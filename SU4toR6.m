function [ R6 ] = SU4toR6( SU4 )
global mapSU4R6
%SU4TOR6 Summary of this function goes here
%   Mapping a SU4 matrix to be a SO6 matrix 
paras=decompsu4( SU4 );
R6=zeros(6);
for i=1:3
    R6=R6+mapSU4R6{i}.*paras(i);
end
R6=expm(R6);
end

