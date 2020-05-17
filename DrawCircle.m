imshow(AfterAdjustpic, 'Parent', handles.EyePhoto2);   %輸出右圖片
axis image;                                 %調整圖片大小
hold on;
x = 120;
y = 120;
r = 120 * 5 / 9;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit,'red');