function imgPatch=build_samples(CImages,M,N,isColor)
% imgPatch=build_samples(CImages,M,N) generates N image patches of size [M
% M] by randomly uniformly sampling from CImages.
% INPUT
% CImages : input image stacks. They could be color images or gray images.
% M : side length of the image pacth
% N : number of image patches
% isColor : flag indicating whether the input image stack is RGB or gray.
% OUTPUT
% imgPatch : imgPatch is [M M N] matrix if the input images are gray;
%            imgPatch is [M M*3 N] matrix if the input images are RGB.

if isColor==false
    [m1,m2,n]=size(CImages);
    imgPatch=zeros(M,M,N);
    for i=1:N
        k=randsample(n,1);
        x=randsample(m1-M+1,1);
        y=randsample(m2-M+1,1);
        patch=CImages(x:x+M-1,y:y+M-1,k);
        imgPatch(:,:,i)=patch;
    end
else
    [m1,m2,~,n]=size(CImages);
    imgPatch=zeros(M,M,3,N);
    for i=1:N
        k=randsample(n,1);
        x=randsample(m2-M+1,1);
        y=randsample(m1-M+1,1);
        patch=CImages(y:y+M-1,x:x+M-1,:,k);
        imgPatch(:,:,:,i)=patch;
    end
    imgPatch=reshape(imgPatch,[M,M*3,N]);
end