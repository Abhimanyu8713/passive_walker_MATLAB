function [value, isterminal, direction] = impact_event(t,x)

q1 = x(1);
q2 = x(2);
psi = deg2rad(3);
Dq2 = x(4);
value = cos(q1+psi) - cos(q2+psi);
direction =  -1;

if Dq2 < 0
    isterminal = 1;
else
    isterminal = 0;
end
end

