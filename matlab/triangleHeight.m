function [triHi] = triangleHeight(point1,point2,point3)
    % triangle(:,1) = [2,5,3];
    % triangle(:,2) = [3,6,9];
    triangle(:,1) = [point1(1),point2(1),point3(1)];
    triangle(:,2) = [point1(2),point2(2),point3(2)];

    angle = atan((triangle(2,2)-triangle(1,2))/(triangle(2,1)-triangle(1,1)));
    %angleDeg = rad2deg(angle);
    toRot = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    triangle = triangle*toRot;
    triHi = triangle(3,2)-triangle(1,2);

end