%% Build Samples
I=double(imread('../data/barbara.png'));
tic
imgPatch=build_samples(I,25,100,0);
toc
imdisp(reshape(imgPatch,[25,25,1,100]))

I=double(imread('../data/bird.jpg'));
tic
imgPatch=build_samples(I,50,100,1);
toc
imagesc(reshape(imgPatch(:,:,20)/255,[50,50,3]))

%% Learn Filters
I=double(imread('../data/barbara.png'));
opts.r=8;
opts.N=5000;
opts.isColor=false;
if opts.isColor==true
    opts.patchSize=[opts.r, opts.r*3];
else
    opts.patchSize=[opts.r, opts.r];
end
opts.nFilter=opts.r*opts.r;
opts.lambda=30;
opts.maxIter=100;
tic
imgPatch=build_samples(I,opts.r,opts.N,0);
toc
tic 
[dict,ratio]=train(imgPatch, opts);
toc

%% Adaptive Wavelet Tight Frame Transform
% This is a demonstration of the adaptive wavelet tight frame transform of
% multiple layers at different downsampling factors. The dictionary is assumed
% to have a unique low frequency filter which is the first one.
I=double(imread('../data/barbara.png'));
I=I/255;
dict=sortdict(dict)/sqrt(trace(dict'*dict));
tic
st=mtfdec2(I, dict, 2,'sym',2);
recImg=mtfrec2(st);
toc
psnr(I,recImg)

















