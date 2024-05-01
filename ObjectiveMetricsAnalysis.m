%% 
% Calculating objective metrics for the 
% experiment, as illustrated in Figure 4 of the paper.
clear;clc;
warning('off')

allresults=[];
VX_AVE = [ ] ;  
VZ_AVE = [ ] ;  
ENERGY_COST_AVE= [ ];   
ENERGY_PER_CM_Z= [ ];
ENERGY_PER_CM_X = [ ];
ENERGY_COST_RATIO_X = [ ] ;
ENERGY_COST_RATIO_Z = [ ] ;
TOTAL_ENERGY_COST = [ ];
TOTAL_ENERGY_COST_PER_CM_Z = [ ];
%% Calculate
for subject = 1:10
    
    subject
    switch subject
        case 1
            M1=load('RawExperimentalData/subject1_M1.mat');
            M2=load('RawExperimentalData/subject1_M2.mat');  
            M3=load('RawExperimentalData/subject1_M3.mat');
            M4=load('RawExperimentalData/subject1_M4.mat');
            start_M1=1392; end_M1=12974; 
            start_M2=4384; end_M2=10335; 
            start_M3=2812; end_M3=11448; 
            start_M4=4082; end_M4=6939;
        case 2
            M1=load('RawExperimentalData/subject2_M1.mat'); 
            M2=load('RawExperimentalData/subject2_M2.mat');
            M3=load('RawExperimentalData/subject2_M3.mat');
            M4=load('RawExperimentalData/subject2_M4.mat');
            start_M1=4360; end_M1=5926;   
            start_M2=1150; end_M2=4718; 
            start_M3=4593; end_M3=7775; 
            start_M4=3014; end_M4=5331; 
        case 3
            M1=load('RawExperimentalData/subject3_M1.mat'); 
            M2=load('RawExperimentalData/subject3_M2.mat');
            M3=load('RawExperimentalData/subject3_M3.mat');
            M4=load('RawExperimentalData/subject3_M4.mat');
            start_M1=1412; end_M1=5672; 
            start_M2=601; end_M2=2523; 
            start_M3=1319; end_M3=4192;   
            start_M4=1013; end_M4=1894;   
        case 4
            M1=load('RawExperimentalData/subject4_M1.mat'); 
            M2=load('RawExperimentalData/subject4_M2.mat');
            M3=load('RawExperimentalData/subject4_M3.mat');
            M4=load('RawExperimentalData/subject4_M4.mat');
            start_M1=1032; end_M1=5575; 
            start_M2=5258; end_M2=8123; 
            start_M3=3295; end_M3=5363; 
            start_M4=4389; end_M4=5200;   
        case 5
            M1=load('RawExperimentalData/subject5_M1.mat'); 
            M2=load('RawExperimentalData/subject5_M2.mat');
            M3=load('RawExperimentalData/subject5_M3.mat');
            M4=load('RawExperimentalData/subject5_M4.mat');
            start_M1=10614; end_M1=14734; 
            start_M2=4145; end_M2=5551;   
            start_M3=2750; end_M3=4177;  
            start_M4=2923; end_M4=4129; 
        case 6
            M1=load('RawExperimentalData/subject6_M1.mat'); 
            M2=load('RawExperimentalData/subject6_M2.mat');
            M3=load('RawExperimentalData/subject6_M3.mat');
            M4=load('RawExperimentalData/subject6_M4.mat');
            start_M1=3724; end_M1=8148; 
            start_M2=2711; end_M2=5041; 
            start_M3=1995; end_M3=2594;   
            start_M4=3468; end_M4=4148;   
        case 7 
            M1=load('RawExperimentalData/subject7_M1.mat'); 
            M2=load('RawExperimentalData/subject7_M2.mat');
            M3=load('RawExperimentalData/subject7_M3.mat');
            M4=load('RawExperimentalData/subject7_M4.mat');
            start_M1=4271; end_M1=6782;  
            start_M2=4000; end_M2=7000; 
            start_M3=1282; end_M3=2068; 
            start_M4=3339; end_M4=4520; 
        case 8 
            M1=load('RawExperimentalData/subject8_M1.mat'); 
            M2=load('RawExperimentalData/subject8_M2.mat');
            M3=load('RawExperimentalData/subject8_M3.mat');
            M4=load('RawExperimentalData/subject8_M4.mat');
            start_M1=4866; end_M1=8168; 
            start_M2=4513; end_M2=7987;  
            start_M3=3256; end_M3=3910; 
            start_M4=1088; end_M4=1862; 
        case 9 
            M1=load('RawExperimentalData/subject9_M1.mat');
            M2=load('RawExperimentalData/subject9_M2.mat');
            M3=load('RawExperimentalData/subject9_M3.mat');
            M4=load('RawExperimentalData/subject9_M4.mat');
            start_M1=3816; end_M1=7044; 
            start_M2=3056; end_M2=8095; 
            start_M3=2234; end_M3=3374;  
            start_M4=3280; end_M4=4021;  
        case 10
            M1=load('RawExperimentalData/subject10_M1.mat'); 
            M2=load('RawExperimentalData/subject10_M2.mat');
            M3=load('RawExperimentalData/subject10_M3.mat');
            M4=load('RawExperimentalData/subject10_M4.mat');
            start_M1=6966; end_M1=9424;  
            start_M2=6245; end_M2=8275; 
            start_M3=2062; end_M3=2702;  
            start_M4=5685; end_M4=7238;  
    end
    
    % M1 ================================================
    M1_all_end_effector_p_z=M1.eef_position(3,start_M1:end_M1); % z position
    M1_dt=mean(M1.dt); % ave control time duration
    M1_all_EMG=M1.EMG_signal(2:end-1,start_M1:end_M1); % 7 emg
   
    M1_EMG_sum = sum(M1_all_EMG.*M1_all_EMG); % M
    energy_cost_ave_M1 = sum(M1_EMG_sum.*M1_dt) / (size(M1_EMG_sum,2)*M1_dt);  % Ave energy cost
    ENERGY_COST_AVE(subject,1) = energy_cost_ave_M1; 
    TOTAL_ENERGY_COST(subject,1) = sum(M1_EMG_sum.*M1_dt) ;
    
    x_M1 = sum( abs(M1.eef_position(1,start_M1+1:end_M1+1)-M1.eef_position(1,start_M1:end_M1) ) ); % x-axis displacement
    vx_M1_ave = x_M1/(M1_dt * (end_M1 - start_M1)); % x ave speed
    vx_M1=(M1.eef_position(1,start_M1+1:end_M1+1)-M1.eef_position(1,start_M1-1:end_M1-1))/(2*M1_dt); % x-axis velocity
    vz_M1=(M1.eef_position(3,start_M1+1:end_M1+1)-M1.eef_position(3,start_M1-1:end_M1-1))/(2*M1_dt); % z-axis velocity
    vz_M1_ave=mean(vz_M1); % z ave speed
    VX_AVE(subject,1) = vx_M1_ave;
    VZ_AVE(subject,1) = vz_M1_ave; % save data
    
    p_x_M1 = M1.eef_force(1,start_M1:end_M1) .* vx_M1; % x power
    p_z_M1 = M1.eef_force(3,start_M1:end_M1) .* vz_M1; % z power
    energy_cost_ratio_x_M1 = sum(p_x_M1./(M1_EMG_sum));
    energy_cost_ratio_z_M1 = sum(p_z_M1./(M1_EMG_sum));
    ENERGY_COST_RATIO_X(subject,1) = energy_cost_ratio_x_M1;
    ENERGY_COST_RATIO_Z(subject,1) = energy_cost_ratio_z_M1;
    
    depth_M1 = M1_all_end_effector_p_z(1) - M1_all_end_effector_p_z(end); 
    energy_per_cm_z_M1 = energy_cost_ave_M1 / depth_M1;
    energy_per_cm_x_M1 = energy_cost_ave_M1/ x_M1;
    ENERGY_PER_CM_X(subject,1) = energy_per_cm_x_M1; % x-axis energy cost per cm
    ENERGY_PER_CM_Z(subject,1) = energy_per_cm_z_M1; % z-axis energy cost per cm
    TOTAL_ENERGY_COST_PER_CM_Z(subject,1)= sum(M1_EMG_sum.*M1_dt)  /depth_M1;
    
    % M2 =======================================
    M2_all_end_effector_p_z=M2.eef_position(3,start_M2:end_M2);
    M2_dt=mean(M2.dt);  
    M2_all_EMG=M2.EMG_signal(2:end-1,start_M2:end_M2);
    
    M2_EMG_sum = sum(M2_all_EMG.*M2_all_EMG);  
    energy_cost_ave_M2 = sum(M2_EMG_sum.*M2_dt) / (size(M2_EMG_sum,2)*M2_dt);  % Ave energy cost
    ENERGY_COST_AVE(subject,2) = energy_cost_ave_M2; 
    TOTAL_ENERGY_COST(subject,2) = sum(M2_EMG_sum.*M2_dt) ;
    
    avg_EMG_M2=sum(M2_all_EMG,2)/size(M2_all_EMG,2);
    
    x_M2 = sum( abs(M2.eef_position(1,start_M2+1:end_M2+1)-M2.eef_position(1,start_M2:end_M2) ) ); % x-axis displacement
    vx_M2_ave = x_M2/(M2_dt * (end_M2 - start_M2));  
    vx_M2=(M2.eef_position(1,start_M2+1:end_M2+1)-M2.eef_position(1,start_M2-1:end_M2-1))/(2*M2_dt); % x-axis velocity
    vz_M2=(M2.eef_position(3,start_M2+1:end_M2+1)-M2.eef_position(3,start_M2-1:end_M2-1))/(2*M2_dt); % z-axis velocity
    vz_M2_ave=mean(vz_M2); 
    VX_AVE(subject,2) = vx_M2_ave;
    VZ_AVE(subject,2) = vz_M2_ave;  
    
    p_x_M2 = M2.eef_force(1,start_M2:end_M2) .* vx_M2;  
    p_z_M2 = M2.eef_force(3,start_M2:end_M2) .* vz_M2;  
    energy_cost_ratio_x_M2 = sum(p_x_M2./(M2_EMG_sum));
    energy_cost_ratio_z_M2 = sum(p_z_M2./(M2_EMG_sum));
    ENERGY_COST_RATIO_X(subject,2) = energy_cost_ratio_x_M2;
    ENERGY_COST_RATIO_Z(subject,2) = energy_cost_ratio_z_M2;
    
    depth_M2 = M2_all_end_effector_p_z(1) - M2_all_end_effector_p_z(end); 
    energy_per_cm_z_M2 = energy_cost_ave_M2 / depth_M2;
    energy_per_cm_x_M2 = energy_cost_ave_M2/ x_M2;
    ENERGY_PER_CM_X(subject,2) = energy_per_cm_x_M2;
    ENERGY_PER_CM_Z(subject,2) = energy_per_cm_z_M2;
    TOTAL_ENERGY_COST_PER_CM_Z(subject,2)= sum(M2_EMG_sum.*M2_dt)  /depth_M2;
    
    each_EMG_div_vxz_M2=sum(M2_all_EMG,1)./sum(vz_M2,1)./sum(vx_M2,1); % the power for each point
    avg_each_EMG_div_vz_vx_M2=mean(each_EMG_div_vxz_M2);
    std1_forv_div_vx=(1/length(each_EMG_div_vxz_M2)*sum((each_EMG_div_vxz_M2-mean(each_EMG_div_vxz_M2)).^2))^0.5;

    % M3 =============================================
    M3_all_end_effector_p_z=M3.eef_position(3,start_M3:end_M3);
    M3_dt=mean(M3.dt);  
    M3_all_EMG=M3.EMG_signal(2:end-1,start_M3:end_M3);
    
    avg_EMG_M3=sum(M3_all_EMG,2)/size(M3_all_EMG,2);
    M3_EMG_sum = sum(M3_all_EMG.*M3_all_EMG); 
    energy_cost_ave_M3 = sum(M3_EMG_sum.*M3_dt) / (size(M3_EMG_sum,2)*M3_dt);  % Ave energy cost
    ENERGY_COST_AVE(subject,3) = energy_cost_ave_M3; 
    TOTAL_ENERGY_COST(subject,3) = sum(M3_EMG_sum.*M3_dt) ;
    
    x_M3 = sum( abs(M3.eef_position(1,start_M3+1:end_M3+1)-M3.eef_position(1,start_M3:end_M3) ) ); % x-axis displacement
    vx_M3_ave = x_M3/(M3_dt * (end_M3 - start_M3));  
    vx_M3=(M3.eef_position(1,start_M3+1:end_M3+1)-M3.eef_position(1,start_M3-1:end_M3-1))/(2*M3_dt); % x-axis velocity
    vz_M3=(M3.eef_position(3,start_M3+1:end_M3+1)-M3.eef_position(3,start_M3-1:end_M3-1))/(2*M3_dt); % z-axis velocity
    vz_M3_ave=mean(vz_M3);
    VX_AVE(subject,3) = vx_M3_ave;
    VZ_AVE(subject,3) = vz_M3_ave; 
    
    p_x_M3 = M3.eef_force(1,start_M3:end_M3) .* vx_M3;  
    p_z_M3 = M3.eef_force(3,start_M3:end_M3) .* vz_M3; 
    energy_cost_ratio_x_M3 = sum(p_x_M3./(M3_EMG_sum));
    energy_cost_ratio_z_M3 = sum(p_z_M3./(M3_EMG_sum));
    ENERGY_COST_RATIO_X(subject,3) = energy_cost_ratio_x_M3;
    ENERGY_COST_RATIO_Z(subject,3) = energy_cost_ratio_z_M3;
    
    depth_M3 = M3_all_end_effector_p_z(1) - M3_all_end_effector_p_z(end); 
    energy_per_cm_z_M3 = energy_cost_ave_M3 / depth_M3;
    energy_per_cm_x_M3 = energy_cost_ave_M3/ x_M3;
    ENERGY_PER_CM_X(subject,3) = energy_per_cm_x_M3;
    ENERGY_PER_CM_Z(subject,3) = energy_per_cm_z_M3;
    TOTAL_ENERGY_COST_PER_CM_Z(subject,3)= sum(M3_EMG_sum.*M3_dt)  /depth_M3;
    
    each_EMG_div_vxz_M3=sum(M3_all_EMG,1)./sum(vz_M3,1)./sum(vx_M3,1); 
    avg_each_EMG_div_vz_vx_M3=mean(each_EMG_div_vxz_M3);
    std2_forv_div_vx=(1/length(each_EMG_div_vxz_M3)*sum((each_EMG_div_vxz_M3-mean(each_EMG_div_vxz_M3)).^2))^0.5;

    each_EMG_div_vz_M3=sum(M3_all_EMG,1)./sum(vz_M3,1);  
    std2_forzv=(1/length(each_EMG_div_vz_M3)*sum((each_EMG_div_vz_M3-mean(each_EMG_div_vz_M3)).^2))^0.5;
    


    % M4 ==============================================
    M4_all_end_effector_p_z=M4.eef_position(3,start_M4:end_M4);    
    M4_dt=mean(M4.dt); 
    M4_all_EMG=M4.EMG_signal(2:end-1,start_M4:end_M4);
    
    avg_EMG_M4=sum(M4_all_EMG,2)/size(M4_all_EMG,2);
    M4_EMG_sum = sum(M4_all_EMG.*M4_all_EMG); 
    energy_cost_ave_M4 = sum(M4_EMG_sum.*M4_dt) / (size(M4_EMG_sum,2)*M4_dt);  % Ave energy cost
    ENERGY_COST_AVE(subject,4) = energy_cost_ave_M4; 
    TOTAL_ENERGY_COST(subject,4) = sum(M4_EMG_sum.*M4_dt) ;
    
    x_M4 = sum( abs(M4.eef_position(1,start_M4+1:end_M4+1)-M4.eef_position(1,start_M4:end_M4) ) ); % x-axis displacement
    vx_M4_ave = x_M4/(M4_dt * (end_M4 - start_M4));  
    vx_M4=(M4.eef_position(1,start_M4+1:end_M4+1)-M4.eef_position(1,start_M4-1:end_M4-1))/(2*M4_dt); % x-axis velocity
    vz_M4=(M4.eef_position(3,start_M4+1:end_M4+1)-M4.eef_position(3,start_M4-1:end_M4-1))/(2*M4_dt); % z-axis velocity
    vz_M4_ave=mean(vz_M4);
    VX_AVE(subject,4) = vx_M4_ave;
    VZ_AVE(subject,4) = vz_M4_ave;  

    p_x_M4 = M4.eef_force(1,start_M4:end_M4) .* vx_M4;  
    p_z_M4 = M4.eef_force(3,start_M4:end_M4) .* vz_M4;  
    energy_cost_ratio_x_M4 = sum(p_x_M4./(M4_EMG_sum));
    energy_cost_ratio_z_M4 = sum(p_z_M4./(M4_EMG_sum));
    ENERGY_COST_RATIO_X(subject,4) = energy_cost_ratio_x_M4;
    ENERGY_COST_RATIO_Z(subject,4) = energy_cost_ratio_z_M4;
    
    depth_M4 = M4_all_end_effector_p_z(1) - M4_all_end_effector_p_z(end); 
    energy_per_cm_z_M4 = energy_cost_ave_M4 / depth_M4;
    energy_per_cm_x_M4 = energy_cost_ave_M4/ x_M4;
    ENERGY_PER_CM_X(subject,4) = energy_per_cm_x_M4;
    ENERGY_PER_CM_Z(subject,4) = energy_per_cm_z_M4;
    TOTAL_ENERGY_COST_PER_CM_Z(subject,4)= sum(M4_EMG_sum.*M4_dt)  /depth_M4;
    
    each_EMG_div_vxz_M4=sum(M4_all_EMG,1)./sum(vz_M4,1)./sum(vx_M4,1); 
    avg_each_EMG_div_vz_vx_M4=mean(each_EMG_div_vxz_M4);
    std3_forv_div_vx=(1/length(each_EMG_div_vxz_M4)*sum((each_EMG_div_vxz_M4-mean(each_EMG_div_vxz_M4)).^2))^0.5;

    each_EMG_div_vz_M4=sum(M4_all_EMG,1)./sum(vz_M4,1); 
    std3_forzv=(1/length(each_EMG_div_vz_M4)*sum((each_EMG_div_vz_M4-mean(each_EMG_div_vz_M4)).^2))^0.5;
    

    clear M1 M2 M3 M4
    
end




%% BOX PLOT


BEColor = '#3132F9';
BFColor = '#D1E6EC';
BoxMedianLineColor = '#D1E6EC';

figure(226)
set(gcf,'unit','normalized','position',[0.2,0.2,0.6,0.7])
% X-axis ave sawing speed
subplot(2,2,1)
VX_AVE_BAR = [mean(VX_AVE(:,1)),mean(VX_AVE(:,2)),mean(VX_AVE(:,3)),mean(VX_AVE(:,4))];
VX_STD_BAR = [std(VX_AVE(:,1)),std(VX_AVE(:,2)),std(VX_AVE(:,3)),std(VX_AVE(:,4))];
b = boxchart(VX_AVE,'BoxFaceColor',BEColor,'LineWidth',1.5,'MarkerStyle', '*','MarkerSize',7,'MarkerColor',BEColor );
title({'Main Axis Average'; 'Sawing Speed [m/s]'})
ylim([0,0.2])
xticklabels({'Mode1','Mode2','Mode3','Mode4'});
set(gca, 'linewidth', 1.1, 'fontsize', 17, 'fontname', 'times','color','#E6E8E9') 
text(2.4, -0.04/0.2*0.2, '(a)','fontsize', 17, 'fontname', 'times')


% energy cost for unit sawing depth
subplot(2,2,2) 
% outlier：subject2 M2 M4; subject8 M2; subject10 M4 
ENERGY_PER_CM_BAR= [mean(TOTAL_ENERGY_COST_PER_CM_Z([1,3,4,5,6,7,9,10],1)),mean(TOTAL_ENERGY_COST_PER_CM_Z(:,2)),mean(TOTAL_ENERGY_COST_PER_CM_Z([1,3,4,5,6,7,8,9],3)),mean(TOTAL_ENERGY_COST_PER_CM_Z(1:9,4))];
ENERGY_PER_CM_STD_BAR = [std(TOTAL_ENERGY_COST_PER_CM_Z([1,3,4,5,6,7,9,10],1)),std(TOTAL_ENERGY_COST_PER_CM_Z(:,2)),std(TOTAL_ENERGY_COST_PER_CM_Z([1,3,4,5,6,7,8,9],3)),std(TOTAL_ENERGY_COST_PER_CM_Z(1:9,4))];
boxchart(TOTAL_ENERGY_COST_PER_CM_Z,'BoxFaceColor',BEColor,'LineWidth',1.5,'MarkerStyle', '*','MarkerSize',7,'MarkerColor',BEColor );
title(["Energy Cost for Unit "; " Sawing Depth [s/m]"])
xticklabels({'Mode1','Mode2','Mode3','Mode4'});
set(gca, 'linewidth', 1.1, 'fontsize', 17, 'fontname', 'times','color','#E6E8E9') 
ylim([-0.2e5,2e5])
text(2.4, -0.04*(2e5+0.2e5)/0.2-0.2e5, '(b)','fontsize', 17, 'fontname', 'times')


% X' Axis Energy Conversion Ratio
subplot(2,2,3)
VX_PER_ENGERGY = VX_AVE ./ ENERGY_COST_AVE;
VX_PER_ENGERGY_BAR= [mean(VX_PER_ENGERGY(:,1)),mean(VX_PER_ENGERGY(:,2)),mean(VX_PER_ENGERGY(:,3)),mean(VX_PER_ENGERGY(1:9,4))];
VX_PER_ENGERGY_STD_BAR = [std(VX_PER_ENGERGY(:,1)),std(VX_PER_ENGERGY(:,2)),std(VX_PER_ENGERGY(:,3)),std(VX_PER_ENGERGY(1:9,4))];
boxchart(VX_PER_ENGERGY,'BoxFaceColor',BEColor,'LineWidth',1.5,'MarkerStyle', '*','MarkerSize',7,'MarkerColor',BEColor );
title(["X' Axis Energy"; "Conversion Ratio [m/s]"])
set(gca, 'linewidth', 1.1, 'fontsize', 17, 'fontname', 'times','color','#E6E8E9') 
xticklabels({'Mode1','Mode2','Mode3','Mode4'});
ylim([0,0.12])
text(2.4, -0.04*0.12/0.2, '(c)','fontsize', 17, 'fontname', 'times')

%  Z' Axis Energy Conversion Ratio
subplot(2,2,4)
VZ_PER_ENGERGY = -VZ_AVE ./ ENERGY_COST_AVE;
VZ_PER_ENGERGY_BAR= [mean(VZ_PER_ENGERGY(:,1)),mean(VZ_PER_ENGERGY(:,2)),mean(VZ_PER_ENGERGY([1,2,3,4,5,6,8,9],3)),mean(VZ_PER_ENGERGY(1:9,4))];
VZ_PER_ENGERGY_STD_BAR = [std(VZ_PER_ENGERGY(:,1)),std(VZ_PER_ENGERGY(:,2)),std(VZ_PER_ENGERGY([1,2,3,4,5,6,8,9],3)),std(VZ_PER_ENGERGY(1:9,4))];
y_data = [ VZ_PER_ENGERGY(:,1) ; VZ_PER_ENGERGY(:,2); VZ_PER_ENGERGY([1,2,3,4,5,6,8,9],3);VZ_PER_ENGERGY(:,4)];
x_data =[ones(10,1);  ones(10,1)*2;  ones(8,1)*3; ones(10,1)*4 ];
boxchart(x_data,y_data,'BoxFaceColor',BEColor,'LineWidth',1.5,'MarkerStyle', '*','MarkerSize',7,'MarkerColor',BEColor );
hold on
xticks([1,2,3,4])
xticklabels({'Mode1','Mode2','Mode3','Mode4'});
% boxchart(VZ_PER_ENGERGY)
title(["Z' Axis Energy"; "Conversion Ratio [m/s]"])
plot(3,VZ_PER_ENGERGY(10,3),'*','color',BEColor,'MarkerSize',7,'LineWidth',1.1)
plot(3,VZ_PER_ENGERGY(7,3),'*','color',BEColor,'MarkerSize',7,'LineWidth',1.1)
ylim([-2.5e-4,3.5e-4])
set(gca, 'linewidth', 1.1, 'fontsize', 17, 'fontname', 'times','color','#E6E8E9') 
text(2.4, -0.04*(3.5e-4+2.5e-4)/0.2-2.5e-4, '(d)','fontsize', 17, 'fontname', 'times')

