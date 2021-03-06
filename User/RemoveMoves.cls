Include %occInclude

/// Generated by TSQL CREATE PROC SQLUser.RemoveMoves
Class User.RemoveMoves [ Abstract, DdlAllowed, GeneratedBy = %XSQL.StatementBatch.cls, Owner = {UnknownUser} ]
{

ClassMethod RemoveMoves(player As %Library.Integer(MAXVAL=2147483647,MINVAL=-2147483648)) As %Library.Integer [ Language = tsql, SqlName = RemoveMoves, SqlProc ]
{

begin
 set nocount on
 --print 'removing moves for '||@player
 declare @move varchar(5), @sql varchar(1000)
 select moves into #tmp from moves_table where comp = case when @player = 1 then 1 else 0 end
 declare curMoves cursor for
 select moves from #tmp
 
 open curMoves
 fetch next from curMoves into @move
 while @@fetch_status = 0
 begin
  if exists(select 1 from sysobjects (nolock) where type = 'p' and name = @move)
  begin 
   set @sql = 'drop procedure ' + @move
   --exec(@sql)
   exec tsql.execddl @sql
   --cache {b}
  end

  delete moves_table where moves = @move
  fetch next from curMoves into @move
 end
 close curMoves
 deallocate curMoves
 drop table #tmp
end;

go
}

}

