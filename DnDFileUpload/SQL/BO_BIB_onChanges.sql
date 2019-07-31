/*
	--BO_BIB_onChanges.sql
	declare @BE_ID int; set @BE_ID = 12435;
	declare @Changes nvarchar(max);
*/

--REM: Parameter
declare @tXML xml; set @tXML = nullif(@Changes, '');

begin transaction [5493];
begin try
	--REM: Aktualisieren
	update
		[T_VWS_Ref_Bibliothek]
	set
		[BIB_BIG_UID] = 
			case
				when [row].c.exist('./@BIG_UID') = 1 then nullif([row].c.value('./@BIG_UID', 'varchar(36)'), '')
				else [BIB_BIG_UID]
			end,

		[BIB_Sort] = 
			case
				when [row].c.exist('./@BIB_Sort') = 1 then [row].c.value('./@BIB_Sort', 'int')
				else [BIB_Sort]
			end,

		[BIB_Status] = 
			case
				when [row].c.exist('./@BIB_Status') = 1 then [row].c.value('./@BIB_Status', 'bit')
				else [BIB_Status]
			end
	from
		@tXML.nodes('row') as [row](c)
		inner join [T_VWS_Ref_Bibliothek] on [BIB_UID] = [row].c.value('./@id', 'uniqueidentifier')
		inner join [T_Benutzer] on [BE_ID] = @BE_ID
	where
		(
			([row].c.value('./@_isNew', 'bit') is null)
		);

	--REM: _isRemoved
	--REM: Bibliothekssymbol entfernen
	update
		[T_VWS_Ref_Bibliothek]
	set
		[BIB_Status] = 99
	from
		@tXML.nodes('row') as [row](c)
		inner join [T_VWS_Ref_Bibliothek] on [BIB_UID] = [row].c.value('./@id', 'uniqueidentifier')
		inner join [T_Benutzer] on [BE_ID] = @BE_ID
	where
		(
			[row].c.value('./@_isRemoved', 'bit') = 1
		);

	--REM: Referenz auf Entitäten entfernen
	update
		[T_VWS_SVGElement]
	set
		[SVE_BIB_UID] = null
	from
		@tXML.nodes('row') as [row](c)
		inner join [T_VWS_SVGElement] on [SVE_BIB_UID] = [row].c.value('./@id', 'uniqueidentifier')
		inner join [T_Benutzer] on [BE_ID] = @BE_ID
	where
		(
			([row].c.value('./@_isRemoved', 'bit') = 1) and
			([SVE_dateCreated] <= current_timestamp) and
			([SVE_dateDeleted] >= current_timestamp or [SVE_dateDeleted] is null)
		);

	commit transaction [5493]
end try

begin catch
	declare @_errorMessage [varchar](max), @_errorSeverity int, @_errorState int;
	select @_errorSeverity=error_severity(), @_errorState=error_state(), @_errorMessage=error_message();

	rollback transaction [5493];
	insert into [T_COR_Error]([All], [Source], [Type]) values(@_errorMessage, 'BO_BIB_onChanges.sql', 'try-catch')
	raiserror(@_errorMessage, @_errorSeverity, @_errorState)
end catch;