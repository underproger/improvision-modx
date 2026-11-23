# Builds _dev/patches/2026-11-23-services-from-old-site.sql from data.json.
# For the two services where only a photo caption changes, the current text is read
# from the local database (same as the server: nobody edited the services there).
import json, re, subprocess, sys

S = json.load(open('data.json'))
CTX = ('web', 'en', 'ru')


def q(s):
    return "'" + str(s).replace('\\', '\\\\').replace("'", "\\'") + "'"


def db(sql):
    return subprocess.run(['mysql', '--default-character-set=utf8mb4', '-N', '-r', '-B', 'improvision', '-e', sql],
                          capture_output=True, text=True, check=True).stdout


def tv_now(rid, name):
    out = db(f"SELECT r.value FROM modx_site_tmplvar_contentvalues r JOIN modx_site_tmplvars v ON v.id = r.tmplvarid "
             f"WHERE r.contentid = {rid} AND v.name = '{name}'")
    return out[:-1] if out.endswith('\n') else out


def migx(items):
    return json.dumps([dict({'MIGX_id': str(i + 1)}, **it) for i, it in enumerate(items)], ensure_ascii=False, separators=(',', ':'))


out = []
w = out.append
w("""-- improvision: service texts reworked with the facts from the old site improvision.com.ua (uk / en / ru).
-- Ventilated facades, entrance groups, outdoor and interior advertising, design: texts, checklists,
-- tabs and related projects. Turnkey construction and renovation: photo captions only.
-- Needs the projects patch of 20.11.2026 (related projects are looked up by alias).
-- Safe to run again. Afterwards clear the cache in the manager.

SET NAMES utf8mb4;
START TRANSACTION;
SET @p_web = (SELECT parent FROM modx_site_content WHERE id = 59);
SET @p_en  = (SELECT parent FROM modx_site_content WHERE id = 60);
SET @p_ru  = (SELECT parent FROM modx_site_content WHERE id = 61);
""")
names = sorted({k for s in S for k in list(s['fields']) + list(s.get('replace', {})) if k != 'content'} | {'related_projects'})
for n in names:
    w(f"SET @tv_{n} = (SELECT id FROM modx_site_tmplvars WHERE name = '{n}');")
w('')

for s in S:
    for li, ctx in enumerate(CTX):
        rid = s['id'] + li
        title = db(f"SELECT pagetitle FROM modx_site_content WHERE id = {rid}").strip()
        w(f"-- {rid} ({ctx}) {title}")
        vals = {}
        for k, v in s['fields'].items():
            v = v[li]
            if k == 'content':
                w(f"UPDATE modx_site_content SET content = {q(v)}, editedon = UNIX_TIMESTAMP() WHERE id = {rid} AND context_key = '{ctx}';")
                continue
            vals[k] = migx(v) if isinstance(v, list) else v
        for k, (start, end, new) in s.get('replace', {}).items():
            cur = tv_now(rid, k)
            i = cur.find(start)
            j = cur.find(end, i)
            assert i >= 0 and j > i, (rid, k)
            vals[k] = cur[:i] + new[li] + cur[j + len(end):]
        for k, v in vals.items():
            w(f"DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = {rid} AND tmplvarid = @tv_{k};")
            w(f"INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_{k}, {rid}, {q(v)});")
        if s.get('slugs'):
            ids = ', '.join(f"(SELECT id FROM modx_site_content WHERE parent = @p_{ctx} AND alias = {q(a)} AND context_key = '{ctx}' AND deleted = 0 LIMIT 1)" for a in s['slugs'])
            w(f"DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = {rid} AND tmplvarid = @tv_related_projects;")
            w(f"INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)\n  SELECT @tv_related_projects, {rid}, CONCAT_WS('||', {ids});")
        w('')
w('COMMIT;')
open(sys.argv[1], 'w').write('\n'.join(out) + '\n')
print('written', sys.argv[1])
