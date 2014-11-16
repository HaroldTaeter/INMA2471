function d = diagrammeM(n)
format long;

theta = linspace(0,pi/2,n);
N = 40;
r = (1:N)/10;

d = zeros(N,n);

for i = 1:40
    for j = 1:n
        d(i,j) = 0.5*quad(@(phi)(cos(2*pi*r(i)*cos(theta(j))*cos(phi))),0,2*pi);
    end
end

%dlmwrite('d.dat',[404 linspace(0,90,n); (1:40)' d],'precision','%.10f');
%dlmwrite('antenne.dat',[(1:40) linspace(0,90,n)],'precision','%.10f');
%dlmwrite('d.txt',d,'precision','%.10f');
end

