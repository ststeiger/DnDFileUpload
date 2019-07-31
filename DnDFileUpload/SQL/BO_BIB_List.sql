/*
	--BO_BIB_List.sql
	declare @BE_ID int; set @BE_ID = 12435;
*/

select
	--REM: Bibliothek
	[BIB_UID] as id,
	[BIB_SVG],
	[BIB_widthInMeter],
	[BIB_heightInMeter],
	
	case
		when [BIB_MDT_UID] is null then 1
		else 0
	end as [BIB_isStandard],

	case [BE_Language]
		when 'EN' then [BIB_Lang_EN]
		when 'FR' then [BIB_Lang_FR]
		when 'IT' then [BIB_Lang_IT]
		else [BIB_Lang_DE]
	end as [BIB_Lang],

	[BIB_Sort],
	[BIB_Status],

	--REM: Anzahl gültiger Referenzen
	(
		select
			count(distinct [SVE_UID])
		from
			[T_VWS_SVGElement]
		where
			(
				([SVE_BIB_UID] = [BIB_UID]) and
				([SVE_dateCreated] <= current_timestamp) and
				([SVE_dateDeleted] >= current_timestamp or [SVE_dateDeleted] is null)
			)
	) as [BIB_SVE_Count],

	--REM: Bibliotheksgruppe
	[BIG_UID],
	[BIG_Sort],

	case [BE_Language]
		when 'EN' then [BIG_Lang_EN]
		when 'FR' then [BIG_Lang_FR]
		when 'IT' then [BIG_Lang_IT]
		else [BIG_Lang_DE]
	end as [BIG_Lang],

	--REM: Objekttyp
	[OBJT_UID],

	case [BE_Language]
		when 'EN' then [OBJT_Lang_EN]
		when 'FR' then [OBJT_Lang_FR]
		when 'IT' then [OBJT_Lang_IT]
		else [OBJT_Lang_DE]
	end as [OBJT_Lang]
from
	[T_VWS_Ref_Bibliothek]

	left join [T_OV_Ref_ObjektTyp] on [OBJT_UID] = [BIB_OBJT_UID]

	left join [T_VWS_Ref_BibliothekGruppe] on [BIG_UID] = [BIB_BIG_UID]

	inner join [T_Benutzer] on [BE_ID] = @BE_ID
where
	(
		([BIB_Status] in (0, 1)) --and
		--REM: Diese Mandaten gibt es ja (noch) nicht wirklich. Daher geht das so nicht.
		--(
		--	not [BIB_MDT_UID] is null or
		--	[BE_isCor_Hash] = substring([master].[dbo].[fn_varbintohexstr](HashBytes('MD5', 'IsCorUser' + lower([BE_User]))), 3, 32) 
		--)
	);

select
	'@BIB_Lang.' as [editHeader];