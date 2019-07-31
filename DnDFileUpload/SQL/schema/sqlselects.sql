
SELECT 
	 PB_UID 
	,PB_MDT_UID 
	,PB_PBG_UID 
	,PB_Text 
	,PB_SVG -- fr, it, en 
	,PB_Sort 
	,PB_Status 
FROM T_VWS_PdfBibliothek 


-- "PL_Type": "text", "image", "legend", "rectangle", 
-- "PL_Format": "plain", "date",  "html", null, 
-- "PL_AspectRatio": "xMinYMin meet", 
-- "PL_Text": `dd'-'MMM'-'yyyy`, 
-- "PL_Text": isSwissRe ? `{@LC_Lang_en} - {@PR_Name} - {@FloorDisplayString} - {@Darstellung}` : `{@Heute} - {@SO_Nr} {@SO_Bezeichnung} - {@GB_Nr} {@GB_Bezeichnung} - {@PLZ} - {@Ort} - {@GS_Display_Kurz} - {@GS_Display_Lang} - {@Darstellung} - {@Vorname} - {@Nachname} - {@Benutzer}`, 
-- "PL_DataBind": isSwissRe ? "tfu_VWS_PDF_LegendeTitelDaten_SwissRe" : "tfu_VWS_PDF_LegendeTitelDaten", 



SELECT 
	 PBG_UID
	,PBG_PBG_UID
	,PBG_Name
	,PBG_Sort
	,PBG_Status
FROM T_VWS_Ref_PdfBibliotheksGruppe 


SELECT 
	 PLK_UID
	,PLK_Code
	,PLK_PS_UID
	,PLK_DAR_UID
	,PLK_Name_DE
	,PLK_Name_FR
	,PLK_Name_IT
	,PLK_Name_EN
	,PLK_IsDefault
	,PLK_Status
FROM T_VWS_Ref_PdfLegendenKategorie


SELECT 
	 PL_UID
	,PL_PLK_UID
	,PL_Type
	,PL_Format
	,PL_X
	,PL_Y
	,PL_W
	,PL_H
	,PL_Angle
	,PL_AspectRatio
	,PL_AlignH
	,PL_AlignV
	,PL_Text_DE
	,PL_Text_FR
	,PL_Text_IT
	,PL_Text_EN
	,PL_Outline
	,PL_Style
	,PL_DataBind
	,PL_Sort
	,PL_Status
FROM T_VWS_PdfLegende
