
SELECT 
	  BE_Language 
	 ,tLanguage.SYSLANG_LCID AS COR_LCID 
	 ,tAllLanguages.SYSLANG_LCID 
FROM T_Benutzer 

OUTER APPLY 
	(
		SELECT 
			CASE T_Benutzer.BE_Language  
				WHEN 'FR' THEN 4108 
				WHEN 'IT' THEN 2064 
				WHEN 'EN' THEN 1033 
				ELSE 2055 
			 END AS SYSLANG_LCID 
	) AS tLanguage 

OUTER APPLY 
	(
		SELECT 
			SYSLANG_LCID 
		FROM T_SYS_Language 
		WHERE T_SYS_Language.SYSLANG_CorUse = 1 
		AND T_SYS_Language.SYSLANG_TwoLetterISOLanguageName = T_Benutzer.BE_Language 
	) AS tAllLanguages 
