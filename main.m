clear;close all
%-----------------------------------------------------------------------------------------------------------------
%将彩色图片转化为数字矩阵，由不同数字的笔画不同，可展现不同颜色深浅。将矩阵复制进word中，可显示图像
% 
%步骤：
%1.打开word，将字体调为times new Roman，字号5，行距2.5磅（这是由于我们想展现的图像为167*166，根据图像的大小可自行调节）
%2.选好图片，根据图片大小修改程序，本程序只用到了4个数字，由浅到深依次为7、1、3、8
%3.运行程序后复制矩阵进word，制表符需要全部清除，并分散对齐，这样就能看到数字组成的图像了
%
%本实例图片为1.jpg，效果图如2.jpg
%-----------------------------------------------------------------------------------------------------------------

%import picture
A=imread('1.jpg');
figure,imshow(A);

%rgb to gray
B=rgb2gray(A);
figure,imshow(B);

%crop 剪裁
rect=[450,0,1000,1000];
C=imcrop(B, rect);
figure,imshow(C);

%压缩图像
D=C(1:6:end,1:6:end-6);
figure,imshow(D);

%generate the matrix
E=ones(167,166);
for i=1:167
    for j=1:166
        if(D(i,j)<65)
            E(i,j)=8;
            continue
        end
        if(D(i,j)>64 && D(i,j)<64*2+1)
            E(i,j)=3;
            continue
        end
        if(D(i,j)>64*2 && D(i,j)<64*3+1)
            E(i,j)=1;
            continue
        end
        if(D(i,j)>64*3 && D(i,j)<256)
            E(i,j)=7;
            continue
        end
    end
end
        


