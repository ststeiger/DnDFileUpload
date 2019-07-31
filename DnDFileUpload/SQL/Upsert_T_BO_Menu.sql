
;WITH CTE AS 
( 
	SELECT 
		  N'77C6BA09-E9E2-4F2F-9102-2FE80B1E9B46' AS ME_UID 
		, N'f25fe5e3-78f0-4dc8-86dc-e1f983ecb6a6' AS ME_ME_UID 
		, 35667 AS ME_Code 
		, N'SVG-Bibliothek PDF' AS ME_Text_de 
		, N'SVG-Bibliothèque PDF' AS ME_Text_fr 
		, N'SVG-Libreria PDF' AS ME_Text_it
		, N'SVG-Library PDF' AS ME_Text_en 
		, 0 AS ME_IsCorBereich 
		, N'ZZZZZ' AS ME_Tabelle 
		, N'FOOBAR' AS ME_FeldPrfx 
		, N'~/Backoffice/Visualisierung/legende_swissre_A0.htm' AS ME_Page 
		, 1 AS ME_Status 
		, 0 AS ME_Sort 
		, 1 AS ME_IsShowInMenu
		, 0 AS ME_CanAdd 
		, 0 AS ME_CS_IsVisible 
		, N'' AS ME_CS_Titel_de 
		, N'' AS ME_CS_Titel_fr 
		, N'' AS ME_CS_Titel_it 
		, N'' AS ME_CS_Titel_en 
		, 0 AS ME_CS_Width 
		, N'' AS ME_CS_Align 
		, 0 AS ME_KS_IsVisible 
		, N'' AS ME_KS_Titel_de
		, N'' AS ME_KS_Titel_fr
		, N'' AS ME_KS_Titel_it
		, N'' AS ME_KS_Titel_en
		, 0 AS ME_KS_Width 
		, N'' AS ME_KS_Align 
		, N'' AS ME_HS_Titel_de 
		, N'' AS ME_HS_Titel_fr
		, N'' AS ME_HS_Titel_it
		, N'' AS ME_HS_Titel_en
		, 0 AS ME_R1_HasReferenz 
		, N'' AS ME_R1_Tabelle 
		, N'' AS ME_R1_FeldPrfx 
		, N'' AS ME_R1_FeldKey 
		, N'' AS ME_R1_Titel_de 
		, N'' AS ME_R1_Titel_fr 
		, N'' AS ME_R1_Titel_it 
		, N'' AS ME_R1_Titel_en 
		, 0 AS ME_R2_HasReferenz 
		, N'' AS ME_R2_Tabelle 
		, N'' AS ME_R2_FeldPrfx 
		, N'' AS ME_R2_FeldKey 
		, N'' AS ME_R2_Titel_de 
		, N'' AS ME_R2_Titel_fr 
		, N'' AS ME_R2_Titel_it 
		, N'' AS ME_R2_Titel_en 
		, 0 AS ME_R2_IsRefTo1 
		, 0 AS ME_Code_IsVisible 
		, 0 AS ME_Code_IsRequired 
		, N'integer' AS ME_Code_Datentyp 
		, N'' AS ME_Code_Anzeige_de 
		, N'' AS ME_Code_Anzeige_fr 
		, N'' AS ME_Code_Anzeige_it 
		, N'' AS ME_Code_Anzeige_en 
		, 0 AS ME_KurzDE_IsVisible 
		, 0 AS ME_KurzDE_IsRequired 
		, N'' AS ME_KurzDE_Anzeige_de 
		, N'' AS ME_KurzDE_Anzeige_fr 
		, N'' AS ME_KurzDE_Anzeige_it 
		, N'' AS ME_KurzDE_Anzeige_en 
		, 0 AS ME_KurzFR_IsSameDE 
		, 0 AS ME_KurzFR_IsVisible 
		, 0 AS ME_KurzFR_IsRequired 
		, N'' AS ME_KurzFR_Anzeige_de 
		, N'' AS ME_KurzFR_Anzeige_fr 
		, N'' AS ME_KurzFR_Anzeige_it 
		, N'' AS ME_KurzFR_Anzeige_en 
		, 0 AS ME_KurzIT_IsSameDE 
		, 0 AS ME_KurzIT_IsVisible 
		, 0 AS ME_KurzIT_IsRequired 
		, N'' AS ME_KurzIT_Anzeige_de 
		, N'' AS ME_KurzIT_Anzeige_fr 
		, N'' AS ME_KurzIT_Anzeige_it 
		, N'' AS ME_KurzIT_Anzeige_en 
		, 0 AS ME_KurzEN_IsSameDE 
		, 0 AS ME_KurzEN_IsVisible 
		, 0 AS ME_KurzEN_IsRequired 
		, N'' AS ME_KurzEN_Anzeige_de 
		, N'' AS ME_KurzEN_Anzeige_fr 
		, N'' AS ME_KurzEN_Anzeige_it 
		, N'' AS ME_KurzEN_Anzeige_en 
		, 1 AS ME_LangDE_IsVisible 
		, N'' AS ME_LangDE_Anzeige_de 
		, N'' AS ME_LangDE_Anzeige_fr 
		, N'' AS ME_LangDE_Anzeige_it 
		, N'' AS ME_LangDE_Anzeige_en 
		, 1 AS ME_LangFR_IsVisible 
		, N'' AS ME_LangFR_Anzeige_de 
		, N'' AS ME_LangFR_Anzeige_fr 
		, N'' AS ME_LangFR_Anzeige_it 
		, N'' AS ME_LangFR_Anzeige_en 
		, 1 AS ME_LangIT_IsVisible 
		, N'' AS ME_LangIT_Anzeige_de 
		, N'' AS ME_LangIT_Anzeige_fr 
		, N'' AS ME_LangIT_Anzeige_it 
		, N'' AS ME_LangIT_Anzeige_en 
		, 1 AS ME_LangEN_IsVisible 
		, N'' AS ME_LangEN_Anzeige_de 
		, N'' AS ME_LangEN_Anzeige_fr 
		, N'' AS ME_LangEN_Anzeige_it 
		, N'' AS ME_LangEN_Anzeige_en 
		, N'' AS ME_NurMandant 
		, N'fdf86595-0500-4b9c-a8da-47376885fbf7' AS ME_MOD_UID 
		, 0 AS ME_EnableDelete 
		, NULL AS ME_SL_UID 
)

MERGE INTO T_BO_Menu AS A 
USING CTE ON CTE.ME_UID = A.ME_UID 
WHEN MATCHED 
	THEN UPDATE
		SET  A.ME_ME_UID = CTE.ME_ME_UID
			,A.ME_Code = CTE.ME_Code
			,A.ME_Text_de = CTE.ME_Text_de
			,A.ME_Text_fr = CTE.ME_Text_fr
			,A.ME_Text_it = CTE.ME_Text_it
			,A.ME_Text_en = CTE.ME_Text_en
			,A.ME_IsCorBereich = CTE.ME_IsCorBereich
			,A.ME_Tabelle = CTE.ME_Tabelle
			,A.ME_FeldPrfx = CTE.ME_FeldPrfx
			,A.ME_Page = CTE.ME_Page
			,A.ME_Status = CTE.ME_Status
			,A.ME_Sort = CTE.ME_Sort
			,A.ME_IsShowInMenu = CTE.ME_IsShowInMenu
			,A.ME_CanAdd = CTE.ME_CanAdd
			,A.ME_CS_IsVisible = CTE.ME_CS_IsVisible
			,A.ME_CS_Titel_de = CTE.ME_CS_Titel_de
			,A.ME_CS_Titel_fr = CTE.ME_CS_Titel_fr
			,A.ME_CS_Titel_it = CTE.ME_CS_Titel_it
			,A.ME_CS_Titel_en = CTE.ME_CS_Titel_en
			,A.ME_CS_Width = CTE.ME_CS_Width
			,A.ME_CS_Align = CTE.ME_CS_Align
			,A.ME_KS_IsVisible = CTE.ME_KS_IsVisible
			,A.ME_KS_Titel_de = CTE.ME_KS_Titel_de
			,A.ME_KS_Titel_fr = CTE.ME_KS_Titel_fr
			,A.ME_KS_Titel_it = CTE.ME_KS_Titel_it
			,A.ME_KS_Titel_en = CTE.ME_KS_Titel_en
			,A.ME_KS_Width = CTE.ME_KS_Width
			,A.ME_KS_Align = CTE.ME_KS_Align
			,A.ME_HS_Titel_de = CTE.ME_HS_Titel_de
			,A.ME_HS_Titel_fr = CTE.ME_HS_Titel_fr
			,A.ME_HS_Titel_it = CTE.ME_HS_Titel_it
			,A.ME_HS_Titel_en = CTE.ME_HS_Titel_en
			,A.ME_R1_HasReferenz = CTE.ME_R1_HasReferenz
			,A.ME_R1_Tabelle = CTE.ME_R1_Tabelle
			,A.ME_R1_FeldPrfx = CTE.ME_R1_FeldPrfx
			,A.ME_R1_FeldKey = CTE.ME_R1_FeldKey
			,A.ME_R1_Titel_de = CTE.ME_R1_Titel_de
			,A.ME_R1_Titel_fr = CTE.ME_R1_Titel_fr
			,A.ME_R1_Titel_it = CTE.ME_R1_Titel_it
			,A.ME_R1_Titel_en = CTE.ME_R1_Titel_en
			,A.ME_R2_HasReferenz = CTE.ME_R2_HasReferenz
			,A.ME_R2_Tabelle = CTE.ME_R2_Tabelle
			,A.ME_R2_FeldPrfx = CTE.ME_R2_FeldPrfx
			,A.ME_R2_FeldKey = CTE.ME_R2_FeldKey
			,A.ME_R2_Titel_de = CTE.ME_R2_Titel_de
			,A.ME_R2_Titel_fr = CTE.ME_R2_Titel_fr
			,A.ME_R2_Titel_it = CTE.ME_R2_Titel_it
			,A.ME_R2_Titel_en = CTE.ME_R2_Titel_en
			,A.ME_R2_IsRefTo1 = CTE.ME_R2_IsRefTo1
			,A.ME_Code_IsVisible = CTE.ME_Code_IsVisible
			,A.ME_Code_IsRequired = CTE.ME_Code_IsRequired
			,A.ME_Code_Datentyp = CTE.ME_Code_Datentyp
			,A.ME_Code_Anzeige_de = CTE.ME_Code_Anzeige_de
			,A.ME_Code_Anzeige_fr = CTE.ME_Code_Anzeige_fr
			,A.ME_Code_Anzeige_it = CTE.ME_Code_Anzeige_it
			,A.ME_Code_Anzeige_en = CTE.ME_Code_Anzeige_en
			,A.ME_KurzDE_IsVisible = CTE.ME_KurzDE_IsVisible
			,A.ME_KurzDE_IsRequired = CTE.ME_KurzDE_IsRequired
			,A.ME_KurzDE_Anzeige_de = CTE.ME_KurzDE_Anzeige_de
			,A.ME_KurzDE_Anzeige_fr = CTE.ME_KurzDE_Anzeige_fr
			,A.ME_KurzDE_Anzeige_it = CTE.ME_KurzDE_Anzeige_it
			,A.ME_KurzDE_Anzeige_en = CTE.ME_KurzDE_Anzeige_en
			,A.ME_KurzFR_IsSameDE = CTE.ME_KurzFR_IsSameDE
			,A.ME_KurzFR_IsVisible = CTE.ME_KurzFR_IsVisible
			,A.ME_KurzFR_IsRequired = CTE.ME_KurzFR_IsRequired
			,A.ME_KurzFR_Anzeige_de = CTE.ME_KurzFR_Anzeige_de
			,A.ME_KurzFR_Anzeige_fr = CTE.ME_KurzFR_Anzeige_fr
			,A.ME_KurzFR_Anzeige_it = CTE.ME_KurzFR_Anzeige_it
			,A.ME_KurzFR_Anzeige_en = CTE.ME_KurzFR_Anzeige_en
			,A.ME_KurzIT_IsSameDE = CTE.ME_KurzIT_IsSameDE
			,A.ME_KurzIT_IsVisible = CTE.ME_KurzIT_IsVisible
			,A.ME_KurzIT_IsRequired = CTE.ME_KurzIT_IsRequired
			,A.ME_KurzIT_Anzeige_de = CTE.ME_KurzIT_Anzeige_de
			,A.ME_KurzIT_Anzeige_fr = CTE.ME_KurzIT_Anzeige_fr
			,A.ME_KurzIT_Anzeige_it = CTE.ME_KurzIT_Anzeige_it
			,A.ME_KurzIT_Anzeige_en = CTE.ME_KurzIT_Anzeige_en
			,A.ME_KurzEN_IsSameDE = CTE.ME_KurzEN_IsSameDE
			,A.ME_KurzEN_IsVisible = CTE.ME_KurzEN_IsVisible
			,A.ME_KurzEN_IsRequired = CTE.ME_KurzEN_IsRequired
			,A.ME_KurzEN_Anzeige_de = CTE.ME_KurzEN_Anzeige_de
			,A.ME_KurzEN_Anzeige_fr = CTE.ME_KurzEN_Anzeige_fr
			,A.ME_KurzEN_Anzeige_it = CTE.ME_KurzEN_Anzeige_it
			,A.ME_KurzEN_Anzeige_en = CTE.ME_KurzEN_Anzeige_en
			,A.ME_LangDE_IsVisible = CTE.ME_LangDE_IsVisible
			,A.ME_LangDE_Anzeige_de = CTE.ME_LangDE_Anzeige_de
			,A.ME_LangDE_Anzeige_fr = CTE.ME_LangDE_Anzeige_fr
			,A.ME_LangDE_Anzeige_it = CTE.ME_LangDE_Anzeige_it
			,A.ME_LangDE_Anzeige_en = CTE.ME_LangDE_Anzeige_en
			,A.ME_LangFR_IsVisible = CTE.ME_LangFR_IsVisible
			,A.ME_LangFR_Anzeige_de = CTE.ME_LangFR_Anzeige_de
			,A.ME_LangFR_Anzeige_fr = CTE.ME_LangFR_Anzeige_fr
			,A.ME_LangFR_Anzeige_it = CTE.ME_LangFR_Anzeige_it
			,A.ME_LangFR_Anzeige_en = CTE.ME_LangFR_Anzeige_en
			,A.ME_LangIT_IsVisible = CTE.ME_LangIT_IsVisible
			,A.ME_LangIT_Anzeige_de = CTE.ME_LangIT_Anzeige_de
			,A.ME_LangIT_Anzeige_fr = CTE.ME_LangIT_Anzeige_fr
			,A.ME_LangIT_Anzeige_it = CTE.ME_LangIT_Anzeige_it
			,A.ME_LangIT_Anzeige_en = CTE.ME_LangIT_Anzeige_en
			,A.ME_LangEN_IsVisible = CTE.ME_LangEN_IsVisible
			,A.ME_LangEN_Anzeige_de = CTE.ME_LangEN_Anzeige_de
			,A.ME_LangEN_Anzeige_fr = CTE.ME_LangEN_Anzeige_fr
			,A.ME_LangEN_Anzeige_it = CTE.ME_LangEN_Anzeige_it
			,A.ME_LangEN_Anzeige_en = CTE.ME_LangEN_Anzeige_en
			,A.ME_NurMandant = CTE.ME_NurMandant
			,A.ME_MOD_UID = CTE.ME_MOD_UID
			,A.ME_EnableDelete = CTE.ME_EnableDelete
			,A.ME_SL_UID = CTE.ME_SL_UID

WHEN NOT MATCHED THEN 
INSERT 
(
	  ME_UID, ME_ME_UID, ME_Code
	, ME_Text_de, ME_Text_fr, ME_Text_it, ME_Text_en 
	, ME_IsCorBereich, ME_Tabelle, ME_FeldPrfx, ME_Page, ME_Status, ME_Sort
	, ME_IsShowInMenu, ME_CanAdd, ME_CS_IsVisible
	, ME_CS_Titel_de, ME_CS_Titel_fr, ME_CS_Titel_it, ME_CS_Titel_en
	, ME_CS_Width, ME_CS_Align, ME_KS_IsVisible
	, ME_KS_Titel_de, ME_KS_Titel_fr, ME_KS_Titel_it, ME_KS_Titel_en
	, ME_KS_Width, ME_KS_Align
	, ME_HS_Titel_de, ME_HS_Titel_fr, ME_HS_Titel_it, ME_HS_Titel_en
	, ME_R1_HasReferenz, ME_R1_Tabelle, ME_R1_FeldPrfx, ME_R1_FeldKey
	, ME_R1_Titel_de, ME_R1_Titel_fr, ME_R1_Titel_it, ME_R1_Titel_en
	, ME_R2_HasReferenz, ME_R2_Tabelle, ME_R2_FeldPrfx, ME_R2_FeldKey
	, ME_R2_Titel_de, ME_R2_Titel_fr, ME_R2_Titel_it, ME_R2_Titel_en
	, ME_R2_IsRefTo1, ME_Code_IsVisible, ME_Code_IsRequired, ME_Code_Datentyp
	, ME_Code_Anzeige_de, ME_Code_Anzeige_fr, ME_Code_Anzeige_it, ME_Code_Anzeige_en
	, ME_KurzDE_IsVisible, ME_KurzDE_IsRequired
	, ME_KurzDE_Anzeige_de, ME_KurzDE_Anzeige_fr, ME_KurzDE_Anzeige_it, ME_KurzDE_Anzeige_en
	, ME_KurzFR_IsSameDE, ME_KurzFR_IsVisible, ME_KurzFR_IsRequired
	, ME_KurzFR_Anzeige_de, ME_KurzFR_Anzeige_fr, ME_KurzFR_Anzeige_it, ME_KurzFR_Anzeige_en
	, ME_KurzIT_IsSameDE, ME_KurzIT_IsVisible, ME_KurzIT_IsRequired
	, ME_KurzIT_Anzeige_de, ME_KurzIT_Anzeige_fr, ME_KurzIT_Anzeige_it, ME_KurzIT_Anzeige_en
	, ME_KurzEN_IsSameDE, ME_KurzEN_IsVisible, ME_KurzEN_IsRequired
	, ME_KurzEN_Anzeige_de, ME_KurzEN_Anzeige_fr, ME_KurzEN_Anzeige_it, ME_KurzEN_Anzeige_en
	, ME_LangDE_IsVisible
	, ME_LangDE_Anzeige_de, ME_LangDE_Anzeige_fr, ME_LangDE_Anzeige_it, ME_LangDE_Anzeige_en
	, ME_LangFR_IsVisible
	, ME_LangFR_Anzeige_de, ME_LangFR_Anzeige_fr, ME_LangFR_Anzeige_it, ME_LangFR_Anzeige_en
	, ME_LangIT_IsVisible
	, ME_LangIT_Anzeige_de, ME_LangIT_Anzeige_fr, ME_LangIT_Anzeige_it, ME_LangIT_Anzeige_en
	, ME_LangEN_IsVisible
	, ME_LangEN_Anzeige_de, ME_LangEN_Anzeige_fr, ME_LangEN_Anzeige_it, ME_LangEN_Anzeige_en
	, ME_NurMandant, ME_MOD_UID, ME_EnableDelete, ME_SL_UID
)
VALUES
(
	 CTE.ME_UID
	,CTE.ME_ME_UID
	,CTE.ME_Code
	,CTE.ME_Text_de
	,CTE.ME_Text_fr
	,CTE.ME_Text_it
	,CTE.ME_Text_en
	,CTE.ME_IsCorBereich
	,CTE.ME_Tabelle
	,CTE.ME_FeldPrfx
	,CTE.ME_Page
	,CTE.ME_Status
	,CTE.ME_Sort
	,CTE.ME_IsShowInMenu
	,CTE.ME_CanAdd
	,CTE.ME_CS_IsVisible
	,CTE.ME_CS_Titel_de
	,CTE.ME_CS_Titel_fr
	,CTE.ME_CS_Titel_it
	,CTE.ME_CS_Titel_en
	,CTE.ME_CS_Width
	,CTE.ME_CS_Align
	,CTE.ME_KS_IsVisible
	,CTE.ME_KS_Titel_de
	,CTE.ME_KS_Titel_fr
	,CTE.ME_KS_Titel_it
	,CTE.ME_KS_Titel_en
	,CTE.ME_KS_Width
	,CTE.ME_KS_Align
	,CTE.ME_HS_Titel_de
	,CTE.ME_HS_Titel_fr
	,CTE.ME_HS_Titel_it
	,CTE.ME_HS_Titel_en
	,CTE.ME_R1_HasReferenz
	,CTE.ME_R1_Tabelle
	,CTE.ME_R1_FeldPrfx
	,CTE.ME_R1_FeldKey
	,CTE.ME_R1_Titel_de
	,CTE.ME_R1_Titel_fr
	,CTE.ME_R1_Titel_it
	,CTE.ME_R1_Titel_en
	,CTE.ME_R2_HasReferenz
	,CTE.ME_R2_Tabelle
	,CTE.ME_R2_FeldPrfx
	,CTE.ME_R2_FeldKey
	,CTE.ME_R2_Titel_de
	,CTE.ME_R2_Titel_fr
	,CTE.ME_R2_Titel_it
	,CTE.ME_R2_Titel_en
	,CTE.ME_R2_IsRefTo1
	,CTE.ME_Code_IsVisible
	,CTE.ME_Code_IsRequired
	,CTE.ME_Code_Datentyp
	,CTE.ME_Code_Anzeige_de
	,CTE.ME_Code_Anzeige_fr
	,CTE.ME_Code_Anzeige_it
	,CTE.ME_Code_Anzeige_en
	,CTE.ME_KurzDE_IsVisible
	,CTE.ME_KurzDE_IsRequired
	,CTE.ME_KurzDE_Anzeige_de
	,CTE.ME_KurzDE_Anzeige_fr
	,CTE.ME_KurzDE_Anzeige_it
	,CTE.ME_KurzDE_Anzeige_en
	,CTE.ME_KurzFR_IsSameDE
	,CTE.ME_KurzFR_IsVisible
	,CTE.ME_KurzFR_IsRequired
	,CTE.ME_KurzFR_Anzeige_de
	,CTE.ME_KurzFR_Anzeige_fr
	,CTE.ME_KurzFR_Anzeige_it
	,CTE.ME_KurzFR_Anzeige_en
	,CTE.ME_KurzIT_IsSameDE
	,CTE.ME_KurzIT_IsVisible
	,CTE.ME_KurzIT_IsRequired
	,CTE.ME_KurzIT_Anzeige_de
	,CTE.ME_KurzIT_Anzeige_fr
	,CTE.ME_KurzIT_Anzeige_it
	,CTE.ME_KurzIT_Anzeige_en
	,CTE.ME_KurzEN_IsSameDE
	,CTE.ME_KurzEN_IsVisible
	,CTE.ME_KurzEN_IsRequired
	,CTE.ME_KurzEN_Anzeige_de
	,CTE.ME_KurzEN_Anzeige_fr
	,CTE.ME_KurzEN_Anzeige_it
	,CTE.ME_KurzEN_Anzeige_en
	,CTE.ME_LangDE_IsVisible
	,CTE.ME_LangDE_Anzeige_de
	,CTE.ME_LangDE_Anzeige_fr
	,CTE.ME_LangDE_Anzeige_it
	,CTE.ME_LangDE_Anzeige_en
	,CTE.ME_LangFR_IsVisible
	,CTE.ME_LangFR_Anzeige_de
	,CTE.ME_LangFR_Anzeige_fr
	,CTE.ME_LangFR_Anzeige_it
	,CTE.ME_LangFR_Anzeige_en
	,CTE.ME_LangIT_IsVisible
	,CTE.ME_LangIT_Anzeige_de
	,CTE.ME_LangIT_Anzeige_fr
	,CTE.ME_LangIT_Anzeige_it
	,CTE.ME_LangIT_Anzeige_en
	,CTE.ME_LangEN_IsVisible
	,CTE.ME_LangEN_Anzeige_de
	,CTE.ME_LangEN_Anzeige_fr
	,CTE.ME_LangEN_Anzeige_it
	,CTE.ME_LangEN_Anzeige_en
	,CTE.ME_NurMandant
	,CTE.ME_MOD_UID
	,CTE.ME_EnableDelete
	,CTE.ME_SL_UID 
);

-- SELECT * FROM T_BO_Menu WHERE ME_UID = '77C6BA09-E9E2-4F2F-9102-2FE80B1E9B46'
