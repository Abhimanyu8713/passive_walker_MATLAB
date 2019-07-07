function ankle_torque(x,E)
mh = 10; m1 = 5; m2 = 5;l = 1;a = 0.5; b= 0.5;g = 9.8;

p1 = mh*(l^2)+m1*(b^2)+m2*(l^2);
p2 = m2*l*a;
p3 = m2*(a^2);
p4 = (mh*(l)+m1*(b)+m2*(l))*g;
p5 = m2*a*g;
for i = 1:1234
q1 = x(i,1);
q2 = x(i,2);
Dq1 = x(i,3);
Dq2 = x(i,4);
Dq = [Dq1;Dq2];m11 = p1;
 m12 = -p2 * cos(q1 - q2);
 m21 = -p2 * cos(q1 - q2);
 m22 = p3;

 M = [m11,m12;m21,m22];

 KE(i) = 0.5*[(Dq1),(Dq2)]*M*[(Dq1);(Dq2)];
 PE(i) = 9.8*((m1*a+(mh+m2)*l)*cos(q1)-m2*b*cos(q2));
  u(i) = (-0.1/(rad2deg(Dq1-Dq2)))*((KE(i)+PE(i))-155);
end
plot(u)
figure(2)
plot(KE+PE)

