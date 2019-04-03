clear; clc;

l1 = 0.3;
l2 = 0.2;
l3 = 0.1;

t1rad = 0.4;
t2rad = 0.6;
t3rad = 1.2;

t1deg = rad2deg(t1rad);
t2deg = rad2deg(t2rad);
t3deg = rad2deg(t3rad);

r1 = [ cos(t1rad)   -sin(t1rad) 0   0;
       sin(t1rad)   cos(t1rad)  0   0;
       0            0           1   0;
       0            0           0   1 ];
   
r2 = [ cos(t2rad)   -sin(t2rad) 0   0;
       sin(t2rad)   cos(t2rad)  0   0;
       0            0           1   0;
       0            0           0   1 ];
   
r3 = [ cos(t3rad)   -sin(t3rad) 0   0;
       sin(t3rad)   cos(t3rad)  0   0;
       0            0           1   0;
       0            0           0   1 ];
   
d1 = [eye(4,3) [l1; 0; 0; 1]];
d2 = [eye(4,3) [l2; 0; 0; 1]];
d3 = [eye(4,3) [l3; 0; 0; 1]];

trans1 = r1*d1;
trans2 = r2*d2;
trans3 = r3*d3;

trans = trans1*trans2*trans3;

x = trans(1,4); % should equal trans(1,4)
y = trans(2,4); % should equal trans(2,4)
z = trans(3,4); % 0

xe = l1*cosd(t1deg) + l2*cosd(t1deg+t2deg) + l3*cosd(t1deg+t2deg+t3deg); % should equal trans(1,4) = x
ye = l1*sind(t1deg) + l2*sind(t1deg+t2deg) + l3*sind(t1deg+t2deg+t3deg); % should equal trans(2,4) = y

transtheta = rad2deg(acos(trans(1,1)));

rawtheta = t1deg + t2deg + t3deg;

trans

fprintf('%f = long form x displacement \n',xe);

fprintf('%f = x displacement from transform \n',trans(1,4));

fprintf('%f = long form y displacement \n',ye);

fprintf('%f = y displacement from transform \n',trans(2,4));

fprintf('%f = long form theta displacement \n',rawtheta);

fprintf('%f = theta displacement from transform \n',transtheta);
