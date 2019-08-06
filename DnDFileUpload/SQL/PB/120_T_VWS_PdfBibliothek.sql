
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.T_VWS_PdfBibliothek') AND type in (N'U'))
BEGIN
CREATE TABLE dbo.T_VWS_PdfBibliothek 
( 
	 PB_UID uniqueidentifier NOT NULL 
	,PB_MDT_UID uniqueidentifier NULL 
	,PB_PBG_UID uniqueidentifier NULL 
	,PB_Text national character varying(250) NULL 
	,PB_Renderer national character varying(250) NULL 
	,PB_SVG xml NULL 
	,PB_Sort int NOT NULL 
	,PB_Status int NOT NULL 
	,PRIMARY KEY( PB_UID ) 
); 
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_PdfBibliothek_PB_UID') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_PdfBibliothek ADD CONSTRAINT DF_T_VWS_PdfBibliothek_PB_UID DEFAULT (NEWID()) FOR PB_UID
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_PdfBibliothek_PB_Sort') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_PdfBibliothek ADD CONSTRAINT DF_T_VWS_PdfBibliothek_PB_Sort DEFAULT ((0)) FOR PB_Sort
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF_T_VWS_PdfBibliothek_PB_Status') AND type = 'D')
BEGIN
ALTER TABLE dbo.T_VWS_PdfBibliothek ADD CONSTRAINT DF_T_VWS_PdfBibliothek_PB_Status DEFAULT ((1)) FOR PB_Status
END
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_PdfBibliothek_T_SYS_Ref_Mandant') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_PdfBibliothek'))
ALTER TABLE dbo.T_VWS_PdfBibliothek  WITH CHECK ADD  CONSTRAINT FK_T_VWS_PdfBibliothek_T_SYS_Ref_Mandant FOREIGN KEY(PB_MDT_UID)
REFERENCES dbo.T_SYS_Ref_Mandant (MDT_UID)
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_PdfBibliothek_T_SYS_Ref_Mandant') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_PdfBibliothek'))
ALTER TABLE dbo.T_VWS_PdfBibliothek CHECK CONSTRAINT FK_T_VWS_PdfBibliothek_T_SYS_Ref_Mandant
GO


IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_PdfBibliothek_T_VWS_Ref_PdfBibliotheksGruppe') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_PdfBibliothek'))
ALTER TABLE dbo.T_VWS_PdfBibliothek  WITH CHECK ADD CONSTRAINT FK_T_VWS_PdfBibliothek_T_VWS_Ref_PdfBibliotheksGruppe FOREIGN KEY(PB_PBG_UID) 
REFERENCES dbo.T_VWS_Ref_PdfBibliotheksGruppe (PBG_UID)
ON DELETE SET NULL
GO


IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'dbo.FK_T_VWS_PdfBibliothek_T_VWS_Ref_PdfBibliotheksGruppe') AND parent_object_id = OBJECT_ID(N'dbo.T_VWS_PdfBibliothek'))
ALTER TABLE dbo.T_VWS_PdfBibliothek CHECK CONSTRAINT FK_T_VWS_PdfBibliothek_T_VWS_Ref_PdfBibliotheksGruppe
GO
