function [Dx] = equations_of_motion(t,x)
mh = 10; m1 = 5; m2 = 5;l = 1;a = 0.5; b= 0.5;g = 9.8;

p1 = mh*(l^2)+m1*(b^2)+m2*(l^2);
p2 = m2*l*a;
p3 = m2*(a^2);
p4 = (mh*(l)+m1*(b)+m2*(l))*g;
p5 = m2*a*g;

q1 = x(1);
q2 = x(2);
Dq1 = x(3);
Dq2 = x(4);
Dq = [Dq1;Dq2];
m11 = p1;
m12 = -p2 * cos(q1 - q2);
m21 = -p2 * cos(q1 - q2);
m22 = p3;
c11 = 0;
c12 = -Dq2 * sin(q1 - q2) * p2;
c21 = Dq1 * sin(q1 - q2) * p2;
c22 = 0;
g1 = -sin(q1) * p4;
g2 = sin(q2) * p5;
M = [m11,m12;m21,m22];
C = [c11,c12;c21,c22];
G = [g1;g2];
DDq = inv(M)*((-C*Dq)-G);
Dx = [Dq;DDq];
end
