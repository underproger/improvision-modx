-- Static elements (templates, chunks, snippets, plugin) are read from their files
-- in core/components/improvision/elements/ again.
-- The paths were stored as {core_path}…, which MODX does not expand, so it kept using
-- the copy in the database and edits of the files (git pull / FTP) did not reach the site.
-- [[++core_path]] is expanded by MODX itself. Clear the cache after running this.

UPDATE modx_site_templates    SET static_file = REPLACE(static_file, '{core_path}', '[[++core_path]]') WHERE static = 1;
UPDATE modx_site_htmlsnippets SET static_file = REPLACE(static_file, '{core_path}', '[[++core_path]]') WHERE static = 1;
UPDATE modx_site_snippets     SET static_file = REPLACE(static_file, '{core_path}', '[[++core_path]]') WHERE static = 1;
UPDATE modx_site_plugins      SET static_file = REPLACE(static_file, '{core_path}', '[[++core_path]]') WHERE static = 1;
