
-- DECLARE @BE_ID int 
-- DECLARE @regID nvarchar(36) 
-- DECLARE @isBackoffice nvarchar(4) 

-- SET @BE_ID=12435 
-- SET @regID=N'77c6ba09-e9e2-4f2f-9102-2fe80b1e9b46' 
-- SET @isBackoffice=N'true' 


SELECT 
	 T_VWS_PdfBibliothek.PB_UID AS id 
	,NEWID() AS upload_id 
	,T_VWS_PdfBibliothek.PB_UID 
	-- ,T_VWS_PdfBibliothek.PB_PBG_UID 
	 
	,
	 COALESCE
	 ( 
		 T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust.PBG_i18n_Cust_Name 
		,T_VWS_Ref_PdfBibliotheksGruppe_i18n.PBG_i18n_Name 
		,T_VWS_Ref_PdfBibliotheksGruppe.PBG_Name 
	 ) AS PBG_Name 
	,T_VWS_Ref_PdfBibliotheksGruppe.PBG_Sort 
	 
	,T_VWS_PdfBibliothek.PB_Text 
	,T_VWS_PdfBibliothek.PB_Sort 
	,T_VWS_PdfBibliothek.PB_SVG 
	 
FROM T_VWS_PdfBibliothek 

-- INNER JOIN T_SYS_Language 
INNER JOIN T_Benutzer 
	ON T_Benutzer.BE_ID = 12435 
	-- ON T_SYS_Language.SYSLANG_CorUse = 1 
	-- AND T_SYS_Language.SYSLANG_TwoLetterISOLanguageName = T_Benutzer.BE_Language 
	
LEFT JOIN T_VWS_Ref_PdfBibliotheksGruppe 
	ON T_VWS_Ref_PdfBibliotheksGruppe.PBG_UID = T_VWS_PdfBibliothek.PB_PBG_UID 
	AND T_VWS_Ref_PdfBibliotheksGruppe.PBG_Status = 1 

LEFT JOIN T_VWS_Ref_PdfBibliotheksGruppe_i18n 
	ON T_VWS_Ref_PdfBibliotheksGruppe_i18n.PBG_i18n_PBG_UID = T_VWS_PdfBibliothek.PB_PBG_UID 
	AND T_VWS_Ref_PdfBibliotheksGruppe_i18n.PBG_i18n_SYSLANG_LCID = T_Benutzer._BE_LCID 

LEFT JOIN T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust 
	ON T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust.PBG_i18n_Cust_PBG_UID = T_VWS_PdfBibliothek.PB_PBG_UID 
	AND T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust.PBG_i18n_Cust_SYSLANG_LCID = T_Benutzer._BE_LCID 

WHERE (1=1) 
AND T_VWS_PdfBibliothek.PB_Status = 1 

ORDER BY 
	 PBG_Name 
	,PB_Text 
	 