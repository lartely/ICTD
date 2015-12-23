init;%Generate the mapping from SU4 to SO6
sc=cell(1,13);%Typical Targets sc
sc{1}=[0 1j 1j 0];%Trihedral
sc{2}=[1 3j 3j -1];%Cylinder
sc{3}=[1 1j 1j -1];%Dipole
sc{4}=exp(-1j*pi/4)*[1 -1 -1 -1];%Wave quarter delayer
sc{5}=exp(1j*pi/4)*[1 1 1 -1];%Wave quarter advancer
sc{6}=[3 1j 1j -3];%Narrow diplane
sc{7}=[1 0 0 -1];%Dihedral
sc{8}=[1 0 0 0];%Right helix
sc{9}=[0 0 0 -1];%Left helix
sc{10}=[0 1 0 0];%Non reciprocal +
sc{11}=[0 0 1 0];%Non reciprocal -

for i=1:11%Norm the sc
    sc{i}=sc{i}/norm(sc{i});
    sc{i}=sc{i}.';
end

sc{12}=sc{1}+sc{8};%Trihedral&Right helix
sc{13}=sc{7}+sc{10};%Dihedral&%Non reciprocal +

for i=1:13
disp('**************************************');
disp(sprintf('No.%d',i));
disp('c')
disp(sc{i})
disp('Represantation under SO6')
disp(SU4toR6( C4toSU4(sc{i})))%Represantation under SO6
disp('Results of proposed method')
PTD=C4toPTD(sc{i});
disp(sprintf('alpha \t helix \t nr'))
disp(sprintf('%5.2f\t%5.2f\t%5.2f',PTD(3),PTD(4),PTD(5)));

disp('Results of LSTD method')
LSTD=C4toLSTD(sc{i});
disp(sprintf('alpha \t helix \t nr'))
disp(sprintf('%5.2f\t%5.2f\t%5.2f',LSTD(3),LSTD(4),LSTD(5)));
disp('**************************************');
end
