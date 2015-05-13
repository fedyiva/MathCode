function pErr =pError2PosNTimes(N,n0,dn0,a,y,Fs,kol)


[z,bits]=insertRandBits2PosNTimes(N,n0,dn0,a,y,Fs,kol);
exbits=extractBits2PosNTimes(N,n0,dn0,a,z,Fs,kol);

ErrorVect=exbits-bits;

subplot(2,1,1);
plot(y);
subplot(2,1,2);
plot(ErrorVect);

MinusK=0;
PlusK=0;

[m,tmp]=size(ErrorVect);

for i=1:m
    if(ErrorVect(i)<0)
        MinusK=MinusK+1;
    else
        if(ErrorVect(i)>0)
            PlusK=PlusK+1;
        end
    end
end


pErr=(abs(MinusK)+abs(PlusK))./m;

if(MinusK>PlusK)
    pErr=-pErr;



end