%init 
%Generate the mapping from SU4 to SO6
global su4 mapSU4R6
%so6%
n=6;
E=cell(n,n);
Ezero=zeros(n,n);
for i=1:n
    for j=1:n
        tmp=Ezero;
        tmp(i,j)=1;
        E{i,j}=tmp;
    end
end

R=cell(n,n);
for i=1:n
    for j=1:n
        R{i,j}=E{i,j}-E{j,i};
    end
end

%su4%

n=4;
E=cell(n,n);
Ezero=zeros(n,n);
tmp=Ezero;
for i=1:n
    for j=1:n
        tmp=Ezero;
        tmp(i,j)=1;
        E{i,j}=tmp;
    end
end

X=cell(n,n);
for i=1:n
    for j=1:n
        X{i,j}=E{i,j}-E{j,i};
    end
end

Y=cell(n,n);
for i=1:n
    for j=1:n
        Y{i,j}=1i*(E{i,j}+E{j,i});
    end
end

T1=1i*(E{1,1}-E{2,2});
T2=1i*(E{2,2}-E{3,3});
T3=1i*(E{3,3}-E{4,4});

%map%
n=6;
mapR6SU4=cell(n,n);
mapR6SU4{1,2}=T1+T3;
mapR6SU4{1,3}=X{1,2}+X{3,4};
mapR6SU4{2,3}=-Y{1,2}-Y{3,4};
mapR6SU4{1,4}=-Y{1,2}+Y{3,4};
mapR6SU4{2,4}=-X{1,2}+X{3,4};
mapR6SU4{3,4}=T1-T3;
mapR6SU4{1,5}=Y{1,4}+Y{2,3};
mapR6SU4{2,5}=X{1,4}-X{2,3};
mapR6SU4{3,5}=-Y{1,3}+Y{2,4};
mapR6SU4{4,5}=-X{1,3}-X{2,4};


mapR6SU4{1,6}=X{1,4}+X{2,3};
mapR6SU4{2,6}=-Y{1,4}+Y{2,3};
mapR6SU4{3,6}=-X{1,3}+X{2,4};
mapR6SU4{4,6}=Y{1,3}+Y{2,4};
mapR6SU4{5,6}=T1+2*T2+T3;

for i=1:5
    for j=i:6
        mapR6SU4{i,j}=mapR6SU4{i,j}/2;
    end
end

%mapR6SU4%
n=15;
su4=cell(1,n);
su4{1}=T1;
su4{2}=T2;
su4{3}=T3;
su4{4}=X{1,2};
su4{5}=X{1,3};
su4{6}=X{1,4};
su4{7}=X{2,3};
su4{8}=X{2,4};
su4{9}=X{3,4};
su4{10}=Y{1,2};
su4{11}=Y{1,3};
su4{12}=Y{1,4};
su4{13}=Y{2,3};
su4{14}=Y{2,4};
su4{15}=Y{3,4};

mapSU4R6=cell(1,n);
mapSU4R6{1}=R{1,2}+R{3,4};
mapSU4R6{2}=R{5,6}-R{1,2};
mapSU4R6{3}=R{1,2}-R{3,4};
mapSU4R6{4}=R{1,3}-R{2,4};
mapSU4R6{5}=-R{3,6}-R{4,5};
mapSU4R6{6}=R{1,6}+R{2,5};
mapSU4R6{7}=R{1,6}-R{2,5};
mapSU4R6{8}=R{3,6}-R{4,5};
mapSU4R6{9}=R{1,3}+R{2,4};
mapSU4R6{10}=-R{1,4}-R{2,3};
mapSU4R6{11}=R{4,6}-R{3,5};
mapSU4R6{12}=R{1,5}-R{2,6};
mapSU4R6{13}=R{1,5}+R{2,6};
mapSU4R6{14}=R{3,5}+R{4,6};
mapSU4R6{15}=R{1,4}-R{2,3};


