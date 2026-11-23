-- improvision: service texts reworked with the facts from the old site improvision.com.ua (uk / en / ru).
-- Ventilated facades, entrance groups, outdoor and interior advertising, design: texts, checklists,
-- tabs and related projects. Turnkey construction and renovation: photo captions only.
-- Needs the projects patch of 20.11.2026 (related projects are looked up by alias).
-- Safe to run again. Afterwards clear the cache in the manager.

SET NAMES utf8mb4;
START TRANSACTION;
SET @p_web = (SELECT parent FROM modx_site_content WHERE id = 59);
SET @p_en  = (SELECT parent FROM modx_site_content WHERE id = 60);
SET @p_ru  = (SELECT parent FROM modx_site_content WHERE id = 61);

SET @tv_callout = (SELECT id FROM modx_site_tmplvars WHERE name = 'callout');
SET @tv_checklist = (SELECT id FROM modx_site_tmplvars WHERE name = 'checklist');
SET @tv_content2 = (SELECT id FROM modx_site_tmplvars WHERE name = 'content2');
SET @tv_content3 = (SELECT id FROM modx_site_tmplvars WHERE name = 'content3');
SET @tv_image_alt = (SELECT id FROM modx_site_tmplvars WHERE name = 'image_alt');
SET @tv_materials = (SELECT id FROM modx_site_tmplvars WHERE name = 'materials');
SET @tv_related_projects = (SELECT id FROM modx_site_tmplvars WHERE name = 'related_projects');

-- 41 (web) Вентильовані фасади
UPDATE modx_site_content SET content = '<h2>Сучасне фасадне рішення — естетика, енергоефективність і довговічність</h2>
<p>Вентильований фасад — це навісна конструкція з повітряним зазором між утеплювачем і облицюванням. Зазор відводить вологу, утеплювач зберігає тепло, а облицювання захищає будівлю й задає її вигляд.</p>
<p>Найчастіше ми облицьовуємо фасади алюмінієвими композитними панелями. Вони стійкі до погоди, ультрафіолету, корозії та забруднень, гасять вібрацію й шум і роками зберігають колір. Панелі легко набувають будь-якої форми, тож з них можна зібрати і строгий діловий фасад, і найсміливіше архітектурне рішення.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 41 AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 41 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 41, '<p>Касети нестандартних розмірів і форм монтуються так само, як і стандартні, тож оригінальний фасад не ускладнює монтаж. Палітра композитних панелей — від стриманих металіків до яскравих кольорів. Для фасадів і приміщень закладів використовуємо також HPL-панелі, а для великих площин — профнастил.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 41 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 41, 'Перед виготовленням розробляємо дизайн-проєкт фасаду: ви погоджуєте кольори та розкладку панелей ще до початку робіт.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 41 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 41, '<p>Підсистему підбираємо під основу та навантаження: алюмінієву — для композитних касет, каркас із металевої профільної труби — для профнастилу. Утеплюємо мінеральним утеплювачем, а вузли кріплення розраховуємо під конкретну стіну.</p>
<figure>
<img alt="Вентильований фасад відділення банку «Глобус» з композитних панелей" height="900" loading="lazy" src="/assets/img/photos/projects/globus-bank-1.jpg" width="1600">
<figcaption>Відділення банку «Глобус»: композитні панелі на алюмінієвій підсистемі та світлова вивіска.</figcaption>
</figure>
<blockquote>
<p>«Облицювання композитними панелями дозволяє досягти будь-якого бажаного результату — варто лише розробити дизайн-проєкт і професійно його змонтувати».</p>
</blockquote>
<p>Щоб замовити вентильований фасад, достатньо безкоштовно викликати нашого фахівця: він огляне обʼєкт, зробить обміри та підкаже оптимальну систему облицювання.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 41 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 41, '[{"MIGX_id":"1","name":"Композитні панелі","text":"Легкі алюмінієві касети, стійкі до погоди, ультрафіолету й корозії, з широкою палітрою кольорів.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Композитні панелі","active":"1"},{"MIGX_id":"2","name":"HPL-панелі","text":"Панелі високого тиску для фасадів і приміщень закладів — як у ресторанах KFC.","image":"assets/img/photos/kfc-night.jpg","alt":"HPL-панелі","active":""},{"MIGX_id":"3","name":"Профнастил","text":"Практичне облицювання великих площин на каркасі з профільної труби.","image":"assets/img/photos/projects/cc-1.jpg","alt":"Профнастил","active":""},{"MIGX_id":"4","name":"Нестандартні касети","text":"Обʼємні та фігурні елементи, які монтуються так само, як стандартні панелі.","image":"assets/img/photos/projects/lego-1.jpg","alt":"Нестандартні касети","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 41 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 41, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'globus-bank' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'cc' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'kfc' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 42 (en) Ventilated facades
UPDATE modx_site_content SET content = '<h2>A modern facade — looks, energy efficiency and durability</h2>
<p>A ventilated facade is a rainscreen system with an air gap between the insulation and the cladding. The gap carries moisture away, the insulation keeps the heat in, and the cladding protects the building and defines its look.</p>
<p>Most of our facades are clad in aluminium composite panels. They resist weather, UV, corrosion and dirt, damp vibration and noise, and keep their colour for years. The panels take almost any shape, so they suit both a strict corporate facade and the boldest architectural idea.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 42 AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 42 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 42, '<p>Non-standard cassettes are installed just like standard ones, so an unusual facade does not complicate the installation. Composite panels come in anything from restrained metallics to bright colours. For restaurant facades and interiors we also use HPL panels, and profiled sheet for large surfaces.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 42 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 42, 'Before production we design the facade: you approve the colours and panel layout before any work starts.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 42 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 42, '<p>The substructure is chosen for the wall and the loads: aluminium for composite cassettes, a steel tube frame for profiled sheet. We insulate with mineral wool and calculate every fixing for the specific wall.</p>
<figure>
<img alt="Composite ventilated facade of a Globus Bank branch" height="900" loading="lazy" src="/assets/img/photos/projects/globus-bank-1.jpg" width="1600">
<figcaption>Globus Bank branch: composite panels on an aluminium substructure and an illuminated sign.</figcaption>
</figure>
<blockquote>
<p>“Composite cladding can achieve any result you want — it only takes a proper design and professional installation.”</p>
</blockquote>
<p>To order a ventilated facade, just call our specialist out free of charge: they will inspect the building, take measurements and suggest the right cladding system.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 42 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 42, '[{"MIGX_id":"1","name":"Composite panels","text":"Light aluminium cassettes that resist weather, UV and corrosion, in a wide range of colours.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Composite panels","active":"1"},{"MIGX_id":"2","name":"HPL panels","text":"High-pressure laminate for restaurant facades and interiors, as at KFC.","image":"assets/img/photos/kfc-night.jpg","alt":"HPL panels","active":""},{"MIGX_id":"3","name":"Profiled sheet","text":"Practical cladding for large surfaces on a steel tube frame.","image":"assets/img/photos/projects/cc-1.jpg","alt":"Profiled sheet","active":""},{"MIGX_id":"4","name":"Custom cassettes","text":"3D and shaped elements that install just like standard panels.","image":"assets/img/photos/projects/lego-1.jpg","alt":"Custom cassettes","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 42 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 42, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'globus-bank' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'cc' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'kfc' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 43 (ru) Вентилируемые фасады
UPDATE modx_site_content SET content = '<h2>Современное фасадное решение — эстетика, энергоэффективность и долговечность</h2>
<p>Вентилируемый фасад — это навесная конструкция с воздушным зазором между утеплителем и облицовкой. Зазор отводит влагу, утеплитель сохраняет тепло, а облицовка защищает здание и задает его облик.</p>
<p>Чаще всего мы облицовываем фасады алюминиевыми композитными панелями. Они устойчивы к погоде, ультрафиолету, коррозии и загрязнениям, гасят вибрацию и шум и годами сохраняют цвет. Панели легко принимают любую форму, поэтому из них можно собрать и строгий деловой фасад, и самое смелое архитектурное решение.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 43 AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 43 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 43, '<p>Кассеты нестандартных размеров и форм монтируются так же, как и стандартные, поэтому оригинальный фасад не усложняет монтаж. Палитра композитных панелей — от сдержанных металликов до ярких цветов. Для фасадов и помещений заведений используем также HPL-панели, а для больших плоскостей — профнастил.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 43 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 43, 'Перед изготовлением разрабатываем дизайн-проект фасада: вы согласовываете цвета и раскладку панелей еще до начала работ.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 43 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 43, '<p>Подсистему подбираем под основание и нагрузки: алюминиевую — для композитных кассет, каркас из металлической профильной трубы — для профнастила. Утепляем минеральным утеплителем, а узлы крепления рассчитываем под конкретную стену.</p>
<figure>
<img alt="Вентилируемый фасад отделения банка «Глобус» из композитных панелей" height="900" loading="lazy" src="/assets/img/photos/projects/globus-bank-1.jpg" width="1600">
<figcaption>Отделение банка «Глобус»: композитные панели на алюминиевой подсистеме и световая вывеска.</figcaption>
</figure>
<blockquote>
<p>«Облицовка композитными панелями позволяет добиться любого желаемого результата — стоит лишь разработать дизайн-проект и профессионально его смонтировать».</p>
</blockquote>
<p>Чтобы заказать вентилируемый фасад, достаточно бесплатно вызвать нашего специалиста: он осмотрит объект, сделает замеры и подскажет оптимальную систему облицовки.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 43 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 43, '[{"MIGX_id":"1","name":"Композитные панели","text":"Легкие алюминиевые кассеты, устойчивые к погоде, ультрафиолету и коррозии, с широкой палитрой цветов.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Композитные панели","active":"1"},{"MIGX_id":"2","name":"HPL-панели","text":"Панели высокого давления для фасадов и помещений заведений — как в ресторанах KFC.","image":"assets/img/photos/kfc-night.jpg","alt":"HPL-панели","active":""},{"MIGX_id":"3","name":"Профнастил","text":"Практичная облицовка больших плоскостей на каркасе из профильной трубы.","image":"assets/img/photos/projects/cc-1.jpg","alt":"Профнастил","active":""},{"MIGX_id":"4","name":"Нестандартные кассеты","text":"Объемные и фигурные элементы, которые монтируются так же, как стандартные панели.","image":"assets/img/photos/projects/lego-1.jpg","alt":"Нестандартные кассеты","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 43 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 43, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'globus-bank' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'cc' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'kfc' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

-- 44 (web) Вхідні групи
UPDATE modx_site_content SET content = '<h2>Вхідна група, яка працює на бренд</h2>
<p>Вхідна група формує перше враження про заклад ще до того, як клієнт відчинив двері. Портал, вітрина, вивіска та освітлення мають працювати як одне ціле й роками витримувати погоду та щоденний трафік.</p>
<p>Ми оцінюємо наявний фасад, робимо обміри й фото, а потім розробляємо дизайн-проєкт: матеріали, освітлення, інтеграцію реклами, привʼязку до наявних конструкцій і кольорову гаму. Каркас, облицювання та вивіску виготовляємо у власному цеху й монтуємо власними бригадами.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 44 AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 44, '<p>Ще на етапі комерційної пропозиції показуємо варіанти з різними матеріалами. Схожий вигляд часто можна отримати з бюджетнішого аналога, а там, де треба виділитися, — застосувати преміальні матеріали без зайвої переплати. Ціни — від виробника.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 44, 'Після погодження дизайну демонтуємо старі конструкції, знімаємо контрольні обміри й частково збираємо елементи в цеху — тож монтаж на обʼєкті займає менше часу.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 44, '<p>Вхідна група має бути помітною в міському середовищі: перевіряємо, щоб ніщо не закривало огляд, і ще на етапі проєкту вирішуємо, де потрібне підсвічування. Строки залежать від складності та обсягу робіт — від тижня.</p>
<figure>
<img alt="Фасад магазину LEGO з композитних панелей" height="900" loading="lazy" src="/assets/img/photos/projects/lego-1.jpg" width="1600">
<figcaption>Магазин LEGO: композитні панелі, обʼємні світлові елементи з акрилу та ПВХ і підсвітка прожекторами.</figcaption>
</figure>
<blockquote>
<p>«Ми завжди оптимізуємо процеси, щоб скоротити строки — і при цьому досягти кращої якості».</p>
</blockquote>
<p>Щоб замовити вхідну групу, достатньо безкоштовно викликати нашого фахівця: він оцінить фасад, зробить обміри й підкаже оптимальні матеріали.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 44, 'Обміри та фотофіксація фасаду
Дизайн-проєкт вхідної групи
Демонтаж старих конструкцій
Металокаркас, портали та обрамлення прорізів
Облицювання композитом, металом або HPL
Вивіска, підсвічування та монтаж під ключ');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 44, '[{"MIGX_id":"1","name":"Портали та обрамлення","text":"Обʼємні портали з композиту й металу з інтегрованою вивіскою.","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Портали та обрамлення","active":"1"},{"MIGX_id":"2","name":"Вітрини","text":"Оформлення вітрин, підсвічування та рекламні елементи.","image":"assets/img/photos/about-mark.jpg","alt":"Вітрини","active":""},{"MIGX_id":"3","name":"Козирки","text":"Козирки над входом із вбудованою вивіскою та підсвічуванням.","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Козирки","active":""},{"MIGX_id":"4","name":"Інтеграція реклами","text":"Вивіска, лайтбокс чи світлові літери як частина фасаду, а не окремий елемент.","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Інтеграція реклами","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 44 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 44, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'vittorio-spernanzoni' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'lego' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'carnegie-center' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 45 (en) Entrance groups
UPDATE modx_site_content SET content = '<h2>An entrance that works for the brand</h2>
<p>The entrance shapes the first impression before a customer even opens the door. Portal, shop window, sign and lighting have to work as one and withstand weather and daily traffic for years.</p>
<p>We assess the existing facade, take measurements and photos, then design the entrance: materials, lighting, integrated signage, fixing to existing structures and colours. The frame, cladding and sign are made in our own workshop and installed by our own crews.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 45 AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 45, '<p>Already at the proposal stage we show options in different materials. A similar look can often be achieved with a more affordable alternative, and where you need to stand out we use premium materials without overpaying. Prices are direct from the manufacturer.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 45, 'Once the design is approved we remove the old structures, take check measurements and pre-assemble elements in the workshop, so less time is spent on site.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 45, '<p>An entrance has to be visible in the street: we make sure nothing blocks the view and decide where lighting is needed already at the design stage. Lead times depend on complexity and scope — from one week.</p>
<figure>
<img alt="LEGO store facade in composite panels" height="900" loading="lazy" src="/assets/img/photos/projects/lego-1.jpg" width="1600">
<figcaption>LEGO store: composite panels, illuminated 3D elements in acrylic and PVC, and floodlights.</figcaption>
</figure>
<blockquote>
<p>“We always streamline the process to save time — and get better quality at the same time.”</p>
</blockquote>
<p>To order an entrance group, just call our specialist out free of charge: they will assess the facade, take measurements and suggest the best materials.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 45, 'Facade measurements and photos
Entrance design project
Removal of old structures
Steel frame, portals and opening surrounds
Cladding in composite, metal or HPL
Sign, lighting and turnkey installation');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 45, '[{"MIGX_id":"1","name":"Portals and surrounds","text":"3D portals in composite and metal with an integrated sign.","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Portals and surrounds","active":"1"},{"MIGX_id":"2","name":"Shop windows","text":"Window displays, lighting and advertising elements.","image":"assets/img/photos/about-mark.jpg","alt":"Shop windows","active":""},{"MIGX_id":"3","name":"Canopies","text":"Entrance canopies with a built-in sign and lighting.","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Canopies","active":""},{"MIGX_id":"4","name":"Integrated signage","text":"A sign, light box or channel letters as part of the facade rather than an add-on.","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Integrated signage","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 45 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 45, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'vittorio-spernanzoni' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'lego' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'carnegie-center' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 46 (ru) Входные группы
UPDATE modx_site_content SET content = '<h2>Входная группа, которая работает на бренд</h2>
<p>Входная группа формирует первое впечатление о заведении еще до того, как клиент открыл дверь. Портал, витрина, вывеска и освещение должны работать как единое целое и годами выдерживать погоду и ежедневный трафик.</p>
<p>Мы оцениваем существующий фасад, делаем замеры и фотографии, а затем разрабатываем дизайн-проект: материалы, освещение, интеграцию рекламы, привязку к существующим конструкциям и цветовую гамму. Каркас, облицовку и вывеску изготавливаем в собственном цеху и монтируем своими бригадами.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 46 AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 46, '<p>Еще на этапе коммерческого предложения показываем варианты с разными материалами. Похожий вид часто можно получить с более бюджетным аналогом, а там, где нужно выделиться, — применить премиальные материалы без лишней переплаты. Цены — от производителя.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 46, 'После утверждения дизайна демонтируем старые конструкции, снимаем контрольные замеры и частично собираем элементы в цеху — поэтому монтаж на объекте занимает меньше времени.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 46, '<p>Входная группа должна быть заметной в городской среде: проверяем, чтобы ничто не мешало обзору, и еще на этапе проекта решаем, где нужна подсветка. Сроки зависят от сложности и объема работ — от недели.</p>
<figure>
<img alt="Фасад магазина LEGO из композитных панелей" height="900" loading="lazy" src="/assets/img/photos/projects/lego-1.jpg" width="1600">
<figcaption>Магазин LEGO: композитные панели, объемные световые элементы из акрила и ПВХ и подсветка прожекторами.</figcaption>
</figure>
<blockquote>
<p>«Мы всегда оптимизируем процессы, чтобы сократить сроки — и при этом добиться лучшего качества».</p>
</blockquote>
<p>Чтобы заказать входную группу, достаточно бесплатно вызвать нашего специалиста: он оценит фасад, сделает замеры и подскажет оптимальные материалы.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 46, 'Замеры и фотофиксация фасада
Дизайн-проект входной группы
Демонтаж старых конструкций
Металлокаркас, порталы и обрамление проемов
Облицовка композитом, металлом или HPL
Вывеска, подсветка и монтаж под ключ');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 46, '[{"MIGX_id":"1","name":"Порталы и обрамление","text":"Объемные порталы из композита и металла с интегрированной вывеской.","image":"assets/img/photos/projects/vittorio-spernanzoni-1.jpg","alt":"Порталы и обрамление","active":"1"},{"MIGX_id":"2","name":"Витрины","text":"Оформление витрин, подсветка и рекламные элементы.","image":"assets/img/photos/about-mark.jpg","alt":"Витрины","active":""},{"MIGX_id":"3","name":"Козырьки","text":"Козырьки над входом со встроенной вывеской и подсветкой.","image":"assets/img/photos/projects/carnegie-center-1.jpg","alt":"Козырьки","active":""},{"MIGX_id":"4","name":"Интеграция рекламы","text":"Вывеска, лайтбокс или световые буквы как часть фасада, а не отдельный элемент.","image":"assets/img/photos/projects/yus-bar-1.jpg","alt":"Интеграция рекламы","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 46 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 46, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'vittorio-spernanzoni' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'lego' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'carnegie-center' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

-- 47 (web) Зовнішня реклама
UPDATE modx_site_content SET content = '<h2>Вивіска, яку помічають і вдень, і вночі</h2>
<p>Світлова реклама працює цілодобово, підкреслює архітектуру будівлі й навіть приховує її недоліки — якщо гармонує з фасадом і роками зберігає колір та яскравість.</p>
<p>Ми виготовляємо й монтуємо вивіски, лайтбокси, обʼємні літери, елементи для вітрин і дахові конструкції будь-якої складності. За потреби розробляємо логотип і фірмовий стиль з нуля або працюємо за наявним бренд-буком.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 47 AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 47, '<p>Тип вивіски підбираємо під фасад, відстань огляду та бюджет: світловий короб (односторонній, двосторонній консольний чи всесторонній), обʼємні літери з лицьовим, контражурним або точковим підсвічуванням, композитний короб з інкрустованими акриловими літерами чи несвітлова вивіска з прожекторами. Для мереж розробляємо стандарти, щоб вивіски на всіх обʼєктах виглядали однаково.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 47, 'Підсвічуємо світлодіодами: вони не перегорають, як лампи, споживають у рази менше енергії, ніж неон чи галоген, і навіть можуть імітувати неон.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 47, '<p>Працюємо зі світлорозсіювальними матеріалами — акрилом, полікарбонатом, склом, банером backlit — і з несвітловими: ПВХ, ПЕТ, композитними та HPL-панелями, металом, деревом і фанерою. Перед виготовленням показуємо креслення та фотопривʼязку макета до фасаду, щоб ви оцінили проєкт цілком.</p>
<figure>
<img alt="Світлові вивіски KFC на фасаді ТРЦ Art Mall увечері" height="815" loading="lazy" src="/assets/img/photos/kfc-artmall-1.jpg" width="1448">
<figcaption>Вивіски KFC у ТРЦ Art Mall: обʼємні літери та лайтбокси.</figcaption>
</figure>
<blockquote>
<p>«Вивіска — це обличчя вашого бізнесу: з неї починається знайомство з брендом».</p>
</blockquote>
<p>Строки залежать від складності: прості вивіски — від трьох робочих днів, обʼємні літери та дахові установки — від тижня. Дахові конструкції розраховуємо на вітрове й снігове навантаження та проєктуємо так, щоб їх було легко обслуговувати. Монтуємо з автовишок або силами промислових альпіністів.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 47, 'Дизайн-макет і фотопривʼязка до фасаду
Логотип і фірмовий стиль за потреби
Креслення та розрахунок конструкції
Виготовлення у власному цеху
Світлодіодне підсвічування
Монтаж, підключення та сервіс');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 47, '[{"MIGX_id":"1","name":"Обʼємні літери","text":"Лицьове, контражурне чи точкове підсвічування, «холодний неон».","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Обʼємні літери","active":"1"},{"MIGX_id":"2","name":"Лайтбокси","text":"Світлові короби: односторонні, консольні та всесторонні.","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Лайтбокси","active":""},{"MIGX_id":"3","name":"Композитні короби","text":"Алюмінієві композитні панелі з інкрустованими акриловими літерами.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Композитні короби","active":""},{"MIGX_id":"4","name":"Дахові установки","text":"Великоформатні конструкції з розрахунком на вітрове навантаження.","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Дахові установки","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 47 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 47, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'kfc' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'sun-gallery' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'hooligan' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 48 (en) Outdoor advertising
UPDATE modx_site_content SET content = '<h2>A sign that gets noticed day and night</h2>
<p>Illuminated advertising works around the clock, emphasises the architecture and can even hide its flaws — as long as it suits the facade and keeps its colour and brightness for years.</p>
<p>We make and install signs, light boxes, channel letters, window display elements and rooftop structures of any complexity. If needed, we create a logo and corporate identity from scratch or work to your existing brand book.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 48 AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 48, '<p>We choose the sign type for the facade, viewing distance and budget: a light box (single-sided, double-sided projecting or all-round), channel letters with face, halo or point lighting, a composite box with inlaid acrylic letters, or a non-illuminated sign with floodlights. For chains we develop standards so the signs look the same at every location.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 48, 'We light signs with LEDs: they do not burn out like lamps, use many times less power than neon or halogen, and can even imitate neon.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 48, '<p>We work with light-diffusing materials — acrylic, polycarbonate, glass, backlit banner — and opaque ones: PVC, PET, composite and HPL panels, metal, wood and plywood. Before production you see the drawings and a photo mock-up of the sign on your facade, so you can judge the whole project.</p>
<figure>
<img alt="KFC illuminated signs on the Art Mall facade at night" height="815" loading="lazy" src="/assets/img/photos/kfc-artmall-1.jpg" width="1448">
<figcaption>KFC signs at Art Mall: channel letters and light boxes.</figcaption>
</figure>
<blockquote>
<p>“A sign is the face of your business: it is where people first meet the brand.”</p>
</blockquote>
<p>Lead times depend on complexity: simple signs from three working days, channel letters and rooftop signs from one week. Rooftop structures are calculated for wind and snow loads and designed to be easy to service. We install from aerial platforms or with industrial climbers.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 48, 'Design mock-up on a photo of the facade
Logo and corporate identity if needed
Drawings and structural calculation
Production in our own workshop
LED lighting
Installation, connection and service');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 48, '[{"MIGX_id":"1","name":"Channel letters","text":"Face, halo or point lighting, LED neon.","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Channel letters","active":"1"},{"MIGX_id":"2","name":"Light boxes","text":"Single-sided, projecting and all-round light boxes.","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Light boxes","active":""},{"MIGX_id":"3","name":"Composite boxes","text":"Aluminium composite panels with inlaid acrylic letters.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Composite boxes","active":""},{"MIGX_id":"4","name":"Rooftop signs","text":"Large-format structures designed for wind loads.","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Rooftop signs","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 48 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 48, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'kfc' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'sun-gallery' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'hooligan' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 49 (ru) Наружная реклама
UPDATE modx_site_content SET content = '<h2>Вывеска, которую замечают и днем, и ночью</h2>
<p>Световая реклама работает круглосуточно, подчеркивает архитектуру здания и даже скрывает его недостатки — если гармонирует с фасадом и годами сохраняет цвет и яркость.</p>
<p>Мы изготавливаем и монтируем вывески, лайтбоксы, объемные буквы, элементы для витрин и крышные конструкции любой сложности. При необходимости разрабатываем логотип и фирменный стиль с нуля или работаем по существующему брендбуку.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 49 AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 49, '<p>Тип вывески подбираем под фасад, расстояние обзора и бюджет: световой короб (односторонний, двусторонний консольный или всесторонний), объемные буквы с лицевой, контражурной или точечной подсветкой, композитный короб с инкрустированными акриловыми буквами или несветовая вывеска с прожекторами. Для сетей разрабатываем стандарты, чтобы вывески на всех объектах выглядели одинаково.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 49, 'Подсвечиваем светодиодами: они не перегорают, как лампы, потребляют в разы меньше энергии, чем неон или галоген, и даже могут имитировать неон.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 49, '<p>Работаем со светорассеивающими материалами — акрилом, поликарбонатом, стеклом, баннером backlit — и с несветовыми: ПВХ, ПЭТ, композитными и HPL-панелями, металлом, деревом и фанерой. Перед изготовлением показываем чертежи и фотопривязку макета к фасаду, чтобы вы оценили проект целиком.</p>
<figure>
<img alt="Световые вывески KFC на фасаде ТРЦ Art Mall вечером" height="815" loading="lazy" src="/assets/img/photos/kfc-artmall-1.jpg" width="1448">
<figcaption>Вывески KFC в ТРЦ Art Mall: объемные буквы и лайтбоксы.</figcaption>
</figure>
<blockquote>
<p>«Вывеска — это лицо вашего бизнеса: с нее начинается знакомство с брендом».</p>
</blockquote>
<p>Сроки зависят от сложности: простые вывески — от трех рабочих дней, объемные буквы и крышные установки — от недели. Крышные конструкции рассчитываем на ветровую и снеговую нагрузку и проектируем так, чтобы их было легко обслуживать. Монтируем с автовышек или силами промышленных альпинистов.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 49, 'Дизайн-макет и фотопривязка к фасаду
Логотип и фирменный стиль при необходимости
Чертежи и расчет конструкции
Изготовление в собственном цеху
Светодиодная подсветка
Монтаж, подключение и сервис');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 49, '[{"MIGX_id":"1","name":"Объемные буквы","text":"Лицевая, контражурная или точечная подсветка, «холодный неон».","image":"assets/img/photos/projects/calzedonia-1.jpg","alt":"Объемные буквы","active":"1"},{"MIGX_id":"2","name":"Лайтбоксы","text":"Световые короба: односторонние, консольные и всесторонние.","image":"assets/img/photos/projects/arbat-prestige-2.jpg","alt":"Лайтбоксы","active":""},{"MIGX_id":"3","name":"Композитные короба","text":"Алюминиевые композитные панели с инкрустированными акриловыми буквами.","image":"assets/img/photos/projects/globus-bank-2.jpg","alt":"Композитные короба","active":""},{"MIGX_id":"4","name":"Крышные установки","text":"Крупноформатные конструкции с расчетом на ветровую нагрузку.","image":"assets/img/photos/projects/sun-gallery-1.jpg","alt":"Крышные установки","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 49 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 49, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'kfc' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'sun-gallery' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'hooligan' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

-- 50 (web) Інтерʼєрна реклама та навігація
UPDATE modx_site_content SET content = '<h2>Простір, у якому легко орієнтуватися й хочеться купувати</h2>
<p>Зовнішні вивіски привертають клієнтів, а внутрішні — інформують, ведуть до потрібного місця й спонукають до покупки. Тому оформлення торгових центрів, магазинів, ресторанів і офісів зсередини — не менш відповідальне завдання, ніж фасад.</p>
<p>Усередині на рекламу не діють вітер, мороз і ультрафіолет, тож вибір матеріалів і форм значно ширший: обʼємні літери, світлові вивіски й консолі, стенди, таблички, акрилайти, фреймлайти та POS-конструкції.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 50 AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 50 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 50, 'Фреймлайт завтовшки від 35 мм світиться рівно по всій площі, а постер у ньому змінюється за кілька хвилин — зручно для акцій і меню.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 50 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 50, '<p>Таблички виготовляємо з пластику чи металу: з плівкою ПВХ, шовкографією або повнокольоровим друком, з гравіюванням на двошаровому пластику чи лазерною обробкою нержавіючої сталі. Акрилайт — акрил з гравіюванням і торцевим підсвічуванням: логотип чи напис у ньому ніби світиться в повітрі, а розмір панелі — до 3000×2000 мм.</p>
<figure>
<img alt="Внутрішня навігація ТЦ «Домосфера»" height="900" loading="lazy" src="/assets/img/photos/projects/domosfera-3.jpg" width="1600">
<figcaption>ТЦ «Домосфера»: стела з друком на склі, обʼємні короби та покажчики.</figcaption>
</figure>
<blockquote>
<p>«Найкраща навігація — та, про яку відвідувач не замислюється: він просто знаходить потрібне».</p>
</blockquote>
<p>Після запуску оновлюємо промографіку, змінюємо постери й доповнюємо навігацію — без демонтажу основних конструкцій.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 50 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 50, 'Аудит простору та сценарії руху відвідувачів
Дизайн системи навігації та піктограм
Таблички, покажчики та стели
Лайтбокси, акрилайти та фреймлайти
POS-конструкції, стійки та промозони
Брендування стін, скла та підвісних елементів');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 50 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 50, '[{"MIGX_id":"1","name":"Брендування торгових залів","text":"Фірмові стіни, панно, обʼємні літери та оформлення вітрин зсередини.","image":"assets/img/photos/project-intimissimi.jpg","alt":"Брендування торгових залів","active":"1"},{"MIGX_id":"2","name":"Навігація торгових центрів","text":"Стели, обʼємні короби, покажчики та поверхові плани.","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Навігація торгових центрів","active":""},{"MIGX_id":"3","name":"Таблички","text":"Інформаційні, дверні, фасадні таблички та покажчики з пластику й металу.","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Таблички","active":""},{"MIGX_id":"4","name":"Світлові вивіски","text":"Вивіски з контражурним підсвічуванням, акрилайти та фреймлайти.","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Світлові вивіски","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 50 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 50, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'domosfera' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'carnegie-center' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'intimissimi' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 51 (en) Interior signage and wayfinding
UPDATE modx_site_content SET content = '<h2>A space that is easy to navigate and makes people want to buy</h2>
<p>Outdoor signs bring customers in; indoor ones inform, guide people where they need to go and prompt them to buy. That is why fitting out shopping centres, stores, restaurants and offices inside matters as much as the facade.</p>
<p>Indoors there is no wind, frost or UV, so the choice of materials and shapes is much wider: channel letters, illuminated and projecting signs, stands, plaques, acrylic light panels, frame lights and POS displays.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 51 AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 51 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 51, 'A frame light from 35 mm thick glows evenly across its whole surface, and the poster can be changed in minutes — handy for promotions and menus.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 51 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 51, '<p>Plaques are made of plastic or metal: with PVC film, screen printing or full-colour print, engraved on two-layer plastic or laser-cut from stainless steel. An acrylic light panel is engraved, edge-lit acrylic in which a logo or lettering seems to glow in mid-air; panels go up to 3000×2000 mm.</p>
<figure>
<img alt="Interior wayfinding at the Domosfera shopping centre" height="900" loading="lazy" src="/assets/img/photos/projects/domosfera-3.jpg" width="1600">
<figcaption>Domosfera shopping centre: printed glass pylon, 3D boxes and direction signs.</figcaption>
</figure>
<blockquote>
<p>“The best wayfinding is the kind visitors never think about: they simply find what they need.”</p>
</blockquote>
<p>After the opening we update promo graphics, change posters and extend the wayfinding without removing the main structures.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 51 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 51, 'Space audit and visitor flow
Wayfinding system and pictogram design
Plaques, direction signs and pylons
Light boxes, acrylic light panels and frame lights
POS displays, stands and promo zones
Branding of walls, glass and suspended elements');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 51 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 51, '[{"MIGX_id":"1","name":"Store branding","text":"Brand walls, panels, channel letters and window displays from the inside.","image":"assets/img/photos/project-intimissimi.jpg","alt":"Store branding","active":"1"},{"MIGX_id":"2","name":"Shopping centre wayfinding","text":"Pylons, 3D boxes, direction signs and floor plans.","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Shopping centre wayfinding","active":""},{"MIGX_id":"3","name":"Plaques","text":"Information, door and facade plaques and direction signs in plastic and metal.","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Plaques","active":""},{"MIGX_id":"4","name":"Illuminated signs","text":"Halo-lit signs, acrylic light panels and frame lights.","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Illuminated signs","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 51 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 51, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'domosfera' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'carnegie-center' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'intimissimi' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 52 (ru) Интерьерная реклама и навигация
UPDATE modx_site_content SET content = '<h2>Пространство, в котором легко ориентироваться и хочется покупать</h2>
<p>Наружные вывески привлекают клиентов, а внутренние — информируют, ведут к нужному месту и побуждают к покупке. Поэтому оформление торговых центров, магазинов, ресторанов и офисов изнутри — не менее ответственная задача, чем фасад.</p>
<p>Внутри на рекламу не действуют ветер, мороз и ультрафиолет, поэтому выбор материалов и форм гораздо шире: объемные буквы, световые вывески и консоли, стенды, таблички, акрилайты, фреймлайты и POS-конструкции.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 52 AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 52 AND tmplvarid = @tv_callout;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_callout, 52, 'Фреймлайт толщиной от 35 мм светится равномерно по всей площади, а постер в нем меняется за несколько минут — удобно для акций и меню.');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 52 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 52, '<p>Таблички изготавливаем из пластика или металла: с пленкой ПВХ, шелкографией или полноцветной печатью, с гравировкой на двухслойном пластике или лазерной обработкой нержавеющей стали. Акрилайт — акрил с гравировкой и торцевой подсветкой: логотип или надпись в нем будто светится в воздухе, а размер панели — до 3000×2000 мм.</p>
<figure>
<img alt="Внутренняя навигация ТЦ «Домосфера»" height="900" loading="lazy" src="/assets/img/photos/projects/domosfera-3.jpg" width="1600">
<figcaption>ТЦ «Домосфера»: стела с печатью на стекле, объемные короба и указатели.</figcaption>
</figure>
<blockquote>
<p>«Лучшая навигация — та, о которой посетитель не задумывается: он просто находит нужное».</p>
</blockquote>
<p>После запуска обновляем промографику, меняем постеры и дополняем навигацию — без демонтажа основных конструкций.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 52 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 52, 'Аудит пространства и сценарии движения посетителей
Дизайн системы навигации и пиктограмм
Таблички, указатели и стелы
Лайтбоксы, акрилайты и фреймлайты
POS-конструкции, стойки и промозоны
Брендирование стен, стекла и подвесных элементов');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 52 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 52, '[{"MIGX_id":"1","name":"Брендирование торговых залов","text":"Фирменные стены, панно, объемные буквы и оформление витрин изнутри.","image":"assets/img/photos/project-intimissimi.jpg","alt":"Брендирование торговых залов","active":"1"},{"MIGX_id":"2","name":"Навигация торговых центров","text":"Стелы, объемные короба, указатели и поэтажные планы.","image":"assets/img/photos/projects/domosfera-3.jpg","alt":"Навигация торговых центров","active":""},{"MIGX_id":"3","name":"Таблички","text":"Информационные, дверные, фасадные таблички и указатели из пластика и металла.","image":"assets/img/photos/projects/carnegie-center-2.jpg","alt":"Таблички","active":""},{"MIGX_id":"4","name":"Световые вывески","text":"Вывески с контражурной подсветкой, акрилайты и фреймлайты.","image":"assets/img/photos/projects/alsace-1.jpg","alt":"Световые вывески","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 52 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 52, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'domosfera' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'carnegie-center' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'intimissimi' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

-- 53 (web) Дизайн і проєктування
UPDATE modx_site_content SET content = '<h2>Проєкт, який можна збудувати без сюрпризів</h2>
<p>Оригінальний дизайн рекламних і будівельних обʼєктів допомагає виділитися й привернути додаткову увагу. Щоб він був не лише гарним, а й реалізованим, наші дизайнери спираються на досвід роботи з матеріалами та можливості власного виробництва.</p>
<p>Пакет документів містить фотореалістичну 3D-візуалізацію, детальні креслення та конструктивні рішення. За ними видно, яким буде обʼєкт, і можна уникнути проблем під час виготовлення та експлуатації.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 53 AND context_key = 'web';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 53 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 53, '<p>Створюємо логотип і фірмовий стиль з нуля або працюємо за бренд-буками мереж і адаптуємо їх до конкретного приміщення, матеріалів та бюджету без втрати фірмового стилю.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 53 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 53, '<p>Дотримуємося стандартів якості та правових норм і супроводжуємо проєкт на погодженнях — з бренд-центром мережі, орендодавцем і технічною службою ТРЦ.</p>
<figure>
<img alt="Дизайн-проєкт фасаду магазину LEGO" height="900" loading="lazy" src="/assets/img/photos/projects/lego-3.jpg" width="1600">
<figcaption>Дизайн-проєкт магазину LEGO: візуалізація фасаду до початку виробництва.</figcaption>
</figure>
<blockquote>
<p>«Нам важлива добре зроблена робота й довгострокова співпраця».</p>
</blockquote>
<p>Проєкт можна замовити окремо або разом із виробництвом і монтажем.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 53 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 53, 'Обміри та фотофіксація обʼєкта
Концепція та дизайн-проєкт
Логотип і фірмовий стиль
3D-візуалізація інтерʼєру та фасаду
Робочі креслення та вузли конструкцій
Специфікації та кошторис');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 53 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 53, '[{"MIGX_id":"1","name":"Дизайн-концепція","text":"Стиль, кольори, матеріали та ключові рішення.","image":"assets/img/photos/projects/lego-2.jpg","alt":"Дизайн-концепція","active":"1"},{"MIGX_id":"2","name":"3D-візуалізація","text":"Фотореалістичні зображення фасаду чи інтерʼєру до початку робіт.","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"3D-візуалізація","active":""},{"MIGX_id":"3","name":"Робоча документація","text":"Креслення, вузли та конструктивні рішення для виробництва й монтажу.","image":"assets/img/photos/blog-drawings.jpg","alt":"Робоча документація","active":""},{"MIGX_id":"4","name":"Кошторис і специфікації","text":"Прозорий розрахунок матеріалів, робіт і строків.","image":"assets/img/photos/material-panels.jpg","alt":"Кошторис і специфікації","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 53 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 53, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'lego' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'yus-bar' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'carnegie-center' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 54 (en) Design and engineering
UPDATE modx_site_content SET content = '<h2>A design you can build without surprises</h2>
<p>An original design for signage and buildings helps you stand out and draw extra attention. To make it buildable as well as beautiful, our designers draw on their experience with materials and on what our own production can do.</p>
<p>The package includes photorealistic 3D visualisation, detailed drawings and structural solutions. They show exactly what the result will look like and help avoid problems in production and use.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 54 AND context_key = 'en';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 54 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 54, '<p>We create a logo and corporate identity from scratch, or work to a chain’s brand book and adapt it to the specific premises, materials and budget without losing the brand’s look.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 54 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 54, '<p>We follow quality standards and regulations and support the project through approvals with the chain’s brand team, the landlord and the mall’s technical service.</p>
<figure>
<img alt="LEGO store facade design" height="900" loading="lazy" src="/assets/img/photos/projects/lego-3.jpg" width="1600">
<figcaption>LEGO store design: a facade visualisation before production starts.</figcaption>
</figure>
<blockquote>
<p>“What matters to us is a job well done and a long-term partnership.”</p>
</blockquote>
<p>You can order the design on its own or together with production and installation.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 54 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 54, 'Measurements and photos of the site
Concept and design project
Logo and corporate identity
3D visualisation of the interior and facade
Working drawings and structural details
Specifications and cost estimate');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 54 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 54, '[{"MIGX_id":"1","name":"Design concept","text":"Style, colours, materials and key solutions.","image":"assets/img/photos/projects/lego-2.jpg","alt":"Design concept","active":"1"},{"MIGX_id":"2","name":"3D visualisation","text":"Photorealistic images of the facade or interior before work starts.","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"3D visualisation","active":""},{"MIGX_id":"3","name":"Working drawings","text":"Drawings, details and structural solutions for production and installation.","image":"assets/img/photos/blog-drawings.jpg","alt":"Working drawings","active":""},{"MIGX_id":"4","name":"Estimate and specifications","text":"A clear breakdown of materials, work and timing.","image":"assets/img/photos/material-panels.jpg","alt":"Estimate and specifications","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 54 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 54, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'lego' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'yus-bar' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'carnegie-center' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 55 (ru) Дизайн и проектирование
UPDATE modx_site_content SET content = '<h2>Проект, который можно построить без сюрпризов</h2>
<p>Оригинальный дизайн рекламных и строительных объектов помогает выделиться и привлечь дополнительное внимание. Чтобы он был не только красивым, но и реализуемым, наши дизайнеры опираются на опыт работы с материалами и возможности собственного производства.</p>
<p>Пакет документов включает фотореалистичную 3D-визуализацию, подробные чертежи и конструктивные решения. По ним видно, каким будет объект, и можно избежать проблем при изготовлении и эксплуатации.</p>
', editedon = UNIX_TIMESTAMP() WHERE id = 55 AND context_key = 'ru';
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 55 AND tmplvarid = @tv_content2;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content2, 55, '<p>Создаем логотип и фирменный стиль с нуля или работаем по брендбукам сетей и адаптируем их к конкретному помещению, материалам и бюджету без потери фирменного стиля.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 55 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 55, '<p>Соблюдаем стандарты качества и правовые нормы и сопровождаем проект на согласованиях — с бренд-центром сети, арендодателем и технической службой ТРЦ.</p>
<figure>
<img alt="Дизайн-проект фасада магазина LEGO" height="900" loading="lazy" src="/assets/img/photos/projects/lego-3.jpg" width="1600">
<figcaption>Дизайн-проект магазина LEGO: визуализация фасада до начала производства.</figcaption>
</figure>
<blockquote>
<p>«Нам важна хорошо сделанная работа и долгосрочное сотрудничество».</p>
</blockquote>
<p>Проект можно заказать отдельно или вместе с производством и монтажом.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 55 AND tmplvarid = @tv_checklist;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_checklist, 55, 'Замеры и фотофиксация объекта
Концепция и дизайн-проект
Логотип и фирменный стиль
3D-визуализация интерьера и фасада
Рабочие чертежи и узлы конструкций
Спецификации и смета');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 55 AND tmplvarid = @tv_materials;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_materials, 55, '[{"MIGX_id":"1","name":"Дизайн-концепция","text":"Стиль, цвета, материалы и ключевые решения.","image":"assets/img/photos/projects/lego-2.jpg","alt":"Дизайн-концепция","active":"1"},{"MIGX_id":"2","name":"3D-визуализация","text":"Фотореалистичные изображения фасада или интерьера до начала работ.","image":"assets/img/photos/projects/globus-bank-3.jpg","alt":"3D-визуализация","active":""},{"MIGX_id":"3","name":"Рабочая документация","text":"Чертежи, узлы и конструктивные решения для производства и монтажа.","image":"assets/img/photos/blog-drawings.jpg","alt":"Рабочая документация","active":""},{"MIGX_id":"4","name":"Смета и спецификации","text":"Прозрачный расчет материалов, работ и сроков.","image":"assets/img/photos/material-panels.jpg","alt":"Смета и спецификации","active":""}]');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 55 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 55, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'lego' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'yus-bar' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'carnegie-center' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

-- 38 (web) Комерційне будівництво «під ключ»
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 38 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 38, 'Ресторан KFC у ТРЦ Dream Town — обʼєкт improvision');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 38 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 38, '<p>Інженерні мережі, оздоблення та реклама плануються разом ще на етапі проєкту. Так ми уникаємо переробок: вивіска не впирається у вентиляцію, а освітлення вітрин закладене в електропроєкт з першого дня.</p>
<figure>
<img alt="Відділення банку «Глобус»: фасад і вивіска" height="562" loading="lazy" src="/assets/img/photos/project-globus.jpg" width="1000">
<figcaption>Відділення банку «Глобус»: вентильований фасад і світлова вивіска.</figcaption>
</figure>
<blockquote>
<p>«Відкриття не переноситься через те, що один підрядник чекає на іншого — бо підрядник один».</p>
</blockquote>
<p>Після здачі обʼєкта ми залишаємося на звʼязку: надаємо гарантію на виконані роботи та беремо на сервісне обслуговування вивіски, світлотехніку й конструкції.</p>');

-- 39 (en) Turnkey commercial construction
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 39 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 39, 'KFC restaurant at Dream Town mall — an improvision project');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 39 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 39, '<p>Utilities, finishing and signage are planned together at the design stage. This avoids rework: the sign doesn’t clash with ventilation, and storefront lighting is in the electrical design from day one.</p>
<figure>
<img alt="Globus Bank branch: facade and sign" height="562" loading="lazy" src="/assets/img/photos/project-globus.jpg" width="1000">
<figcaption>Globus Bank branch: ventilated facade and illuminated sign.</figcaption>
</figure>
<blockquote>
<p>“Opening day doesn’t slip because one contractor is waiting for another — there is only one contractor.”</p>
</blockquote>
<p>After handover we stay in touch: we provide a warranty on the works and offer service maintenance for signage, lighting and structures.</p>');

-- 40 (ru) Коммерческое строительство «под ключ»
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 40 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 40, 'Ресторан KFC в ТРЦ Dream Town — объект improvision');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 40 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 40, '<p>Инженерные сети, отделка и реклама планируются вместе ещё на этапе проекта. Так мы избегаем переделок: вывеска не упирается в вентиляцию, а освещение витрин заложено в электропроект с первого дня.</p>
<figure>
<img alt="Отделение банка «Глобус»: фасад и вывеска" height="562" loading="lazy" src="/assets/img/photos/project-globus.jpg" width="1000">
<figcaption>Отделение банка «Глобус»: вентилируемый фасад и световая вывеска.</figcaption>
</figure>
<blockquote>
<p>«Открытие не переносится из-за того, что один подрядчик ждёт другого — потому что подрядчик один».</p>
</blockquote>
<p>После сдачи объекта мы остаёмся на связи: даём гарантию на выполненные работы и берём на сервисное обслуживание вывески, светотехнику и конструкции.</p>');

-- 56 (web) Оздоблювальні та реконструкційні роботи
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 56 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 56, 'Фасад бізнес-центру');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 56 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 56, '<p>Використовуємо матеріали для комерційних приміщень з підвищеною зносостійкістю та пожежною безпекою, а приховані роботи фіксуємо актами й фотозвітами.</p>
<figure>
<img alt="Вентильований фасад магазину C&amp;C" height="900" loading="lazy" src="/assets/img/photos/projects/cc-1.jpg" width="1600">
<figcaption>Магазин C&amp;C: новий утеплений вентильований фасад з композиту та профнастилу.</figcaption>
</figure>
<blockquote>
<p>«Найкраща реконструкція — та, яку клієнти помічають лише за результатом».</p>
</blockquote>
<p>Після завершення робіт передаємо виконавчу документацію та надаємо гарантію. Для мереж готові виконувати реконструкцію кількох обʼєктів паралельно за єдиним стандартом.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 56 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 56, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'cc' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'globus-bank' AND context_key = 'web' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_web AND alias = 'carnegie-center' AND context_key = 'web' AND deleted = 0 LIMIT 1));

-- 57 (en) Finishing and renovation works
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 57 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 57, 'Business centre facade');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 57 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 57, '<p>We use commercial-grade materials with high wear resistance and fire safety, and document concealed works with certificates and photo reports.</p>
<figure>
<img alt="C&amp;C store ventilated facade" height="900" loading="lazy" src="/assets/img/photos/projects/cc-1.jpg" width="1600">
<figcaption>C&amp;C store: a new insulated ventilated facade in composite and profiled sheet.</figcaption>
</figure>
<blockquote>
<p>“The best renovation is one that customers notice only by its result.”</p>
</blockquote>
<p>On completion we hand over as-built documentation and provide a warranty. For chains we can renovate several locations in parallel to a single standard.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 57 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 57, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'cc' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'globus-bank' AND context_key = 'en' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_en AND alias = 'carnegie-center' AND context_key = 'en' AND deleted = 0 LIMIT 1));

-- 58 (ru) Отделочные и реконструкционные работы
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 58 AND tmplvarid = @tv_image_alt;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_image_alt, 58, 'Фасад бизнес-центра');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 58 AND tmplvarid = @tv_content3;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES (@tv_content3, 58, '<p>Используем материалы для коммерческих помещений с повышенной износостойкостью и пожарной безопасностью, а скрытые работы фиксируем актами и фотоотчётами.</p>
<figure>
<img alt="Вентилируемый фасад магазина C&amp;C" height="900" loading="lazy" src="/assets/img/photos/projects/cc-1.jpg" width="1600">
<figcaption>Магазин C&amp;C: новый утепленный вентилируемый фасад из композита и профнастила.</figcaption>
</figure>
<blockquote>
<p>«Лучшая реконструкция — та, которую клиенты замечают только по результату».</p>
</blockquote>
<p>После завершения работ передаём исполнительную документацию и даём гарантию. Для сетей готовы выполнять реконструкцию нескольких объектов параллельно по единому стандарту.</p>');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid = 58 AND tmplvarid = @tv_related_projects;
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value)
  SELECT @tv_related_projects, 58, CONCAT_WS('||', (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'cc' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'globus-bank' AND context_key = 'ru' AND deleted = 0 LIMIT 1), (SELECT id FROM modx_site_content WHERE parent = @p_ru AND alias = 'carnegie-center' AND context_key = 'ru' AND deleted = 0 LIMIT 1));

COMMIT;
