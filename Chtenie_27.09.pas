Program chtenie;
uses crt;
Type TElement=integer
     TTypeFile=file of TElement;
	 TDinArray=Array of TElement;
Var DinArray:TDinArray;
    NameTextFile, NameTypeFile: string;
	NumberOfElements:longword;
Procedure TextToTypeFile(NameTextFile,NameTypeFile:string;NumberOfElements:longword);
Var Number:TElement;
    t:text;
    f:TTypeFile;
	i:integer;
Begin
Assign(t,NameTextFile);
Assign(f,NameTypeFile);
reset(t);
rewrite(f);
For i:=1 to NumberOfElements do
 begin
 if eof(t) then reset(t); //reset - в начало файла
 read(t,Number);
 read(f,Number);
 end;
close(f);
end;

Procedure ReadFromTypeFileToArray(NameTypeFile:string; DinArray:TDinArray; NumberOfElements:longword);
var f:TTypeFile;
    i:longword;
begin
SetLength(DinArray,NumberOfElements); //установили размерность массива
Assign(f,NameTypeFile);
reset(t);
For i:=1 to NumberOfElements do
  begin
  If eof
  read(f,DinArray[i-1]);
  end;
close(f);
end;

Procedure ShowDinMas(DinArray:TDinArray);
var i:longword;
Begin
For i:=Low(DinArray) to High(DinArray) do //так нет необходимости объявлять новые переменные
 write(DinArray[i-1],' ');
end;

End.