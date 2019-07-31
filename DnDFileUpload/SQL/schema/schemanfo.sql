

SELECT 
	 BIB_UID
	,BIB_BIG_UID
	,BIG_Lang_DE
	-- ,BIG_Lang_FR
	-- ,BIG_Lang_IT
	-- ,BIG_Lang_EN
	 
	,BIB_Lang_DE
	-- ,BIB_Lang_FR
	-- ,BIB_Lang_IT
	-- ,BIB_Lang_EN

	-- SELECT OBJT_UID, OBJT_Code, OBJT_Lang_DE FROM T_OV_Ref_ObjektTyp 
	,BIB_OBJT_UID 
	-- T_COR_Objekte.OBJ_OBJK_UID
	-- ,OBJ_OBJK_UID AS ( COALESCE(OBJ_GB_GK_UID, OBJ_GS_GST_UID, OBJ_RM_NA_UID, OBJ_AL_AK_UID, OBJ_AO_AOKAT_UID, OBJ_AP_APK_UID, OBJ_KM_KMKAT_UID, OBJ_KU_KKAT_UID, OBJ_MO_MKAT_UID, OBJ_PP_PK_UID, OBJ_TR_TT_UID, OBJ_ZYL_ZKAT_UID, OBJ_DO_DKAT_UID, OBJ_IN_IKAT_UID, OBJ_SH_SKAT_UID, OBJ_ZN_ZKAT_UID, OBJ_SLG_SKAT_UID) ) 
	
	-- ,BIB_OBJK_UID
	-- ,BIB_OBJL_UID

	--,BIB_MDT_UID
	,BIB_SVG
	--,BIB_widthInMeter
	--,BIB_heightInMeter
	,BIB_Sort
	,BIB_Status      
FROM T_VWS_Ref_Bibliothek

LEFT JOIN T_VWS_Ref_BibliothekGruppe  
	ON T_VWS_Ref_BibliothekGruppe.BIG_UID = T_VWS_Ref_Bibliothek.BIB_BIG_UID 


SELECT 
	 BIG_UID
	,BIG_BIG_UID
	,BIG_Lang_DE
	,BIG_Lang_FR
	,BIG_Lang_IT
	,BIG_Lang_EN
	,BIG_Sort
	,BIG_Status
FROM T_VWS_Ref_BibliothekGruppe 




DECLARE @lang_id int 
SET @lang_id = (
	SELECT SYSLANG_LCID 
	FROM T_Benutzer 
	INNER JOIN T_SYS_Language  
		ON T_Benutzer.BE_ID = 12435
		AND T_SYS_Language.SYSLANG_CorUse = 1 
		AND T_SYS_Language.SYSLANG_TwoLetterISOLanguageName = T_Benutzer.BE_Language 
);


/*
SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME LIKE '%biblio%' 

SELECT * FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME LIKE '%BIG_UID%' 
*/


SELECT 
	 kanton
	,gemeinde
	,from_50000
	,from_60000
	,from_70000
	,from_80000
	,from_90000
	,from_100000
	,from_125000
	,from_150000
	,from_175000
	,from_200000

	--,RL_Dauer
FROM TestDb.dbo.__Steuern_2017

LEFT JOIN TestDb.dbo.__Steuern_2017_ZO_Rail 
	ON RL_GemeindeNummer = gemeindenummer
	-- AND RL_Ort = 'Zürich HB'
	AND RL_Ort = 'Erlen'
	-- AND RL_Ort = 'Basel SBB' 
	-- AND RL_Ort = 'Winterthur'

WHERE (1=1) 
-- AND kanton = 'TG'
AND RL_Dauer < 1.5



INTERSECT  



SELECT 
	 kanton
	,gemeinde
	,from_50000
	,from_60000
	,from_70000
	,from_80000
	,from_90000
	,from_100000
	,from_125000
	,from_150000
	,from_175000
	,from_200000
	 
	--,RL_Dauer
FROM TestDb.dbo.__Steuern_2017

LEFT JOIN TestDb.dbo.__Steuern_2017_ZO_Rail 
	ON RL_GemeindeNummer = gemeindenummer
	AND RL_Ort = 'Zürich HB'
	-- AND RL_Ort = 'Erlen'
	-- AND RL_Ort = 'Basel SBB' 
	-- AND RL_Ort = 'Winterthur'

WHERE (1=1) 
AND RL_Dauer < 1


-- SELECT  * FROM __Steuern_2017_ZO_Rail WHERE RL_Ort NOT IN ('Erlen', 'St. Gallen HB', 'Zürich HB', 'Basel SBB', 'Winterthur')




SELECT 
	 kanton
	,gemeinde
	,from_50000
	,from_60000
	,from_70000
	,from_80000
	,from_90000
	,from_100000
	,from_125000
	,from_150000
	,from_175000
	,from_200000

	,RailErlen.RL_Dauer AS ToErlen 
	,RailZH.RL_Dauer AS ToZH 
FROM TestDb.dbo.__Steuern_2017

INNER JOIN TestDb.dbo.__Steuern_2017_ZO_Rail AS RailErlen
	ON RailErlen.RL_GemeindeNummer = gemeindenummer
	AND RailErlen.RL_Dauer < 2
	AND RailErlen.RL_Ort = 'Erlen'
	-- AND RailErlen.RL_Ort = 'Zürich HB'
	-- AND RailErlen.RL_Ort = 'Basel SBB' 
	-- AND RailErlen.RL_Ort = 'Winterthur'
	

INNER JOIN TestDb.dbo.__Steuern_2017_ZO_Rail AS RailZH
	ON RailZH.RL_GemeindeNummer = gemeindenummer
	AND RailZH.RL_Dauer < 0.5
	AND RailZH.RL_Ort = 'Zürich HB'
	-- AND RailZH.RL_Ort = 'Erlen'
	-- AND RailZH.RL_Ort = 'Basel SBB' 
	-- AND RailZH.RL_Ort = 'Winterthur'
	
WHERE (1=1) 
-- AND kanton = 'TG'


