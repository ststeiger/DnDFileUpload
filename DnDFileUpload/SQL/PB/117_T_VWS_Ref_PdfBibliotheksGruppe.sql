
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe') AND type in (N'U')) 
BEGIN 
CREATE TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe 
( 
	 PBG_UID uniqueidentifier NOT NULL 
	,PBG_PBG_UID uniqueidentifier NULL 
	,PBG_Name national character varying(250) NULL 
	,PBG_Sort int NOT NULL 
	,PBG_Status int NOT NULL 
	,CONSTRAINT PK_T_VWS_Ref_PdfBibliotheksGruppe PRIMARY KEY( PBG_UID ) 
); 
END 


GO



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_UID') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe ADD CONSTRAINT DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_UID DEFAULT (NEWID()) FOR PBG_UID
END


GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_Sort') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe ADD CONSTRAINT DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_Sort DEFAULT ((0)) FOR PBG_Sort
END


GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_Status') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe ADD CONSTRAINT DF_T_VWS_Ref_PdfBibliotheksGruppe_PBG_Status DEFAULT ((1)) FOR PBG_Status
END


GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_T_VWS_Ref_PdfBibliotheksGruppe') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe')) 
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe WITH CHECK ADD CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_T_VWS_Ref_PdfBibliotheksGruppe FOREIGN KEY(PBG_PBG_UID) 
REFERENCES dbo.T_VWS_Ref_PdfBibliotheksGruppe (PBG_UID) 
;


GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_Ref_PdfBibliotheksGruppe_T_VWS_Ref_PdfBibliotheksGruppe') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_Ref_PdfBibliotheksGruppe'))
ALTER TABLE dbo.T_VWS_Ref_PdfBibliotheksGruppe CHECK CONSTRAINT FK_T_VWS_Ref_PdfBibliotheksGruppe_T_VWS_Ref_PdfBibliotheksGruppe
;


GO

