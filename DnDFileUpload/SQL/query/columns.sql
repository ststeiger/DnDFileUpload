
SELECT T_BO_Menu.* FROM T_BO_Menu 
WHERE T_BO_Menu.ME_SL_UID IS NOT NULL 


SELECT T_BO_Menu.* FROM T_BO_Menu 
WHERE T_BO_Menu.ME_Page LIKE '%legende_swissre_A0%' 


-- SELECT T_COR_Slicklist.* FROM T_COR_Slicklist WHERE SL_SQL_onChanges LIKE '~\%' 


SELECT 
	 T_COR_Ref_Slickcolumn.SLCOL_field 
	,T_COR_Ref_Slickcolumn.SLCOL_name, 
	 * 
FROM T_COR_Ref_Slickcolumn 
WHERE SLCOL_SL_UID = '3FA840B2-C2D0-49A7-0000-000000000000' 


-- de
-- fr
-- en
-- ru
-- ar
-- zh
-- pr
-- ja


SELECT * FROM T_COR_Ref_Slickcolumn 
WHERE (1=1) 

ORDER BY 
	 CASE WHEN SLCOL_SL_UID = '091089E7-B7EE-4CEB-9272-51E4954C15FF' THEN 0 ELSE 1 END 
	,SLCOL_SL_UID
	,SLCOL_Sort 


SELECT * FROM T_COR_Ref_Slickcolumn 
WHERE (1=1) -- AND SLCOL_LANG_DE = 'Bearbeiten' 
ORDER BY SLCOL_SL_UID, SLCOL_Sort 
