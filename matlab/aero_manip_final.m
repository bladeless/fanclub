function  [output] = aero_manip_final(vargin, des)
%% Input variables

if nargin ~= 2
initial_rotation = 0;
outlet_angle =  16;
outlet_separation =  1.3;
aerofoil_length = 100;
aerofoil_height = 30;
thickness = 2;
cone_angle = 19;
lip_height =  11;
lip_width =  4;
exit_edge_x =  4.5;
exit_edge_ang = 45;
revRad = 45;

%outlet_extension = 4;
% sweep
% choose sweep section
circle = 0;
oval = 0;
rectangle = 3;
% sweep parameters
sweep_height = 300; % diameter for circle
sweep_width = 200;
corner_diameter = 80; % for rectangle only
resolution = 400;
des = 1;
aerofoil_choice = 1;
%nargin = 1;
else
% aerofoil
aerofoil_choice = vargin(1);
initial_rotation = 0; % 13
outlet_angle = vargin(2); % 19
outlet_separation = vargin(3); % 1.3
aerofoil_length = vargin(4); % 100
aerofoil_height = vargin(5); % 28
thickness = vargin(6); % 1.5
cone_angle = vargin(7); % 16
lip_height = aerofoil_height*11/30;
lip_width = aerofoil_height*4/30;
%lip_height = vargin(8); % 9
%lip_width = vargin(9); % 6
exit_edge_x = vargin(10); % 2
exit_edge_ang = 45; % 45
revRad = vargin(18);

% sweep
% choose sweep section
circle = vargin(16);
oval = vargin(16);
rectangle = vargin(16);
% sweep parameters
sweep_height = vargin(12); % diameter for circle
sweep_width = vargin(13);
corner_diameter = vargin(14); % for rectangle only
resolution = 400;
end


% new choose swept section
%aerofoil_choice = 1;
e473 = table2array(readtable('e473.dat'));
e479 = table2array(readtable('e479.dat'));
if aerofoil_choice == 1
    basicFoil = e473;
elseif aerofoil_choice == 2
    basicFoil = e479;
end
basicFoil(1:2,:) = [];
basicFoil(31:60,:) = flipud(basicFoil(31:60,:));
basicFoil(length(basicFoil),:) = [];
[pos, locBot] = min(basicFoil(:,2));
[pos, locRight] = max(basicFoil(:,1));
aeroOver = basicFoil(locBot:length(basicFoil),:);
aeroOver = [aeroOver; basicFoil(1:locRight,:)];
aeroUnder = flipud(basicFoil(locRight:locBot,:));


aeroOverX = aeroOver(:,1);
aeroOverY = aeroOver(:,2);
aeroUnderX = aeroUnder(:,1);
aeroUnderY = aeroUnder(:,2);

%% Generate swept points

if circle == 1
    sweep(1,:) = [0,sweep_height/2];
    for i = 1:resolution
        sweep(i+1,:) = [(sweep_height/2)*sin(i*2*pi/resolution),(sweep_height/2)*cos(i*2*pi/resolution)];
    end
    sweep(:,2) = sweep(:,2)-sweep_height/2;
elseif oval == 2
    sweep(1,:) = [sweep_width/2,0];
    for i =1:resolution
        sweep(i+1,:) = [(sweep_width/2)*cos(i*2*pi/resolution),(sweep_height/2)*sin(i*2*pi/resolution)];
    end
    %sweep(:,1) = sweep(:,1)-sweep_width/2;
    sweep(:,2) = sweep(:,2)-sweep_height/2;
elseif rectangle == 3
    sweep(1,:) = [0,0];
    for i = 1:resolution/4
        sweep(i+1,:) = [sweep_width/2-corner_diameter/2+(corner_diameter/2)*sin(i*pi/(2*resolution/4)), -corner_diameter/2+(corner_diameter/2)*cos(i*pi/(2*resolution/4))];
    end
    sweep(resolution/4+2,:) = [sweep_width/2,corner_diameter/2-sweep_height/2];
    sweep(resolution/4+3:resolution/2+4,1) = flipud(sweep(1:resolution/4+2,1));
    sweep(resolution/4+3:resolution/2+4,2) = -sweep_height-flipud(sweep(1:resolution/4+2,2));
    sweep(resolution/2+5:resolution+8,1) = -flipud(sweep(1:resolution/2+4,1));
    sweep(resolution/2+5:resolution+8,2) = flipud(sweep(1:resolution/2+4,2));
    % Remove duplicate point
    sweep(resolution/2+5,:) = [];
    sweep(:,2) = sweep(:,2)+sweep_height/2;
    sweep(:,2) = sweep(:,2)-sweep_height/2;
    
end

%% Top side of aerofoil

% ensure aeroOver is flat before applying initial rotation

levelAng = atan((aeroOver(30,2)-aeroOver(31,2))/(aeroOver(30,1)-aeroOver(31,1)));
levelMat = [cos(levelAng) -sin(levelAng); sin(levelAng) cos(levelAng)];
aeroOver = aeroOver*levelMat;

% rotate initial angle
rotAng = -initial_rotation*2*pi/360;
RO = [cos(rotAng) -sin(rotAng); sin(rotAng) cos(rotAng)];
%aeroOver = [aeroOverX; aeroOverY];
%aeroOver = aeroOver'*RO;

aeroOver = aeroOver*RO;

% scale length and height
aeroOver(:,1) = aeroOver(:,1)*(aerofoil_length)/(abs(max(aeroOver(:,1))-min(aeroOver(:,1))));
aeroOver(:,2) = aeroOver(:,2)*aerofoil_height/(abs(max(aeroOver(:,2))-min(aeroOver(:,2))));
aOFinPos = [aeroOver(1,1),aeroOver(1,2)];

%plot(aeroOver(:,1),aeroOver(:,2));
% cut off points when curve reaches outlet angle
desAng = outlet_angle*2*pi/360;
step = sqrt((aeroOver(1,1)-aeroOver(2,1))^2+(aeroOver(1,2)-aeroOver(2,2))^2);
for i = 2:20
    currentAng(i) = pi/2 - atan((aeroOver(i,1)-aeroOver(i-1,1))/(aeroOver(i-1,2)-aeroOver(i,2)));
end
angPos = 0;
i=2;
while angPos ==0
    i=i+1;
    if currentAng(i)<desAng && currentAng(i+1)>desAng
        angPos = i+1;
        finPointPos = i;
    end
end
for i = 1:angPos-1
    aeroOver(angPos-i,1)= aeroOver(angPos,1) + step*i*cos(desAng);
    aeroOver(angPos-i,2)= aeroOver(angPos,2) - step*i*sin(desAng);
end
aeroOver(1:finPointPos-1,:) = [];
maxY = max(aeroOver(:,2));

% add tail edge
aeroOver(length(aeroOver)+1,1) = aeroOver(length(aeroOver),1)-exit_edge_x;
exit_edge_y = exit_edge_x*tan(exit_edge_ang*2*pi/360);
aeroOver(length(aeroOver),2) = aeroOver(length(aeroOver)-1,2)-exit_edge_y;
%plot(aeroOver(:,1),aeroOver(:,2));
%% Underside of aerofoil (cont. in Lip)

% half the number of points to calculate middle angle from
lengU = round(length(aeroUnder)/2,0);

% rotate so that mid point is at cone angle
cone_angle = cone_angle*2*pi/360;
curAng = atan((aeroUnder(lengU+1,2)-aeroUnder(lengU,2))/(aeroUnder(lengU+1,1) - aeroUnder(lengU,1)));
RU = [cos(curAng-cone_angle) -sin(curAng-cone_angle); sin(curAng-cone_angle) cos(curAng-cone_angle)];
aeroUnder = aeroUnder*RU;

wholeUnder = basicFoil*RU;

%% Lip Old

lipX = -1*[5.098, 12.521, 18.277, 20.552, 20.2552, 18.000, 15.001, 11.609, 9.245, 6.842, 5.596, 5.649, 5.443, 3.677, 0.976, -2.827, -7.319, -13.148, -21.034];
lipY = [-16.986, -14.350, -10.610, -7.203, -3.510, 1.152, 3.913, 5.288, 5.223, 3.707, 0.971, -2.872, -7.481, -11.019, -13.332, -14.809, -15.698, -16.212, -15.698];

% change height and width scaling to later as botch fix. scale to 30/9
% because and 30/6

iLipHeight = aerofoil_height*9/30;
iLipWidth = aerofoil_height*6/30;

% scale to lip height (and width)
lipH1 = max(lipY)-min(lipY);
lipW1 = abs(lipX(4)-lipX(11));
%lipX = lipX*lip_width/lipW1;
%lipY = lipY*lip_height/lipH1;
%lipX = lipX*lip_height/lipH1;
lipX = lipX*iLipWidth/lipW1;
lipY = lipY*iLipHeight/lipH1;
underEndAng = atan((aeroUnder(1,2)-aeroUnder(2,2))/(aeroUnder(2,1)-aeroUnder(1,1)));
lip = [lipX; lipY];
lip = lip';

% matches top side of lip to top side of aeroUnder
lipAng = atan((lip(length(lip)-2,2)-lip(length(lip)-1,2))/(lip(length(lip)-1,1)-lip(length(lip)-2,1)));
RL = [cos(-(lipAng-underEndAng)) -sin(-(lipAng-underEndAng)); sin(-(lipAng-underEndAng)) cos(-(lipAng-underEndAng))];
lip = lip*RL;
lip(length(lip)-1:length(lip),:) = [];
lipXMove = aeroUnder(1,1)-lip(length(lip),1);
lipYMove = aeroUnder(1,2)-lip(length(lip),2);
lip(:,1) = lip(:,1)+lipXMove;
lip(:,2) = lip(:,2)+lipYMove;

% delete point lipDes-1 and make new point at outlet_angle same distance away from lipDes
lipAngOG = 0;
for i = 2:7
    lipAngOG(i) = rad2deg(pi/2 - atan((lip(i,1)-lip(i-1,1))/(lip(i-1,2)-lip(i,2))));
end
for i = 2:7
    if lipAngOG(i)>outlet_angle && lipAngOG(i-1)<outlet_angle
        lipDes = i;
    end
end
lipDist = sqrt((lip(lipDes,1)-lip(lipDes-1,1))^2+(lip(lipDes,2)-lip(lipDes-1,2))^2);
lip(1:lipDes-2,:) = [];
newLipPos(1) = lip(1,1)+lipDist*cos(deg2rad(outlet_angle));
newLipPos(2) = lip(1,2)-lipDist*sin(deg2rad(outlet_angle));
lip = [newLipPos;lip];

yDes = abs(aeroOver(length(aeroOver),2)-aeroOver(1,2)) - (lip(length(lip),2)-lip(1,2)) - outlet_separation*sin(deg2rad(90-outlet_angle)); %
yInitial = abs(aeroUnder(1,2)-aeroUnder(length(aeroUnder),2));
aeroUnder = aeroUnder*yDes/yInitial;
wholeUnder = wholeUnder*yDes/yInitial;
% hold on; axis equal; plot(aeroOver(:,1), aeroOver(:,2)); plot(lip(:,1), lip(:,2)); plot(wholeUnder(:,1), wholeUnder(:,2)); plot(aeroUnder(:,1), aeroUnder(:,2));
heightMove = aeroOver(length(aeroOver),2) - aeroUnder(length(aeroUnder),2);

aeroUnder(:,2) = aeroUnder(:,2) + heightMove;
wholeUnder(:,2) = wholeUnder(:,2) + heightMove;

mult2 = aeroOver(1,1)-aeroUnder(1,1)-(lip(1,1)-lip(length(lip),1))+outlet_separation*cos(deg2rad(90-outlet_angle));
aeroUnder(:,1) = aeroUnder(:,1)+mult2;
wholeUnder(:,1) = wholeUnder(:,1)+mult2;



% move lip
lipMov(1) = aeroOver(1,1)+outlet_separation*cos(deg2rad(90-outlet_angle))-lip(1,1);
lipMov(2) = aeroOver(1,2)+outlet_separation*sin(deg2rad(90-outlet_angle))-lip(1,2);
lip(:,1) = lip(:,1)+lipMov(1);
lip(:,2) = lip(:,2)+lipMov(2);


%% Add offsets

% offset

offL = length(aeroOver)-1;

%[aeroOverOff(1:offL,1), aeroOverOff(1:offL,2)] = offsetCurve(aeroOver(1:offL,1),aeroOver(1:offL,2),thickness);
[aeroOverOff(:,1), aeroOverOff(:,2)] = offsetCurve(aeroOver(:,1),aeroOver(:,2),thickness);
[aeroUnderOff(:,1), aeroUnderOff(:,2)] = offsetCurve(aeroUnder(:,1),aeroUnder(:,2),-thickness);

% adjust exit edge of offset aerofoil because the thickness in the
% horizontal section wasn't accurate
aeroOverOff(length(aeroOverOff),2) = aeroOver(length(aeroOver),2) - thickness;
aeroOverOff(length(aeroOverOff),1) = aeroOverOff(length(aeroOverOff)-1,1) - (aeroOverOff(length(aeroOverOff)-1,2) - aeroOverOff(length(aeroOverOff),2))/tan(deg2rad(exit_edge_ang));

wholeXMov = aeroUnder(length(aeroUnder),1)-aeroUnderOff(length(aeroUnderOff),1);
wholeYMov = aeroUnder(length(aeroUnder),2)-aeroUnderOff(length(aeroUnderOff),2);

wholeUnder(:,1) = wholeUnder(:,1) + abs(wholeXMov);
wholeUnder(:,2) = wholeUnder(:,2) - abs(wholeYMov);


%% Move whole under foil so that it coincides with first point on lip
% - Assign to nearest point on whole under
maxDist = pdist([wholeUnder(1,:); lip(1,:)], 'euclidean');
for i = 1: length(wholeUnder)
    distank(i) = pdist([wholeUnder(i,:); lip(1,:)], 'euclidean');
    if distank(i) < maxDist
        maxDist = distank(i);
        closeIndex = i;
    end
end

xShift = lip(1,1) - wholeUnder(closeIndex,1);
yShift = lip(1,2) - wholeUnder(closeIndex,2);

wholeUnder(:,1) = wholeUnder(:,1) + xShift;
wholeUnder(:,2) = wholeUnder(:,2) + yShift;

% take actualUnder as the aerofoil from one point after where wholeUnder
% coincides with lip up to the point where wholeUnder x value is max.
[~, maxIndex] = max(wholeUnder(:,1));
actualUnder = wholeUnder(maxIndex:closeIndex-1,:);

% make sure highest point of actualUnder is moved to be same height as exit
% edge for aeroOverOff.
points2Del = 0;
for i = 1:length(actualUnder)/2
    if actualUnder(i,2) > aeroOverOff(length(aeroOverOff),2)
        points2Del = points2Del+1;
    end
end

% Don't delete last point thats too high, just move it down
actualUnder(1:points2Del-1,:) = [];
actualUnder(1,2) = aeroOverOff(length(aeroOverOff),2);

% if the last point was lower than the height, add a new point at the
% height and corresponding to the angle of the cone. (Might be a bit of a
% botch).
gamma = (atan(abs(actualUnder(6,2)-actualUnder(5,2))/abs(actualUnder(6,1)-actualUnder(5,1))));
if points2Del == 0
    firstUnder = actualUnder(2,1) + (actualUnder(1,2)-actualUnder(2,2))/tan(gamma);
    actualUnder(1,:) = [firstUnder, aeroOverOff(length(aeroOverOff),2)];
end


%% Lip and top side of aeroUnder adjustments to ensure that desired thickness is achieved.

% measure current thickness of underside by measuring the distance between a point in the middle of
% aeroUnder and the closest point from actualUnder. Use two closest points
% and take the average predicted thickness

midUnderIndex = round(length(aeroUnder)/2,0);
indexThick = 0;
minThick = pdist([aeroUnder(midUnderIndex,:); actualUnder(1,:)], 'euclidean');
for i = 1: length(actualUnder)
    currentThick(i) = pdist([actualUnder(i,:); aeroUnder(midUnderIndex,:)], 'euclidean');
    if currentThick(i) <= minThick
        minThick(2) = minThick(1);
        indexThick(2) = indexThick(1);
        minThick(1) = currentThick(i);
        indexThick(1) = i;
    end
end

% points dont exactly align so need to use trigonometry
underThickInit = triangleHeight(actualUnder(indexThick(1),:),actualUnder(indexThick(2),:),aeroUnder(midUnderIndex,:));
thickDif = thickness - underThickInit;
underXMov = thickDif*sin(cone_angle);
underYMov = thickDif*cos(cone_angle);

aeroUnder(:,1) = aeroUnder(:,1) + underXMov;
aeroUnder(:,2) = aeroUnder(:,2) + underYMov;

% remove points on aeroUnder that are too high and assign last point to
% desired height
tooHighCount = 0;
for i = 1: length(aeroUnder)
    if (aeroUnder(i,2) > aeroOver(length(aeroOver),2))
        tooHighCount = i;
        break
    end
end
if tooHighCount ~= 0
    aeroUnder(tooHighCount+1:length(aeroUnder),:) = [];
    aeroUnder(length(aeroUnder),2) = aeroOver(length(aeroOver),2);
end
% move lip so that first point moves full amount and last point moves
% nothing and there is a gradient in between

for i = 1: length(lip)
    lip(i,1) = lip(i,1) + underXMov*(i-1)/length(lip);
    lip(i,2) = lip(i,2) + underYMov*(i-1)/length(lip);
end

% now stretch lip to intended height and width without changing first and
% last points

cLipHeight = max(lip(:,2)) - min(lip(:,2));
cLipWidth = lip(10,1) - min(lip(:,1));

%preI = 4;
%jadjkls = (lip(1,1)*((length(lip)-preI)/length(lip))+lip(length(lip),1)*preI/length(lip))/2;

% height and width scale sithout moving the bottom (point A) or top (point
% B) of the lip

for i = 2: length(lip)-1
    % weighted average so that there is not step at one side
    
    weightB(i) = (i-1)/(length(lip)-2);
    weightA(i) = 1 - weightB(i);
    
    % if weight A = 1, ie stretches only relative to bottom of lip
    stretchA(i,1) = lip(1,1)+(lip(i,1)-lip(1,1))*lip_width/cLipWidth;
    stretchA(i,2) = lip(1,2)+(lip(i,2)-lip(1,2))*lip_height/cLipHeight;
    
    % vice versa
    stretchB(i,1) = lip(length(lip),1)+(lip(i,1)-lip(length(lip),1))*lip_width/cLipWidth;
    stretchB(i,2) = lip(length(lip),2)+(lip(i,2)-lip(length(lip),2))*lip_height/cLipHeight;
    
    % Scaling just wrt A makes it smooth at the bottom but messy at B
    lip(i,1) = weightA(i)*stretchA(i,1)+weightB(i)*stretchB(i,1);
    lip(i,2) = weightA(i)*stretchA(i,2)+weightB(i)*stretchB(i,2);
    
end

% Move all points so that the outlet is at 0,0
lastMovX = aeroOver(1,1);
lastMovY = aeroOver(1,2);

aeroOver(:,1) = aeroOver(:,1) - lastMovX;
aeroOver(:,2) = aeroOver(:,2) - lastMovY;
aeroUnder(:,1) = aeroUnder(:,1) - lastMovX;
aeroUnder(:,2) = aeroUnder(:,2) - lastMovY;
actualUnder(:,1) = actualUnder(:,1) - lastMovX;
actualUnder(:,2) = actualUnder(:,2) - lastMovY;
lip(:,1) = lip(:,1) - lastMovX;
lip(:,2) = lip(:,2) - lastMovY;
aeroOverOff(:,1) = aeroOverOff(:,1) - lastMovX;
aeroOverOff(:,2) = aeroOverOff(:,2) - lastMovY;

%% Diameter adapter
impAdaRad = 104;
diaAdaThick = 4;
chamferSize = 0.25;
diaAdaptRes = 100;
diaLipH = 20;
diaPoints(1,:) = [diaAdaThick,0];
diaPoints(2,:) = [0,0];
diaPoints(3,:) = [0,diaLipH];
diaPoints(4,:) = [impAdaRad-revRad-diaAdaThick/2,diaLipH+impAdaRad-revRad-diaAdaThick/2];
diaPoints(5,:) = [diaPoints(4,1), diaPoints(4,2)+ diaLipH];
diaPoints(6,:) = [diaPoints(5,1)+diaAdaThick/2-chamferSize, diaPoints(5,2)];
diaPoints(7,:) = [diaPoints(6,1), diaPoints(6,2)- diaLipH/2];
diaPoints(8,:) = [diaPoints(7,1)+diaAdaThick/2, diaPoints(7,2)];
diaPoints(9,:) = [diaPoints(8,1), diaPoints(4,2)];
diaPoints(10,:) = [diaPoints(3,1)+diaAdaThick, diaPoints(3,2)];
diaPoints(11,:) = diaPoints(1,:);

[diaAdaptX, diaAdaptY, ~] = cylinder(impAdaRad-diaPoints(:,1),diaAdaptRes);

diaAdaptZ = zeros(length(diaPoints),diaAdaptRes+1);
for i = 1: length(diaAdaptZ)
    diaAdaptZ(:,i) = (diaPoints(:,2));
end

%surf(diaAdaptX, diaAdaptY, diaAdaptZ);

%% Join all points and create files if necessary
fanPoints = [aeroOver(1,:);aeroOverOff;actualUnder;lip(1:length(lip)-1,:);aeroUnder;flipud(aeroOver)];
innerShell = [aeroOver(1,:);lip(1:length(lip)-1,:);aeroUnder;flipud(aeroOver)];

if nargin == 2
    if vargin(17) == 1
        filename = 'aeroOver.xls';
        xlswrite(filename,aeroOver(1:length(aeroOver)-1,:));
        filename = 'edges.xls';
        xlswrite(filename,[aeroOver(length(aeroOver),:);aeroOverOff(length(aeroOver),:)]);
        filename = 'aeroOverOff.xls';
        xlswrite(filename,aeroOverOff(1:length(aeroOver)-1,:));
%         filename = 'aeroUnderLip.xls';
%         xlswrite(filename,[flipud(aeroUnderOff);lip(1:length(lip)-1,:);aeroUnder]);
        filename = 'aeroUnderLip.xls';
        xlswrite(filename, [actualUnder;lip(1:length(lip)-1,:);aeroUnder]);
        filename = 'sweep.xls';
%         xlswrite(filename,sweep);
%         filename = 'diameterAdapter.xls';
        xlswrite(filename,diaPoints);
        surf2stl('diameterAdapter.stl', diaAdaptX, diaAdaptY, diaAdaptZ);
    end
end


%% Plo0t
plotCol = [0, 0, 0];
wongoBongo = [actualUnder;lip(1:length(lip)-1,:);aeroUnder];
%outAngCheck = rad2deg((atan(abs(aeroOver(2,2)-aeroOver(1,2))/abs(aeroOver(2,1)-aeroOver(1,1)))))
if des == 1
    output = fanPoints;
elseif des == 2
    output = sweep;
elseif des == 3
    output = diaPoints;
end
if nargin ~=2
    output = [];
	hold on;
    subplot(2,1,1);
    plot(fanPoints(:,1),fanPoints(:,2),'Color',plotCol);
    subplot(2,1,2);
    plot(innerShell(:,1),innerShell(:,2),'Color',plotCol);
    hold off;
    axis equal;

end
end