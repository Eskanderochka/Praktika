Program FourGraph;
Uses Graph;
Var dx, dy : integer;
Type TFunc = Function(x:real):real;

{$F+}
Function f1(fi : real):real;
   begin
   f1:=sin(3*fi);
   end;

Function f2(fi : real):real;
   begin
   f2:=sin(5*fi);
   end;

Function f3(fi : real):real;
   begin
   f3:=sin(7*fi);
   end;

Function f4(fi : real):real;
   begin
   f4:=sin(sqrt(2)*fi);
   end;
{$F-}

Procedure PolarToCartesian(fi,r : real; var x, y : real);
   begin
   x:=r*cos(fi);
   y:=r*sin(fi);
   end;

Procedure FindMaxMinXY(f:TFunc; var MaxX, MinX, MaxY, MinY : real;
                       FiFirst, FiLast : real);
   var x,y,fi:real;
          dfi:real;
   begin
   dfi:=0.01;
   fi:=FiFirst;
   PolarToCartesian(fi,f1(fi),x,y);
   MaxX:=x;
   MinX:=x;
   MaxY:=y;
   MinY:=y;
   fi:=fi+dfi;
   While fi<=FiLast+dfi/10 do
      begin
      PolarToCartesian(fi,f1(fi),x,y);
      If x>MaxX then MaxX:=x
         else if x<MinX then MinX:=x;
      If y>Maxy then Maxy:=y
         else if y<Miny then Miny:=y;
      fi:=fi+dfi;
      end;
   end;

Function Min(a,b:real):real;
   begin
   If a<b then min:=a else min:=b;
   end;

Function Max(a,b:real):real;
   begin
   If a>b then max:=a else max:=b;
   end;

Procedure GetMashtab(x1,y1,x2,y2:integer; dx, dy : integer;
                     MaxX,MinX,MaxY,MinY: real;
                     var mash : real);
   var LX,LY: integer;
       MashX, MashY : real;
   begin
   //dx:=8;
   //dy:=8;
   Lx:=(x2-x1-2*dx) div 2;
   Ly:=(y2-y1-2*dy) div 2;
   MashX:=Lx/Max(Abs(MaxX),Abs(MinX));
   MashY:=Ly/Max(Abs(MaxY),Abs(MinY));
   Mash:=Min(MashX,MashY);
   end;

Procedure PlotAxis(x1,y1,x2,y2 : integer; dx,dy: integer;
                   ColorAxis : integer);
   begin
   SetColor(ColorAxis);
   //Line(x1+dx,(y2-y1) div 2,x2 - dx,(y2-y1) div 2);
   //Line((x2-x1) div 2, y1 + dy, (x2-x1) div 2,y2-dy);

   Line(x1+dx,y1 + (y2-y1) div 2,x2 - dx, y1 + (y2-y1) div 2);
   Line(x1 + (x2-x1) div 2, y1 + dy,x1 + (x2-x1) div 2,y2-dy);
   {samostoyatelno vivesti strelochki}
   end;

Procedure DrawGraph(x1,y1,x2,y2 : integer; dx,dy : integer;
                    ColorGraph : integer;
                    f:TFunc;FiFirst, FiLast : real);
 var x,y:real; r,fi,dfi:real;
     MaxX, MinX, MaxY, MinY, Mash : real;
     x1g,y1g,x2g,y2g:integer;
   begin
   {Sdvig x1 + (x2 - x1) div 2 i y1 + (y2 - y1) div 2}
   FindMaxMinXY(f, MaxX, MinX, MaxY, MinY, FiFirst, FiLast);
   GetMashtab(x1,y1,x2,y2,dx, dy, MaxX,MinX,MaxY,MinY, Mash);

   fi:=FiFirst;
   dfi:=0.001;

   While fi<=FiLast +dfi/10 do
      begin
      r:=f(fi);
      PolarToCartesian(fi,r, x, y);
      x1g:=round(x*Mash)+x1+ (x2-x1) div 2;
      y1g:=round(y*Mash)+y1+(y2-y1) div 2;
      PutPixel(x1g,y1g,ColorGraph);
      fi:=fi+dfi;
      end
   end;

Var
   x1,y1,x2,y2:integer;
   gd,gm:smallint;
   ColorAxis, ColorGraph : integer; Mashtab : real;
   FiFirst, FiLast : real;
Begin
gd := detect;
InitGraph(gd,gm,'');
//writeln(getmaxx:6,getmaxy:6, getmaxx div 2 :6,getmaxy div 2:6);
dx:=8;dy:=8;

x1:=0;y1:=0;x2:=getmaxx div 2;y2:=getmaxy div 2;
setviewport(x1,y1,x2,y2,ClipOn);
x2:=x2-x1;y2:=y2-y1;x1:=0;y1:=0;;
ColorAxis:=white;
PlotAxis(x1,y1,x2,y2,4,4,ColorAxis);
ColorGraph:=white;
FiFirst:=0;FiLast:=2*Pi;
DrawGraph(x1,y1,x2,y2,dx,dy,ColorGraph,@f1,FiFirst, FiLast);



x1:=0;y1:=getmaxy div 2; x2:=getmaxx div 2;y2:=getmaxy;
setviewport(x1,y1,x2,y2,ClipOn);
ColorAxis:=red;
x2:=x2-x1;y2:=y2-y1;x1:=0;y1:=0;
PlotAxis(x1,y1,x2,y2,dx,dy,ColorAxis);
ColorGraph:=red;
FiFirst:=0;FiLast:=2*Pi;
DrawGraph(x1,y1,x2,y2,dx,dy,ColorGraph, @f2,FiFirst, FiLast);

x1:=getmaxx div 2;y1:=0; x2:=getmaxx;y2:=getmaxy div 2;
setviewport(x1,y1,x2,y2,ClipOn);
x2:=x2-x1;y2:=y2-y1;x1:=0;y1:=0;
PlotAxis(x1,y1,x2,y2,dx,dy,ColorAxis);
ColorGraph:=white;
FiFirst:=0;FiLast:=2*Pi;
DrawGraph(x1,y1,x2,y2,dx,dy,ColorGraph, @f3,FiFirst, FiLast);

x1:=getmaxx div 2;y1:=getmaxy div 2; x2:=getmaxx;y2:=getmaxy;
setviewport(x1,y1,x2,y2,ClipOn);
x2:=x2-x1;y2:=y2-y1;x1:=0;y1:=0;
PlotAxis(x1,y1,x2,y2,dx,dy,ColorAxis);
ColorGraph:=white;
FiFirst:=0;FiLast:=500*Pi;
DrawGraph(x1,y1,x2,y2,dx,dy,ColorGraph, @f4,FiFirst, FiLast);


readln;
End.
