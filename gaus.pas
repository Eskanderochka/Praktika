 Program Gauss;
 {$MODE DELPHI}
 Type TItem=Double;
      TVector=Array of TItem;
      TMatr=Array of TVector;
	  TErrorInit=Class(Exception);
      TSystemLAE=Object 
       Public 
        Procedure InitTask(FileName:string);
        Procedure SetA(B:TMatr);
        Procedure GetA(var B:TMatr);
        Procedure Setf(g:TVector);
        Procedure Getf(var g:TVector);
	    Procedure GetSolution (var solve:TVector; str_error:string);
	   Private
	    Var A:TMatr; f,x:TVector; n:word;
		Procedure SolveGauss(var solve:TVector; str_error:string);
	 end;
	 
 Var SLAE:TSystemLAE;

Procedure TSystemLAE.InitTask(FileName:string);
   var i,j,n:word;
       t:text;
   begin
   Try
   Assign(t,FileName);
   Reset(t);
   Read(t,n);
   SetLength(A,n,n);
   SetLength(f,n);
   For i:=0 to n-1 do
     For j:=0 to n-1 do
	  Read(t,A[i,j]);
   For i:=0 to n-1 do
     Read(t,f[i]);
   Except
    raise TErrorInit.Create('ОШИБКА ЧТЕНИЯ ФАЙЛА. ВСЕ ПЛОХО. ПЕРЕДЕЛАЙ');
   end;
   end;

Procedure TSystemLAE.SetA(B:TMatr);
begin
end;

Procedure TSystemLAE.GetA(var B:TMatr);
begin
end;

Procedure TSystemLAE.Setf(g:TVector);
begin
end;

Procedure TSystemLAE.Getf(var g:TVector);
begin
end;

 Procedure TSystemLAE.SolveGauss(var solve:TVector; str_error:string);
 Var i,j,k,n:word; sum:TItem;
    begin
	try
    // n:=High(A);
	For k:=Low(A) to High(A) do
	   begin
	   f[k]:=f[k]/A[k,k];
	   For j:=k+1 to High(A) do
          A[k,j]:=A[k,j]/A[k,k];
	   For i:=k+1 to  High(A) do
	      begin
	      f[i]:=f[i]-A[i,k]*f[k];
		  For j:= k+1 to High(A) do
		    A[i,j]:=A[i,j]-A[i,k]*A[k,j];
		  end;
	  end;
	SetLength(X,n);
	x[High(X)]:=f[High(f)];
    For i:=High(A)-1 downto Low(A) do
       begin
	   sum:=0;
       For k:=i+1 to High(A) do
	      sum:=sum+A[i,k]*x[k];
	   x[i]:=f[i]-sum;
       end;
	 str_error:='';
     Except
	  str_error:='Ошибка метода';
   end;

Procedure GetSolution (var solve:TVector; str_error:string);
begin
end;

 Procedure PrintVect(b:TVector);
 Var i:word;
 Begin
   For i:=Low(b) to High(b) do
    Writeln(b[i]);
 End;

 Begin
   ReadFromFile('C:\Users\Eskanderochka\Desktop\BSU\2 kurs\Vichy\input.txt',A,f);
   SolveGauss(A,f,x);
   PrintVect(x);
 End.
