Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.canMoveBack
Class User.canMoveBack [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod canMoveBack(who As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648), cell As %Library.String(MAXLEN=2)) As %Library.String [ Language = tsql, SqlName = canMoveBack, SqlProc ]
{

begin
declare @ret varchar(5)
 set @ret = SQLUser.canMoveRight(convert(tinyint,tsql.modulo2(@who))+1, @cell) + ' ' +
  SQLUser.canMoveLeft((convert(tinyint,tsql.modulo2(@who)))+1, @cell)
 
 return rtrim(ltrim(@ret))
end;

go
}

}

