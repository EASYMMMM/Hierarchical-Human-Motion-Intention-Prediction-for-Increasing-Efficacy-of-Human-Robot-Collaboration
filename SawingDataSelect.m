% Processing and analysis of raw experimental data. 
% For all trials, we manually select the fast and stable
% sawing portion of each trial as the valid data.
clear, clc

allresults=[];
VZ_AVE = [ ] ; ENERGY_COST_AVE= [ ]; ENERGY_PER_CM= [ ];
%% Display the raw data, manually select the valid data
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
    
%     figure(subject)
%     for trail = 1:4
%         switch trail
%             case 1
%                 M_DATA = M1;
%                 start_point = start_M1;
%                 end_point = end_M1;
%             case 2
%                 M_DATA = M2;
%                 start_point = start_M2;
%                 end_point = end_M2;
%             case 3
%                 M_DATA = M3;
%                 start_point = start_M3;
%                 end_point = end_M3;
%             case 4
%                 M_DATA = M4;
%                 start_point = start_M4;
%                 end_point = end_M4;
%         end
%         trail_name = ['M',num2str(trail)];
%         
%         subplot(4,4,trail)
%         plot(M_DATA.eef_position(1,:),'LineWidth',2);
%         hold on
%         plot([start_point,end_point],[M_DATA.eef_position(1,start_point),M_DATA.eef_position(1,end_point)],'s','MarkerFaceColor','red','Markersize',6);
%         title([trail_name,' X'])
%         grid on
%         
%         subplot (4,4,trail+4)
%         plot(M_DATA.eef_position(3,:),'LineWidth',2);
%         hold on
%         plot([start_point,end_point],[M_DATA.eef_position(3,start_point),M_DATA.eef_position(3,end_point)],'s','MarkerFaceColor','red','Markersize',6);
%         title([trail_name,' Z'])
%         grid on
%         
%         subplot (4,4,trail+8)
%         plot(M_DATA.eef_force(3,:),'LineWidth',2);
%         hold on
%         plot(M_DATA.eef_force(1,:),'r','LineWidth',2);
%         plot([start_point,end_point],[M_DATA.eef_force(3,start_point),M_DATA.eef_force(3,end_point)],'s','MarkerFaceColor','red','Markersize',6);
%         title([trail_name,' Z Force'])
%         grid on
%         
%         subplot(4,4,trail+12)
%         emg_sum = sum(M_DATA.EMG_signal(2:end-1,:).*M_DATA.EMG_signal(2:end-1,:));
%         plot(emg_sum,'LineWidth',2);
%         hold on
%         plot([start_point,end_point],[emg_sum(start_point),emg_sum(end_point)],'s','MarkerFaceColor','red','Markersize',6);
%         title([trail_name,' EMG Contract'])
%         grid on
%     end
%     sgtitle(['Subject',num2str(subject)])
%      
    
    figure(subject+10)
    
    for trail = 1:4
        switch trail
            case 1
                M_DATA = M1;
            case 2
                M_DATA = M2;
            case 3
                M_DATA = M3;
            case 4
                M_DATA = M4;
        end
        trail_name = ['Mode',num2str(trail)];
        x_trajectory = M_DATA.eef_position(1,:);
        subplot(4,1,trail)
        plot([1:size(x_trajectory,2)]*0.018,x_trajectory,'LineWidth',2);
        hold on
        title([trail_name,' Main Axis Position [m]'])
        set(gca, 'linewidth', 1.1, 'fontsize', 15, 'fontname', 'times',...
                'TickLength',[0 0], 'XTick', [] ) %
        xlabel({'Time [s]'})
        grid on
    end
    sgtitle(['Subject',num2str(subject)])    
end

