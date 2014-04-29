function []=displayfilter(dict)
%displayfilter displays the 2D filters.
%INPUT
%dict: the input dictionary. Each row of dict corresponds to a square
%      filter.
r=sqrt(size(dict,2));
for i=1:r
    for j=1:r
        subplot(r,r,(i-1)*r+j);
        surface(reshape(dict((i-1)*r+j,:),r,r),'FaceColor',...
            'interp','EdgeColor','none','FaceLighting','phong');
        view(90,90)       
    end
end
end