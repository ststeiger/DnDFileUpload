
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust') AND type in (N'U'))
BEGIN
CREATE TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust
( 
	 PBG_i18n_Cust_PBG_UID uniqueidentifier NOT NULL 
	,PBG_i18n_Cust_SYSLANG_LCID int NOT NULL 
	,PBG_i18n_Cust_Name national character varying(4000) NULL 
	,CONSTRAINT PK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust PRIMARY KEY( PBG_i18n_Cust_PBG_UID, PBG_i18n_Cust_SYSLANG_LCID ) 
); 
END 


GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust_T_SYS_Language') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust'))
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust WITH CHECK ADD CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust_T_SYS_Language FOREIGN KEY(PBG_i18n_Cust_SYSLANG_LCID) 
REFERENCES dbo.T_SYS_Language (SYSLANG_LCID) 
;


GO



IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust_T_SYS_Language') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust')) 
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust CHECK CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_Cust_T_SYS_Language 
;


GO

