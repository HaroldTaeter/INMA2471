function diagrammePlot(tau)
format long;

if nargin == 0
    tau = 0;
end

d = dlmread('d.txt');
x = dlmread('4050.txt');

xtrue = x.*(1+rand(size(x))*2*tau-tau);

D = d'*xtrue;
plot(linspace(0,90,length(D)),D,'b');
end