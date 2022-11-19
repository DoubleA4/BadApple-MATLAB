clear;

path = './output/';
dir = dir([path '*.jpg']);
fps = 15;
frametime = 1/fps;

for i = 1:length(dir)
    clc;
    disp("processing... " + i);
    img = imread([path dir(i).name]);
    img = rgb2gray(img);
    roberts = edge(img,'roberts');
    
    [x,y] = find(roberts==1);
    output(i).x = x;
    output(i).y = y;
end

disp("Done!");
disp("Playing...");

for i = 1:length(dir)
    tic;
    xout = output(i).x;
    yout = output(i).y;
    scatter(yout,-xout,'.');
    axis([0 480 -360 0]);
    pause(frametime - toc);
end
close;
disp("Finished!");