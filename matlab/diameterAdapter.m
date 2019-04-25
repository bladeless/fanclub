function [diAdap] = diameterAdapter(radTop, radBot)
if nargin~= 2
    radTop = 48; % inner diameter of top
    radBot = 89; % outer diameter of bottom
end
diaAdaThick = 6;
diaLipH = 15;
height4 = diaLipH + abs(radBot-radTop);

radii = [radBot-diaAdaThick,radBot,radBot,radTop+diaAdaThick/2,radTop+diaAdaThick/2,radTop,radTop,radTop-diaAdaThick/2,radTop-diaAdaThick/2,radBot-diaAdaThick,radBot-diaAdaThick];
res = 100;

[x, y, z] = cylinder(radii, res);

z([1,2],:) = 0;
z(3,:) = diaLipH;
z(4,:) = height4;
z(5,:) = height4 + diaLipH;
z(6,:) = height4 + diaLipH;
z(7,:) = height4 + diaLipH/2;
z(8,:) = height4 + diaLipH/2;
z(9,:) = height4;
z(10,:) = diaLipH;
z(11,:) = 0;


surf(x,y,z);
axis equal;
%surf2stl('diameterAdapterMini.stl',x,y,z);
end