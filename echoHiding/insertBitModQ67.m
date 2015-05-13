function [Res] = insertBitModQ67(y,oldRes,bit,N1,N2,b0,b1,y0,y1,Smoothing)


N=N2-N1+1;

nSm=floor(Smoothing*N);


a=[(1/(2*nSm-1)).*(1:2*nSm)+(1/(1-2*nSm)) ones(1,N-2*nSm) (1/(1-2*nSm)).*(1:2*nSm)+(1-1/(1-2*nSm))];

Res=oldRes;
 
 if(nSm==0)
     if(bit==1)
            x1=N1;
            x2=N2;
            Res(x1:x2)=y1(x1:x2);                 
     else
            Res(N1:N2)=y0((N1:N2));            
     end     
 else 
    if(N1<=N||numel(y)-N2<=N)
       if(numel(y)-N2<=N)
           if(bit==1)            
                Res(N1-nSm:N2)=Res(N1-nSm:N2)+a(1:N+nSm).*y1(N1-nSm:N2);     
            else            
                Res(N1-nSm:N2)=Res(N1-nSm:N2)+a(1:N+nSm).*y0(N1-nSm:N2);          
            end
       else
           if(bit==1)            
                Res(N1:N2+nSm)=Res(N1:N2+nSm)+a(numel(a)-N-nSm+1:numel(a)).*y1(N1:N2+nSm);     
           else            
                Res(N1:N2+nSm)=Res(N1:N2+nSm)+a(numel(a)-N-nSm+1:numel(a)).*y0(N1:N2+nSm);      
            end
       end
    else
        if(bit==1)
            x1=N1-nSm;
            x2=N2+nSm;
            
            Res(x1:x2)=Res(x1:x2)+a.*y1(x1:x2);     
        else
            x1=N1-nSm;
            x2=N2+nSm;
            
            Res(x1:x2)=Res(x1:x2)+a.*y0(x1:x2);

        end
    end
 end






end