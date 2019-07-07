function [x_plus] = impact_map(x_minus)

mh = 10; m1 = 5; m2 = 5;l = 1;a = 0.5; b= 0.5;g = 9.8;


q1 = x_minus(1);
q2 = x_minus(2);
Dq1 = x_minus(3);
Dq2 = x_minus(4);

p6 = mh*(l^2)+m1*(l^2)+m2*(b^2);
p7 = m1*l*a;
p8 = m1*(a^2);
p9 = m1*a*b;
p10 = mh*(l^2)+m1*(b*l)+m2*(l*b);
p11 = m2*a*b ;


    Qp = [(-p7*cos(q1-q2))+p6,p8-(p7*cos(q1-q2));
             -p7*cos(q1-q2),     p8        ];
    Qn = [(p10*cos(q1-q2))-p9,-p11;-p9,0];
    Dq_plus = inv(Qp)*Qn*[Dq1;Dq2];


q_plus = [q2;q1];
x_plus = [q_plus;Dq_plus];
end