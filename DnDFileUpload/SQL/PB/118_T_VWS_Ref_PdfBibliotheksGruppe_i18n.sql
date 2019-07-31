
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n') AND type in (N'U'))
BEGIN 
CREATE TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n 
( 
	 PBG_i18n_PBG_UID uniqueidentifier NOT NULL 
	,PBG_i18n_SYSLANG_LCID int NOT NULL 
	,PBG_i18n_Name national character varying(4000) NULL 
	,CONSTRAINT PK_T_VWS_Ref_PdfBibliotheksGruppe_i18n PRIMARY KEY( PBG_i18n_PBG_UID, PBG_i18n_SYSLANG_LCID ) 
); 
END


GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_T_SYS_Language') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n'))
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n WITH CHECK ADD CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_T_SYS_Language FOREIGN KEY(PBG_i18n_SYSLANG_LCID)
REFERENCES dbo.T_SYS_Language (SYSLANG_LCID) 
; 


GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_T_SYS_Language') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n'))
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe_i18n CHECK CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_i18n_T_SYS_Language
;


GO

