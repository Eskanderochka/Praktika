Program Pr1;
Type TElement=double;
     TVect=Array of TElement;
	 TMatr=Array of TElement;
Operator + (A:TMatr; b:TVect): TVect;
Var i,j,m,n: word;
begin
n:=High(A)-Low(A)+1;
m:=High(A[Low(A)])-Low(A[Low(A)])+1;
//Обработка ошибки в числовых
Setlength(c,n);
For i:=Low(A) to High(A) do
    begin
	gum:=0;
	For i:=Low(A[Low(A)]) to 
	sum:= gum+a[i,j]*b[j];
	c[i]:=sum
	
	end;

end.	 

Operator +(A,b:TVect) c:TVect;
Var i,n:word;
begin
  n:=High(A)-Low(A);
  For a to high(A) do
  a[i]:=a[i]*b[i];
 end;
 
 Procedure InitTask(FileName:string; var A:TMatrix; var f:TVector);
 Begin
  try
  Assign(FileName,t);
  reset(t);
  read(t,n);
  SetLength(A,n,n);
  SetLength(f,n);
  for i:=0 to n-1 do
   for j:=0 to n-1 do
    Read(t,A[i,j]);
   for i:=o to n-1 do
    Read(t,f[i]);
	Close(t);
  except
  writeln('PEREPIS');
  halt;
  end;

 
 begin
InitTask
SetLength(c,High(B)-Low(B)) 
 c:=A+ *
 end.