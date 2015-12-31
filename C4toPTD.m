function [ PTD ] = C4toPTD( c4 )
%C4TOPTD Proposed method

span=norm(c4);
c4=c4./span;
sigma=1/4*angle(c4(3)*conj(c4(2)));
phi=1/4*angle(c4(4)*conj(c4(1)));

Rcg1=[1 0 0 0;0 exp(-1i*2*-sigma) 0 0; 0 0 exp(1i*2*-sigma) 0;0 0 0 1];
Rcg2=[exp(-1i*2*-phi) 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 exp(1i*2*-phi)];
c4_new=Rcg2*Rcg1*c4;

gamma=1/4*angle(conj(c4_new(1))*c4_new(2));
if abs(gamma*4+pi)<eps
    gamma=0;
end
Rcg3=[exp(-1i*2*-gamma) 0 0 0; 0 exp(1i*2*-gamma) 0 0; 0 0 exp(1i*2*-gamma) 0;0 0 0 exp(-1i*2*-gamma)];
c4_new=Rcg3*c4_new;



decompc4=decompsu4(C4toSU4(c4_new));
hel=-(decompc4(1)+decompc4(3))/pi;
nr=-decompc4(2)*2/pi+1-hel;
if abs(abs(hel)+abs(nr)-1)<eps
    alpha=0;
else
    alpha=asin(sqrt(1-(2/pi*decompc4(1)-abs(nr)+hel)/(1-abs(hel)-abs(nr))));
end
PTD=[sigma phi alpha/pi*180 hel nr gamma/pi*180 span];

end

