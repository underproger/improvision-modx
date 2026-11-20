# Builds the SQL patch that puts the old-site projects into the MODX database.
# Idempotent: running it again refreshes the same 15 projects, it does not duplicate them.
import json, sys

d = json.load(open('data.json'))
CTX = ('web', 'en', 'ru')
TVS = ['seo_title', 'og_title', 'og_description', 'og_image', 'card_image', 'card_image_alt', 'checklist',
       'brand', 'city', 'year', 'category', 'gallery', 'directions', 'specs']


def q(s):
    return "'" + str(s).replace('\\', '\\\\').replace("'", "\\'") + "'"


def migx(items):
    rows = [dict({'MIGX_id': str(i + 1)}, **it) for i, it in enumerate(items)]
    return json.dumps(rows, ensure_ascii=False, separators=(',', ':'))


out = []
w = out.append
w("""-- improvision: 15 projects from the old site improvision.com.ua (uk / en / ru).
-- The 6 projects that already existed (KFC, Lego, Carnegie Center, Intimissimi, Calzedonia, Globus)
-- are rewritten with the old-site data; 9 projects are added.
-- Photos: assets/img/photos/projects/ (git pull before running this).
-- Safe to run again. Afterwards clear the cache in the manager.

SET NAMES utf8mb4;
START TRANSACTION;

SET @tpl  = (SELECT id FROM modx_site_templates WHERE templatename = 'Проєкт' LIMIT 1);
SET @p_web = (SELECT parent FROM modx_site_content WHERE id = 59);
SET @p_en  = (SELECT parent FROM modx_site_content WHERE id = 60);
SET @p_ru  = (SELECT parent FROM modx_site_content WHERE id = 61);
SET @u_web = (SELECT uri FROM modx_site_content WHERE id = @p_web);
SET @u_en  = (SELECT uri FROM modx_site_content WHERE id = @p_en);
SET @u_ru  = (SELECT uri FROM modx_site_content WHERE id = @p_ru);
SET @tv_babel = (SELECT id FROM modx_site_tmplvars WHERE name = 'babelLanguageLinks');
""")
for t in TVS:
    w(f"SET @tv_{t} = (SELECT id FROM modx_site_tmplvars WHERE name = '{t}');")
w('')

for r in d:
    slug = r['slug']
    w(f"-- ---------------------------------------------------------------- {slug}")
    for li, L in enumerate(r['langs']):
        ctx = L['ctx']
        var = f"@r_{slug.replace('-', '_')}_{ctx}"
        if r['id']:
            w(f"SET {var} = {r['id'] + li};")
        else:
            w(f"""INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', {q(L['pagetitle'])}, {q(L['description'])}, {q(slug)}, 1, @p_{ctx}, 1, 1, @tpl, {r['menuindex']},
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\\\Revolution\\\\modDocument', '{ctx}', 1, CONCAT(@u_{ctx}, {q(slug + '/')}), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_{ctx} AND alias = {q(slug)} AND context_key = '{ctx}');""")
            w(f"SET {var} = (SELECT id FROM modx_site_content WHERE parent = @p_{ctx} AND alias = {q(slug)} AND context_key = '{ctx}' ORDER BY id LIMIT 1);")
        w(f"""UPDATE modx_site_content SET pagetitle = {q(L['pagetitle'])}, longtitle = '', menutitle = '',
  description = {q(L['description'])}, alias = {q(slug)}, uri = CONCAT(@u_{ctx}, {q(slug + '/')}),
  introtext = {q(L['introtext'])}, content = {q(L['content'])},
  template = @tpl, menuindex = {r['menuindex']}, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = {var} AND context_key = '{ctx}';""")
        tv = L['tv']
        w(f"DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = {var} AND tmplvarid <> @tv_babel;")
        vals = []
        for t in TVS:
            v = tv.get(t, '')
            if isinstance(v, list):
                v = migx(v) if v else ''
            if v == '' or v is None:
                continue
            vals.append(f"(@tv_{t}, {var}, {q(v)})")
        w("INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES\n  " + ",\n  ".join(vals) + ";")
    s = slug.replace('-', '_')
    w(f"DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_{s}_web, @r_{s}_en, @r_{s}_ru);")
    links = f"CONCAT('web:', @r_{s}_web, ';en:', @r_{s}_en, ';ru:', @r_{s}_ru)"
    w(f"INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES\n  (@tv_babel, @r_{s}_web, {links}),\n  (@tv_babel, @r_{s}_en, {links}),\n  (@tv_babel, @r_{s}_ru, {links});")
    w('')

w('COMMIT;')
open(sys.argv[1], 'w').write('\n'.join(out) + '\n')
print('written', sys.argv[1])
