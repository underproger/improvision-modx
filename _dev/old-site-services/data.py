# Service texts reworked with the facts from the old site improvision.com.ua
# (pages: ventiliruemye-fasady, vkhodnye-gruppy, naruzhnaya-reklama, vyveska, obemnye-bukvy,
#  kryshnye-ystanovki, lajtboksy, interernaya-reklama, tablichki, akrilajty, frejmlajty, design).
# Only the fields listed per service change; the rest stays as it is on the site.
# Index 0/1/2 = uk / en / ru. Resource ids: uk id, en id + 1, ru id + 2.
import json

P = 'assets/img/photos/'


def fig(src, w, h, alt, cap):
    return [f'<figure>\n<img alt="{a}" height="{h}" loading="lazy" src="/{P}{src}" width="{w}">\n<figcaption>{c}</figcaption>\n</figure>'
            for a, c in zip(alt, cap)]


def tabs(*items):
    """items: (image, active, (name uk, en, ru), (text uk, en, ru))"""
    out = []
    for li in range(3):
        out.append([{'name': n[li], 'text': t[li], 'image': P + img, 'alt': n[li], 'active': '1' if act else ''}
                    for img, act, n, t in items])
    return out


def q3(uk, en, ru):
    return [f'<blockquote>\n<p>{x}</p>\n</blockquote>' for x in (uk, en, ru)]


S = []

# ---------------------------------------------------------------- Ventilated facades
f = fig('projects/globus-bank-1.jpg', 1600, 900,
        ('Вентильований фасад відділення банку «Глобус» з композитних панелей',
         'Composite ventilated facade of a Globus Bank branch',
         'Вентилируемый фасад отделения банка «Глобус» из композитных панелей'),
        ('Відділення банку «Глобус»: композитні панелі на алюмінієвій підсистемі та світлова вивіска.',
         'Globus Bank branch: composite panels on an aluminium substructure and an illuminated sign.',
         'Отделение банка «Глобус»: композитные панели на алюминиевой подсистеме и световая вывеска.'))
qt = q3('«Облицювання композитними панелями дозволяє досягти будь-якого бажаного результату — варто лише розробити дизайн-проєкт і професійно його змонтувати».',
        '“Composite cladding can achieve any result you want — it only takes a proper design and professional installation.”',
        '«Облицовка композитными панелями позволяет добиться любого желаемого результата — стоит лишь разработать дизайн-проект и профессионально его смонтировать».')
S.append(dict(id=41, slugs=('globus-bank', 'cc', 'kfc'), fields=dict(
    content=[
        '<h2>Сучасне фасадне рішення — естетика, енергоефективність і довговічність</h2>\n<p>Вентильований фасад — це навісна конструкція з повітряним зазором між утеплювачем і облицюванням. Зазор відводить вологу, утеплювач зберігає тепло, а облицювання захищає будівлю й задає її вигляд.</p>\n<p>Найчастіше ми облицьовуємо фасади алюмінієвими композитними панелями. Вони стійкі до погоди, ультрафіолету, корозії та забруднень, гасять вібрацію й шум і роками зберігають колір. Панелі легко набувають будь-якої форми, тож з них можна зібрати і строгий діловий фасад, і найсміливіше архітектурне рішення.</p>\n',
        '<h2>A modern facade — looks, energy efficiency and durability</h2>\n<p>A ventilated facade is a rainscreen system with an air gap between the insulation and the cladding. The gap carries moisture away, the insulation keeps the heat in, and the cladding protects the building and defines its look.</p>\n<p>Most of our facades are clad in aluminium composite panels. They resist weather, UV, corrosion and dirt, damp vibration and noise, and keep their colour for years. The panels take almost any shape, so they suit both a strict corporate facade and the boldest architectural idea.</p>\n',
        '<h2>Современное фасадное решение — эстетика, энергоэффективность и долговечность</h2>\n<p>Вентилируемый фасад — это навесная конструкция с воздушным зазором между утеплителем и облицовкой. Зазор отводит влагу, утеплитель сохраняет тепло, а облицовка защищает здание и задает его облик.</p>\n<p>Чаще всего мы облицовываем фасады алюминиевыми композитными панелями. Они устойчивы к погоде, ультрафиолету, коррозии и загрязнениям, гасят вибрацию и шум и годами сохраняют цвет. Панели легко принимают любую форму, поэтому из них можно собрать и строгий деловой фасад, и самое смелое архитектурное решение.</p>\n'],
    content2=[
        '<p>Касети нестандартних розмірів і форм монтуються так само, як і стандартні, тож оригінальний фасад не ускладнює монтаж. Палітра композитних панелей — від стриманих металіків до яскравих кольорів. Для фасадів і приміщень закладів використовуємо також HPL-панелі, а для великих площин — профнастил.</p>',
        '<p>Non-standard cassettes are installed just like standard ones, so an unusual facade does not complicate the installation. Composite panels come in anything from restrained metallics to bright colours. For restaurant facades and interiors we also use HPL panels, and profiled sheet for large surfaces.</p>',
        '<p>Кассеты нестандартных размеров и форм монтируются так же, как и стандартные, поэтому оригинальный фасад не усложняет монтаж. Палитра композитных панелей — от сдержанных металликов до ярких цветов. Для фасадов и помещений заведений используем также HPL-панели, а для больших плоскостей — профнастил.</p>'],
    callout=['Перед виготовленням розробляємо дизайн-проєкт фасаду: ви погоджуєте кольори та розкладку панелей ще до початку робіт.',
             'Before production we design the facade: you approve the colours and panel layout before any work starts.',
             'Перед изготовлением разрабатываем дизайн-проект фасада: вы согласовываете цвета и раскладку панелей еще до начала работ.'],
    content3=[
        '<p>Підсистему підбираємо під основу та навантаження: алюмінієву — для композитних касет, каркас із металевої профільної труби — для профнастилу. Утеплюємо мінеральним утеплювачем, а вузли кріплення розраховуємо під конкретну стіну.</p>\n' + f[0] + '\n' + qt[0] + '\n<p>Щоб замовити вентильований фасад, достатньо безкоштовно викликати нашого фахівця: він огляне обʼєкт, зробить обміри та підкаже оптимальну систему облицювання.</p>',
        '<p>The substructure is chosen for the wall and the loads: aluminium for composite cassettes, a steel tube frame for profiled sheet. We insulate with mineral wool and calculate every fixing for the specific wall.</p>\n' + f[1] + '\n' + qt[1] + '\n<p>To order a ventilated facade, just call our specialist out free of charge: they will inspect the building, take measurements and suggest the right cladding system.</p>',
        '<p>Подсистему подбираем под основание и нагрузки: алюминиевую — для композитных кассет, каркас из металлической профильной трубы — для профнастила. Утепляем минеральным утеплителем, а узлы крепления рассчитываем под конкретную стену.</p>\n' + f[2] + '\n' + qt[2] + '\n<p>Чтобы заказать вентилируемый фасад, достаточно бесплатно вызвать нашего специалиста: он осмотрит объект, сделает замеры и подскажет оптимальную систему облицовки.</p>'],
    materials=tabs(
        ('projects/globus-bank-2.jpg', True, ('Композитні панелі', 'Composite panels', 'Композитные панели'),
         ('Легкі алюмінієві касети, стійкі до погоди, ультрафіолету й корозії, з широкою палітрою кольорів.',
          'Light aluminium cassettes that resist weather, UV and corrosion, in a wide range of colours.',
          'Легкие алюминиевые кассеты, устойчивые к погоде, ультрафиолету и коррозии, с широкой палитрой цветов.')),
        ('kfc-night.jpg', False, ('HPL-панелі', 'HPL panels', 'HPL-панели'),
         ('Панелі високого тиску для фасадів і приміщень закладів — як у ресторанах KFC.',
          'High-pressure laminate for restaurant facades and interiors, as at KFC.',
          'Панели высокого давления для фасадов и помещений заведений — как в ресторанах KFC.')),
        ('projects/cc-1.jpg', False, ('Профнастил', 'Profiled sheet', 'Профнастил'),
         ('Практичне облицювання великих площин на каркасі з профільної труби.',
          'Practical cladding for large surfaces on a steel tube frame.',
          'Практичная облицовка больших плоскостей на каркасе из профильной трубы.')),
        ('projects/lego-1.jpg', False, ('Нестандартні касети', 'Custom cassettes', 'Нестандартные кассеты'),
         ('Обʼємні та фігурні елементи, які монтуються так само, як стандартні панелі.',
          '3D and shaped elements that install just like standard panels.',
          'Объемные и фигурные элементы, которые монтируются так же, как стандартные панели.')),
    ),
)))

# ---------------------------------------------------------------- Entrance groups
f = fig('projects/lego-1.jpg', 1600, 900,
        ('Фасад магазину LEGO з композитних панелей', 'LEGO store facade in composite panels', 'Фасад магазина LEGO из композитных панелей'),
        ('Магазин LEGO: композитні панелі, обʼємні світлові елементи з акрилу та ПВХ і підсвітка прожекторами.',
         'LEGO store: composite panels, illuminated 3D elements in acrylic and PVC, and floodlights.',
         'Магазин LEGO: композитные панели, объемные световые элементы из акрила и ПВХ и подсветка прожекторами.'))
qt = q3('«Ми завжди оптимізуємо процеси, щоб скоротити строки — і при цьому досягти кращої якості».',
        '“We always streamline the process to save time — and get better quality at the same time.”',
        '«Мы всегда оптимизируем процессы, чтобы сократить сроки — и при этом добиться лучшего качества».')
S.append(dict(id=44, slugs=('vittorio-spernanzoni', 'lego', 'carnegie-center'), fields=dict(
    content=[
        '<h2>Вхідна група, яка працює на бренд</h2>\n<p>Вхідна група формує перше враження про заклад ще до того, як клієнт відчинив двері. Портал, вітрина, вивіска та освітлення мають працювати як одне ціле й роками витримувати погоду та щоденний трафік.</p>\n<p>Ми оцінюємо наявний фасад, робимо обміри й фото, а потім розробляємо дизайн-проєкт: матеріали, освітлення, інтеграцію реклами, привʼязку до наявних конструкцій і кольорову гаму. Каркас, облицювання та вивіску виготовляємо у власному цеху й монтуємо власними бригадами.</p>\n',
        '<h2>An entrance that works for the brand</h2>\n<p>The entrance shapes the first impression before a customer even opens the door. Portal, shop window, sign and lighting have to work as one and withstand weather and daily traffic for years.</p>\n<p>We assess the existing facade, take measurements and photos, then design the entrance: materials, lighting, integrated signage, fixing to existing structures and colours. The frame, cladding and sign are made in our own workshop and installed by our own crews.</p>\n',
        '<h2>Входная группа, которая работает на бренд</h2>\n<p>Входная группа формирует первое впечатление о заведении еще до того, как клиент открыл дверь. Портал, витрина, вывеска и освещение должны работать как единое целое и годами выдерживать погоду и ежедневный трафик.</p>\n<p>Мы оцениваем существующий фасад, делаем замеры и фотографии, а затем разрабатываем дизайн-проект: материалы, освещение, интеграцию рекламы, привязку к существующим конструкциям и цветовую гамму. Каркас, облицовку и вывеску изготавливаем в собственном цеху и монтируем своими бригадами.</p>\n'],
    content2=[
        '<p>Ще на етапі комерційної пропозиції показуємо варіанти з різними матеріалами. Схожий вигляд часто можна отримати з бюджетнішого аналога, а там, де треба виділитися, — застосувати преміальні матеріали без зайвої переплати. Ціни — від виробника.</p>',
        '<p>Already at the proposal stage we show options in different materials. A similar look can often be achieved with a more affordable alternative, and where you need to stand out we use premium materials without overpaying. Prices are direct from the manufacturer.</p>',
        '<p>Еще на этапе коммерческого предложения показываем варианты с разными материалами. Похожий вид часто можно получить с более бюджетным аналогом, а там, где нужно выделиться, — применить премиальные материалы без лишней переплаты. Цены — от производителя.</p>'],
    callout=['Після погодження дизайну демонтуємо старі конструкції, знімаємо контрольні обміри й частково збираємо елементи в цеху — тож монтаж на обʼєкті займає менше часу.',
             'Once the design is approved we remove the old structures, take check measurements and pre-assemble elements in the workshop, so less time is spent on site.',
             'После утверждения дизайна демонтируем старые конструкции, снимаем контрольные замеры и частично собираем элементы в цеху — поэтому монтаж на объекте занимает меньше времени.'],
    content3=[
        '<p>Вхідна група має бути помітною в міському середовищі: перевіряємо, щоб ніщо не закривало огляд, і ще на етапі проєкту вирішуємо, де потрібне підсвічування. Строки залежать від складності та обсягу робіт — від тижня.</p>\n' + f[0] + '\n' + qt[0] + '\n<p>Щоб замовити вхідну групу, достатньо безкоштовно викликати нашого фахівця: він оцінить фасад, зробить обміри й підкаже оптимальні матеріали.</p>',
        '<p>An entrance has to be visible in the street: we make sure nothing blocks the view and decide where lighting is needed already at the design stage. Lead times depend on complexity and scope — from one week.</p>\n' + f[1] + '\n' + qt[1] + '\n<p>To order an entrance group, just call our specialist out free of charge: they will assess the facade, take measurements and suggest the best materials.</p>',
        '<p>Входная группа должна быть заметной в городской среде: проверяем, чтобы ничто не мешало обзору, и еще на этапе проекта решаем, где нужна подсветка. Сроки зависят от сложности и объема работ — от недели.</p>\n' + f[2] + '\n' + qt[2] + '\n<p>Чтобы заказать входную группу, достаточно бесплатно вызвать нашего специалиста: он оценит фасад, сделает замеры и подскажет оптимальные материалы.</p>'],
    checklist=['Обміри та фотофіксація фасаду\nДизайн-проєкт вхідної групи\nДемонтаж старих конструкцій\nМеталокаркас, портали та обрамлення прорізів\nОблицювання композитом, металом або HPL\nВивіска, підсвічування та монтаж під ключ',
               'Facade measurements and photos\nEntrance design project\nRemoval of old structures\nSteel frame, portals and opening surrounds\nCladding in composite, metal or HPL\nSign, lighting and turnkey installation',
               'Замеры и фотофиксация фасада\nДизайн-проект входной группы\nДемонтаж старых конструкций\nМеталлокаркас, порталы и обрамление проемов\nОблицовка композитом, металлом или HPL\nВывеска, подсветка и монтаж под ключ'],
    materials=tabs(
        ('projects/vittorio-spernanzoni-1.jpg', True, ('Портали та обрамлення', 'Portals and surrounds', 'Порталы и обрамление'),
         ('Обʼємні портали з композиту й металу з інтегрованою вивіскою.',
          '3D portals in composite and metal with an integrated sign.',
          'Объемные порталы из композита и металла с интегрированной вывеской.')),
        ('about-mark.jpg', False, ('Вітрини', 'Shop windows', 'Витрины'),
         ('Оформлення вітрин, підсвічування та рекламні елементи.',
          'Window displays, lighting and advertising elements.',
          'Оформление витрин, подсветка и рекламные элементы.')),
        ('projects/carnegie-center-1.jpg', False, ('Козирки', 'Canopies', 'Козырьки'),
         ('Козирки над входом із вбудованою вивіскою та підсвічуванням.',
          'Entrance canopies with a built-in sign and lighting.',
          'Козырьки над входом со встроенной вывеской и подсветкой.')),
        ('projects/yus-bar-1.jpg', False, ('Інтеграція реклами', 'Integrated signage', 'Интеграция рекламы'),
         ('Вивіска, лайтбокс чи світлові літери як частина фасаду, а не окремий елемент.',
          'A sign, light box or channel letters as part of the facade rather than an add-on.',
          'Вывеска, лайтбокс или световые буквы как часть фасада, а не отдельный элемент.')),
    ),
)))

# ---------------------------------------------------------------- Outdoor advertising
f = fig('kfc-artmall-1.jpg', 1448, 815,
        ('Світлові вивіски KFC на фасаді ТРЦ Art Mall увечері', 'KFC illuminated signs on the Art Mall facade at night', 'Световые вывески KFC на фасаде ТРЦ Art Mall вечером'),
        ('Вивіски KFC у ТРЦ Art Mall: обʼємні літери та лайтбокси.',
         'KFC signs at Art Mall: channel letters and light boxes.',
         'Вывески KFC в ТРЦ Art Mall: объемные буквы и лайтбоксы.'))
qt = q3('«Вивіска — це обличчя вашого бізнесу: з неї починається знайомство з брендом».',
        '“A sign is the face of your business: it is where people first meet the brand.”',
        '«Вывеска — это лицо вашего бизнеса: с нее начинается знакомство с брендом».')
S.append(dict(id=47, slugs=('kfc', 'sun-gallery', 'hooligan'), fields=dict(
    content=[
        '<h2>Вивіска, яку помічають і вдень, і вночі</h2>\n<p>Світлова реклама працює цілодобово, підкреслює архітектуру будівлі й навіть приховує її недоліки — якщо гармонує з фасадом і роками зберігає колір та яскравість.</p>\n<p>Ми виготовляємо й монтуємо вивіски, лайтбокси, обʼємні літери, елементи для вітрин і дахові конструкції будь-якої складності. За потреби розробляємо логотип і фірмовий стиль з нуля або працюємо за наявним бренд-буком.</p>\n',
        '<h2>A sign that gets noticed day and night</h2>\n<p>Illuminated advertising works around the clock, emphasises the architecture and can even hide its flaws — as long as it suits the facade and keeps its colour and brightness for years.</p>\n<p>We make and install signs, light boxes, channel letters, window display elements and rooftop structures of any complexity. If needed, we create a logo and corporate identity from scratch or work to your existing brand book.</p>\n',
        '<h2>Вывеска, которую замечают и днем, и ночью</h2>\n<p>Световая реклама работает круглосуточно, подчеркивает архитектуру здания и даже скрывает его недостатки — если гармонирует с фасадом и годами сохраняет цвет и яркость.</p>\n<p>Мы изготавливаем и монтируем вывески, лайтбоксы, объемные буквы, элементы для витрин и крышные конструкции любой сложности. При необходимости разрабатываем логотип и фирменный стиль с нуля или работаем по существующему брендбуку.</p>\n'],
    content2=[
        '<p>Тип вивіски підбираємо під фасад, відстань огляду та бюджет: світловий короб (односторонній, двосторонній консольний чи всесторонній), обʼємні літери з лицьовим, контражурним або точковим підсвічуванням, композитний короб з інкрустованими акриловими літерами чи несвітлова вивіска з прожекторами. Для мереж розробляємо стандарти, щоб вивіски на всіх обʼєктах виглядали однаково.</p>',
        '<p>We choose the sign type for the facade, viewing distance and budget: a light box (single-sided, double-sided projecting or all-round), channel letters with face, halo or point lighting, a composite box with inlaid acrylic letters, or a non-illuminated sign with floodlights. For chains we develop standards so the signs look the same at every location.</p>',
        '<p>Тип вывески подбираем под фасад, расстояние обзора и бюджет: световой короб (односторонний, двусторонний консольный или всесторонний), объемные буквы с лицевой, контражурной или точечной подсветкой, композитный короб с инкрустированными акриловыми буквами или несветовая вывеска с прожекторами. Для сетей разрабатываем стандарты, чтобы вывески на всех объектах выглядели одинаково.</p>'],
    callout=['Підсвічуємо світлодіодами: вони не перегорають, як лампи, споживають у рази менше енергії, ніж неон чи галоген, і навіть можуть імітувати неон.',
             'We light signs with LEDs: they do not burn out like lamps, use many times less power than neon or halogen, and can even imitate neon.',
             'Подсвечиваем светодиодами: они не перегорают, как лампы, потребляют в разы меньше энергии, чем неон или галоген, и даже могут имитировать неон.'],
    content3=[
        '<p>Працюємо зі світлорозсіювальними матеріалами — акрилом, полікарбонатом, склом, банером backlit — і з несвітловими: ПВХ, ПЕТ, композитними та HPL-панелями, металом, деревом і фанерою. Перед виготовленням показуємо креслення та фотопривʼязку макета до фасаду, щоб ви оцінили проєкт цілком.</p>\n' + f[0] + '\n' + qt[0] + '\n<p>Строки залежать від складності: прості вивіски — від трьох робочих днів, обʼємні літери та дахові установки — від тижня. Дахові конструкції розраховуємо на вітрове й снігове навантаження та проєктуємо так, щоб їх було легко обслуговувати. Монтуємо з автовишок або силами промислових альпіністів.</p>',
        '<p>We work with light-diffusing materials — acrylic, polycarbonate, glass, backlit banner — and opaque ones: PVC, PET, composite and HPL panels, metal, wood and plywood. Before production you see the drawings and a photo mock-up of the sign on your facade, so you can judge the whole project.</p>\n' + f[1] + '\n' + qt[1] + '\n<p>Lead times depend on complexity: simple signs from three working days, channel letters and rooftop signs from one week. Rooftop structures are calculated for wind and snow loads and designed to be easy to service. We install from aerial platforms or with industrial climbers.</p>',
        '<p>Работаем со светорассеивающими материалами — акрилом, поликарбонатом, стеклом, баннером backlit — и с несветовыми: ПВХ, ПЭТ, композитными и HPL-панелями, металлом, деревом и фанерой. Перед изготовлением показываем чертежи и фотопривязку макета к фасаду, чтобы вы оценили проект целиком.</p>\n' + f[2] + '\n' + qt[2] + '\n<p>Сроки зависят от сложности: простые вывески — от трех рабочих дней, объемные буквы и крышные установки — от недели. Крышные конструкции рассчитываем на ветровую и снеговую нагрузку и проектируем так, чтобы их было легко обслуживать. Монтируем с автовышек или силами промышленных альпинистов.</p>'],
    checklist=['Дизайн-макет і фотопривʼязка до фасаду\nЛоготип і фірмовий стиль за потреби\nКреслення та розрахунок конструкції\nВиготовлення у власному цеху\nСвітлодіодне підсвічування\nМонтаж, підключення та сервіс',
               'Design mock-up on a photo of the facade\nLogo and corporate identity if needed\nDrawings and structural calculation\nProduction in our own workshop\nLED lighting\nInstallation, connection and service',
               'Дизайн-макет и фотопривязка к фасаду\nЛоготип и фирменный стиль при необходимости\nЧертежи и расчет конструкции\nИзготовление в собственном цеху\nСветодиодная подсветка\nМонтаж, подключение и сервис'],
    materials=tabs(
        ('projects/calzedonia-1.jpg', True, ('Обʼємні літери', 'Channel letters', 'Объемные буквы'),
         ('Лицьове, контражурне чи точкове підсвічування, «холодний неон».',
          'Face, halo or point lighting, LED neon.',
          'Лицевая, контражурная или точечная подсветка, «холодный неон».')),
        ('projects/arbat-prestige-2.jpg', False, ('Лайтбокси', 'Light boxes', 'Лайтбоксы'),
         ('Світлові короби: односторонні, консольні та всесторонні.',
          'Single-sided, projecting and all-round light boxes.',
          'Световые короба: односторонние, консольные и всесторонние.')),
        ('projects/globus-bank-2.jpg', False, ('Композитні короби', 'Composite boxes', 'Композитные короба'),
         ('Алюмінієві композитні панелі з інкрустованими акриловими літерами.',
          'Aluminium composite panels with inlaid acrylic letters.',
          'Алюминиевые композитные панели с инкрустированными акриловыми буквами.')),
        ('projects/sun-gallery-1.jpg', False, ('Дахові установки', 'Rooftop signs', 'Крышные установки'),
         ('Великоформатні конструкції з розрахунком на вітрове навантаження.',
          'Large-format structures designed for wind loads.',
          'Крупноформатные конструкции с расчетом на ветровую нагрузку.')),
    ),
)))

# ---------------------------------------------------------------- Interior signage and wayfinding
f = fig('projects/domosfera-3.jpg', 1600, 900,
        ('Внутрішня навігація ТЦ «Домосфера»', 'Interior wayfinding at the Domosfera shopping centre', 'Внутренняя навигация ТЦ «Домосфера»'),
        ('ТЦ «Домосфера»: стела з друком на склі, обʼємні короби та покажчики.',
         'Domosfera shopping centre: printed glass pylon, 3D boxes and direction signs.',
         'ТЦ «Домосфера»: стела с печатью на стекле, объемные короба и указатели.'))
qt = q3('«Найкраща навігація — та, про яку відвідувач не замислюється: він просто знаходить потрібне».',
        '“The best wayfinding is the kind visitors never think about: they simply find what they need.”',
        '«Лучшая навигация — та, о которой посетитель не задумывается: он просто находит нужное».')
S.append(dict(id=50, slugs=('domosfera', 'carnegie-center', 'intimissimi'), fields=dict(
    content=[
        '<h2>Простір, у якому легко орієнтуватися й хочеться купувати</h2>\n<p>Зовнішні вивіски привертають клієнтів, а внутрішні — інформують, ведуть до потрібного місця й спонукають до покупки. Тому оформлення торгових центрів, магазинів, ресторанів і офісів зсередини — не менш відповідальне завдання, ніж фасад.</p>\n<p>Усередині на рекламу не діють вітер, мороз і ультрафіолет, тож вибір матеріалів і форм значно ширший: обʼємні літери, світлові вивіски й консолі, стенди, таблички, акрилайти, фреймлайти та POS-конструкції.</p>\n',
        '<h2>A space that is easy to navigate and makes people want to buy</h2>\n<p>Outdoor signs bring customers in; indoor ones inform, guide people where they need to go and prompt them to buy. That is why fitting out shopping centres, stores, restaurants and offices inside matters as much as the facade.</p>\n<p>Indoors there is no wind, frost or UV, so the choice of materials and shapes is much wider: channel letters, illuminated and projecting signs, stands, plaques, acrylic light panels, frame lights and POS displays.</p>\n',
        '<h2>Пространство, в котором легко ориентироваться и хочется покупать</h2>\n<p>Наружные вывески привлекают клиентов, а внутренние — информируют, ведут к нужному месту и побуждают к покупке. Поэтому оформление торговых центров, магазинов, ресторанов и офисов изнутри — не менее ответственная задача, чем фасад.</p>\n<p>Внутри на рекламу не действуют ветер, мороз и ультрафиолет, поэтому выбор материалов и форм гораздо шире: объемные буквы, световые вывески и консоли, стенды, таблички, акрилайты, фреймлайты и POS-конструкции.</p>\n'],
    callout=['Фреймлайт завтовшки від 35 мм світиться рівно по всій площі, а постер у ньому змінюється за кілька хвилин — зручно для акцій і меню.',
             'A frame light from 35 mm thick glows evenly across its whole surface, and the poster can be changed in minutes — handy for promotions and menus.',
             'Фреймлайт толщиной от 35 мм светится равномерно по всей площади, а постер в нем меняется за несколько минут — удобно для акций и меню.'],
    content3=[
        '<p>Таблички виготовляємо з пластику чи металу: з плівкою ПВХ, шовкографією або повнокольоровим друком, з гравіюванням на двошаровому пластику чи лазерною обробкою нержавіючої сталі. Акрилайт — акрил з гравіюванням і торцевим підсвічуванням: логотип чи напис у ньому ніби світиться в повітрі, а розмір панелі — до 3000×2000 мм.</p>\n' + f[0] + '\n' + qt[0] + '\n<p>Після запуску оновлюємо промографіку, змінюємо постери й доповнюємо навігацію — без демонтажу основних конструкцій.</p>',
        '<p>Plaques are made of plastic or metal: with PVC film, screen printing or full-colour print, engraved on two-layer plastic or laser-cut from stainless steel. An acrylic light panel is engraved, edge-lit acrylic in which a logo or lettering seems to glow in mid-air; panels go up to 3000×2000 mm.</p>\n' + f[1] + '\n' + qt[1] + '\n<p>After the opening we update promo graphics, change posters and extend the wayfinding without removing the main structures.</p>',
        '<p>Таблички изготавливаем из пластика или металла: с пленкой ПВХ, шелкографией или полноцветной печатью, с гравировкой на двухслойном пластике или лазерной обработкой нержавеющей стали. Акрилайт — акрил с гравировкой и торцевой подсветкой: логотип или надпись в нем будто светится в воздухе, а размер панели — до 3000×2000 мм.</p>\n' + f[2] + '\n' + qt[2] + '\n<p>После запуска обновляем промографику, меняем постеры и дополняем навигацию — без демонтажа основных конструкций.</p>'],
    checklist=['Аудит простору та сценарії руху відвідувачів\nДизайн системи навігації та піктограм\nТаблички, покажчики та стели\nЛайтбокси, акрилайти та фреймлайти\nPOS-конструкції, стійки та промозони\nБрендування стін, скла та підвісних елементів',
               'Space audit and visitor flow\nWayfinding system and pictogram design\nPlaques, direction signs and pylons\nLight boxes, acrylic light panels and frame lights\nPOS displays, stands and promo zones\nBranding of walls, glass and suspended elements',
               'Аудит пространства и сценарии движения посетителей\nДизайн системы навигации и пиктограмм\nТаблички, указатели и стелы\nЛайтбоксы, акрилайты и фреймлайты\nPOS-конструкции, стойки и промозоны\nБрендирование стен, стекла и подвесных элементов'],
    materials=tabs(
        ('project-intimissimi.jpg', True, ('Брендування торгових залів', 'Store branding', 'Брендирование торговых залов'),
         ('Фірмові стіни, панно, обʼємні літери та оформлення вітрин зсередини.',
          'Brand walls, panels, channel letters and window displays from the inside.',
          'Фирменные стены, панно, объемные буквы и оформление витрин изнутри.')),
        ('projects/domosfera-3.jpg', False, ('Навігація торгових центрів', 'Shopping centre wayfinding', 'Навигация торговых центров'),
         ('Стели, обʼємні короби, покажчики та поверхові плани.',
          'Pylons, 3D boxes, direction signs and floor plans.',
          'Стелы, объемные короба, указатели и поэтажные планы.')),
        ('projects/carnegie-center-2.jpg', False, ('Таблички', 'Plaques', 'Таблички'),
         ('Інформаційні, дверні, фасадні таблички та покажчики з пластику й металу.',
          'Information, door and facade plaques and direction signs in plastic and metal.',
          'Информационные, дверные, фасадные таблички и указатели из пластика и металла.')),
        ('projects/alsace-1.jpg', False, ('Світлові вивіски', 'Illuminated signs', 'Световые вывески'),
         ('Вивіски з контражурним підсвічуванням, акрилайти та фреймлайти.',
          'Halo-lit signs, acrylic light panels and frame lights.',
          'Вывески с контражурной подсветкой, акрилайты и фреймлайты.')),
    ),
)))

# ---------------------------------------------------------------- Design and engineering
f = fig('projects/lego-3.jpg', 1600, 900,
        ('Дизайн-проєкт фасаду магазину LEGO', 'LEGO store facade design', 'Дизайн-проект фасада магазина LEGO'),
        ('Дизайн-проєкт магазину LEGO: візуалізація фасаду до початку виробництва.',
         'LEGO store design: a facade visualisation before production starts.',
         'Дизайн-проект магазина LEGO: визуализация фасада до начала производства.'))
qt = q3('«Нам важлива добре зроблена робота й довгострокова співпраця».',
        '“What matters to us is a job well done and a long-term partnership.”',
        '«Нам важна хорошо сделанная работа и долгосрочное сотрудничество».')
S.append(dict(id=53, slugs=('lego', 'yus-bar', 'carnegie-center'), fields=dict(
    content=[
        '<h2>Проєкт, який можна збудувати без сюрпризів</h2>\n<p>Оригінальний дизайн рекламних і будівельних обʼєктів допомагає виділитися й привернути додаткову увагу. Щоб він був не лише гарним, а й реалізованим, наші дизайнери спираються на досвід роботи з матеріалами та можливості власного виробництва.</p>\n<p>Пакет документів містить фотореалістичну 3D-візуалізацію, детальні креслення та конструктивні рішення. За ними видно, яким буде обʼєкт, і можна уникнути проблем під час виготовлення та експлуатації.</p>\n',
        '<h2>A design you can build without surprises</h2>\n<p>An original design for signage and buildings helps you stand out and draw extra attention. To make it buildable as well as beautiful, our designers draw on their experience with materials and on what our own production can do.</p>\n<p>The package includes photorealistic 3D visualisation, detailed drawings and structural solutions. They show exactly what the result will look like and help avoid problems in production and use.</p>\n',
        '<h2>Проект, который можно построить без сюрпризов</h2>\n<p>Оригинальный дизайн рекламных и строительных объектов помогает выделиться и привлечь дополнительное внимание. Чтобы он был не только красивым, но и реализуемым, наши дизайнеры опираются на опыт работы с материалами и возможности собственного производства.</p>\n<p>Пакет документов включает фотореалистичную 3D-визуализацию, подробные чертежи и конструктивные решения. По ним видно, каким будет объект, и можно избежать проблем при изготовлении и эксплуатации.</p>\n'],
    content2=[
        '<p>Створюємо логотип і фірмовий стиль з нуля або працюємо за бренд-буками мереж і адаптуємо їх до конкретного приміщення, матеріалів та бюджету без втрати фірмового стилю.</p>',
        '<p>We create a logo and corporate identity from scratch, or work to a chain’s brand book and adapt it to the specific premises, materials and budget without losing the brand’s look.</p>',
        '<p>Создаем логотип и фирменный стиль с нуля или работаем по брендбукам сетей и адаптируем их к конкретному помещению, материалам и бюджету без потери фирменного стиля.</p>'],
    content3=[
        '<p>Дотримуємося стандартів якості та правових норм і супроводжуємо проєкт на погодженнях — з бренд-центром мережі, орендодавцем і технічною службою ТРЦ.</p>\n' + f[0] + '\n' + qt[0] + '\n<p>Проєкт можна замовити окремо або разом із виробництвом і монтажем.</p>',
        '<p>We follow quality standards and regulations and support the project through approvals with the chain’s brand team, the landlord and the mall’s technical service.</p>\n' + f[1] + '\n' + qt[1] + '\n<p>You can order the design on its own or together with production and installation.</p>',
        '<p>Соблюдаем стандарты качества и правовые нормы и сопровождаем проект на согласованиях — с бренд-центром сети, арендодателем и технической службой ТРЦ.</p>\n' + f[2] + '\n' + qt[2] + '\n<p>Проект можно заказать отдельно или вместе с производством и монтажом.</p>'],
    checklist=['Обміри та фотофіксація обʼєкта\nКонцепція та дизайн-проєкт\nЛоготип і фірмовий стиль\n3D-візуалізація інтерʼєру та фасаду\nРобочі креслення та вузли конструкцій\nСпецифікації та кошторис',
               'Measurements and photos of the site\nConcept and design project\nLogo and corporate identity\n3D visualisation of the interior and facade\nWorking drawings and structural details\nSpecifications and cost estimate',
               'Замеры и фотофиксация объекта\nКонцепция и дизайн-проект\nЛоготип и фирменный стиль\n3D-визуализация интерьера и фасада\nРабочие чертежи и узлы конструкций\nСпецификации и смета'],
    materials=tabs(
        ('projects/lego-2.jpg', True, ('Дизайн-концепція', 'Design concept', 'Дизайн-концепция'),
         ('Стиль, кольори, матеріали та ключові рішення.',
          'Style, colours, materials and key solutions.',
          'Стиль, цвета, материалы и ключевые решения.')),
        ('projects/globus-bank-3.jpg', False, ('3D-візуалізація', '3D visualisation', '3D-визуализация'),
         ('Фотореалістичні зображення фасаду чи інтерʼєру до початку робіт.',
          'Photorealistic images of the facade or interior before work starts.',
          'Фотореалистичные изображения фасада или интерьера до начала работ.')),
        ('blog-drawings.jpg', False, ('Робоча документація', 'Working drawings', 'Рабочая документация'),
         ('Креслення, вузли та конструктивні рішення для виробництва й монтажу.',
          'Drawings, details and structural solutions for production and installation.',
          'Чертежи, узлы и конструктивные решения для производства и монтажа.')),
        ('material-panels.jpg', False, ('Кошторис і специфікації', 'Estimate and specifications', 'Смета и спецификации'),
         ('Прозорий розрахунок матеріалів, робіт і строків.',
          'A clear breakdown of materials, work and timing.',
          'Прозрачный расчет материалов, работ и сроков.')),
    ),
)))

# ---------------------------------------------------------------- Turnkey construction: photo captions only
f = fig('project-globus.jpg', 1000, 562,
        ('Відділення банку «Глобус»: фасад і вивіска', 'Globus Bank branch: facade and sign', 'Отделение банка «Глобус»: фасад и вывеска'),
        ('Відділення банку «Глобус»: вентильований фасад і світлова вивіска.',
         'Globus Bank branch: ventilated facade and illuminated sign.',
         'Отделение банка «Глобус»: вентилируемый фасад и световая вывеска.'))
S.append(dict(id=38, slugs=None, replace=dict(
    content3=('<figure>\n<img alt="', '</figure>', f)),
    fields=dict(image_alt=['Ресторан KFC у ТРЦ Dream Town — обʼєкт improvision', 'KFC restaurant at Dream Town mall — an improvision project', 'Ресторан KFC в ТРЦ Dream Town — объект improvision'])))

# ---------------------------------------------------------------- Finishing and renovation: photo captions only
f = fig('projects/cc-1.jpg', 1600, 900,
        ('Вентильований фасад магазину C&amp;C', 'C&amp;C store ventilated facade', 'Вентилируемый фасад магазина C&amp;C'),
        ('Магазин C&amp;C: новий утеплений вентильований фасад з композиту та профнастилу.',
         'C&amp;C store: a new insulated ventilated facade in composite and profiled sheet.',
         'Магазин C&amp;C: новый утепленный вентилируемый фасад из композита и профнастила.'))
S.append(dict(id=56, slugs=('cc', 'globus-bank', 'carnegie-center'), replace=dict(
    content3=('<figure>\n<img alt="', '</figure>', f)),
    fields=dict(image_alt=['Фасад бізнес-центру', 'Business centre facade', 'Фасад бизнес-центра'])))

json.dump(S, open('data.json', 'w'), ensure_ascii=False, indent=1)
print(len(S), 'services')
