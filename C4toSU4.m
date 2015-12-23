function [ su4 ] = C4toSU4( c4 )
%C4TOSU4 Summary of this function goes here
% Household transform from normilized C4 to SU4
su4=eye(4)-2/(c4'*c4)*c4*(c4)';
su4=su4*1i;
end
