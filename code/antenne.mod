reset; 
param thetaS:= 44; 
param thetaP:= 45;
param N:= 40;

set angles := 0 .. 90;
set anglesP := thetaP .. 90;
set anglesS := 0 .. thetaS;
set nombres := 1..N;

param rayons{nombres};
for {i in nombres}{
	let rayons[i]:=i/10;
}
param d{nombres,angles};

var epsilon >=0;
var x{nombres};

minimize objectif : epsilon;

data dlong.dat;

#subject to criterePbid{i in anglesP} : -epsilon <= (sum{j in nombres}x[j]*d[j,i])-1 <= epsilon;
subject to critereP1{i in anglesP} : (sum{j in nombres}x[j]*d[j,i])-1-epsilon <= 0;
subject to critereP2{i in anglesP} : 0 <= epsilon+(sum{j in nombres}x[j]*d[j,i])-1 ;

#subject to critereS{i in anglesS} : -epsilon <= (sum{j in nombres}x[j]*d[j,i]) <= epsilon;
subject to critereS1{i in anglesS} : 0 <= epsilon+(sum{j in nombres}x[j]*d[j,i]) ;
subject to critereS2{i in anglesS} : (sum{j in nombres}x[j]*d[j,i])-epsilon <=0;

option solver cplex; 
solve; 


# print les variables dans un fichier
for{i in nombres}{
printf "%f \n", x[i] > 4445.txt;
}



   
