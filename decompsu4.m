function [ paras ] = decompsu4( SU4 )
%DECOMPSU4 Summary of this function goes here
%   decompose SU4 under the basis L(SU4)
su=logm(SU4);
paras=zeros(1,15);
paras(1)=imag(su(1,1));
paras(2)=imag(su(2,2))+paras(1);
paras(3)=-imag(su(4,4));
paras(4)=real(su(1,2));
paras(5)=real(su(1,3));
paras(6)=real(su(1,4));
paras(7)=real(su(2,3));
paras(8)=real(su(2,4));
paras(9)=real(su(3,4));
paras(10)=imag(su(1,2));
paras(11)=imag(su(1,3));
paras(12)=imag(su(1,4));
paras(13)=imag(su(2,3));
paras(14)=imag(su(2,4));
paras(15)=imag(su(3,4));
end

