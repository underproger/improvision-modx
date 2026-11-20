-- improvision: 15 projects from the old site improvision.com.ua (uk / en / ru).
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

SET @tv_seo_title = (SELECT id FROM modx_site_tmplvars WHERE name = 'seo_title');
SET @tv_og_title = (SELECT id FROM modx_site_tmplvars WHERE name = 'og_title');
SET @tv_og_description = (SELECT id FROM modx_site_tmplvars WHERE name = 'og_description');
SET @tv_og_image = (SELECT id FROM modx_site_tmplvars WHERE name = 'og_image');
SET @tv_card_image = (SELECT id FROM modx_site_tmplvars WHERE name = 'card_image');
SET @tv_card_image_alt = (SELECT id FROM modx_site_tmplvars WHERE name = 'card_image_alt');
SET @tv_checklist = (SELECT id FROM modx_site_tmplvars WHERE name = 'checklist');
SET @tv_brand = (SELECT id FROM modx_site_tmplvars WHERE name = 'brand');
SET @tv_city = (SELECT id FROM modx_site_tmplvars WHERE name = 'city');
SET @tv_year = (SELECT id FROM modx_site_tmplvars WHERE name = 'year');
SET @tv_category = (SELECT id FROM modx_site_tmplvars WHERE name = 'category');
SET @tv_gallery = (SELECT id FROM modx_site_tmplvars WHERE name = 'gallery');
SET @tv_directions = (SELECT id FROM modx_site_tmplvars WHERE name = 'directions');
SET @tv_specs = (SELECT id FROM modx_site_tmplvars WHERE name = 'specs');

-- ---------------------------------------------------------------- kfc
SET @r_kfc_web = 59;
UPDATE modx_site_content SET pagetitle = 'Ресторани мережі KFC', longtitle = '', menutitle = '',
  description = 'Проєктна документація, зовнішня та внутрішня реклама, облицювання фасадів і приміщень для мережі ресторанів KFC.', alias = 'kfc', uri = CONCAT(@u_web, 'kfc/'),
  introtext = 'Проєктна документація, зовнішня та внутрішня реклама, облицювання фасадів і приміщень для мережі ресторанів KFC.', content = '<p>Розробка проєктної документації, виготовлення зовнішньої та внутрішньої реклами, обшивка фасадів і внутрішніх приміщень HPL- та композитними панелями для мережі ресторанів «KFC».</p><p>Реклама в ТРЦ «Art Mall», «Dream Town» та «Appetite».</p>',
  template = @tpl, menuindex = 0, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_kfc_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_kfc_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_kfc_web, 'Ресторани мережі KFC — проєкт improvision'),
  (@tv_og_description, @r_kfc_web, 'Проєктна документація, зовнішня та внутрішня реклама, облицювання фасадів і приміщень для мережі ресторанів KFC.'),
  (@tv_card_image, @r_kfc_web, 'assets/img/photos/project-kfc.jpg'),
  (@tv_card_image_alt, @r_kfc_web, 'KFC — Ресторани мережі KFC'),
  (@tv_checklist, @r_kfc_web, 'Розробка проєктної документації
Виготовлення зовнішньої реклами
Виготовлення внутрішньої реклами
Обшивка фасадів HPL- та композитними панелями
Обшивка внутрішніх приміщень'),
  (@tv_brand, @r_kfc_web, 'KFC'),
  (@tv_city, @r_kfc_web, 'Київ'),
  (@tv_category, @r_kfc_web, 'restaurants'),
  (@tv_gallery, @r_kfc_web, '[{"MIGX_id":"1","image":"assets/img/photos/kfc-night.jpg","alt":"Ресторан KFC у ТРЦ Art Mall увечері"},{"MIGX_id":"2","image":"assets/img/photos/kfc-dusk.jpg","alt":"Світлові вивіски KFC Авто на фасаді ТРЦ Art Mall"},{"MIGX_id":"3","image":"assets/img/photos/kfc-artmall-4.jpg","alt":"Обʼємні світлові літери KFC над входом"},{"MIGX_id":"4","image":"assets/img/photos/kfc-artmall-5.jpg","alt":"Лайтбокс KFC і вивіска KFC Авто"},{"MIGX_id":"5","image":"assets/img/photos/kfc-artmall-3.jpg","alt":"Ресторан KFC у ТРЦ Dream Town"},{"MIGX_id":"6","image":"assets/img/photos/projects/kfc-documents.jpg","alt":"Проєктна документація для ресторанів KFC"}]'),
  (@tv_directions, @r_kfc_web, '[{"MIGX_id":"1","title":"Дизайн і проєктування","link":"53"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"},{"MIGX_id":"3","title":"Інтерʼєрна навігація","link":"50"},{"MIGX_id":"4","title":"Вентильовані фасади","link":"41"}]'),
  (@tv_specs, @r_kfc_web, '[{"MIGX_id":"1","label":"Замовник","value":"KFC"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Мережа ресторанів"},{"MIGX_id":"3","label":"Локація","value":"ТРЦ Art Mall, Dream Town, Appetite"}]');
SET @r_kfc_en = 60;
UPDATE modx_site_content SET pagetitle = 'KFC restaurant chain', longtitle = '', menutitle = '',
  description = 'Engineering documents, outdoor and indoor advertising, facade and interior cladding for the KFC restaurant chain.', alias = 'kfc', uri = CONCAT(@u_en, 'kfc/'),
  introtext = 'Engineering documents, outdoor and indoor advertising, facade and interior cladding for the KFC restaurant chain.', content = '<p>Engineering documents, outdoor and indoor advertising, and cladding of facades and interiors with HPL and composite panels for the KFC restaurant chain.</p><p>Advertising at the Art Mall, Dream Town and Appetite shopping malls.</p>',
  template = @tpl, menuindex = 0, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_kfc_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_kfc_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_kfc_en, 'KFC restaurant chain — an improvision project'),
  (@tv_og_description, @r_kfc_en, 'Engineering documents, outdoor and indoor advertising, facade and interior cladding for the KFC restaurant chain.'),
  (@tv_card_image, @r_kfc_en, 'assets/img/photos/project-kfc.jpg'),
  (@tv_card_image_alt, @r_kfc_en, 'KFC — KFC restaurant chain'),
  (@tv_checklist, @r_kfc_en, 'Engineering documents
Outdoor advertising
Indoor advertising
Facade cladding with HPL and composite panels
Interior cladding'),
  (@tv_brand, @r_kfc_en, 'KFC'),
  (@tv_city, @r_kfc_en, 'Kyiv'),
  (@tv_category, @r_kfc_en, 'restaurants'),
  (@tv_gallery, @r_kfc_en, '[{"MIGX_id":"1","image":"assets/img/photos/kfc-night.jpg","alt":"KFC restaurant at Art Mall in the evening"},{"MIGX_id":"2","image":"assets/img/photos/kfc-dusk.jpg","alt":"KFC Auto illuminated signs on the Art Mall facade"},{"MIGX_id":"3","image":"assets/img/photos/kfc-artmall-4.jpg","alt":"KFC illuminated channel letters above the entrance"},{"MIGX_id":"4","image":"assets/img/photos/kfc-artmall-5.jpg","alt":"KFC light box and KFC Auto sign"},{"MIGX_id":"5","image":"assets/img/photos/kfc-artmall-3.jpg","alt":"KFC restaurant at Dream Town mall"},{"MIGX_id":"6","image":"assets/img/photos/projects/kfc-documents.jpg","alt":"Engineering documents for KFC restaurants"}]'),
  (@tv_directions, @r_kfc_en, '[{"MIGX_id":"1","title":"Design and engineering","link":"54"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"},{"MIGX_id":"3","title":"Interior wayfinding","link":"51"},{"MIGX_id":"4","title":"Ventilated facades","link":"42"}]'),
  (@tv_specs, @r_kfc_en, '[{"MIGX_id":"1","label":"Client","value":"KFC"},{"MIGX_id":"2","label":"Property type","value":"Restaurant chain"},{"MIGX_id":"3","label":"Location","value":"Art Mall, Dream Town, Appetite malls"}]');
SET @r_kfc_ru = 61;
UPDATE modx_site_content SET pagetitle = 'Рестораны сети KFC', longtitle = '', menutitle = '',
  description = 'Проектная документация, наружная и внутренняя реклама, обшивка фасадов и помещений для сети ресторанов KFC.', alias = 'kfc', uri = CONCAT(@u_ru, 'kfc/'),
  introtext = 'Проектная документация, наружная и внутренняя реклама, обшивка фасадов и помещений для сети ресторанов KFC.', content = '<p>Разработка проектной документации, изготовление наружной и внутренней рекламы, обшивка фасадов и внутренних помещений HPL и композитными панелями для сети ресторанов «KFC».</p><p>Реклама в ТРЦ «Art Mall», «Dream Town» и «Appetite».</p>',
  template = @tpl, menuindex = 0, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_kfc_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_kfc_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_kfc_ru, 'Рестораны сети KFC — проект improvision'),
  (@tv_og_description, @r_kfc_ru, 'Проектная документация, наружная и внутренняя реклама, обшивка фасадов и помещений для сети ресторанов KFC.'),
  (@tv_card_image, @r_kfc_ru, 'assets/img/photos/project-kfc.jpg'),
  (@tv_card_image_alt, @r_kfc_ru, 'KFC — Рестораны сети KFC'),
  (@tv_checklist, @r_kfc_ru, 'Разработка проектной документации
Изготовление наружной рекламы
Изготовление внутренней рекламы
Обшивка фасадов HPL и композитными панелями
Обшивка внутренних помещений'),
  (@tv_brand, @r_kfc_ru, 'KFC'),
  (@tv_city, @r_kfc_ru, 'Киев'),
  (@tv_category, @r_kfc_ru, 'restaurants'),
  (@tv_gallery, @r_kfc_ru, '[{"MIGX_id":"1","image":"assets/img/photos/kfc-night.jpg","alt":"Ресторан KFC в ТРЦ Art Mall вечером"},{"MIGX_id":"2","image":"assets/img/photos/kfc-dusk.jpg","alt":"Световые вывески KFC Авто на фасаде ТРЦ Art Mall"},{"MIGX_id":"3","image":"assets/img/photos/kfc-artmall-4.jpg","alt":"Объемные световые буквы KFC над входом"},{"MIGX_id":"4","image":"assets/img/photos/kfc-artmall-5.jpg","alt":"Лайтбокс KFC и вывеска KFC Авто"},{"MIGX_id":"5","image":"assets/img/photos/kfc-artmall-3.jpg","alt":"Ресторан KFC в ТРЦ Dream Town"},{"MIGX_id":"6","image":"assets/img/photos/projects/kfc-documents.jpg","alt":"Проектная документация для ресторанов KFC"}]'),
  (@tv_directions, @r_kfc_ru, '[{"MIGX_id":"1","title":"Дизайн и проектирование","link":"55"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"},{"MIGX_id":"3","title":"Интерьерная навигация","link":"52"},{"MIGX_id":"4","title":"Вентилируемые фасады","link":"43"}]'),
  (@tv_specs, @r_kfc_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"KFC"},{"MIGX_id":"2","label":"Тип объекта","value":"Сеть ресторанов"},{"MIGX_id":"3","label":"Локация","value":"ТРЦ Art Mall, Dream Town, Appetite"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_kfc_web, @r_kfc_en, @r_kfc_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_kfc_web, CONCAT('web:', @r_kfc_web, ';en:', @r_kfc_en, ';ru:', @r_kfc_ru)),
  (@tv_babel, @r_kfc_en, CONCAT('web:', @r_kfc_web, ';en:', @r_kfc_en, ';ru:', @r_kfc_ru)),
  (@tv_babel, @r_kfc_ru, CONCAT('web:', @r_kfc_web, ';en:', @r_kfc_en, ';ru:', @r_kfc_ru));

-- ---------------------------------------------------------------- lego
SET @r_lego_web = 62;
UPDATE modx_site_content SET pagetitle = 'Дизайн і фасад магазину', longtitle = '', menutitle = '',
  description = 'Оригінальний дизайн і зовнішнє рекламне оформлення магазину Lego.', alias = 'lego', uri = CONCAT(@u_web, 'lego/'),
  introtext = 'Оригінальний дизайн і зовнішнє рекламне оформлення магазину Lego.', content = '<p>Розробка оригінального дизайну для магазину «Lego». Зовнішнє рекламне оформлення виготовлене з алюмінієвих композитних панелей, обʼємні світлові елементи — з акрилу та ПВХ із підсвіткою світлодіодними кластерами та діодними прожекторами.</p>',
  template = @tpl, menuindex = 1, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_lego_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_lego_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_lego_web, 'Дизайн і фасад магазину LEGO — проєкт improvision'),
  (@tv_og_description, @r_lego_web, 'Оригінальний дизайн і зовнішнє рекламне оформлення магазину Lego.'),
  (@tv_card_image, @r_lego_web, 'assets/img/photos/projects/lego-card.jpg'),
  (@tv_card_image_alt, @r_lego_web, 'LEGO — Дизайн і фасад магазину'),
  (@tv_checklist, @r_lego_web, 'Оригінальний дизайн фасаду
Облицювання алюмінієвими композитними панелями
Обʼємні світлові елементи з акрилу та ПВХ
Підсвітка світлодіодними кластерами та прожекторами'),
  (@tv_brand, @r_lego_web, 'LEGO'),
  (@tv_category, @r_lego_web, 'retail'),
  (@tv_gallery, @r_lego_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/lego-1.jpg","alt":"Фасад магазину Lego"},{"MIGX_id":"2","image":"assets/img/photos/projects/lego-2.jpg","alt":"Дизайн-проєкт фасаду Lego з вечірньою підсвіткою"},{"MIGX_id":"3","image":"assets/img/photos/projects/lego-3.jpg","alt":"Дизайн-проєкт фасаду магазину Lego"}]'),
  (@tv_directions, @r_lego_web, '[{"MIGX_id":"1","title":"Дизайн і проєктування","link":"53"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_lego_web, '[{"MIGX_id":"1","label":"Замовник","value":"LEGO"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Магазин"}]');
SET @r_lego_en = 63;
UPDATE modx_site_content SET pagetitle = 'Store design and facade', longtitle = '', menutitle = '',
  description = 'Original design and exterior branding of a Lego store.', alias = 'lego', uri = CONCAT(@u_en, 'lego/'),
  introtext = 'Original design and exterior branding of a Lego store.', content = '<p>Original design for a Lego store. The exterior branding is made of aluminium composite panels; the illuminated 3D elements are acrylic and PVC, lit by LED clusters and LED floodlights.</p>',
  template = @tpl, menuindex = 1, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_lego_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_lego_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_lego_en, 'LEGO: store design and facade — an improvision project'),
  (@tv_og_description, @r_lego_en, 'Original design and exterior branding of a Lego store.'),
  (@tv_card_image, @r_lego_en, 'assets/img/photos/projects/lego-card.jpg'),
  (@tv_card_image_alt, @r_lego_en, 'LEGO — Store design and facade'),
  (@tv_checklist, @r_lego_en, 'Original facade design
Aluminium composite panel cladding
Illuminated 3D elements in acrylic and PVC
LED cluster and floodlight lighting'),
  (@tv_brand, @r_lego_en, 'LEGO'),
  (@tv_category, @r_lego_en, 'retail'),
  (@tv_gallery, @r_lego_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/lego-1.jpg","alt":"Lego store facade"},{"MIGX_id":"2","image":"assets/img/photos/projects/lego-2.jpg","alt":"Lego facade design with evening lighting"},{"MIGX_id":"3","image":"assets/img/photos/projects/lego-3.jpg","alt":"Lego store facade design"}]'),
  (@tv_directions, @r_lego_en, '[{"MIGX_id":"1","title":"Design and engineering","link":"54"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_lego_en, '[{"MIGX_id":"1","label":"Client","value":"LEGO"},{"MIGX_id":"2","label":"Property type","value":"Store"}]');
SET @r_lego_ru = 64;
UPDATE modx_site_content SET pagetitle = 'Дизайн и фасад магазина', longtitle = '', menutitle = '',
  description = 'Оригинальный дизайн и наружное рекламное оформление магазина Lego.', alias = 'lego', uri = CONCAT(@u_ru, 'lego/'),
  introtext = 'Оригинальный дизайн и наружное рекламное оформление магазина Lego.', content = '<p>Разработка оригинального дизайна для магазина «Lego». Внешнее рекламное оформление изготовлено из алюминиевых композитных панелей, объемные световые элементы — из акрила и ПВХ с подсветкой при помощи светодиодных кластеров и диодных прожекторов.</p>',
  template = @tpl, menuindex = 1, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_lego_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_lego_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_lego_ru, 'Дизайн и фасад магазина LEGO — проект improvision'),
  (@tv_og_description, @r_lego_ru, 'Оригинальный дизайн и наружное рекламное оформление магазина Lego.'),
  (@tv_card_image, @r_lego_ru, 'assets/img/photos/projects/lego-card.jpg'),
  (@tv_card_image_alt, @r_lego_ru, 'LEGO — Дизайн и фасад магазина'),
  (@tv_checklist, @r_lego_ru, 'Оригинальный дизайн фасада
Облицовка алюминиевыми композитными панелями
Объемные световые элементы из акрила и ПВХ
Подсветка светодиодными кластерами и прожекторами'),
  (@tv_brand, @r_lego_ru, 'LEGO'),
  (@tv_category, @r_lego_ru, 'retail'),
  (@tv_gallery, @r_lego_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/lego-1.jpg","alt":"Фасад магазина Lego"},{"MIGX_id":"2","image":"assets/img/photos/projects/lego-2.jpg","alt":"Дизайн-проект фасада Lego с вечерней подсветкой"},{"MIGX_id":"3","image":"assets/img/photos/projects/lego-3.jpg","alt":"Дизайн-проект фасада магазина Lego"}]'),
  (@tv_directions, @r_lego_ru, '[{"MIGX_id":"1","title":"Дизайн и проектирование","link":"55"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_lego_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"LEGO"},{"MIGX_id":"2","label":"Тип объекта","value":"Магазин"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_lego_web, @r_lego_en, @r_lego_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_lego_web, CONCAT('web:', @r_lego_web, ';en:', @r_lego_en, ';ru:', @r_lego_ru)),
  (@tv_babel, @r_lego_en, CONCAT('web:', @r_lego_web, ';en:', @r_lego_en, ';ru:', @r_lego_ru)),
  (@tv_babel, @r_lego_ru, CONCAT('web:', @r_lego_web, ';en:', @r_lego_en, ';ru:', @r_lego_ru));

-- ---------------------------------------------------------------- domosfera
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вивіска та навігація торгового центру', 'Фасадна вивіска та внутрішня навігація ТЦ «Домосфера».', 'domosfera', 1, @p_web, 1, 1, @tpl, 2,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'domosfera/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'domosfera' AND context_key = 'web');
SET @r_domosfera_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'domosfera' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вивіска та навігація торгового центру', longtitle = '', menutitle = '',
  description = 'Фасадна вивіска та внутрішня навігація ТЦ «Домосфера».', alias = 'domosfera', uri = CONCAT(@u_web, 'domosfera/'),
  introtext = 'Фасадна вивіска та внутрішня навігація ТЦ «Домосфера».', content = '<p>Вивіска для ТЦ «Домосфера» виготовлена з ПВХ і молочного акрилу, підсвітка — діодні кластери.</p><p>Внутрішня навігація: стела — скло з друком, багетна рамка, каркас; обʼємні короби — композитний матеріал, полістирол; покажчики — композитний матеріал, багетна рамка.</p>',
  template = @tpl, menuindex = 2, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_domosfera_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_domosfera_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_domosfera_web, 'Вивіска та навігація торгового центру Домосфера — проєкт improvision'),
  (@tv_og_description, @r_domosfera_web, 'Фасадна вивіска та внутрішня навігація ТЦ «Домосфера».'),
  (@tv_card_image, @r_domosfera_web, 'assets/img/photos/projects/domosfera-card.jpg'),
  (@tv_card_image_alt, @r_domosfera_web, 'Домосфера — Вивіска та навігація торгового центру'),
  (@tv_checklist, @r_domosfera_web, 'Фасадна вивіска з ПВХ і молочного акрилу
Стела з друком на склі
Обʼємні короби з композиту та полістиролу
Покажчики внутрішньої навігації'),
  (@tv_brand, @r_domosfera_web, 'Домосфера'),
  (@tv_category, @r_domosfera_web, 'retail'),
  (@tv_gallery, @r_domosfera_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/domosfera-1.jpg","alt":"Вивіска на фасаді ТЦ «Домосфера»"},{"MIGX_id":"2","image":"assets/img/photos/projects/domosfera-2.jpg","alt":"Обʼємні літери «Домосфера»"},{"MIGX_id":"3","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Внутрішня навігація ТЦ «Домосфера»"}]'),
  (@tv_directions, @r_domosfera_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"},{"MIGX_id":"2","title":"Інтерʼєрна навігація","link":"50"}]'),
  (@tv_specs, @r_domosfera_web, '[{"MIGX_id":"1","label":"Замовник","value":"Домосфера"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Торговий центр"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Shopping centre signage and wayfinding', 'Facade sign and interior wayfinding for the Domosfera shopping centre.', 'domosfera', 1, @p_en, 1, 1, @tpl, 2,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'domosfera/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'domosfera' AND context_key = 'en');
SET @r_domosfera_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'domosfera' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Shopping centre signage and wayfinding', longtitle = '', menutitle = '',
  description = 'Facade sign and interior wayfinding for the Domosfera shopping centre.', alias = 'domosfera', uri = CONCAT(@u_en, 'domosfera/'),
  introtext = 'Facade sign and interior wayfinding for the Domosfera shopping centre.', content = '<p>The sign for the Domosfera shopping centre is made of PVC and opal acrylic, lit by LED clusters.</p><p>Interior wayfinding: a pylon of printed glass in a moulded frame on a steel structure; 3D boxes of composite and polystyrene; direction signs of composite in a moulded frame.</p>',
  template = @tpl, menuindex = 2, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_domosfera_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_domosfera_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_domosfera_en, 'Domosfera: shopping centre signage and wayfinding — an improvision project'),
  (@tv_og_description, @r_domosfera_en, 'Facade sign and interior wayfinding for the Domosfera shopping centre.'),
  (@tv_card_image, @r_domosfera_en, 'assets/img/photos/projects/domosfera-card.jpg'),
  (@tv_card_image_alt, @r_domosfera_en, 'Domosfera — Shopping centre signage and wayfinding'),
  (@tv_checklist, @r_domosfera_en, 'Facade sign in PVC and opal acrylic
Printed glass pylon
3D boxes in composite and polystyrene
Interior direction signs'),
  (@tv_brand, @r_domosfera_en, 'Domosfera'),
  (@tv_category, @r_domosfera_en, 'retail'),
  (@tv_gallery, @r_domosfera_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/domosfera-1.jpg","alt":"Sign on the Domosfera shopping centre facade"},{"MIGX_id":"2","image":"assets/img/photos/projects/domosfera-2.jpg","alt":"Domosfera channel letters"},{"MIGX_id":"3","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Interior wayfinding at Domosfera"}]'),
  (@tv_directions, @r_domosfera_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"},{"MIGX_id":"2","title":"Interior wayfinding","link":"51"}]'),
  (@tv_specs, @r_domosfera_en, '[{"MIGX_id":"1","label":"Client","value":"Domosfera"},{"MIGX_id":"2","label":"Property type","value":"Shopping centre"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вывеска и навигация торгового центра', 'Фасадная вывеска и внутренняя навигация ТЦ «Домосфера».', 'domosfera', 1, @p_ru, 1, 1, @tpl, 2,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'domosfera/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'domosfera' AND context_key = 'ru');
SET @r_domosfera_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'domosfera' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вывеска и навигация торгового центра', longtitle = '', menutitle = '',
  description = 'Фасадная вывеска и внутренняя навигация ТЦ «Домосфера».', alias = 'domosfera', uri = CONCAT(@u_ru, 'domosfera/'),
  introtext = 'Фасадная вывеска и внутренняя навигация ТЦ «Домосфера».', content = '<p>Вывеска для ТЦ «Домосфера» изготовлена из ПВХ и молочного акрила, подсветка — диодные кластеры.</p><p>Внутренняя навигация: стела — стекло (печать на стекле), багетная рамка, каркас; объемные короба — композитный материал, полистирол; указатели — композитный материал, багетная рамка.</p>',
  template = @tpl, menuindex = 2, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_domosfera_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_domosfera_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_domosfera_ru, 'Вывеска и навигация торгового центра Домосфера — проект improvision'),
  (@tv_og_description, @r_domosfera_ru, 'Фасадная вывеска и внутренняя навигация ТЦ «Домосфера».'),
  (@tv_card_image, @r_domosfera_ru, 'assets/img/photos/projects/domosfera-card.jpg'),
  (@tv_card_image_alt, @r_domosfera_ru, 'Домосфера — Вывеска и навигация торгового центра'),
  (@tv_checklist, @r_domosfera_ru, 'Фасадная вывеска из ПВХ и молочного акрила
Стела с печатью на стекле
Объемные короба из композита и полистирола
Указатели внутренней навигации'),
  (@tv_brand, @r_domosfera_ru, 'Домосфера'),
  (@tv_category, @r_domosfera_ru, 'retail'),
  (@tv_gallery, @r_domosfera_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/domosfera-1.jpg","alt":"Вывеска на фасаде ТЦ «Домосфера»"},{"MIGX_id":"2","image":"assets/img/photos/projects/domosfera-2.jpg","alt":"Объемные буквы «Домосфера»"},{"MIGX_id":"3","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Внутренняя навигация ТЦ «Домосфера»"}]'),
  (@tv_directions, @r_domosfera_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"},{"MIGX_id":"2","title":"Интерьерная навигация","link":"52"}]'),
  (@tv_specs, @r_domosfera_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Домосфера"},{"MIGX_id":"2","label":"Тип объекта","value":"Торговый центр"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_domosfera_web, @r_domosfera_en, @r_domosfera_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_domosfera_web, CONCAT('web:', @r_domosfera_web, ';en:', @r_domosfera_en, ';ru:', @r_domosfera_ru)),
  (@tv_babel, @r_domosfera_en, CONCAT('web:', @r_domosfera_web, ';en:', @r_domosfera_en, ';ru:', @r_domosfera_ru)),
  (@tv_babel, @r_domosfera_ru, CONCAT('web:', @r_domosfera_web, ';en:', @r_domosfera_en, ';ru:', @r_domosfera_ru));

-- ---------------------------------------------------------------- globus-bank
SET @r_globus_bank_web = 74;
UPDATE modx_site_content SET pagetitle = 'Вентильований фасад і вивіска банку', longtitle = '', menutitle = '',
  description = 'Вентильований фасад відділення та світлова вивіска банку «Глобус».', alias = 'globus-bank', uri = CONCAT(@u_web, 'globus-bank/'),
  introtext = 'Вентильований фасад відділення та світлова вивіска банку «Глобус».', content = '<p>Вентильований фасад банку «Глобус» виконаний з композитного матеріалу на алюмінієвій підсистемі. Вивіска виготовлена з композитного матеріалу з обʼємними та інкрустованими літерами з ПВХ і молочного акрилу, підсвітка — світлодіодні модулі.</p>',
  template = @tpl, menuindex = 3, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_globus_bank_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_globus_bank_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_globus_bank_web, 'Вентильований фасад і вивіска банку Глобус — проєкт improvision'),
  (@tv_og_description, @r_globus_bank_web, 'Вентильований фасад відділення та світлова вивіска банку «Глобус».'),
  (@tv_card_image, @r_globus_bank_web, 'assets/img/photos/projects/globus-bank-card.jpg'),
  (@tv_card_image_alt, @r_globus_bank_web, 'Глобус — Вентильований фасад і вивіска банку'),
  (@tv_checklist, @r_globus_bank_web, 'Вентильований фасад з композитного матеріалу
Алюмінієва підсистема
Вивіска з обʼємними та інкрустованими літерами
Підсвітка світлодіодними модулями'),
  (@tv_brand, @r_globus_bank_web, 'Глобус'),
  (@tv_category, @r_globus_bank_web, 'facades'),
  (@tv_gallery, @r_globus_bank_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/globus-bank-1.jpg","alt":"Вентильований фасад відділення банку «Глобус»"},{"MIGX_id":"2","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Світлова вивіска банку «Глобус»"},{"MIGX_id":"3","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"Дизайн-проєкт вивіски банку «Глобус»"}]'),
  (@tv_directions, @r_globus_bank_web, '[{"MIGX_id":"1","title":"Вентильовані фасади","link":"41"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_globus_bank_web, '[{"MIGX_id":"1","label":"Замовник","value":"Глобус"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Відділення банку"}]');
SET @r_globus_bank_en = 75;
UPDATE modx_site_content SET pagetitle = 'Branch ventilated facade and sign', longtitle = '', menutitle = '',
  description = 'Ventilated facade of a branch and an illuminated sign for Globus Bank.', alias = 'globus-bank', uri = CONCAT(@u_en, 'globus-bank/'),
  introtext = 'Ventilated facade of a branch and an illuminated sign for Globus Bank.', content = '<p>The ventilated facade of Globus Bank is made of composite panels on an aluminium substructure. The sign is composite with 3D and inlaid letters in PVC and opal acrylic, lit by LED modules.</p>',
  template = @tpl, menuindex = 3, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_globus_bank_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_globus_bank_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_globus_bank_en, 'Globus Bank: branch ventilated facade and sign — an improvision project'),
  (@tv_og_description, @r_globus_bank_en, 'Ventilated facade of a branch and an illuminated sign for Globus Bank.'),
  (@tv_card_image, @r_globus_bank_en, 'assets/img/photos/projects/globus-bank-card.jpg'),
  (@tv_card_image_alt, @r_globus_bank_en, 'Globus Bank — Branch ventilated facade and sign'),
  (@tv_checklist, @r_globus_bank_en, 'Composite ventilated facade
Aluminium substructure
Sign with 3D and inlaid letters
LED module lighting'),
  (@tv_brand, @r_globus_bank_en, 'Globus Bank'),
  (@tv_category, @r_globus_bank_en, 'facades'),
  (@tv_gallery, @r_globus_bank_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/globus-bank-1.jpg","alt":"Ventilated facade of a Globus Bank branch"},{"MIGX_id":"2","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Globus Bank illuminated sign"},{"MIGX_id":"3","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"Globus Bank sign design"}]'),
  (@tv_directions, @r_globus_bank_en, '[{"MIGX_id":"1","title":"Ventilated facades","link":"42"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_globus_bank_en, '[{"MIGX_id":"1","label":"Client","value":"Globus Bank"},{"MIGX_id":"2","label":"Property type","value":"Bank branch"}]');
SET @r_globus_bank_ru = 76;
UPDATE modx_site_content SET pagetitle = 'Вентилируемый фасад и вывеска банка', longtitle = '', menutitle = '',
  description = 'Вентилируемый фасад отделения и световая вывеска банка «Глобус».', alias = 'globus-bank', uri = CONCAT(@u_ru, 'globus-bank/'),
  introtext = 'Вентилируемый фасад отделения и световая вывеска банка «Глобус».', content = '<p>Вентилируемый фасад банка «Глобус» исполнен из композитного материала на алюминиевом подкаркасе. Вывеска изготовлена из композитного материала с объемными и инкрустированными буквами из ПВХ и молочного акрила, подсветка — светодиодные модули.</p>',
  template = @tpl, menuindex = 3, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_globus_bank_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_globus_bank_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_globus_bank_ru, 'Вентилируемый фасад и вывеска банка Глобус — проект improvision'),
  (@tv_og_description, @r_globus_bank_ru, 'Вентилируемый фасад отделения и световая вывеска банка «Глобус».'),
  (@tv_card_image, @r_globus_bank_ru, 'assets/img/photos/projects/globus-bank-card.jpg'),
  (@tv_card_image_alt, @r_globus_bank_ru, 'Глобус — Вентилируемый фасад и вывеска банка'),
  (@tv_checklist, @r_globus_bank_ru, 'Вентилируемый фасад из композитного материала
Алюминиевый подкаркас
Вывеска с объемными и инкрустированными буквами
Подсветка светодиодными модулями'),
  (@tv_brand, @r_globus_bank_ru, 'Глобус'),
  (@tv_category, @r_globus_bank_ru, 'facades'),
  (@tv_gallery, @r_globus_bank_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/globus-bank-1.jpg","alt":"Вентилируемый фасад отделения банка «Глобус»"},{"MIGX_id":"2","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Световая вывеска банка «Глобус»"},{"MIGX_id":"3","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"Дизайн-проект вывески банка «Глобус»"}]'),
  (@tv_directions, @r_globus_bank_ru, '[{"MIGX_id":"1","title":"Вентилируемые фасады","link":"43"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_globus_bank_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Глобус"},{"MIGX_id":"2","label":"Тип объекта","value":"Отделение банка"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_globus_bank_web, @r_globus_bank_en, @r_globus_bank_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_globus_bank_web, CONCAT('web:', @r_globus_bank_web, ';en:', @r_globus_bank_en, ';ru:', @r_globus_bank_ru)),
  (@tv_babel, @r_globus_bank_en, CONCAT('web:', @r_globus_bank_web, ';en:', @r_globus_bank_en, ';ru:', @r_globus_bank_ru)),
  (@tv_babel, @r_globus_bank_ru, CONCAT('web:', @r_globus_bank_web, ';en:', @r_globus_bank_en, ';ru:', @r_globus_bank_ru));

-- ---------------------------------------------------------------- vittorio-spernanzoni
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Фасад і вивіска бутика', 'Фасад бутика з алюмінієвих панелей, світлодіодний монітор і світлові літери.', 'vittorio-spernanzoni', 1, @p_web, 1, 1, @tpl, 4,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'vittorio-spernanzoni/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'vittorio-spernanzoni' AND context_key = 'web');
SET @r_vittorio_spernanzoni_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'vittorio-spernanzoni' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Фасад і вивіска бутика', longtitle = '', menutitle = '',
  description = 'Фасад бутика з алюмінієвих панелей, світлодіодний монітор і світлові літери.', alias = 'vittorio-spernanzoni', uri = CONCAT(@u_web, 'vittorio-spernanzoni/'),
  introtext = 'Фасад бутика з алюмінієвих панелей, світлодіодний монітор і світлові літери.', content = '<p>Фасад бутика «Vittorio Spernanzoni» виготовлений з алюмінієвих панелей і декоративного профілю з порошковим фарбуванням. Вивіска виконана у вигляді світлодіодного монітора, обʼємних світлових літер з акрилу та ПВХ і світлового логотипа з інкрустацією з акрилу. Підсвітка — світлодіодні модулі.</p>',
  template = @tpl, menuindex = 4, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_vittorio_spernanzoni_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_vittorio_spernanzoni_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_vittorio_spernanzoni_web, 'Фасад і вивіска бутика Vittorio Spernanzoni — проєкт improvision'),
  (@tv_og_description, @r_vittorio_spernanzoni_web, 'Фасад бутика з алюмінієвих панелей, світлодіодний монітор і світлові літери.'),
  (@tv_card_image, @r_vittorio_spernanzoni_web, 'assets/img/photos/projects/vittorio-spernanzoni-card.jpg'),
  (@tv_card_image_alt, @r_vittorio_spernanzoni_web, 'Vittorio Spernanzoni — Фасад і вивіска бутика'),
  (@tv_checklist, @r_vittorio_spernanzoni_web, 'Фасад з алюмінієвих панелей і декоративного профілю
Порошкове фарбування
Світлодіодний монітор
Обʼємні світлові літери та логотип'),
  (@tv_brand, @r_vittorio_spernanzoni_web, 'Vittorio Spernanzoni'),
  (@tv_category, @r_vittorio_spernanzoni_web, 'retail'),
  (@tv_gallery, @r_vittorio_spernanzoni_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Фасад і вивіска бутика Vittorio Spernanzoni"}]'),
  (@tv_directions, @r_vittorio_spernanzoni_web, '[{"MIGX_id":"1","title":"Вхідні групи","link":"44"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_vittorio_spernanzoni_web, '[{"MIGX_id":"1","label":"Замовник","value":"Vittorio Spernanzoni"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бутик"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Boutique facade and sign', 'A boutique facade in aluminium panels with an LED screen and illuminated letters.', 'vittorio-spernanzoni', 1, @p_en, 1, 1, @tpl, 4,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'vittorio-spernanzoni/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'vittorio-spernanzoni' AND context_key = 'en');
SET @r_vittorio_spernanzoni_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'vittorio-spernanzoni' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Boutique facade and sign', longtitle = '', menutitle = '',
  description = 'A boutique facade in aluminium panels with an LED screen and illuminated letters.', alias = 'vittorio-spernanzoni', uri = CONCAT(@u_en, 'vittorio-spernanzoni/'),
  introtext = 'A boutique facade in aluminium panels with an LED screen and illuminated letters.', content = '<p>The Vittorio Spernanzoni boutique facade is made of aluminium panels and decorative powder-coated profiles. The signage combines an LED screen, illuminated 3D letters in acrylic and PVC, and an illuminated logo with acrylic inlay, lit by LED modules.</p>',
  template = @tpl, menuindex = 4, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_vittorio_spernanzoni_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_vittorio_spernanzoni_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_vittorio_spernanzoni_en, 'Vittorio Spernanzoni: boutique facade and sign — an improvision project'),
  (@tv_og_description, @r_vittorio_spernanzoni_en, 'A boutique facade in aluminium panels with an LED screen and illuminated letters.'),
  (@tv_card_image, @r_vittorio_spernanzoni_en, 'assets/img/photos/projects/vittorio-spernanzoni-card.jpg'),
  (@tv_card_image_alt, @r_vittorio_spernanzoni_en, 'Vittorio Spernanzoni — Boutique facade and sign'),
  (@tv_checklist, @r_vittorio_spernanzoni_en, 'Aluminium panel and decorative profile facade
Powder coating
LED screen
Illuminated 3D letters and logo'),
  (@tv_brand, @r_vittorio_spernanzoni_en, 'Vittorio Spernanzoni'),
  (@tv_category, @r_vittorio_spernanzoni_en, 'retail'),
  (@tv_gallery, @r_vittorio_spernanzoni_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Vittorio Spernanzoni boutique facade and sign"}]'),
  (@tv_directions, @r_vittorio_spernanzoni_en, '[{"MIGX_id":"1","title":"Entrance groups","link":"45"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_vittorio_spernanzoni_en, '[{"MIGX_id":"1","label":"Client","value":"Vittorio Spernanzoni"},{"MIGX_id":"2","label":"Property type","value":"Boutique"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Фасад и вывеска бутика', 'Фасад бутика из алюминиевых панелей, светодиодный монитор и световые буквы.', 'vittorio-spernanzoni', 1, @p_ru, 1, 1, @tpl, 4,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'vittorio-spernanzoni/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'vittorio-spernanzoni' AND context_key = 'ru');
SET @r_vittorio_spernanzoni_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'vittorio-spernanzoni' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Фасад и вывеска бутика', longtitle = '', menutitle = '',
  description = 'Фасад бутика из алюминиевых панелей, светодиодный монитор и световые буквы.', alias = 'vittorio-spernanzoni', uri = CONCAT(@u_ru, 'vittorio-spernanzoni/'),
  introtext = 'Фасад бутика из алюминиевых панелей, светодиодный монитор и световые буквы.', content = '<p>Фасад бутика «Vittorio Spernanzoni» изготовлен из алюминиевых панелей и декоративного профиля с порошковой покраской. Вывеска исполнена в виде светодиодного монитора, объемных световых букв из акрила и ПВХ и светового логотипа с инкрустацией из акрила. Подсветка — светодиодные модули.</p>',
  template = @tpl, menuindex = 4, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_vittorio_spernanzoni_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_vittorio_spernanzoni_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_vittorio_spernanzoni_ru, 'Фасад и вывеска бутика Vittorio Spernanzoni — проект improvision'),
  (@tv_og_description, @r_vittorio_spernanzoni_ru, 'Фасад бутика из алюминиевых панелей, светодиодный монитор и световые буквы.'),
  (@tv_card_image, @r_vittorio_spernanzoni_ru, 'assets/img/photos/projects/vittorio-spernanzoni-card.jpg'),
  (@tv_card_image_alt, @r_vittorio_spernanzoni_ru, 'Vittorio Spernanzoni — Фасад и вывеска бутика'),
  (@tv_checklist, @r_vittorio_spernanzoni_ru, 'Фасад из алюминиевых панелей и декоративного профиля
Порошковая покраска
Светодиодный монитор
Объемные световые буквы и логотип'),
  (@tv_brand, @r_vittorio_spernanzoni_ru, 'Vittorio Spernanzoni'),
  (@tv_category, @r_vittorio_spernanzoni_ru, 'retail'),
  (@tv_gallery, @r_vittorio_spernanzoni_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Фасад и вывеска бутика Vittorio Spernanzoni"}]'),
  (@tv_directions, @r_vittorio_spernanzoni_ru, '[{"MIGX_id":"1","title":"Входные группы","link":"46"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_vittorio_spernanzoni_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Vittorio Spernanzoni"},{"MIGX_id":"2","label":"Тип объекта","value":"Бутик"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_vittorio_spernanzoni_web, @r_vittorio_spernanzoni_en, @r_vittorio_spernanzoni_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_vittorio_spernanzoni_web, CONCAT('web:', @r_vittorio_spernanzoni_web, ';en:', @r_vittorio_spernanzoni_en, ';ru:', @r_vittorio_spernanzoni_ru)),
  (@tv_babel, @r_vittorio_spernanzoni_en, CONCAT('web:', @r_vittorio_spernanzoni_web, ';en:', @r_vittorio_spernanzoni_en, ';ru:', @r_vittorio_spernanzoni_ru)),
  (@tv_babel, @r_vittorio_spernanzoni_ru, CONCAT('web:', @r_vittorio_spernanzoni_web, ';en:', @r_vittorio_spernanzoni_en, ';ru:', @r_vittorio_spernanzoni_ru));

-- ---------------------------------------------------------------- intimissimi
SET @r_intimissimi_web = 68;
UPDATE modx_site_content SET pagetitle = 'Вивіска бутика', longtitle = '', menutitle = '',
  description = 'Світлова вивіска бутика Intimissimi з обʼємними та інкрустованими літерами.', alias = 'intimissimi', uri = CONCAT(@u_web, 'intimissimi/'),
  introtext = 'Світлова вивіска бутика Intimissimi з обʼємними та інкрустованими літерами.', content = '<p>Вивіска бутика «Intimissimi» виготовлена з алюмінієвих композитних панелей з обʼємними світловими та інкрустованими літерами з акрилу та ПВХ, підсвітка — світлодіодні модулі.</p>',
  template = @tpl, menuindex = 5, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_intimissimi_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_intimissimi_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_intimissimi_web, 'Вивіска бутика Intimissimi — проєкт improvision'),
  (@tv_og_description, @r_intimissimi_web, 'Світлова вивіска бутика Intimissimi з обʼємними та інкрустованими літерами.'),
  (@tv_card_image, @r_intimissimi_web, 'assets/img/photos/projects/intimissimi-card.jpg'),
  (@tv_card_image_alt, @r_intimissimi_web, 'Intimissimi — Вивіска бутика'),
  (@tv_brand, @r_intimissimi_web, 'Intimissimi'),
  (@tv_category, @r_intimissimi_web, 'retail'),
  (@tv_gallery, @r_intimissimi_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/intimissimi-1.jpg","alt":"Вивіска бутика Intimissimi"}]'),
  (@tv_directions, @r_intimissimi_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_intimissimi_web, '[{"MIGX_id":"1","label":"Замовник","value":"Intimissimi"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бутик"}]');
SET @r_intimissimi_en = 69;
UPDATE modx_site_content SET pagetitle = 'Boutique sign', longtitle = '', menutitle = '',
  description = 'An illuminated sign with 3D and inlaid letters for an Intimissimi boutique.', alias = 'intimissimi', uri = CONCAT(@u_en, 'intimissimi/'),
  introtext = 'An illuminated sign with 3D and inlaid letters for an Intimissimi boutique.', content = '<p>The Intimissimi boutique sign is made of aluminium composite panels with illuminated 3D and inlaid letters in acrylic and PVC, lit by LED modules.</p>',
  template = @tpl, menuindex = 5, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_intimissimi_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_intimissimi_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_intimissimi_en, 'Intimissimi: boutique sign — an improvision project'),
  (@tv_og_description, @r_intimissimi_en, 'An illuminated sign with 3D and inlaid letters for an Intimissimi boutique.'),
  (@tv_card_image, @r_intimissimi_en, 'assets/img/photos/projects/intimissimi-card.jpg'),
  (@tv_card_image_alt, @r_intimissimi_en, 'Intimissimi — Boutique sign'),
  (@tv_brand, @r_intimissimi_en, 'Intimissimi'),
  (@tv_category, @r_intimissimi_en, 'retail'),
  (@tv_gallery, @r_intimissimi_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/intimissimi-1.jpg","alt":"Intimissimi boutique sign"}]'),
  (@tv_directions, @r_intimissimi_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_intimissimi_en, '[{"MIGX_id":"1","label":"Client","value":"Intimissimi"},{"MIGX_id":"2","label":"Property type","value":"Boutique"}]');
SET @r_intimissimi_ru = 70;
UPDATE modx_site_content SET pagetitle = 'Вывеска бутика', longtitle = '', menutitle = '',
  description = 'Световая вывеска бутика Intimissimi с объемными и инкрустированными буквами.', alias = 'intimissimi', uri = CONCAT(@u_ru, 'intimissimi/'),
  introtext = 'Световая вывеска бутика Intimissimi с объемными и инкрустированными буквами.', content = '<p>Вывеска бутика «Intimissimi» изготовлена из алюминиевых композитных панелей с объемными световыми и инкрустированными буквами из акрила и ПВХ, подсветка — светодиодные модули.</p>',
  template = @tpl, menuindex = 5, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_intimissimi_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_intimissimi_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_intimissimi_ru, 'Вывеска бутика Intimissimi — проект improvision'),
  (@tv_og_description, @r_intimissimi_ru, 'Световая вывеска бутика Intimissimi с объемными и инкрустированными буквами.'),
  (@tv_card_image, @r_intimissimi_ru, 'assets/img/photos/projects/intimissimi-card.jpg'),
  (@tv_card_image_alt, @r_intimissimi_ru, 'Intimissimi — Вывеска бутика'),
  (@tv_brand, @r_intimissimi_ru, 'Intimissimi'),
  (@tv_category, @r_intimissimi_ru, 'retail'),
  (@tv_gallery, @r_intimissimi_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/intimissimi-1.jpg","alt":"Вывеска бутика Intimissimi"}]'),
  (@tv_directions, @r_intimissimi_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_intimissimi_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Intimissimi"},{"MIGX_id":"2","label":"Тип объекта","value":"Бутик"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_intimissimi_web, @r_intimissimi_en, @r_intimissimi_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_intimissimi_web, CONCAT('web:', @r_intimissimi_web, ';en:', @r_intimissimi_en, ';ru:', @r_intimissimi_ru)),
  (@tv_babel, @r_intimissimi_en, CONCAT('web:', @r_intimissimi_web, ';en:', @r_intimissimi_en, ';ru:', @r_intimissimi_ru)),
  (@tv_babel, @r_intimissimi_ru, CONCAT('web:', @r_intimissimi_web, ';en:', @r_intimissimi_en, ';ru:', @r_intimissimi_ru));

-- ---------------------------------------------------------------- carnegie-center
SET @r_carnegie_center_web = 65;
UPDATE modx_site_content SET pagetitle = 'Вивіска та навігація бізнес-центру', longtitle = '', menutitle = '',
  description = 'Дизайн-проєкт, вивіска та навігаційна табличка для бізнес-центру Carnegie Center.', alias = 'carnegie-center', uri = CONCAT(@u_web, 'carnegie-center/'),
  introtext = 'Дизайн-проєкт, вивіска та навігаційна табличка для бізнес-центру Carnegie Center.', content = '<p>Розробка дизайн-проєкту для БЦ «Carnegie Center». Вивіска виготовлена з композитного матеріалу з обʼємними та інкрустованими літерами з ПВХ і молочного акрилу, підсвітка — світлодіодні модулі. Навігаційна табличка — композитний матеріал, профіль і акрил. Інкрустація логотипа виготовлена з акрилу.</p>',
  template = @tpl, menuindex = 6, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_carnegie_center_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_carnegie_center_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_carnegie_center_web, 'Вивіска та навігація бізнес-центру Carnegie Center — проєкт improvision'),
  (@tv_og_description, @r_carnegie_center_web, 'Дизайн-проєкт, вивіска та навігаційна табличка для бізнес-центру Carnegie Center.'),
  (@tv_card_image, @r_carnegie_center_web, 'assets/img/photos/projects/carnegie-center-card.jpg'),
  (@tv_card_image_alt, @r_carnegie_center_web, 'Carnegie Center — Вивіска та навігація бізнес-центру'),
  (@tv_checklist, @r_carnegie_center_web, 'Дизайн-проєкт
Вивіска з обʼємними та інкрустованими літерами
Підсвітка світлодіодними модулями
Навігаційна табличка з композиту, профілю та акрилу'),
  (@tv_brand, @r_carnegie_center_web, 'Carnegie Center'),
  (@tv_city, @r_carnegie_center_web, 'Київ'),
  (@tv_category, @r_carnegie_center_web, 'business'),
  (@tv_gallery, @r_carnegie_center_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Вивіска над входом у БЦ Carnegie Center"},{"MIGX_id":"2","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Навігаційна табличка Carnegie Center з інкрустованими літерами"}]'),
  (@tv_directions, @r_carnegie_center_web, '[{"MIGX_id":"1","title":"Дизайн і проєктування","link":"53"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"},{"MIGX_id":"3","title":"Інтерʼєрна навігація","link":"50"}]'),
  (@tv_specs, @r_carnegie_center_web, '[{"MIGX_id":"1","label":"Замовник","value":"Carnegie Center"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бізнес-центр"},{"MIGX_id":"3","label":"Локація","value":"Кловський узвіз, 7, Київ"}]');
SET @r_carnegie_center_en = 66;
UPDATE modx_site_content SET pagetitle = 'Business centre sign and wayfinding', longtitle = '', menutitle = '',
  description = 'Design, sign and directory board for the Carnegie Center business centre.', alias = 'carnegie-center', uri = CONCAT(@u_en, 'carnegie-center/'),
  introtext = 'Design, sign and directory board for the Carnegie Center business centre.', content = '<p>Design project for the Carnegie Center business centre. The sign is composite with 3D and inlaid letters in PVC and opal acrylic, lit by LED modules. The directory board is composite, profile and acrylic; the logo inlay is acrylic.</p>',
  template = @tpl, menuindex = 6, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_carnegie_center_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_carnegie_center_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_carnegie_center_en, 'Carnegie Center: business centre sign and wayfinding — an improvision project'),
  (@tv_og_description, @r_carnegie_center_en, 'Design, sign and directory board for the Carnegie Center business centre.'),
  (@tv_card_image, @r_carnegie_center_en, 'assets/img/photos/projects/carnegie-center-card.jpg'),
  (@tv_card_image_alt, @r_carnegie_center_en, 'Carnegie Center — Business centre sign and wayfinding'),
  (@tv_checklist, @r_carnegie_center_en, 'Design project
Sign with 3D and inlaid letters
LED module lighting
Directory board in composite, profile and acrylic'),
  (@tv_brand, @r_carnegie_center_en, 'Carnegie Center'),
  (@tv_city, @r_carnegie_center_en, 'Kyiv'),
  (@tv_category, @r_carnegie_center_en, 'business'),
  (@tv_gallery, @r_carnegie_center_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Sign above the Carnegie Center entrance"},{"MIGX_id":"2","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Carnegie Center directory board with inlaid letters"}]'),
  (@tv_directions, @r_carnegie_center_en, '[{"MIGX_id":"1","title":"Design and engineering","link":"54"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"},{"MIGX_id":"3","title":"Interior wayfinding","link":"51"}]'),
  (@tv_specs, @r_carnegie_center_en, '[{"MIGX_id":"1","label":"Client","value":"Carnegie Center"},{"MIGX_id":"2","label":"Property type","value":"Business centre"},{"MIGX_id":"3","label":"Location","value":"7 Klovskyi Uzviz, Kyiv"}]');
SET @r_carnegie_center_ru = 67;
UPDATE modx_site_content SET pagetitle = 'Вывеска и навигация бизнес-центра', longtitle = '', menutitle = '',
  description = 'Дизайн-проект, вывеска и навигационная табличка для бизнес-центра Carnegie Center.', alias = 'carnegie-center', uri = CONCAT(@u_ru, 'carnegie-center/'),
  introtext = 'Дизайн-проект, вывеска и навигационная табличка для бизнес-центра Carnegie Center.', content = '<p>Разработка дизайн-проекта для БЦ «Carnegie Center». Вывеска изготовлена из композитного материала с объемными и инкрустированными буквами из ПВХ и молочного акрила, подсветка — светодиодные модули. Навигационная табличка — композитный материал, профиль и акрил. Инкрустация логотипа изготовлена из акрила.</p>',
  template = @tpl, menuindex = 6, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_carnegie_center_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_carnegie_center_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_carnegie_center_ru, 'Вывеска и навигация бизнес-центра Carnegie Center — проект improvision'),
  (@tv_og_description, @r_carnegie_center_ru, 'Дизайн-проект, вывеска и навигационная табличка для бизнес-центра Carnegie Center.'),
  (@tv_card_image, @r_carnegie_center_ru, 'assets/img/photos/projects/carnegie-center-card.jpg'),
  (@tv_card_image_alt, @r_carnegie_center_ru, 'Carnegie Center — Вывеска и навигация бизнес-центра'),
  (@tv_checklist, @r_carnegie_center_ru, 'Дизайн-проект
Вывеска с объемными и инкрустированными буквами
Подсветка светодиодными модулями
Навигационная табличка из композита, профиля и акрила'),
  (@tv_brand, @r_carnegie_center_ru, 'Carnegie Center'),
  (@tv_city, @r_carnegie_center_ru, 'Киев'),
  (@tv_category, @r_carnegie_center_ru, 'business'),
  (@tv_gallery, @r_carnegie_center_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Вывеска над входом в БЦ Carnegie Center"},{"MIGX_id":"2","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Навигационная табличка Carnegie Center с инкрустированными буквами"}]'),
  (@tv_directions, @r_carnegie_center_ru, '[{"MIGX_id":"1","title":"Дизайн и проектирование","link":"55"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"},{"MIGX_id":"3","title":"Интерьерная навигация","link":"52"}]'),
  (@tv_specs, @r_carnegie_center_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Carnegie Center"},{"MIGX_id":"2","label":"Тип объекта","value":"Бизнес-центр"},{"MIGX_id":"3","label":"Локация","value":"Кловский спуск, 7, Киев"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_carnegie_center_web, @r_carnegie_center_en, @r_carnegie_center_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_carnegie_center_web, CONCAT('web:', @r_carnegie_center_web, ';en:', @r_carnegie_center_en, ';ru:', @r_carnegie_center_ru)),
  (@tv_babel, @r_carnegie_center_en, CONCAT('web:', @r_carnegie_center_web, ';en:', @r_carnegie_center_en, ';ru:', @r_carnegie_center_ru)),
  (@tv_babel, @r_carnegie_center_ru, CONCAT('web:', @r_carnegie_center_web, ';en:', @r_carnegie_center_en, ';ru:', @r_carnegie_center_ru));

-- ---------------------------------------------------------------- calzedonia
SET @r_calzedonia_web = 71;
UPDATE modx_site_content SET pagetitle = 'Вивіска бутика', longtitle = '', menutitle = '',
  description = 'Світлова вивіска бутика Calzedonia з обʼємними літерами.', alias = 'calzedonia', uri = CONCAT(@u_web, 'calzedonia/'),
  introtext = 'Світлова вивіска бутика Calzedonia з обʼємними літерами.', content = '<p>Вивіска бутика «Calzedonia» виготовлена з алюмінієвих композитних панелей з обʼємними світловими літерами з акрилу та ПВХ, підсвітка — діодні кластери.</p>',
  template = @tpl, menuindex = 7, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_calzedonia_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_calzedonia_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_calzedonia_web, 'Вивіска бутика Calzedonia — проєкт improvision'),
  (@tv_og_description, @r_calzedonia_web, 'Світлова вивіска бутика Calzedonia з обʼємними літерами.'),
  (@tv_card_image, @r_calzedonia_web, 'assets/img/photos/projects/calzedonia-card.jpg'),
  (@tv_card_image_alt, @r_calzedonia_web, 'Calzedonia — Вивіска бутика'),
  (@tv_brand, @r_calzedonia_web, 'Calzedonia'),
  (@tv_category, @r_calzedonia_web, 'retail'),
  (@tv_gallery, @r_calzedonia_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Вивіска бутика Calzedonia"}]'),
  (@tv_directions, @r_calzedonia_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_calzedonia_web, '[{"MIGX_id":"1","label":"Замовник","value":"Calzedonia"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бутик"}]');
SET @r_calzedonia_en = 72;
UPDATE modx_site_content SET pagetitle = 'Boutique sign', longtitle = '', menutitle = '',
  description = 'An illuminated sign with 3D letters for a Calzedonia boutique.', alias = 'calzedonia', uri = CONCAT(@u_en, 'calzedonia/'),
  introtext = 'An illuminated sign with 3D letters for a Calzedonia boutique.', content = '<p>The Calzedonia boutique sign is made of aluminium composite panels with illuminated 3D letters in acrylic and PVC, lit by LED clusters.</p>',
  template = @tpl, menuindex = 7, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_calzedonia_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_calzedonia_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_calzedonia_en, 'Calzedonia: boutique sign — an improvision project'),
  (@tv_og_description, @r_calzedonia_en, 'An illuminated sign with 3D letters for a Calzedonia boutique.'),
  (@tv_card_image, @r_calzedonia_en, 'assets/img/photos/projects/calzedonia-card.jpg'),
  (@tv_card_image_alt, @r_calzedonia_en, 'Calzedonia — Boutique sign'),
  (@tv_brand, @r_calzedonia_en, 'Calzedonia'),
  (@tv_category, @r_calzedonia_en, 'retail'),
  (@tv_gallery, @r_calzedonia_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Calzedonia boutique sign"}]'),
  (@tv_directions, @r_calzedonia_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_calzedonia_en, '[{"MIGX_id":"1","label":"Client","value":"Calzedonia"},{"MIGX_id":"2","label":"Property type","value":"Boutique"}]');
SET @r_calzedonia_ru = 73;
UPDATE modx_site_content SET pagetitle = 'Вывеска бутика', longtitle = '', menutitle = '',
  description = 'Световая вывеска бутика Calzedonia с объемными буквами.', alias = 'calzedonia', uri = CONCAT(@u_ru, 'calzedonia/'),
  introtext = 'Световая вывеска бутика Calzedonia с объемными буквами.', content = '<p>Вывеска бутика «Calzedonia» изготовлена из алюминиевых композитных панелей с объемными световыми буквами из акрила и ПВХ, подсветка — диодные кластеры.</p>',
  template = @tpl, menuindex = 7, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_calzedonia_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_calzedonia_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_calzedonia_ru, 'Вывеска бутика Calzedonia — проект improvision'),
  (@tv_og_description, @r_calzedonia_ru, 'Световая вывеска бутика Calzedonia с объемными буквами.'),
  (@tv_card_image, @r_calzedonia_ru, 'assets/img/photos/projects/calzedonia-card.jpg'),
  (@tv_card_image_alt, @r_calzedonia_ru, 'Calzedonia — Вывеска бутика'),
  (@tv_brand, @r_calzedonia_ru, 'Calzedonia'),
  (@tv_category, @r_calzedonia_ru, 'retail'),
  (@tv_gallery, @r_calzedonia_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Вывеска бутика Calzedonia"}]'),
  (@tv_directions, @r_calzedonia_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_calzedonia_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Calzedonia"},{"MIGX_id":"2","label":"Тип объекта","value":"Бутик"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_calzedonia_web, @r_calzedonia_en, @r_calzedonia_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_calzedonia_web, CONCAT('web:', @r_calzedonia_web, ';en:', @r_calzedonia_en, ';ru:', @r_calzedonia_ru)),
  (@tv_babel, @r_calzedonia_en, CONCAT('web:', @r_calzedonia_web, ';en:', @r_calzedonia_en, ';ru:', @r_calzedonia_ru)),
  (@tv_babel, @r_calzedonia_ru, CONCAT('web:', @r_calzedonia_web, ';en:', @r_calzedonia_en, ';ru:', @r_calzedonia_ru));

-- ---------------------------------------------------------------- sun-gallery
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Дахова установка ТРЦ', 'Дахова рекламна установка з динамічною підсвіткою для ТРЦ «Сонячна Галерея».', 'sun-gallery', 1, @p_web, 1, 1, @tpl, 8,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'sun-gallery/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'sun-gallery' AND context_key = 'web');
SET @r_sun_gallery_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'sun-gallery' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Дахова установка ТРЦ', longtitle = '', menutitle = '',
  description = 'Дахова рекламна установка з динамічною підсвіткою для ТРЦ «Сонячна Галерея».', alias = 'sun-gallery', uri = CONCAT(@u_web, 'sun-gallery/'),
  introtext = 'Дахова рекламна установка з динамічною підсвіткою для ТРЦ «Сонячна Галерея».', content = '<p>Дахова установка ТРЦ «Сонячна Галерея» виготовлена з композитного матеріалу та банерної тканини backlit на каркасі з профільної труби. Динамічна підсвітка — діодні модулі з контролером.</p>',
  template = @tpl, menuindex = 8, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_sun_gallery_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_sun_gallery_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_sun_gallery_web, 'Дахова установка ТРЦ Сонячна Галерея — проєкт improvision'),
  (@tv_og_description, @r_sun_gallery_web, 'Дахова рекламна установка з динамічною підсвіткою для ТРЦ «Сонячна Галерея».'),
  (@tv_card_image, @r_sun_gallery_web, 'assets/img/photos/projects/sun-gallery-card.jpg'),
  (@tv_card_image_alt, @r_sun_gallery_web, 'Сонячна Галерея — Дахова установка ТРЦ'),
  (@tv_checklist, @r_sun_gallery_web, 'Каркас з профільної труби
Композитний матеріал і банерна тканина backlit
Динамічна підсвітка з контролером'),
  (@tv_brand, @r_sun_gallery_web, 'Сонячна Галерея'),
  (@tv_category, @r_sun_gallery_web, 'retail'),
  (@tv_gallery, @r_sun_gallery_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Дахова установка ТРЦ «Сонячна Галерея»"}]'),
  (@tv_directions, @r_sun_gallery_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_sun_gallery_web, '[{"MIGX_id":"1","label":"Замовник","value":"Сонячна Галерея"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"ТРЦ"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Rooftop sign for a shopping mall', 'A rooftop sign with dynamic lighting for the Sun Gallery shopping mall.', 'sun-gallery', 1, @p_en, 1, 1, @tpl, 8,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'sun-gallery/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'sun-gallery' AND context_key = 'en');
SET @r_sun_gallery_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'sun-gallery' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Rooftop sign for a shopping mall', longtitle = '', menutitle = '',
  description = 'A rooftop sign with dynamic lighting for the Sun Gallery shopping mall.', alias = 'sun-gallery', uri = CONCAT(@u_en, 'sun-gallery/'),
  introtext = 'A rooftop sign with dynamic lighting for the Sun Gallery shopping mall.', content = '<p>The rooftop sign of the Sun Gallery mall is made of composite and backlit banner fabric on a steel tube frame. Dynamic lighting is driven by LED modules and a controller.</p>',
  template = @tpl, menuindex = 8, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_sun_gallery_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_sun_gallery_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_sun_gallery_en, 'Sun Gallery: rooftop sign for a shopping mall — an improvision project'),
  (@tv_og_description, @r_sun_gallery_en, 'A rooftop sign with dynamic lighting for the Sun Gallery shopping mall.'),
  (@tv_card_image, @r_sun_gallery_en, 'assets/img/photos/projects/sun-gallery-card.jpg'),
  (@tv_card_image_alt, @r_sun_gallery_en, 'Sun Gallery — Rooftop sign for a shopping mall'),
  (@tv_checklist, @r_sun_gallery_en, 'Steel tube frame
Composite and backlit banner fabric
Dynamic lighting with a controller'),
  (@tv_brand, @r_sun_gallery_en, 'Sun Gallery'),
  (@tv_category, @r_sun_gallery_en, 'retail'),
  (@tv_gallery, @r_sun_gallery_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Rooftop sign of the Sun Gallery mall"}]'),
  (@tv_directions, @r_sun_gallery_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_sun_gallery_en, '[{"MIGX_id":"1","label":"Client","value":"Sun Gallery"},{"MIGX_id":"2","label":"Property type","value":"Shopping mall"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Крышная установка ТРЦ', 'Крышная рекламная установка с динамической подсветкой для ТРЦ «Солнечная Галерея».', 'sun-gallery', 1, @p_ru, 1, 1, @tpl, 8,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'sun-gallery/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'sun-gallery' AND context_key = 'ru');
SET @r_sun_gallery_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'sun-gallery' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Крышная установка ТРЦ', longtitle = '', menutitle = '',
  description = 'Крышная рекламная установка с динамической подсветкой для ТРЦ «Солнечная Галерея».', alias = 'sun-gallery', uri = CONCAT(@u_ru, 'sun-gallery/'),
  introtext = 'Крышная рекламная установка с динамической подсветкой для ТРЦ «Солнечная Галерея».', content = '<p>Крышная установка ТРЦ «Солнечная Галерея» изготовлена из композитного материала и баннерной ткани backlit на каркасе из профильной трубы, динамическая подсветка — диодные модули и контроллер.</p>',
  template = @tpl, menuindex = 8, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_sun_gallery_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_sun_gallery_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_sun_gallery_ru, 'Крышная установка ТРЦ Солнечная Галерея — проект improvision'),
  (@tv_og_description, @r_sun_gallery_ru, 'Крышная рекламная установка с динамической подсветкой для ТРЦ «Солнечная Галерея».'),
  (@tv_card_image, @r_sun_gallery_ru, 'assets/img/photos/projects/sun-gallery-card.jpg'),
  (@tv_card_image_alt, @r_sun_gallery_ru, 'Солнечная Галерея — Крышная установка ТРЦ'),
  (@tv_checklist, @r_sun_gallery_ru, 'Каркас из профильной трубы
Композитный материал и баннерная ткань backlit
Динамическая подсветка с контроллером'),
  (@tv_brand, @r_sun_gallery_ru, 'Солнечная Галерея'),
  (@tv_category, @r_sun_gallery_ru, 'retail'),
  (@tv_gallery, @r_sun_gallery_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Крышная установка ТРЦ «Солнечная Галерея»"}]'),
  (@tv_directions, @r_sun_gallery_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_sun_gallery_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Солнечная Галерея"},{"MIGX_id":"2","label":"Тип объекта","value":"ТРЦ"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_sun_gallery_web, @r_sun_gallery_en, @r_sun_gallery_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_sun_gallery_web, CONCAT('web:', @r_sun_gallery_web, ';en:', @r_sun_gallery_en, ';ru:', @r_sun_gallery_ru)),
  (@tv_babel, @r_sun_gallery_en, CONCAT('web:', @r_sun_gallery_web, ';en:', @r_sun_gallery_en, ';ru:', @r_sun_gallery_ru)),
  (@tv_babel, @r_sun_gallery_ru, CONCAT('web:', @r_sun_gallery_web, ';en:', @r_sun_gallery_en, ';ru:', @r_sun_gallery_ru));

-- ---------------------------------------------------------------- arbat-prestige
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вивіски для мережі магазинів', 'Світлові короби для 29 магазинів мережі по всій Україні та сувенірна продукція.', 'arbat-prestige', 1, @p_web, 1, 1, @tpl, 9,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'arbat-prestige/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'arbat-prestige' AND context_key = 'web');
SET @r_arbat_prestige_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'arbat-prestige' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вивіски для мережі магазинів', longtitle = '', menutitle = '',
  description = 'Світлові короби для 29 магазинів мережі по всій Україні та сувенірна продукція.', alias = 'arbat-prestige', uri = CONCAT(@u_web, 'arbat-prestige/'),
  introtext = 'Світлові короби для 29 магазинів мережі по всій Україні та сувенірна продукція.', content = '<p>Оформлення 29 магазинів по всій Україні рекламними світловими коробами з банерної тканини backlit, закріпленої за системою «Milliken», та композитного матеріалу з підсвіткою люмінесцентними лампами.</p><p>Також виготовлення сувенірної продукції: подарункових пакувань, поліетиленових пакетів, вологих серветок.</p>',
  template = @tpl, menuindex = 9, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_arbat_prestige_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_arbat_prestige_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_arbat_prestige_web, 'Вивіски для мережі магазинів Арбат Престиж — проєкт improvision'),
  (@tv_og_description, @r_arbat_prestige_web, 'Світлові короби для 29 магазинів мережі по всій Україні та сувенірна продукція.'),
  (@tv_card_image, @r_arbat_prestige_web, 'assets/img/photos/projects/arbat-prestige-card.jpg'),
  (@tv_card_image_alt, @r_arbat_prestige_web, 'Арбат Престиж — Вивіски для мережі магазинів'),
  (@tv_checklist, @r_arbat_prestige_web, 'Світлові короби для 29 магазинів
Банерна тканина backlit на системі Milliken
Підсвітка люмінесцентними лампами
Сувенірна продукція: пакування, пакети, серветки'),
  (@tv_brand, @r_arbat_prestige_web, 'Арбат Престиж'),
  (@tv_city, @r_arbat_prestige_web, 'Україна'),
  (@tv_category, @r_arbat_prestige_web, 'retail'),
  (@tv_gallery, @r_arbat_prestige_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/arbat-prestige-1.jpg","alt":"Вивіски магазинів мережі «Арбат Престиж»"},{"MIGX_id":"2","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Світлові короби магазинів «Арбат Престиж» у різних містах"}]'),
  (@tv_directions, @r_arbat_prestige_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_arbat_prestige_web, '[{"MIGX_id":"1","label":"Замовник","value":"Арбат Престиж"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Мережа магазинів"},{"MIGX_id":"3","label":"Локація","value":"Україна"},{"MIGX_id":"4","label":"Обсяг","value":"29 магазинів по всій Україні"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Signage for a store chain', 'Light boxes for 29 stores of the chain across Ukraine, plus branded merchandise.', 'arbat-prestige', 1, @p_en, 1, 1, @tpl, 9,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'arbat-prestige/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'arbat-prestige' AND context_key = 'en');
SET @r_arbat_prestige_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'arbat-prestige' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Signage for a store chain', longtitle = '', menutitle = '',
  description = 'Light boxes for 29 stores of the chain across Ukraine, plus branded merchandise.', alias = 'arbat-prestige', uri = CONCAT(@u_en, 'arbat-prestige/'),
  introtext = 'Light boxes for 29 stores of the chain across Ukraine, plus branded merchandise.', content = '<p>29 stores across Ukraine were fitted with illuminated light boxes of backlit banner fabric on the Milliken tensioning system and composite, lit by fluorescent lamps.</p><p>We also produced branded merchandise: gift packaging, plastic bags and wet wipes.</p>',
  template = @tpl, menuindex = 9, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_arbat_prestige_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_arbat_prestige_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_arbat_prestige_en, 'Arbat Prestige: signage for a store chain — an improvision project'),
  (@tv_og_description, @r_arbat_prestige_en, 'Light boxes for 29 stores of the chain across Ukraine, plus branded merchandise.'),
  (@tv_card_image, @r_arbat_prestige_en, 'assets/img/photos/projects/arbat-prestige-card.jpg'),
  (@tv_card_image_alt, @r_arbat_prestige_en, 'Arbat Prestige — Signage for a store chain'),
  (@tv_checklist, @r_arbat_prestige_en, 'Light boxes for 29 stores
Backlit banner fabric on the Milliken system
Fluorescent lighting
Merchandise: packaging, bags, wet wipes'),
  (@tv_brand, @r_arbat_prestige_en, 'Arbat Prestige'),
  (@tv_city, @r_arbat_prestige_en, 'Ukraine'),
  (@tv_category, @r_arbat_prestige_en, 'retail'),
  (@tv_gallery, @r_arbat_prestige_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/arbat-prestige-1.jpg","alt":"Arbat Prestige store signs"},{"MIGX_id":"2","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Arbat Prestige light boxes in different cities"}]'),
  (@tv_directions, @r_arbat_prestige_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_arbat_prestige_en, '[{"MIGX_id":"1","label":"Client","value":"Arbat Prestige"},{"MIGX_id":"2","label":"Property type","value":"Store chain"},{"MIGX_id":"3","label":"Location","value":"Ukraine"},{"MIGX_id":"4","label":"Scope","value":"29 stores across Ukraine"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вывески для сети магазинов', 'Световые короба для 29 магазинов сети по всей Украине и сувенирная продукция.', 'arbat-prestige', 1, @p_ru, 1, 1, @tpl, 9,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'arbat-prestige/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'arbat-prestige' AND context_key = 'ru');
SET @r_arbat_prestige_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'arbat-prestige' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вывески для сети магазинов', longtitle = '', menutitle = '',
  description = 'Световые короба для 29 магазинов сети по всей Украине и сувенирная продукция.', alias = 'arbat-prestige', uri = CONCAT(@u_ru, 'arbat-prestige/'),
  introtext = 'Световые короба для 29 магазинов сети по всей Украине и сувенирная продукция.', content = '<p>Оформление 29 магазинов по всей Украине рекламными световыми коробами из баннерной ткани (backlit), закрепленной по системе «Milliken», и композитного материала с подсветкой люминесцентными лампами.</p><p>А также изготовление сувенирной продукции: подарочных упаковок, полиэтиленовых пакетов, влажных салфеток.</p>',
  template = @tpl, menuindex = 9, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_arbat_prestige_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_arbat_prestige_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_arbat_prestige_ru, 'Вывески для сети магазинов Арбат Престиж — проект improvision'),
  (@tv_og_description, @r_arbat_prestige_ru, 'Световые короба для 29 магазинов сети по всей Украине и сувенирная продукция.'),
  (@tv_card_image, @r_arbat_prestige_ru, 'assets/img/photos/projects/arbat-prestige-card.jpg'),
  (@tv_card_image_alt, @r_arbat_prestige_ru, 'Арбат Престиж — Вывески для сети магазинов'),
  (@tv_checklist, @r_arbat_prestige_ru, 'Световые короба для 29 магазинов
Баннерная ткань backlit на системе Milliken
Подсветка люминесцентными лампами
Сувенирная продукция: упаковка, пакеты, салфетки'),
  (@tv_brand, @r_arbat_prestige_ru, 'Арбат Престиж'),
  (@tv_city, @r_arbat_prestige_ru, 'Украина'),
  (@tv_category, @r_arbat_prestige_ru, 'retail'),
  (@tv_gallery, @r_arbat_prestige_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/arbat-prestige-1.jpg","alt":"Вывески магазинов сети «Арбат Престиж»"},{"MIGX_id":"2","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Световые короба магазинов «Арбат Престиж» в разных городах"}]'),
  (@tv_directions, @r_arbat_prestige_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_arbat_prestige_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Арбат Престиж"},{"MIGX_id":"2","label":"Тип объекта","value":"Сеть магазинов"},{"MIGX_id":"3","label":"Локация","value":"Украина"},{"MIGX_id":"4","label":"Объем","value":"29 магазинов по всей Украине"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_arbat_prestige_web, @r_arbat_prestige_en, @r_arbat_prestige_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_arbat_prestige_web, CONCAT('web:', @r_arbat_prestige_web, ';en:', @r_arbat_prestige_en, ';ru:', @r_arbat_prestige_ru)),
  (@tv_babel, @r_arbat_prestige_en, CONCAT('web:', @r_arbat_prestige_web, ';en:', @r_arbat_prestige_en, ';ru:', @r_arbat_prestige_ru)),
  (@tv_babel, @r_arbat_prestige_ru, CONCAT('web:', @r_arbat_prestige_web, ';en:', @r_arbat_prestige_en, ';ru:', @r_arbat_prestige_ru));

-- ---------------------------------------------------------------- baldessarini
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вивіска бутика', 'Світлова вивіска бутика Baldessarini з обʼємними літерами.', 'baldessarini', 1, @p_web, 1, 1, @tpl, 10,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'baldessarini/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'baldessarini' AND context_key = 'web');
SET @r_baldessarini_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'baldessarini' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вивіска бутика', longtitle = '', menutitle = '',
  description = 'Світлова вивіска бутика Baldessarini з обʼємними літерами.', alias = 'baldessarini', uri = CONCAT(@u_web, 'baldessarini/'),
  introtext = 'Світлова вивіска бутика Baldessarini з обʼємними літерами.', content = '<p>Вивіска бутика «Baldessarini» виготовлена з композитного матеріалу з обʼємними світловими літерами з акрилу та ПВХ, підсвітка — світлодіодні кластери.</p>',
  template = @tpl, menuindex = 10, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_baldessarini_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_baldessarini_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_baldessarini_web, 'Вивіска бутика Baldessarini — проєкт improvision'),
  (@tv_og_description, @r_baldessarini_web, 'Світлова вивіска бутика Baldessarini з обʼємними літерами.'),
  (@tv_card_image, @r_baldessarini_web, 'assets/img/photos/projects/baldessarini-card.jpg'),
  (@tv_card_image_alt, @r_baldessarini_web, 'Baldessarini — Вивіска бутика'),
  (@tv_brand, @r_baldessarini_web, 'Baldessarini'),
  (@tv_category, @r_baldessarini_web, 'retail'),
  (@tv_gallery, @r_baldessarini_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/baldessarini-1.jpg","alt":"Вивіска бутика Baldessarini"}]'),
  (@tv_directions, @r_baldessarini_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_baldessarini_web, '[{"MIGX_id":"1","label":"Замовник","value":"Baldessarini"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бутик"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Boutique sign', 'An illuminated sign with 3D letters for a Baldessarini boutique.', 'baldessarini', 1, @p_en, 1, 1, @tpl, 10,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'baldessarini/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'baldessarini' AND context_key = 'en');
SET @r_baldessarini_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'baldessarini' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Boutique sign', longtitle = '', menutitle = '',
  description = 'An illuminated sign with 3D letters for a Baldessarini boutique.', alias = 'baldessarini', uri = CONCAT(@u_en, 'baldessarini/'),
  introtext = 'An illuminated sign with 3D letters for a Baldessarini boutique.', content = '<p>The Baldessarini boutique sign is made of composite with illuminated 3D letters in acrylic and PVC, lit by LED clusters.</p>',
  template = @tpl, menuindex = 10, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_baldessarini_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_baldessarini_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_baldessarini_en, 'Baldessarini: boutique sign — an improvision project'),
  (@tv_og_description, @r_baldessarini_en, 'An illuminated sign with 3D letters for a Baldessarini boutique.'),
  (@tv_card_image, @r_baldessarini_en, 'assets/img/photos/projects/baldessarini-card.jpg'),
  (@tv_card_image_alt, @r_baldessarini_en, 'Baldessarini — Boutique sign'),
  (@tv_brand, @r_baldessarini_en, 'Baldessarini'),
  (@tv_category, @r_baldessarini_en, 'retail'),
  (@tv_gallery, @r_baldessarini_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/baldessarini-1.jpg","alt":"Baldessarini boutique sign"}]'),
  (@tv_directions, @r_baldessarini_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_baldessarini_en, '[{"MIGX_id":"1","label":"Client","value":"Baldessarini"},{"MIGX_id":"2","label":"Property type","value":"Boutique"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вывеска бутика', 'Световая вывеска бутика Baldessarini с объемными буквами.', 'baldessarini', 1, @p_ru, 1, 1, @tpl, 10,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'baldessarini/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'baldessarini' AND context_key = 'ru');
SET @r_baldessarini_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'baldessarini' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вывеска бутика', longtitle = '', menutitle = '',
  description = 'Световая вывеска бутика Baldessarini с объемными буквами.', alias = 'baldessarini', uri = CONCAT(@u_ru, 'baldessarini/'),
  introtext = 'Световая вывеска бутика Baldessarini с объемными буквами.', content = '<p>Вывеска бутика «Baldessarini» изготовлена из композитного материала с объемными световыми буквами из акрила и ПВХ, подсветка — светодиодные кластеры.</p>',
  template = @tpl, menuindex = 10, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_baldessarini_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_baldessarini_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_baldessarini_ru, 'Вывеска бутика Baldessarini — проект improvision'),
  (@tv_og_description, @r_baldessarini_ru, 'Световая вывеска бутика Baldessarini с объемными буквами.'),
  (@tv_card_image, @r_baldessarini_ru, 'assets/img/photos/projects/baldessarini-card.jpg'),
  (@tv_card_image_alt, @r_baldessarini_ru, 'Baldessarini — Вывеска бутика'),
  (@tv_brand, @r_baldessarini_ru, 'Baldessarini'),
  (@tv_category, @r_baldessarini_ru, 'retail'),
  (@tv_gallery, @r_baldessarini_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/baldessarini-1.jpg","alt":"Вывеска бутика Baldessarini"}]'),
  (@tv_directions, @r_baldessarini_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_baldessarini_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Baldessarini"},{"MIGX_id":"2","label":"Тип объекта","value":"Бутик"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_baldessarini_web, @r_baldessarini_en, @r_baldessarini_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_baldessarini_web, CONCAT('web:', @r_baldessarini_web, ';en:', @r_baldessarini_en, ';ru:', @r_baldessarini_ru)),
  (@tv_babel, @r_baldessarini_en, CONCAT('web:', @r_baldessarini_web, ';en:', @r_baldessarini_en, ';ru:', @r_baldessarini_ru)),
  (@tv_babel, @r_baldessarini_ru, CONCAT('web:', @r_baldessarini_web, ';en:', @r_baldessarini_en, ';ru:', @r_baldessarini_ru));

-- ---------------------------------------------------------------- cc
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вентильований фасад магазину', 'Утеплений вентильований фасад магазину з композиту та профнастилу.', 'cc', 1, @p_web, 1, 1, @tpl, 11,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'cc/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'cc' AND context_key = 'web');
SET @r_cc_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'cc' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вентильований фасад магазину', longtitle = '', menutitle = '',
  description = 'Утеплений вентильований фасад магазину з композиту та профнастилу.', alias = 'cc', uri = CONCAT(@u_web, 'cc/'),
  introtext = 'Утеплений вентильований фасад магазину з композиту та профнастилу.', content = '<p>Вентильований фасад магазину «C&amp;C» виготовлений з композитного матеріалу та профнастилу, закріпленого на каркасі з металевої профільної труби. Фасад утеплений мінеральним утеплювачем.</p>',
  template = @tpl, menuindex = 11, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_cc_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_cc_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_cc_web, 'Вентильований фасад магазину C&C — проєкт improvision'),
  (@tv_og_description, @r_cc_web, 'Утеплений вентильований фасад магазину з композиту та профнастилу.'),
  (@tv_card_image, @r_cc_web, 'assets/img/photos/projects/cc-card.jpg'),
  (@tv_card_image_alt, @r_cc_web, 'C&C — Вентильований фасад магазину'),
  (@tv_checklist, @r_cc_web, 'Каркас з металевої профільної труби
Облицювання композитом і профнастилом
Утеплення мінеральним утеплювачем'),
  (@tv_brand, @r_cc_web, 'C&C'),
  (@tv_category, @r_cc_web, 'facades'),
  (@tv_gallery, @r_cc_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/cc-1.jpg","alt":"Вентильований фасад магазину C&C"},{"MIGX_id":"2","image":"assets/img/photos/projects/cc-2.jpg","alt":"Фасад магазину C&C, бічна сторона"}]'),
  (@tv_directions, @r_cc_web, '[{"MIGX_id":"1","title":"Вентильовані фасади","link":"41"}]'),
  (@tv_specs, @r_cc_web, '[{"MIGX_id":"1","label":"Замовник","value":"C&C"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Магазин"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Store ventilated facade', 'An insulated ventilated store facade in composite and profiled sheet.', 'cc', 1, @p_en, 1, 1, @tpl, 11,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'cc/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'cc' AND context_key = 'en');
SET @r_cc_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'cc' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Store ventilated facade', longtitle = '', menutitle = '',
  description = 'An insulated ventilated store facade in composite and profiled sheet.', alias = 'cc', uri = CONCAT(@u_en, 'cc/'),
  introtext = 'An insulated ventilated store facade in composite and profiled sheet.', content = '<p>The ventilated facade of the C&amp;C store is made of composite and profiled sheet fixed to a steel tube frame, insulated with mineral wool.</p>',
  template = @tpl, menuindex = 11, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_cc_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_cc_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_cc_en, 'C&C: store ventilated facade — an improvision project'),
  (@tv_og_description, @r_cc_en, 'An insulated ventilated store facade in composite and profiled sheet.'),
  (@tv_card_image, @r_cc_en, 'assets/img/photos/projects/cc-card.jpg'),
  (@tv_card_image_alt, @r_cc_en, 'C&C — Store ventilated facade'),
  (@tv_checklist, @r_cc_en, 'Steel tube frame
Composite and profiled sheet cladding
Mineral wool insulation'),
  (@tv_brand, @r_cc_en, 'C&C'),
  (@tv_category, @r_cc_en, 'facades'),
  (@tv_gallery, @r_cc_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/cc-1.jpg","alt":"C&C store ventilated facade"},{"MIGX_id":"2","image":"assets/img/photos/projects/cc-2.jpg","alt":"C&C store facade, side view"}]'),
  (@tv_directions, @r_cc_en, '[{"MIGX_id":"1","title":"Ventilated facades","link":"42"}]'),
  (@tv_specs, @r_cc_en, '[{"MIGX_id":"1","label":"Client","value":"C&C"},{"MIGX_id":"2","label":"Property type","value":"Store"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вентилируемый фасад магазина', 'Утепленный вентилируемый фасад магазина из композита и профнастила.', 'cc', 1, @p_ru, 1, 1, @tpl, 11,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'cc/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'cc' AND context_key = 'ru');
SET @r_cc_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'cc' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вентилируемый фасад магазина', longtitle = '', menutitle = '',
  description = 'Утепленный вентилируемый фасад магазина из композита и профнастила.', alias = 'cc', uri = CONCAT(@u_ru, 'cc/'),
  introtext = 'Утепленный вентилируемый фасад магазина из композита и профнастила.', content = '<p>Вентилируемый фасад магазина «C&amp;C» изготовлен из композитного материала и профнастила, закрепленного на каркасе из металлической профильной трубы. Фасад утеплен минеральным утеплителем.</p>',
  template = @tpl, menuindex = 11, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_cc_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_cc_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_cc_ru, 'Вентилируемый фасад магазина C&C — проект improvision'),
  (@tv_og_description, @r_cc_ru, 'Утепленный вентилируемый фасад магазина из композита и профнастила.'),
  (@tv_card_image, @r_cc_ru, 'assets/img/photos/projects/cc-card.jpg'),
  (@tv_card_image_alt, @r_cc_ru, 'C&C — Вентилируемый фасад магазина'),
  (@tv_checklist, @r_cc_ru, 'Каркас из металлической профильной трубы
Облицовка композитом и профнастилом
Утепление минеральным утеплителем'),
  (@tv_brand, @r_cc_ru, 'C&C'),
  (@tv_category, @r_cc_ru, 'facades'),
  (@tv_gallery, @r_cc_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/cc-1.jpg","alt":"Вентилируемый фасад магазина C&C"},{"MIGX_id":"2","image":"assets/img/photos/projects/cc-2.jpg","alt":"Фасад магазина C&C, боковая сторона"}]'),
  (@tv_directions, @r_cc_ru, '[{"MIGX_id":"1","title":"Вентилируемые фасады","link":"43"}]'),
  (@tv_specs, @r_cc_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"C&C"},{"MIGX_id":"2","label":"Тип объекта","value":"Магазин"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_cc_web, @r_cc_en, @r_cc_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_cc_web, CONCAT('web:', @r_cc_web, ';en:', @r_cc_en, ';ru:', @r_cc_ru)),
  (@tv_babel, @r_cc_en, CONCAT('web:', @r_cc_web, ';en:', @r_cc_en, ';ru:', @r_cc_ru)),
  (@tv_babel, @r_cc_ru, CONCAT('web:', @r_cc_web, ';en:', @r_cc_en, ';ru:', @r_cc_ru));

-- ---------------------------------------------------------------- yus-bar
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вивіска ресторану', 'Дизайн зовнішнього оформлення, вивіска та торцевий лайтбокс ресторану Yu.S.', 'yus-bar', 1, @p_web, 1, 1, @tpl, 12,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'yus-bar/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'yus-bar' AND context_key = 'web');
SET @r_yus_bar_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'yus-bar' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вивіска ресторану', longtitle = '', menutitle = '',
  description = 'Дизайн зовнішнього оформлення, вивіска та торцевий лайтбокс ресторану Yu.S.', alias = 'yus-bar', uri = CONCAT(@u_web, 'yus-bar/'),
  introtext = 'Дизайн зовнішнього оформлення, вивіска та торцевий лайтбокс ресторану Yu.S.', content = '<p>Розробка дизайну зовнішнього оформлення для ресторану «Yu.S». Вивіска й торцевий лайтбокс виготовлені з алюмінієвих композитних панелей з обʼємними акриловими літерами, підсвіченими зовнішніми діодами.</p>',
  template = @tpl, menuindex = 12, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_yus_bar_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_yus_bar_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_yus_bar_web, 'Вивіска ресторану Yu.S bar — проєкт improvision'),
  (@tv_og_description, @r_yus_bar_web, 'Дизайн зовнішнього оформлення, вивіска та торцевий лайтбокс ресторану Yu.S.'),
  (@tv_card_image, @r_yus_bar_web, 'assets/img/photos/projects/yus-bar-card.jpg'),
  (@tv_card_image_alt, @r_yus_bar_web, 'Yu.S bar — Вивіска ресторану'),
  (@tv_checklist, @r_yus_bar_web, 'Дизайн зовнішнього оформлення
Вивіска з обʼємними акриловими літерами
Торцевий лайтбокс'),
  (@tv_brand, @r_yus_bar_web, 'Yu.S bar'),
  (@tv_category, @r_yus_bar_web, 'restaurants'),
  (@tv_gallery, @r_yus_bar_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Вивіска ресторану Yu.S bar"}]'),
  (@tv_directions, @r_yus_bar_web, '[{"MIGX_id":"1","title":"Дизайн і проєктування","link":"53"},{"MIGX_id":"2","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_yus_bar_web, '[{"MIGX_id":"1","label":"Замовник","value":"Yu.S bar"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Ресторан"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Restaurant sign', 'Exterior design, sign and blade light box for the Yu.S restaurant.', 'yus-bar', 1, @p_en, 1, 1, @tpl, 12,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'yus-bar/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'yus-bar' AND context_key = 'en');
SET @r_yus_bar_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'yus-bar' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Restaurant sign', longtitle = '', menutitle = '',
  description = 'Exterior design, sign and blade light box for the Yu.S restaurant.', alias = 'yus-bar', uri = CONCAT(@u_en, 'yus-bar/'),
  introtext = 'Exterior design, sign and blade light box for the Yu.S restaurant.', content = '<p>Exterior design for the Yu.S restaurant. The sign and the blade light box are made of aluminium composite panels with 3D acrylic letters lit by external LEDs.</p>',
  template = @tpl, menuindex = 12, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_yus_bar_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_yus_bar_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_yus_bar_en, 'Yu.S bar: restaurant sign — an improvision project'),
  (@tv_og_description, @r_yus_bar_en, 'Exterior design, sign and blade light box for the Yu.S restaurant.'),
  (@tv_card_image, @r_yus_bar_en, 'assets/img/photos/projects/yus-bar-card.jpg'),
  (@tv_card_image_alt, @r_yus_bar_en, 'Yu.S bar — Restaurant sign'),
  (@tv_checklist, @r_yus_bar_en, 'Exterior design
Sign with 3D acrylic letters
Blade light box'),
  (@tv_brand, @r_yus_bar_en, 'Yu.S bar'),
  (@tv_category, @r_yus_bar_en, 'restaurants'),
  (@tv_gallery, @r_yus_bar_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Yu.S bar restaurant sign"}]'),
  (@tv_directions, @r_yus_bar_en, '[{"MIGX_id":"1","title":"Design and engineering","link":"54"},{"MIGX_id":"2","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_yus_bar_en, '[{"MIGX_id":"1","label":"Client","value":"Yu.S bar"},{"MIGX_id":"2","label":"Property type","value":"Restaurant"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вывеска ресторана', 'Дизайн наружного оформления, вывеска и торцевой лайтбокс ресторана Yu.S.', 'yus-bar', 1, @p_ru, 1, 1, @tpl, 12,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'yus-bar/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'yus-bar' AND context_key = 'ru');
SET @r_yus_bar_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'yus-bar' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вывеска ресторана', longtitle = '', menutitle = '',
  description = 'Дизайн наружного оформления, вывеска и торцевой лайтбокс ресторана Yu.S.', alias = 'yus-bar', uri = CONCAT(@u_ru, 'yus-bar/'),
  introtext = 'Дизайн наружного оформления, вывеска и торцевой лайтбокс ресторана Yu.S.', content = '<p>Разработка дизайна внешнего оформления для ресторана «Yu.S». Вывеска и торцевой лайтбокс изготовлены из алюминиевых композитных панелей с объемными акриловыми буквами, засвеченными при помощи наружных диодов.</p>',
  template = @tpl, menuindex = 12, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_yus_bar_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_yus_bar_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_yus_bar_ru, 'Вывеска ресторана Yu.S bar — проект improvision'),
  (@tv_og_description, @r_yus_bar_ru, 'Дизайн наружного оформления, вывеска и торцевой лайтбокс ресторана Yu.S.'),
  (@tv_card_image, @r_yus_bar_ru, 'assets/img/photos/projects/yus-bar-card.jpg'),
  (@tv_card_image_alt, @r_yus_bar_ru, 'Yu.S bar — Вывеска ресторана'),
  (@tv_checklist, @r_yus_bar_ru, 'Дизайн наружного оформления
Вывеска с объемными акриловыми буквами
Торцевой лайтбокс'),
  (@tv_brand, @r_yus_bar_ru, 'Yu.S bar'),
  (@tv_category, @r_yus_bar_ru, 'restaurants'),
  (@tv_gallery, @r_yus_bar_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Вывеска ресторана Yu.S bar"}]'),
  (@tv_directions, @r_yus_bar_ru, '[{"MIGX_id":"1","title":"Дизайн и проектирование","link":"55"},{"MIGX_id":"2","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_yus_bar_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Yu.S bar"},{"MIGX_id":"2","label":"Тип объекта","value":"Ресторан"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_yus_bar_web, @r_yus_bar_en, @r_yus_bar_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_yus_bar_web, CONCAT('web:', @r_yus_bar_web, ';en:', @r_yus_bar_en, ';ru:', @r_yus_bar_ru)),
  (@tv_babel, @r_yus_bar_en, CONCAT('web:', @r_yus_bar_web, ';en:', @r_yus_bar_en, ';ru:', @r_yus_bar_ru)),
  (@tv_babel, @r_yus_bar_ru, CONCAT('web:', @r_yus_bar_web, ';en:', @r_yus_bar_en, ';ru:', @r_yus_bar_ru));

-- ---------------------------------------------------------------- hooligan
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Світлова вивіска мотосалону', 'Світлова вивіска, сітка mesh з друком і брендування автомобіля для мотосалону Hooligan.', 'hooligan', 1, @p_web, 1, 1, @tpl, 13,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'hooligan/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'hooligan' AND context_key = 'web');
SET @r_hooligan_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'hooligan' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Світлова вивіска мотосалону', longtitle = '', menutitle = '',
  description = 'Світлова вивіска, сітка mesh з друком і брендування автомобіля для мотосалону Hooligan.', alias = 'hooligan', uri = CONCAT(@u_web, 'hooligan/'),
  introtext = 'Світлова вивіска, сітка mesh з друком і брендування автомобіля для мотосалону Hooligan.', content = '<p>Світлова вивіска мотосалону «Hooligan» виготовлена з композитного матеріалу з обʼємними та інкрустованими світловими літерами з ПВХ і акрилу. Підсвітка — світлодіодні модулі.</p><p>Також сітка mesh із широкоформатним друком сольвентними чорнилами та брендування автомобіля вініловими плівками.</p>',
  template = @tpl, menuindex = 13, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_hooligan_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_hooligan_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_hooligan_web, 'Світлова вивіска мотосалону Hooligan — проєкт improvision'),
  (@tv_og_description, @r_hooligan_web, 'Світлова вивіска, сітка mesh з друком і брендування автомобіля для мотосалону Hooligan.'),
  (@tv_card_image, @r_hooligan_web, 'assets/img/photos/projects/hooligan-card.jpg'),
  (@tv_card_image_alt, @r_hooligan_web, 'Hooligan — Світлова вивіска мотосалону'),
  (@tv_checklist, @r_hooligan_web, 'Світлова вивіска з обʼємними літерами
Сітка mesh із широкоформатним друком
Брендування автомобіля вініловими плівками'),
  (@tv_brand, @r_hooligan_web, 'Hooligan'),
  (@tv_category, @r_hooligan_web, 'retail'),
  (@tv_gallery, @r_hooligan_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/hooligan-1.jpg","alt":"Світлова вивіска мотосалону Hooligan"}]'),
  (@tv_directions, @r_hooligan_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_hooligan_web, '[{"MIGX_id":"1","label":"Замовник","value":"Hooligan"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Мотосалон"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Motorcycle showroom sign', 'An illuminated sign, printed mesh banner and vehicle branding for the Hooligan motorcycle showroom.', 'hooligan', 1, @p_en, 1, 1, @tpl, 13,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'hooligan/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'hooligan' AND context_key = 'en');
SET @r_hooligan_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'hooligan' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Motorcycle showroom sign', longtitle = '', menutitle = '',
  description = 'An illuminated sign, printed mesh banner and vehicle branding for the Hooligan motorcycle showroom.', alias = 'hooligan', uri = CONCAT(@u_en, 'hooligan/'),
  introtext = 'An illuminated sign, printed mesh banner and vehicle branding for the Hooligan motorcycle showroom.', content = '<p>The Hooligan showroom sign is made of composite with illuminated 3D and inlaid letters in PVC and acrylic, lit by LED modules.</p><p>We also made a mesh banner with large-format solvent printing and branded the company car with vinyl film.</p>',
  template = @tpl, menuindex = 13, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_hooligan_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_hooligan_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_hooligan_en, 'Hooligan: motorcycle showroom sign — an improvision project'),
  (@tv_og_description, @r_hooligan_en, 'An illuminated sign, printed mesh banner and vehicle branding for the Hooligan motorcycle showroom.'),
  (@tv_card_image, @r_hooligan_en, 'assets/img/photos/projects/hooligan-card.jpg'),
  (@tv_card_image_alt, @r_hooligan_en, 'Hooligan — Motorcycle showroom sign'),
  (@tv_checklist, @r_hooligan_en, 'Illuminated sign with 3D letters
Large-format printed mesh banner
Vehicle branding with vinyl film'),
  (@tv_brand, @r_hooligan_en, 'Hooligan'),
  (@tv_category, @r_hooligan_en, 'retail'),
  (@tv_gallery, @r_hooligan_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/hooligan-1.jpg","alt":"Hooligan motorcycle showroom sign"}]'),
  (@tv_directions, @r_hooligan_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_hooligan_en, '[{"MIGX_id":"1","label":"Client","value":"Hooligan"},{"MIGX_id":"2","label":"Property type","value":"Motorcycle showroom"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Световая вывеска мотосалона', 'Световая вывеска, сетка mesh с печатью и брендирование автомобиля для мотосалона Hooligan.', 'hooligan', 1, @p_ru, 1, 1, @tpl, 13,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'hooligan/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'hooligan' AND context_key = 'ru');
SET @r_hooligan_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'hooligan' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Световая вывеска мотосалона', longtitle = '', menutitle = '',
  description = 'Световая вывеска, сетка mesh с печатью и брендирование автомобиля для мотосалона Hooligan.', alias = 'hooligan', uri = CONCAT(@u_ru, 'hooligan/'),
  introtext = 'Световая вывеска, сетка mesh с печатью и брендирование автомобиля для мотосалона Hooligan.', content = '<p>Световая вывеска мотосалона «Hooligan» изготовлена из композитного материала с объемными и инкрустированными световыми буквами из ПВХ и акрила. Подсветка — светодиодные модули.</p><p>А также сетка mesh с широкоформатной печатью сольвентными чернилами и брендирование автомобиля виниловыми пленками.</p>',
  template = @tpl, menuindex = 13, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_hooligan_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_hooligan_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_hooligan_ru, 'Световая вывеска мотосалона Hooligan — проект improvision'),
  (@tv_og_description, @r_hooligan_ru, 'Световая вывеска, сетка mesh с печатью и брендирование автомобиля для мотосалона Hooligan.'),
  (@tv_card_image, @r_hooligan_ru, 'assets/img/photos/projects/hooligan-card.jpg'),
  (@tv_card_image_alt, @r_hooligan_ru, 'Hooligan — Световая вывеска мотосалона'),
  (@tv_checklist, @r_hooligan_ru, 'Световая вывеска с объемными буквами
Сетка mesh с широкоформатной печатью
Брендирование автомобиля виниловыми пленками'),
  (@tv_brand, @r_hooligan_ru, 'Hooligan'),
  (@tv_category, @r_hooligan_ru, 'retail'),
  (@tv_gallery, @r_hooligan_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/hooligan-1.jpg","alt":"Световая вывеска мотосалона Hooligan"}]'),
  (@tv_directions, @r_hooligan_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_hooligan_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Hooligan"},{"MIGX_id":"2","label":"Тип объекта","value":"Мотосалон"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_hooligan_web, @r_hooligan_en, @r_hooligan_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_hooligan_web, CONCAT('web:', @r_hooligan_web, ';en:', @r_hooligan_en, ';ru:', @r_hooligan_ru)),
  (@tv_babel, @r_hooligan_en, CONCAT('web:', @r_hooligan_web, ';en:', @r_hooligan_en, ';ru:', @r_hooligan_ru)),
  (@tv_babel, @r_hooligan_ru, CONCAT('web:', @r_hooligan_web, ';en:', @r_hooligan_en, ';ru:', @r_hooligan_ru));

-- ---------------------------------------------------------------- alsace
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вивіска бутика', 'Вивіска бутика Alsace з контражурною підсвіткою.', 'alsace', 1, @p_web, 1, 1, @tpl, 14,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'web', 1, CONCAT(@u_web, 'alsace/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_web AND alias = 'alsace' AND context_key = 'web');
SET @r_alsace_web = (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'alsace' AND context_key = 'web' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вивіска бутика', longtitle = '', menutitle = '',
  description = 'Вивіска бутика Alsace з контражурною підсвіткою.', alias = 'alsace', uri = CONCAT(@u_web, 'alsace/'),
  introtext = 'Вивіска бутика Alsace з контражурною підсвіткою.', content = '<p>Вивіска бутика «Alsace» виготовлена з композитного матеріалу з інкрустованими та обʼємними літерами з акрилу, контражурна підсвітка — діодна стрічка.</p>',
  template = @tpl, menuindex = 14, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_alsace_web AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_alsace_web AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_alsace_web, 'Вивіска бутика Alsace — проєкт improvision'),
  (@tv_og_description, @r_alsace_web, 'Вивіска бутика Alsace з контражурною підсвіткою.'),
  (@tv_card_image, @r_alsace_web, 'assets/img/photos/projects/alsace-card.jpg'),
  (@tv_card_image_alt, @r_alsace_web, 'Alsace — Вивіска бутика'),
  (@tv_brand, @r_alsace_web, 'Alsace'),
  (@tv_category, @r_alsace_web, 'retail'),
  (@tv_gallery, @r_alsace_web, '[{"MIGX_id":"1","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Вивіска бутика Alsace з контражурною підсвіткою"}]'),
  (@tv_directions, @r_alsace_web, '[{"MIGX_id":"1","title":"Зовнішня реклама","link":"47"}]'),
  (@tv_specs, @r_alsace_web, '[{"MIGX_id":"1","label":"Замовник","value":"Alsace"},{"MIGX_id":"2","label":"Тип обʼєкта","value":"Бутик"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Boutique sign', 'A halo-lit sign for the Alsace boutique.', 'alsace', 1, @p_en, 1, 1, @tpl, 14,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'en', 1, CONCAT(@u_en, 'alsace/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_en AND alias = 'alsace' AND context_key = 'en');
SET @r_alsace_en = (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'alsace' AND context_key = 'en' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Boutique sign', longtitle = '', menutitle = '',
  description = 'A halo-lit sign for the Alsace boutique.', alias = 'alsace', uri = CONCAT(@u_en, 'alsace/'),
  introtext = 'A halo-lit sign for the Alsace boutique.', content = '<p>The Alsace boutique sign is made of composite with inlaid and 3D acrylic letters, halo-lit by LED strip.</p>',
  template = @tpl, menuindex = 14, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_alsace_en AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_alsace_en AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_alsace_en, 'Alsace: boutique sign — an improvision project'),
  (@tv_og_description, @r_alsace_en, 'A halo-lit sign for the Alsace boutique.'),
  (@tv_card_image, @r_alsace_en, 'assets/img/photos/projects/alsace-card.jpg'),
  (@tv_card_image_alt, @r_alsace_en, 'Alsace — Boutique sign'),
  (@tv_brand, @r_alsace_en, 'Alsace'),
  (@tv_category, @r_alsace_en, 'retail'),
  (@tv_gallery, @r_alsace_en, '[{"MIGX_id":"1","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Halo-lit Alsace boutique sign"}]'),
  (@tv_directions, @r_alsace_en, '[{"MIGX_id":"1","title":"Outdoor advertising","link":"48"}]'),
  (@tv_specs, @r_alsace_en, '[{"MIGX_id":"1","label":"Client","value":"Alsace"},{"MIGX_id":"2","label":"Property type","value":"Boutique"}]');
INSERT INTO modx_site_content (type, pagetitle, description, alias, published, parent, isfolder, richtext, template, menuindex,
  searchable, cacheable, createdby, createdon, publishedon, class_key, context_key, content_type, uri, alias_visible)
SELECT 'document', 'Вывеска бутика', 'Вывеска бутика Alsace с контражурной подсветкой.', 'alsace', 1, @p_ru, 1, 1, @tpl, 14,
  1, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 'MODX\\Revolution\\modDocument', 'ru', 1, CONCAT(@u_ru, 'alsace/'), 1
FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM modx_site_content WHERE parent = @p_ru AND alias = 'alsace' AND context_key = 'ru');
SET @r_alsace_ru = (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'alsace' AND context_key = 'ru' ORDER BY id LIMIT 1);
UPDATE modx_site_content SET pagetitle = 'Вывеска бутика', longtitle = '', menutitle = '',
  description = 'Вывеска бутика Alsace с контражурной подсветкой.', alias = 'alsace', uri = CONCAT(@u_ru, 'alsace/'),
  introtext = 'Вывеска бутика Alsace с контражурной подсветкой.', content = '<p>Вывеска бутика «Alsace» изготовлена из композитного материала с инкрустированными и объемными буквами из акрила, контражурная подсветка — диодная лента.</p>',
  template = @tpl, menuindex = 14, published = 1, deleted = 0, editedon = UNIX_TIMESTAMP()
WHERE id = @r_alsace_ru AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = @r_alsace_ru AND tmplvarid <> @tv_babel;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_seo_title, @r_alsace_ru, 'Вывеска бутика Alsace — проект improvision'),
  (@tv_og_description, @r_alsace_ru, 'Вывеска бутика Alsace с контражурной подсветкой.'),
  (@tv_card_image, @r_alsace_ru, 'assets/img/photos/projects/alsace-card.jpg'),
  (@tv_card_image_alt, @r_alsace_ru, 'Alsace — Вывеска бутика'),
  (@tv_brand, @r_alsace_ru, 'Alsace'),
  (@tv_category, @r_alsace_ru, 'retail'),
  (@tv_gallery, @r_alsace_ru, '[{"MIGX_id":"1","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Вывеска бутика Alsace с контражурной подсветкой"}]'),
  (@tv_directions, @r_alsace_ru, '[{"MIGX_id":"1","title":"Наружная реклама","link":"49"}]'),
  (@tv_specs, @r_alsace_ru, '[{"MIGX_id":"1","label":"Заказчик","value":"Alsace"},{"MIGX_id":"2","label":"Тип объекта","value":"Бутик"}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE tmplvarid = @tv_babel AND contentid IN (@r_alsace_web, @r_alsace_en, @r_alsace_ru);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_babel, @r_alsace_web, CONCAT('web:', @r_alsace_web, ';en:', @r_alsace_en, ';ru:', @r_alsace_ru)),
  (@tv_babel, @r_alsace_en, CONCAT('web:', @r_alsace_web, ';en:', @r_alsace_en, ';ru:', @r_alsace_ru)),
  (@tv_babel, @r_alsace_ru, CONCAT('web:', @r_alsace_web, ';en:', @r_alsace_en, ';ru:', @r_alsace_ru));

COMMIT;
