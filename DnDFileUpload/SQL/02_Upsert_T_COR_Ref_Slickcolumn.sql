
DELETE FROM T_COR_Ref_Slickcolumn WHERE T_COR_Ref_Slickcolumn.SLCOL_SL_UID = '091089E7-B7EE-4CEB-9272-51E4954C15FF'; 


;WITH CTE AS 
( 
	SELECT 
		 '8394B346-07CF-409F-A15A-A46213E6582C' AS SLCOL_UID 
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID 
		,NULL AS SLCOL_MOD_UID 
		 
		,'Bearbeiten' AS SLCOL_LANG_DE 
		,'Edit' AS SLCOL_LANG_EN 
		,'Modifier' AS SLCOL_LANG_FR 
		,'Modifica' AS SLCOL_LANG_IT 
		 
		,10 AS SLCOL_Sort 
		,1 AS SLCOL_Status 
		,NULL AS SLCOL_asyncPostRender 
		,NULL AS SLCOL_backgroundcolorfield 
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'id' AS SLCOL_field
		,NULL AS SLCOL_footer
		,'_.Slicklist.Formatter.Edit' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,NULL AS SLCOL_minWidth
		,10 AS SLCOL_maxWidth
		,'id' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,40 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 
		 

	UNION ALL 


	SELECT 
		 '375412C1-3DDD-48A8-B1A6-30AD3954598F' AS SLCOL_UID
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID
		,NULL AS SLCOL_MOD_UID
		,'Kategorie' AS SLCOL_LANG_DE
		,'Kategorie' AS SLCOL_LANG_EN
		,'Kategorie' AS SLCOL_LANG_FR
		,'Kategorie' AS SLCOL_LANG_IT
		,20 AS SLCOL_Sort
		,1 AS SLCOL_Status
		,NULL AS SLCOL_asyncPostRender
		,NULL AS SLCOL_backgroundcolorfield
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'PBG_Name' AS SLCOL_field
		,NULL AS SLCOL_footer
		,'' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,NULL AS SLCOL_minWidth
		,NULL AS SLCOL_maxWidth
		,'PBG_Name' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,100 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 


	UNION ALL 


	SELECT 
		 '43F59912-5D9C-406B-ABF0-A10F52ED5DAF' AS SLCOL_UID
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID
		,NULL AS SLCOL_MOD_UID
		,'Bezeichnung' AS SLCOL_LANG_DE
		,'Bezeichnung' AS SLCOL_LANG_EN
		,'Bezeichnung' AS SLCOL_LANG_FR
		,'Bezeichnung' AS SLCOL_LANG_IT
		,30 AS SLCOL_Sort
		,1 AS SLCOL_Status
		,NULL AS SLCOL_asyncPostRender
		,NULL AS SLCOL_backgroundcolorfield
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'PB_Text' AS SLCOL_field
		,NULL AS SLCOL_footer
		,'' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,NULL AS SLCOL_minWidth
		,NULL AS SLCOL_maxWidth
		,'PB_Text' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,100 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 
		 
		 
	UNION ALL 
	

	SELECT 
		 '695BABBD-23EB-4F35-90FC-F76E66F60B25' AS SLCOL_UID
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID
		,NULL AS SLCOL_MOD_UID
		,'Upload' AS SLCOL_LANG_DE
		,'Upload' AS SLCOL_LANG_EN
		,'Upload' AS SLCOL_LANG_FR
		,'Upload' AS SLCOL_LANG_IT
		,40 AS SLCOL_Sort
		,1 AS SLCOL_Status
		,NULL AS SLCOL_asyncPostRender
		,NULL AS SLCOL_backgroundcolorfield
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		-- ,'' AS SLCOL_cssClass

		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'upload_id' AS SLCOL_field
		,NULL AS SLCOL_footer
		-- ,'' AS SLCOL_formatter
		,'_.Slicklist.Formatter.Upload' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,NULL AS SLCOL_minWidth
		,20 AS SLCOL_maxWidth
		,'upload_id' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,100 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 


	UNION ALL 


	SELECT 
		 '848B62E8-DB59-43F5-ADBE-1CB8B253F175' AS SLCOL_UID
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID
		,NULL AS SLCOL_MOD_UID
		,'Download' AS SLCOL_LANG_DE
		,'Download' AS SLCOL_LANG_EN
		,'Download' AS SLCOL_LANG_FR
		,'Download' AS SLCOL_LANG_IT
		,50 AS SLCOL_Sort
		,1 AS SLCOL_Status
		,NULL AS SLCOL_asyncPostRender
		,NULL AS SLCOL_backgroundcolorfield
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'PB_UID' AS SLCOL_field
		,NULL AS SLCOL_footer
		-- ,'' AS SLCOL_formatter
		,'_.Slicklist.Formatter.Download' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,NULL AS SLCOL_minWidth
		,20 AS SLCOL_maxWidth
		,'downloadlink' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,100 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 
		 
		 
	UNION ALL 


	SELECT 
		 '25B11A54-0C73-482F-9E11-80487AE6338F' AS SLCOL_UID
		,'091089E7-B7EE-4CEB-9272-51E4954C15FF' AS SLCOL_SL_UID 
		,NULL AS SLCOL_MOD_UID 
		,'Löschen' AS SLCOL_LANG_DE 
		,'Delete' AS SLCOL_LANG_EN 
		,'Effacer' AS SLCOL_LANG_FR 
		,'Elimina' AS SLCOL_LANG_IT 
		 
		-- ,'Entfernen' AS SLCOL_LANG_DE 
		-- ,'Remove' AS SLCOL_LANG_EN 
		-- ,'Enlever' AS SLCOL_LANG_FR 
		-- ,'Rimuove' AS SLCOL_LANG_IT 
		 
		,60 AS SLCOL_Sort
		,1 AS SLCOL_Status
		,NULL AS SLCOL_asyncPostRender
		,NULL AS SLCOL_backgroundcolorfield
		,NULL AS SLCOL_cannotTriggerInsert
		,NULL AS SLCOL_colorfield
		,NULL AS SLCOL_cssClass
		,NULL AS SLCOL_displayfield
		,NULL AS SLCOL_editor
		,'PB_UID' AS SLCOL_field
		,NULL AS SLCOL_footer
		,'_.Slicklist.Formatter.Remove' AS SLCOL_formatter
		,NULL AS SLCOL_headerCssClass
		,50 AS SLCOL_minWidth
		,50 AS SLCOL_maxWidth
		,'PB_UID' AS SLCOL_name
		,NULL AS SLCOL_referenceTablename
		,NULL AS SLCOL_required
		,NULL AS SLCOL_requiredFieldRead
		,NULL AS SLCOL_requiredFieldWrite
		,NULL AS SLCOL_rerenderOnResize
		,1 AS SLCOL_resizable
		,1 AS SLCOL_show
		,1 AS SLCOL_showInHeaderRow
		,1 AS SLCOL_sortable 
		--,'_.Slicklist.Sorter.Date' AS SLCOL_sorter
		,NULL AS SLCOL_sorter 
		,NULL AS SLCOL_tooltip
		,NULL AS SLCOL_unselectable
		,40 AS SLCOL_width 
		,1 AS SLCOL_includeInExport 
		,NULL AS SLCOL_export 
		,NULL AS SLCOL_referenceSQL 
		,NULL AS SLCOL_LANG_UID 
		,0 AS SLCOL_multiple 
)

MERGE INTO T_COR_Ref_Slickcolumn AS A 
USING CTE ON CTE.SLCOL_UID = A.SLCOL_UID 
WHEN MATCHED 
	THEN UPDATE
		SET  A.SLCOL_SL_UID = CTE.SLCOL_SL_UID
			,A.SLCOL_MOD_UID = CTE.SLCOL_MOD_UID
			,A.SLCOL_LANG_DE = CTE.SLCOL_LANG_DE
			,A.SLCOL_LANG_EN = CTE.SLCOL_LANG_EN
			,A.SLCOL_LANG_FR = CTE.SLCOL_LANG_FR
			,A.SLCOL_LANG_IT = CTE.SLCOL_LANG_IT
			,A.SLCOL_Sort = CTE.SLCOL_Sort
			,A.SLCOL_Status = CTE.SLCOL_Status
			,A.SLCOL_asyncPostRender = CTE.SLCOL_asyncPostRender
			,A.SLCOL_backgroundcolorfield = CTE.SLCOL_backgroundcolorfield
			,A.SLCOL_cannotTriggerInsert = CTE.SLCOL_cannotTriggerInsert
			,A.SLCOL_colorfield = CTE.SLCOL_colorfield
			,A.SLCOL_cssClass = CTE.SLCOL_cssClass
			,A.SLCOL_displayfield = CTE.SLCOL_displayfield
			,A.SLCOL_editor = CTE.SLCOL_editor
			,A.SLCOL_field = CTE.SLCOL_field
			,A.SLCOL_footer = CTE.SLCOL_footer
			,A.SLCOL_formatter = CTE.SLCOL_formatter
			,A.SLCOL_headerCssClass = CTE.SLCOL_headerCssClass
			,A.SLCOL_minWidth = CTE.SLCOL_minWidth
			,A.SLCOL_maxWidth = CTE.SLCOL_maxWidth
			,A.SLCOL_name = CTE.SLCOL_name
			,A.SLCOL_referenceTablename = CTE.SLCOL_referenceTablename
			,A.SLCOL_required = CTE.SLCOL_required
			,A.SLCOL_requiredFieldRead = CTE.SLCOL_requiredFieldRead
			,A.SLCOL_requiredFieldWrite = CTE.SLCOL_requiredFieldWrite
			,A.SLCOL_rerenderOnResize = CTE.SLCOL_rerenderOnResize
			,A.SLCOL_resizable = CTE.SLCOL_resizable
			,A.SLCOL_show = CTE.SLCOL_show
			,A.SLCOL_showInHeaderRow = CTE.SLCOL_showInHeaderRow
			,A.SLCOL_sortable = CTE.SLCOL_sortable
			,A.SLCOL_sorter = CTE.SLCOL_sorter
			,A.SLCOL_tooltip = CTE.SLCOL_tooltip
			,A.SLCOL_unselectable = CTE.SLCOL_unselectable
			,A.SLCOL_width = CTE.SLCOL_width
			,A.SLCOL_includeInExport = CTE.SLCOL_includeInExport
			,A.SLCOL_export = CTE.SLCOL_export
			,A.SLCOL_referenceSQL = CTE.SLCOL_referenceSQL
			,A.SLCOL_LANG_UID = CTE.SLCOL_LANG_UID
			,A.SLCOL_multiple = CTE.SLCOL_multiple



WHEN NOT MATCHED THEN 
INSERT 
( 
	 SLCOL_UID
	,SLCOL_SL_UID
	,SLCOL_MOD_UID
	,SLCOL_LANG_DE
	,SLCOL_LANG_EN
	,SLCOL_LANG_FR
	,SLCOL_LANG_IT
	,SLCOL_Sort
	,SLCOL_Status
	,SLCOL_asyncPostRender
	,SLCOL_backgroundcolorfield
	,SLCOL_cannotTriggerInsert
	,SLCOL_colorfield
	,SLCOL_cssClass
	,SLCOL_displayfield
	,SLCOL_editor
	,SLCOL_field
	,SLCOL_footer
	,SLCOL_formatter
	,SLCOL_headerCssClass
	,SLCOL_minWidth
	,SLCOL_maxWidth
	,SLCOL_name
	,SLCOL_referenceTablename
	,SLCOL_required
	,SLCOL_requiredFieldRead
	,SLCOL_requiredFieldWrite
	,SLCOL_rerenderOnResize
	,SLCOL_resizable
	,SLCOL_show
	,SLCOL_showInHeaderRow
	,SLCOL_sortable
	,SLCOL_sorter
	,SLCOL_tooltip
	,SLCOL_unselectable
	,SLCOL_width
	,SLCOL_includeInExport
	,SLCOL_export
	,SLCOL_referenceSQL
	,SLCOL_LANG_UID
	,SLCOL_multiple 
)
VALUES
(
	 CTE.SLCOL_UID
	,CTE.SLCOL_SL_UID
	,CTE.SLCOL_MOD_UID
	,CTE.SLCOL_LANG_DE
	,CTE.SLCOL_LANG_EN
	,CTE.SLCOL_LANG_FR
	,CTE.SLCOL_LANG_IT
	,CTE.SLCOL_Sort
	,CTE.SLCOL_Status
	,CTE.SLCOL_asyncPostRender
	,CTE.SLCOL_backgroundcolorfield
	,CTE.SLCOL_cannotTriggerInsert
	,CTE.SLCOL_colorfield
	,CTE.SLCOL_cssClass
	,CTE.SLCOL_displayfield
	,CTE.SLCOL_editor
	,CTE.SLCOL_field
	,CTE.SLCOL_footer
	,CTE.SLCOL_formatter
	,CTE.SLCOL_headerCssClass
	,CTE.SLCOL_minWidth
	,CTE.SLCOL_maxWidth
	,CTE.SLCOL_name
	,CTE.SLCOL_referenceTablename
	,CTE.SLCOL_required
	,CTE.SLCOL_requiredFieldRead
	,CTE.SLCOL_requiredFieldWrite
	,CTE.SLCOL_rerenderOnResize
	,CTE.SLCOL_resizable
	,CTE.SLCOL_show
	,CTE.SLCOL_showInHeaderRow
	,CTE.SLCOL_sortable
	,CTE.SLCOL_sorter
	,CTE.SLCOL_tooltip
	,CTE.SLCOL_unselectable
	,CTE.SLCOL_width
	,CTE.SLCOL_includeInExport
	,CTE.SLCOL_export
	,CTE.SLCOL_referenceSQL
	,CTE.SLCOL_LANG_UID
	,CTE.SLCOL_multiple 
);

-- SELECT * FROM T_COR_Ref_Slickcolumn WHERE SLCOL_UID = '091089E7-B7EE-4CEB-9272-51E4954C15FF'




--REM: Einheitlich
update [T_COR_Ref_Slickcolumn] 
set [SLCOL_width] = 40, [SLCOL_maxWidth] = null, [SLCOL_minWidth] = null, [SLCOL_resizable] = 0 where [SLCOL_UID] in ('992197A5-628D-4121-91D6-39AB06AC4F47', '6C3F51D4-61C8-496C-B700-F3FD706B941C', 'BC0996ED-55FD-42CE-9B9E-9714EB7E7FBE');

--REM: Diese Spalten können direkt in der Übersicht bearbeitet werden
update [T_COR_Ref_Slickcolumn] set [SLCOL_editor] = '_.Slicklist.Editor.Text', [SLCOL_required] = 1 where [SLCOL_UID] = '11D3AAD7-5C17-4623-AA99-A903473C9FBE';
update [T_COR_Ref_Slickcolumn] set [SLCOL_editor] = '_.Slicklist.Editor.Select', [SLCOL_cannotTriggerInsert] = 1 where [SLCOL_UID] = 'F51CF7D8-82C6-4B6F-A06F-3952F12F5AD3';

--REM: Referenz_Katalog für die Spalte "Kategorie"
update
	[T_COR_Ref_Slickcolumn]
set
	[SLCOL_field] = 'PBG_UID',
	[SLCOL_displayfield] = 'PBG_Name',
	[SLCOL_referenceTablename] = 'T_VWS_Ref_PdfBibliotheksGruppe',
	[SLCOL_referenceSQL] = '~\Modules\Visualiser\sql\BO_VWS_PB_PBG_Filter.sql'
where
	(
		[SLCOL_UID] = 'F51CF7D8-82C6-4B6F-A06F-3952F12F5AD3'
	);

--REM: Pflichtfelder
update [T_COR_Ref_Slickcolumn] set [SLCOL_required] = 1 where [SLCOL_UID] = '11D3AAD7-5C17-4623-AA99-A903473C9FBE';

--REM: Duch diese Spalten können keine neuen Einträge erstellt werden
update [T_COR_Ref_Slickcolumn] set [SLCOL_cannotTriggerInsert] = 1 where [SLCOL_UID] = 'F51CF7D8-82C6-4B6F-A06F-3952F12F5AD3';


--REM: Für das Hochladen von SVG
update [T_COR_Ref_Slickcolumn] set [SLCOL_field] = 'PB_SVG' where [SLCOL_UID] = '992197A5-628D-4121-91D6-39AB06AC4F47';

--REM: Für das Herunterladen von SVG
update [T_COR_Ref_Slickcolumn] set [SLCOL_field] = 'PB_SVG_Download', [SLCOL_formatter] = '_.Slicklist.Formatter.Download' where [SLCOL_UID] = '6C3F51D4-61C8-496C-B700-F3FD706B941C';
