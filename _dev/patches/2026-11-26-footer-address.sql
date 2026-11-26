-- improvision: address in the footer and for search engines (Shared blocks, 3 languages).
-- It was Kutuzova St 18/7 from the mockup; the office address (old site, Contacts page) is Zdolbunivska St 7G.
-- Afterwards clear the cache in the manager.
SET NAMES utf8mb4;
START TRANSACTION;
SET @tv_address = (SELECT id FROM modx_site_tmplvars WHERE name = 'address');
SET @tv_street  = (SELECT id FROM modx_site_tmplvars WHERE name = 'map_street');
DELETE FROM modx_site_tmplvar_contentvalues WHERE contentid IN (34, 35, 36) AND tmplvarid IN (@tv_address, @tv_street);
INSERT INTO modx_site_tmplvar_contentvalues (tmplvarid, contentid, value) VALUES
  (@tv_address, 34, 'вул. Здолбунівська, 7Г, офіс 19, м. Київ'),
  (@tv_address, 35, '7G Zdolbunivska St, office 19, Kyiv'),
  (@tv_address, 36, 'ул. Здолбуновская, 7Г, офис 19, г. Киев'),
  (@tv_street,  34, 'вул. Здолбунівська, 7Г, офіс 19'),
  (@tv_street,  35, '7G Zdolbunivska St, office 19'),
  (@tv_street,  36, 'ул. Здолбуновская, 7Г, офис 19');
COMMIT;
