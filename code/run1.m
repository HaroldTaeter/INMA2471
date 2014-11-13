function run1()
% script pour la question 1
% En gros ça fait les graphes :-)
close all; 
clear all;
format long
% 
theta = pi*(0:90)/180;
N = 40;
r = (1:N)/10;

%d1=csvread('d1.csv');
%d=csvread('d.csv');

d = zeros(N,91);

for i = 1:40
    for j = 1:91
       d(i,j) = 0.5*quad(@(phi)(cos(2*pi*r(i)*cos(theta(j))*cos(phi))),0,2*pi);
    end
end

%dlmwrite('dlong.csv',d,'precision', '%.10f');
%csvwrite('d.csv',d);


X=load('results4050.txt');
D4050=d'*X;

X=load('results4248.txt');
D4248=d'*X;

X=load('results4445.txt');
D4445=d'*X;


figure
plot(0:90,D4050,'b',50:90,(1+0.01716135157)*ones(41,1),'r', ...
                    50:90,(1-0.01716135157)*ones(41,1),'r', ...
                    0:40,(0.01716135157)*ones(41,1),'r', ...
                    0:40,(-0.01716135157)*ones(41,1),'r')

figure
plot(0:90,D4050,'b',0:90,D4248,'g',0:90,D4445,'k');
legend('thetaS=40, thetaP=50','thetaS=42, thetaP=48','thetaS=44, thetaP=45','Location','SouthEast')




% 
% X=load('results4050.txt');
% D4050=d1'*X;
% 
% X=load('results4248.txt');
% D4248=d1'*X;
% 
% X=load('results4445.txt');
% D4445=d1'*X;
% 
% 
% figure
% plot(0:90,D4050,'b',50:90,(1+0.0251264)*ones(41,1),'r', ...
%                     50:90,(1-0.0251264)*ones(41,1),'r', ...
%                     0:40,(0.0251264)*ones(41,1),'r', ...
%                     0:40,(-0.0251264)*ones(41,1),'r')


end








