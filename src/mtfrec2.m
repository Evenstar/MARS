function recImg=mtfrec2(st)
L=st.L;
f=st.df;
dict=st.dict;

for l=L:-1:1
    Dict=dict;
    if st.df==1
        for j=1:l-1
            Dict=doublefilter(Dict);
        end
    end
    r=sqrt(size(Dict,2));
    if l>1
        imgSize=size(st.coef{l-1}{2});
    else
        imgSize=st.imgSize;
    end
    recImg=zeros(imgSize);
    coef=st.coef{l};
    for i=1:size(Dict,1)
        a=reshape(Dict(i,:),[r,r]);
        a=rot90(a,2);
        if st.df==1
            temp=conv2(coef{i},a,'valid');
        else
            temp=transpose(upsample(transpose(upsample(coef{i},f)),f));
            temp=conv2(temp,a,'valid');
        end
        recImg=recImg+temp(1:imgSize(1),1:imgSize(2));
    end   
    recImg=recImg;
    if l>1
        st.coef{l-1}{1}=recImg/r/r;
    end
end
recImg=recImg;
end