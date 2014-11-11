function diagramme()
theta = pi*(0:90)/180;
N = 40;
r = (1:N)/10;

d = zeros(N,91);

for i = 1:40
    for j = 1:91
        d(i,j) = 0.5*quad(@(phi)(cos(2*pi*r(i)*cos(theta(j))*cos(phi))),0,2*pi);
    end
end

X=load('results.txt');
%size(X)
D=zeros(1,91);
for i = 1:91   
    D(i)=(d(:,i)'*X);
    
end

plot(0:90,D);
%csvwrite('d.csv',d');
end

