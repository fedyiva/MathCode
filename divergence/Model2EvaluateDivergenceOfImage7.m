function [ DivXY DivYX pE] = Model2EvaluateDivergenceOfImage7( directoryCM,ext,dim,T,pEmb,visual,stegosys,amplitude,blkLen)
% Takes HUGO/SPAM features for estimation
%Separating each CM image into two ajacents subset - like chess
%board.Leaving white cells as is, and embedding into black cells.


cmDirWhite=[directoryCM 'cmWhite\'];
cmDirBlack=[directoryCM 'cmBlack\'];

if(exist(cmDirWhite,'dir')==0)
    mkdir(cmDirWhite);
end
if(exist(cmDirBlack,'dir')==0)
    mkdir(cmDirBlack);
end


split_images3b(directoryCM,cmDirWhite,cmDirBlack,ext,blkLen);



[ DivXY DivYX pE] = Model2EvaluateDivergenceOfImage6( cmDirWhite,cmDirBlack,ext,dim,T,pEmb,visual,stegosys,amplitude);
end

