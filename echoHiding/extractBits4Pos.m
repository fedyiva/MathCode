function bits = extractBits4Pos(N,n0,dn0,a,z,Fs)
%Extrat in y random bits

[Num,tmp]=size(z);
Num=floor(Num/N);

bits=zeros(Num,1);


for i=1:2:Num-1
    [bits(i), bits(i+1)]=extractBit4Pos(z,Fs,i*N,(i+1)*N-1,a,n0,dn0);
end


end 