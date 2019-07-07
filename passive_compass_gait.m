clear all
close all
clc
q0 = [0.2;-0.3];
Dq0 = [-1.21;-0.1];
x0 = [q0;Dq0];
MAP_SELCTOR = 1;
SIMULATION_TIME =30;
DRAW_INTERVAL = 0.05;
current_time = 0;
REPEATS = 0;
FPS = 24;
T0 = 0;
tspan = [T0 SIMULATION_TIME];
state_space = [];
time = [];
impacts= [];
last_impact = [];
gait_period = [];
while(current_time < SIMULATION_TIME)
    
    options = odeset('Events',@impact_event);
    [tout,xout,event_time,event_state,event_id] = ode45(@equations_of_motion,tspan,x0,options);
    if ~isempty(event_id) && event_time(end)==tout(end)
        disp(1)
%         if isempty(time)
%             time = 0;
%         end
        impact_time = tout(end);
        impact_index = length(time)+length(tout);
        impacts = [impacts;impact_time,impact_index];
        gait_period = [gait_period;impact_time-last_impact];
        last_impact = impact_time;
        x0 = impact_map(xout(end,:));  %MAP_SELECTOT = 1
        fprintf('*************************************************\n');
        fprintf('Impact surface hit at time = %0.2f\n', impact_time);
        fprintf('Index = %d\n', impact_index);
        fprintf('q1 = %0.2f\n', xout(end,1)*180/pi);
        fprintf('q2 = %0.2f\n', xout(end,2)*180/pi);
        fprintf('*************************************************\n');
    end
    time = [time; tout];
    state_space = [state_space;xout];
    %disp(xout)
    tspan = [time(end) max(SIMULATION_TIME, time(end))];
    current_time = time(end);
end
plot(time(:),state_space(:,4))
hold on
plot(time(:),state_space(:,3))
figure(2)
plot(time(:),state_space(:,2))
hold on
plot(time(:),state_space(:,1))