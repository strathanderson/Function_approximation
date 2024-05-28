clear all, close all, clc

n = 8;
R = 8;
b = R*rand(n,1);
w = R*rand(n,1);
%w = ones(n,1);
%b = -linspace(0,1,n);
L = pi;
for i=1:n
    for j=1:n
        if w(i) ~= w(j)
            M(i,j) = 1/2/(w(i)-w(j))*sin(L*w(i)-L*w(j)+b(i)-b(j))-...
                1/2/(w(i)+w(j))*sin(L*w(i)+L*w(j)+b(i)+b(j))-...
                1/2/(w(i)-w(j))*sin(b(i)-b(j))+...
                1/2/(w(i)+w(j))*sin(b(i)+b(j));
        else
            M(i,j) = (2*L*cos(b(i)-b(j))*w(i)-sin(2*L*w(i)+b(i)+b(j)) +...
                sin(b(i)+b(j)))/(4*w(i));
        end
    end
end
eig(M)
cond(M)