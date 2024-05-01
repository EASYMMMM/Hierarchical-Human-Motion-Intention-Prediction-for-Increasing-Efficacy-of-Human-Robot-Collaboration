%% Sawing Task: Experiment Result
% This file is used to plot the case result, i.e. Figure3 in the manuscript.
clear, clc, close all
allresults=[];

%% Subject1 Mode4 Data
M4=load('RawExperimentalData/subject1_M4.mat');
start_M4=4082; end_M4=6939; 
M_DATA = M4;

%% Figure 3   
figure(226)
expname = ['M4'];
LineColor = '#507FE3';
YLineColor = '#34A853';
ZLineColor = '#EA4335';
RangeMarkerColor = '#DC123A';
PredictPointColor = '#CA6800';
ActualPointColor = '#68DA00';
NewPredictPointColor = '#FB0000';
LightGrey = '#D0D0D0';
ZForceColor = '#FF9887';
label_font_size = 15;
set(gcf,'unit','normalized','position',[0.2,0.2,0.9,0.7])
x_start= 50; % 2850
x_end = 4600; % 4480
x_range = [x_start:x_end];
all_dt = M_DATA.dt;
ave_dt = sum(all_dt)/size(all_dt,2);

target_points = M_DATA.GPR_predicted_transition_point;
GPR_predicted_points = zeros(1,size(target_points,2));

% GPR predicted points
trajectory = M_DATA.eef_position(1,:);
this_pull = 0; this_push = 0; last_pull = 0; last_push = 0;
push_time = []; pull_time = []; total_phase = 0;
for i = 1:size(M_DATA.GPR_predicted_transition_point,2)
    if target_points(i) == 0 % 先找到收到gpr的点，一般在峰值后
        continue
    end
    if trajectory(i) < 0.6 % 如果这个点是拉
        total_phase = total_phase+1;
        this_pull = i;
        if size(pull_time,2) >= 1
%                 GPR_predicted_points(this_pull + round(sum(pull_time(end-2:end))/3)) = target_points(this_pull);
            GPR_predicted_points(last_push + round(M_DATA.esitimated_time(total_phase)/ave_dt)) = target_points(last_pull);
        end
        pull_time = [pull_time , last_pull-last_pull];
        last_pull = this_pull;
    end
    if trajectory(i) > 0.6 % 如果这个点是拉
        total_phase = total_phase+1;
        this_push = i;
        if size(push_time,2) >= 1
%                 GPR_predicted_points(this_push + round(sum(push_time(end-2:end)/3))) = target_points(this_push);
                GPR_predicted_points(last_pull + round(M_DATA.esitimated_time(total_phase)/ave_dt)) = target_points(last_push);
        end
        push_time = [push_time , this_push-last_push];
        last_push = this_push;
    end     
end

% Actual State Transition Points
original_data = target_points;
state_transition_point_x = find(original_data ~= 0);

% Predicted Trajectory 1
p0 = 0.5074; % 3013
pf = 0.7020; % 3180
v0 = 0; 
vf = 0; 
T = 10; 
% equation
A = [1, 0, 0, 0; 
     1, T, T^2, T^3;
     0, 1, 0, 0; 
     0, 1, 2*T, 3*T^2];
B = [p0; pf; v0; vf];
% coefficient
coeff = A\B;
% time vector and trajectory
t = linspace(0, T, 3180-3013+1); % 100 timesteps
predicted_trajectory = coeff(1) + coeff(2)*t + coeff(3)*t.^2 + coeff(4)*t.^3;


subplot(15,1,[1 2]) %M(t)
emg_sum = sum(M_DATA.EMG_signal(2:end-1,:).*M_DATA.EMG_signal(2:end-1,:));
for idx = state_transition_point_x
    if idx>x_start && idx < x_end
        plot([idx idx], [-100,100], 'Color', LightGrey, 'LineStyle', '--','LineWidth',1); % 使用红色虚线
        hold on
    end
end
plot(x_range, emg_sum(x_range),'Color',LineColor,'LineWidth',2.3);
xlim([x_start,x_end]);
ylabel({'M(t)'})
ylim([2,8]);
%title('Case Result of Subject1 in Mode4');
set(gca, 'YAxisLocation', 'right'); % Move Y-axis label to the righ
set(gca, 'linewidth', 1.1, 'fontsize', label_font_size, 'fontname', 'times',...
                'TickLength',[0 0], 'XTick', [] ) %

subplot(15,1,[3 5]) % actual force
for idx = state_transition_point_x
    if idx>x_start && idx < x_end
        plot([idx idx]*ave_dt, [-100,100], 'Color', LightGrey, 'LineStyle', '--','LineWidth',1); % 使用红色虚线
        hold on
    end
end
afx = plot(x_range*ave_dt, M_DATA.eef_force(1,x_range),'Color',LineColor,'LineWidth',2.3);
afz = plot(x_range*ave_dt, M_DATA.eef_force(3,x_range),'Color',ZLineColor,'LineWidth',2.3);
afy = plot(x_range*ave_dt, M_DATA.eef_force(2,x_range),'Color',YLineColor,'LineWidth',2.3);
ylabel({'Robot'; 'External';'Force [N]'})
ylim([-95,95])
xlim([x_start,x_end]*ave_dt);
legend([afx,afy,afz],{"X'-axis","Y'-axis","Z'-axis"},'fontsize', 14, ... 
         'Orientation', 'horizontal', 'NumColumns', 2)
set(gca, 'YAxisLocation', 'right'); % Move Y-axis label to the righ
set(gca, 'linewidth', 1.1, 'fontsize', label_font_size, 'fontname', 'times',...
                'TickLength',[0 0] ) %去掉x，y坐标轴的刻度

subplot(15,1,[6 10]) % X位移
for idx = state_transition_point_x
    if idx>x_start && idx < x_end
        plot([idx idx], [-100,100], 'Color', LightGrey, 'LineStyle', '--','LineWidth',1); % 使用红色虚线
        hold on
    end
end
% actual trajectory
at = plot(x_range, M_DATA.eef_position(1,x_range),'Color',LineColor,'LineWidth',2.3);
ylabel({'Main Axis', 'Position [m]'})
% actual transition point
ap = plot( state_transition_point_x,M_DATA.eef_position(1,state_transition_point_x),'o','MarkerEdgeColor',LineColor, 'MarkerFaceColor',LineColor,'MarkerSize',8);
% predicted trajectory
%pdt = plot([3013:3180],predicted_trajectory,'--','Color',NewPredictPointColor,'LineWidth',1.8 );

GPR_ends = GPR_predicted_points;
pdt_plot = 0;
for idx = state_transition_point_x(3:end)
    predicted_trajectory = [];
    s_p = idx;
    e_p = s_p + 1;
    while 1
        try
            if GPR_ends(e_p) ~= 0
                if abs(GPR_ends(e_p)-M_DATA.eef_position(1,s_p))>0.1
                    break
                end
            end
        catch
            break
        end
        e_p = e_p + 1;
    end
    try
        p0 = M_DATA.eef_position(1,s_p); % s_p
        pf  =  GPR_ends(e_p); % e_p
        A = [1, 0, 0, 0; 
         1, T, T^2, T^3;
         0, 1, 0, 0; 
         0, 1, 2*T, 3*T^2];
        v0 = 0; vf = 0; T = 10; B = [p0; pf; v0; vf];
        coeff = A\B;
        t = linspace(0, T, e_p-s_p+1); % 生成100个时间点
        predicted_trajectory = coeff(1) + coeff(2)*t + coeff(3)*t.^2 + coeff(4)*t.^3;
        if pdt_plot == 0
            pdt=plot([s_p:e_p],predicted_trajectory,'--','Color',NewPredictPointColor,'LineWidth',1.8 );
            pdt_plot = 1;
        else
            plot([s_p:e_p],predicted_trajectory,'--','Color',NewPredictPointColor,'LineWidth',1.8 );
        end
        GPR_ends(e_p) = 0;
    catch
        continue
    end
end

% predicted transition point
gpr = plot(GPR_predicted_points,'o','MarkerEdgeColor',NewPredictPointColor, 'MarkerFaceColor',NewPredictPointColor,'MarkerSize',8);
ylim([0.44,0.74])
xlim([x_start,x_end]);
legend([at,  gpr, ap, pdt], {'Actual Trajectory',  .... 
            'Predicted State Transition Point', 'State Transition Point',... 
            'Predicted Trajectory'}, 'fontsize', 14, 'Orientation', 'horizontal', 'NumColumns', 2);
% legend([at,ap,gpr],{'Actual Trajectory','State Transition Point','Predicted State Transition Point', ...
%    },'fontsize', 14);
set(gca, 'YAxisLocation', 'right'); % Move Y-axis label to the righ
set(gca, 'linewidth', 1.1, 'fontsize', label_font_size, 'fontname', 'times',...
                'TickLength',[0 0] , 'XTick', []) %去掉x，y坐标轴的刻度
          

subplot (15,1,[11 12]) % 识别的状态
for idx = state_transition_point_x
    if idx>x_start && idx < x_end
        plot([idx idx], [-100,100], 'Color', LightGrey, 'LineStyle', '--','LineWidth',1); % 使用红色虚线
        hold on
    end
end
states = zeros(size(M_DATA.SVM_recognized_state(1,:),2),1);
last_s = 2;
for i = 1:size(M_DATA.SVM_recognized_state,2)
    if M_DATA.SVM_recognized_state(1,i) == 0
        states(i) = last_s;
    else
        states(i) = M_DATA.SVM_recognized_state(1,i); 
        last_s = M_DATA.SVM_recognized_state(1,i) ;
    end
end
a = find(M_DATA.SVM_recognized_state(1,:)~=0);
f=M_DATA.SVM_recognized_state(1,a);
% plot(x_range, states(x_range),'Color',PredictPointColor,'LineWidth',2.3);
plot(x_range, M_DATA.SVM_recognized_state(x_range),'Color',PredictPointColor,'LineWidth',2.3);
yticks([2 3]);
yticklabels({'Pull','Push'})
ylabel({'Recognized' ;'Motion State'});
ylim([1.5,3.5]);
xlim([x_start,x_end]);
set(gca, 'YAxisLocation', 'right');
set(gca, 'linewidth', 1.1, 'fontsize', label_font_size, 'fontname', 'times',...
                'TickLength',[0 0], 'XTick', [] ) %去掉x，y坐标轴的刻度
%text(-800, 2.5, '(b)','fontsize', 14, 'fontname', 'times')      
            

subplot(15,1,[13 15]) % Lasso estimated force
desired_f = M_DATA.LASSO_estimated_force/5;
for idx = state_transition_point_x
    if idx>x_start && idx < x_end
        plot([idx idx]*ave_dt, [-100,100], 'Color', LightGrey, 'LineStyle', '--','LineWidth',1); % 使用红色虚线
        hold on
    end
end
efx =  plot(x_range*ave_dt, desired_f(x_range),'Color',LineColor,'LineWidth',2.3);
ylabel({'Estimated'; 'Desired';'Force [N]'})
xlabel({'Time [s]'})
ylim([-20,20])
xlim([x_start,x_end]*ave_dt);
% legend([efx],{'X-axis'},'fontsize', 14)
legend([efx],{"X'-axis"},'fontsize', 14)
set(gca, 'YAxisLocation', 'right'); % Move Y-axis label to the righ
set(gca, 'linewidth', 1.1, 'fontsize', label_font_size, 'fontname', 'times',...
                'TickLength',[0 0] ) %去掉x，y坐标轴的刻度
  

           