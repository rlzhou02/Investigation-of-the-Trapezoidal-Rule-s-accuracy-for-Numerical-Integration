format long g
filename='E:\testexp4.xlsx';
a=1;
b=2;
h=0;
k=0;
sl=0;



%tv=1./para.*(exp(b*para)-exp(a*para));
%disp(tv);

aa=zeros(10,1); %absolute value
bb=zeros(10,1);  %difference
dd=zeros(10,1);
ee=zeros(10,1);
for i =1:5
    k=10.^i;
    h=(b-a)./k;
    ss=0;
    cc=0;
    for j=1:(k+1)
        evalue=exp((a+(j-1).*h).^2);
        ss=ss+evalue.*h;
        if j<(k+1)
            sl=(exp((a+j.*h).^2)-evalue)./h;
            err=evalue+h*0.5*sl;
            cc=cc+err-exp((a+(j-1).*h+0.5.*h).^2);
        end
    end
    ss=ss-(exp(a.^2)+exp(b.^2)).*0.5.*h;
    %%ss=ss*h;
    aa(i,1)=ss;
    %%disp(ss);
    %bb(i,1)=tv-ss;
    dd(i,1)=cc./k;
    bb(i,1)=dd(i,1)*(b-a)*(2/3);
    ee(i,1)=aa(i,1)-bb(i,1);
end;
xlswrite(filename,aa,1);
xlswrite(filename,bb,2);
xlswrite(filename,dd,3);
xlswrite(filename,ee,4);