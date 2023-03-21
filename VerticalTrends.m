format long e
filename='E:\exp0-3.xlsx';
a=double(0);
b=double(3);
h=double(0.0);
k=double(0.0);
sl=double(0.0);
err=double(0.0);

%para=6;

time=6;
aaa=zeros(10,20); %absolute value
bbb=zeros(10,20);  %difference
ddd=zeros(10,20);
eee=zeros(10,20);
fff=zeros(10,20);
ggg=zeros(10,20);

aa=double(aaa);
bb=double(bbb);
dd=double(ddd);
ee=double(eee);
ff=double(fff);
gg=double(ggg);


for para=1:time

tv=double(1./para.*(exp(b*para)-exp(a*para)));
disp(tv);


for i =1:7
    k=10.^i;
    h=(b-a)./k;
    ss=double(0.0);
    cc=double(0.0);
    for j=1:(k+1)
        evalue=double(exp(para.*(a+(j-1).*h)));
        ss=ss+evalue.*h;
        if j<(k+1)
            sl=(exp(para.*(a+j.*h))-evalue)./h;
            err=evalue+0.5*h*sl;
            cc=cc+err-exp(para.*(a+(j-1).*h+0.5.*h)); %sum of vertical difference
        end
    end
    ss=ss-(exp(a*para)+exp(b*para)).*0.5.*h;
    %%ss=ss*h;
    aa(i,para)=ss;
    %%disp(ss);
    bb(i,para)=ss-tv;
    ee(i,para)=log10(bb(i,para));
    dd(i,para)=cc./k; 
    ff(i,para)=log10(dd(i,para));
    gg(i,para)=bb(i,para)./dd(i,para);
end;
%disp(bb(time,1)); 
%disp(dd(time,1));
%disp(bb(time,1)./dd(time,1));
%disp('11111');
end;
xlswrite(filename,bb,1);
xlswrite(filename,dd,2);
xlswrite(filename,ee,3);
xlswrite(filename,ff,4);
xlswrite(filename,gg,5);
xlswrite(filename,aa,6);



%disp(aa);
