reset; 
param thetaS:= 40; 
param thetaP:= 50;
param N:= 40;

set angles := 0 .. 90;
set anglesP := thetaP .. 90;
set anglesS := 0 .. thetaS;
set nombres := 1..N;

param rayons{nombres};
for {i in nombres}{
	let rayons[i]:=i/10;
}
param d{angles,nombres};

var epsilon >=0;
var x{nombres};

minimize objectif : epsilon;

data d.dat;

#subject to criterePbid{i in anglesP} : -epsilon <= (sum{j in nombres}x[j]*d[j,i])-1 <= epsilon;
subject to critereP1{i in anglesP} : (sum{j in nombres}x[j]*d[i,j])-1-epsilon <= 0;
subject to critereP2{i in anglesP} : 0 <= epsilon+(sum{j in nombres}x[j]*d[i,j])-1 ;

#subject to critereS{i in anglesS} : -epsilon <= (sum{j in nombres}x[j]*d[j,i]) <= epsilon;
subject to critereS1{i in anglesS} : 0 <= epsilon+(sum{j in nombres}x[j]*d[i,j]) ;
subject to critereS2{i in anglesS} : (sum{j in nombres}x[j]*d[i,j])-epsilon <=0;

option solver cplex; 
solve; 






   