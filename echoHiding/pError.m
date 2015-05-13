function pErr =pError(N,n0,a,y,Fs)


[z,bits]=insertRandBits(N,n0,a,y,Fs);
exbits=extractBits(N,n0,a,z,Fs);

ErrorVect=exbits-bits;

subplot(2,1,1);
plot(y);
subplot(2,1,2);
%plot(ErrorVect);
bar(ErrorVect);
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