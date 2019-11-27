Program MathForGraph;
Uses math;

Type TFunction=Function(fi:double):double;

{$F+}
Function r1(fi:double):double;
 begin
 r1:=sin(3*fi);
 end;
 
Function r2(fi:double):double;
 begin
 r2:=sin(4*fi/3);
 end; 
{$F-} 

Function PolarToCartesianX(r,fi:double):double;
 begin
 PolarToCartesianX:=r *cos(fi);
 end; 

 Function PolarToCartesianY(r,fi:double):double;
 begin
 PolarToCartesianY:=r *sin(fi);
 end; 
 
Procedure PlotGraph(TopX,TopY,BottomX,BottomY:integer; F:TFunction;FiBegin,FiEnd,dFi:double;dx,dy:double);
 type TMas= array of double;
 var Width, Height:integer;
     X,Y:TMas;
	 i, N:longword;
	 fi:double;
     r:double;
	 MaxX, MinX, MaxY, MinY:double;
	 MashX, MashY, Mash:double;
 begin
 Width=BottomX-TopX-2*dx;
 Height=BottomY-TopY-2*dy;
 N:=Round((FiEnd-FiBegin)/dFi)+1;
 SetLength(X,N);
 SetLength(Y,N); 
 for i:=0 to N-1 do
     begin
	 fi:=FiBegin+i*dFi;
	 r:=F(fi);
	 X[i]:=PolarToCartesianX(r,fi);
	 Y[i]:=PolarToCartesianY(r,fi);
	 end;
 MaxX:=maxvalue(X);
 MinX:=minvalue(X);
 MaxY:=maxvalue(Y);
 MinY:=minvalue(Y);
 MashX:=Width/(MaxX-MinX);
 MashY:=Height/(MaxY-MinY);
 Mash:=Min(MashX,MashY);
 end;