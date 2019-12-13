program PR1;
Type TPLink=^TLink;
     TLink=record
	       Inf:integer;
	       Next:TPLink;
	       end;
Var First1,Last1,First2,Last2:TPLink;
    Number,a,b:word;
	FirstUnion,LastUnion,FirstIntersect,LastIntersect:TPLink;
Procedure CreateEmptyList(var First,Last:TPLink);
begin
New(First);
New(Last);
First^.Next:=Last;
Last^.Next:=Nil;
First^.Inf:=13;
Last^.Inf:=16;	 
end;
Procedure InsertAfter(var Current:TPLink;NewItem:TPLink);
var InsertItem:TPLink;
begin
New(InsertItem);
InsertItem^.Inf:=NewItem^.Inf;
InsertItem^.Next:=Current^.Next;
Current^.Next:=InsertItem;
//Current:=Current^.Next;
end;
Procedure CreateNewList(var First,Last:TPLink;Number:word;a,b:word);
var i:word;
    NewItem:TPLink;
	Current:TPLink;
	Data:integer;
begin
CreateEmptyList(First,Last);
Current:=First;
Randomize;
For i:=1 to Number do
  begin
  New(NewItem);
  Data:=random(b-a)+a;
  NewItem^.Inf:=Data;
  InsertAfter(Current,NewItem);
  end;     
end;

Procedure PrintList(First,Last:TPLink);
var Current:TPLink;
begin
Current:=First;
While Current^.Next <> Last do
  begin
  Write(Current^.Next^.Inf,' ');
  Current:=Current^.Next;
  end;
Writeln;
end;

Function InSet(SomeLink:TPLink; First,Last:TPLink):boolean;
var Result:boolean; Current:TPLink;
begin
Current:=First;
Result:=False;
While Current^.Next<>Last do
  begin
   if Current^.Next^.Inf=SomeLink^.Inf then
    begin
	Result:=True;
	Break;
	end;
  Current:=Current^.Next;
  end; 
InSet:=Result;
end;

Procedure Union(First1,Last1,First2,Last2:TPLink; var FirstUnion, LastUnion:TPLink);
var Current1,Current2:TPLink;
begin
CreateEmptyList(FirstUnion,LastUnion);
Current1:=First1;
While Current1^.Next<>Last1 do
  begin
  If not InSet(Current1^.Next,FirstUnion,LastUnion) then
    InsertAfter(FirstUnion,Current1^.Next);
  Current1:=Current1^.Next; 
  end;
Current2:=First2;
While Current2^.Next<>Last2 do
  begin
  If not InSet(Current2^.Next,FirstUnion,LastUnion) then
    InsertAfter(FirstUnion,Current2^.Next);
  Current2:=Current2^.Next; 
  end;
end;

Procedure Intersect(First1,Last1,First2,Last2:TPLink; var FirstIntersect, LastIntersect:TPLink);
var Current1,Current2:TPLink;
begin
CreateEmptyList(FirstIntersect,LastIntersect);
Current1:=First1;
While Current1^.Next<>Last1 do
  begin
  If InSet(Current1^.Next,First2,Last2) and ( not InSet(Current1^.Next,FirstIntersect,LastIntersect) )then
    InsertAfter(FirstIntersect,Current1^.Next);
  Current1:=Current1^.Next; 
  end;
end;

BEGIN
Randomize;
Number:=10;
a:=1;
b:=6;
CreateNewList(First1,Last1,Number,a,b);
PrintList(First1,Last1);
Number:=15;
a:=3;
b:=8;
CreateNewList(First2,Last2,Number,a,b);
PrintList(First2,Last2);
Union(First1,Last1,First2,Last2,FirstUnion,LastUnion);
PrintList(FirstUnion,LastUnion);
Intersect(First1,Last1,First2,Last2,FirstIntersect,LastIntersect);
PrintList(FirstIntersect,LastIntersect);

END.