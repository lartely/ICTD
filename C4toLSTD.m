function [ LSTD ] = C4toLSTD( c4 )
%Lossless and Sufficient target decomposition


span=norm(c4);
c4=c4./span;
sigma=1/4*angle(c4(3)*conj(c4(2)));
phi=1/4*angle(c4(4)*conj(c4(1)));


Rcg1=[1 0 0 0;0 exp(-1i*2*-sigma) 0 0; 0 0 exp(1i*2*-sigma) 0;0 0 0 1];
Rcg2=[exp(-1i*2*-phi) 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 exp(1i*2*-phi)];
c4_new=Rcg2*Rcg1*c4;

gamma=1/4*angle(conj(c4_new(1))*c4_new(2));
alpha=acos(sqrt(abs(c4_new(2))^2+abs(c4_new(3))^2));


if abs(alpha-pi/2)<eps
    nr=0;
else
    sigmac=acos(abs(c4_new(2))/cos(alpha)*norm(c4));
    nr=cos(alpha)^2*(cos(sigmac)^2-sin(sigmac)^2);
end

if abs(alpha)<eps
    hel=0;
else
    betac=acos(abs(c4_new(1))/sin(alpha)*norm(c4));
    hel=sin(alpha)^2*(cos(betac)^2-sin(betac)^2);
end

LSTD=[sigma phi alpha/pi*180 hel nr gamma/pi*180 span];
end

