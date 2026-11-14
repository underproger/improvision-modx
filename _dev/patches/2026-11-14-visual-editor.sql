-- Visual editor (TinyMCE Rich Text Editor) for page texts.
-- Run AFTER installing "TinyMCE Rich Text Editor" in the manager (Extras → Installer).

-- 1. «Вміст» and the rich-text fields open in the editor on these pages
UPDATE modx_site_content c
JOIN modx_site_templates t ON t.id = c.template
SET c.richtext = 1
WHERE t.templatename IN ('Про нас', 'Послуга', 'Проєкт', 'Стаття', 'Текстова сторінка');

-- 2. the editor stores links and images as /assets/… (not relative to /en/ or /ru/)
INSERT INTO modx_system_settings (`key`, `value`, `xtype`, `namespace`, `area`)
VALUES ('tinymcerte.relative_urls', '0', 'combo-boolean', 'tinymcerte', 'tinymcerte.default')
ON DUPLICATE KEY UPDATE `value` = '0';

-- 3. editor on, TinyMCE as the editor, new pages with the editor on by default
UPDATE modx_system_settings SET `value` = '1' WHERE `key` IN ('use_editor', 'richtext_default');
UPDATE modx_system_settings SET `value` = 'TinyMCE RTE' WHERE `key` = 'which_editor';
