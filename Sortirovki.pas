Unit presort;
{$Mode Delphi}
Interface
Type TElement=integer;
     TDinArray=array of TElement;
	    TTypeFile=file of TElement;
var DinArray:TDinArray;
    TextFileName,TypeFileName:string;
	    CountNumber:longword;
Procedure TextFileToTypeFile(TextFileName:string;CountNumber:longword);
Procedure TypeFileToArray(TypeFileName:string; var DinArray:TDinArray;CountNumber:longword);
Procedure PrintArray(DinArray:TDinArray);

Implementation
Uses SysUtils;
Function TransformName(TextFileName:string):string;
Begin
  TransformName:=concat(copy(TextFileName,1,length(TextFileName)-3),'dat');
End;

Procedure TextFileToTypeFile(TextFileName:string;CountNumber:longword);
var i:longword;
    Temp:TElement;
	  TextFile:text;
    TypeFile:TTypeFile;
    TypeFileName:string;
	  a:byte;
Begin
  try
    assign(TextFile,TextFileName);
	  reset(TextFile);
	  TypeFileName:=TransformName(TextFileName);
	  assign(TypeFile,TypeFileName);
	  rewrite(TypeFile);
	  for i:=1 to CountNumber do
	    begin
	      read(TextFile,Temp);
		    write(TypeFile,Temp);
	    end;
    close(TextFile);
	  close(TypeFile);
  except
    writeln('РЈ РЅР°СЃ РїСЂРѕР±Р»РµРјС‹ СЃ С„Р°Р№Р»РѕРј');
	  exit;;
   end;
End;

Procedure TypeFileToArray(TypeFileName:string; var DinArray:TDinArray;CountNumber:longword);
var i:longword;
    TypeFile:TTypeFile;
Begin
  Assign(TypeFile,TypeFileName);
  Reset(TypeFile);
  i:=0;
  If CountNumber=0 then SetLength(DinArray,FileSize(TypeFile))
    else SetLength(DinArray,CountNumber);
  If CountNumber=0 then
    begin
	 while not eof(TypeFile) do
        	 begin
			    read(TypeFile,DinArray[i]);
				inc(i);
			end;
	end
    else begin
	       for i:=0 to CountNumber do
		     begin
			  If eof(TypeFile) then reset(TypeFile);
			  read(TypeFile,DinArray[i-1]);
			 end;
		end;
	close(TypeFile);
End;

Procedure PrintArray(DinArray:TDinArray);
var i:longword;
Begin
  for i:=Low(DinArray) to High(DinArray) do
   Write(DinArray[i],' ' );
End;


Begin

End.