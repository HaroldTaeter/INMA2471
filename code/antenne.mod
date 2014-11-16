reset; 

param thetaS; 
param thetaP;
set angles;
set anglesP;
set anglesS;
set nombres;

data antenne.dat;

param rayons{nombres};
for {i in nombres}{
	let rayons[i]:=i/10;
}
param d{nombres,angles};

var epsilon >=0;
var x{nombres};

minimize objectif : epsilon;

data d.dat;

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
printf "%f \n", x[i] > 4050.txt;
}



   
