function [dict, ratio]=train(imgPatch, opts)
%[dict,recImg,ratio]=train(imgPatch,opts) learns the filters from the input
%data imgPatch as specified by opts.
%INPUT
%imgPatch : 3-D matrix of image patches. The 3rd dimension is the total
%           number of image patches.
%opts     : the parameters.
%OUTPUT
%dict     : the learned dictionary. Each row corresponds to a filter.
%recImg   :
[m,n,p]=size(imgPatch);
data_matrix=reshape(imgPatch,[m*n,p]);
[norm_data_matrix,norm_data]=normalize(data_matrix);
[dict,H]=adm(norm_data_matrix,opts);
%recVec=dict'*H;
%recVec=recVec.*repmat(norm_data,[size(data_matrix,1),1]);
ratio=numel(data_matrix)/nnz(H);
dict=sortdict(dict);
%recImg=reshape(recVec,[m,n,p]);
end

function [NX,A]=normalize(X)
A=sqrt(sum(X.^2)+1e-8);
NX=X./repmat(A,[size(X,1),1]);
end