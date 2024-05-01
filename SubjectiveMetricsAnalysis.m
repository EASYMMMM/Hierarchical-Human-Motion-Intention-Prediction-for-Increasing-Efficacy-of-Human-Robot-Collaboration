clc,clear,close all
% The analysis of subjective metric  (Fig.5 in the paper)

%% The analysis of subjective metric  (Fig.5 in the paper)
% 10 Subjects * 6 Questions
Score_M1 = zeros(10,6);
Score_M2 = zeros(10,6);
Score_M3 = zeros(10,6);
Score_M4 = zeros(10,6);
RANK = zeros(10,4);    % Ranking of favorate mode 


%% Questionnaire Results
% S1
% M1
Score_M1(1,1) = 1; % The robot can adapt to my movements
Score_M1(1,2) = 1; % The robot can predict my movements.
Score_M1(1,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M1(1,4) = 1; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(1,5) = 1; % The robot aided my task and made it easier for me.
Score_M1(1,6) = 5; % The robot is safe.
% M2
Score_M2(1,1) = 4; % The robot can adapt to my movements
Score_M2(1,2) = 3; % The robot can predict my movements.
Score_M2(1,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M2(1,4) = 2; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(1,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(1,6) = 5; % The robot is safe.
% M3
Score_M3(1,1) = 4; % The robot can adapt to my movements
Score_M3(1,2) = 5; % The robot can predict my movements.
Score_M3(1,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M3(1,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(1,5) = 5; % The robot aided my task and made it easier for me.
Score_M3(1,6) = 5; % The robot is safe.
% M4
Score_M4(1,1) = 5; % The robot can adapt to my movements
Score_M4(1,2) = 5; % The robot can predict my movements.
Score_M4(1,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M4(1,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(1,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(1,6) = 5; % The robot is safe.
% RANK
RANK(1,1) = 1;
RANK(1,2) = 2;
RANK(1,3) = 3;
RANK(1,4) = 4;


% S2
% M1
Score_M1(2,1) = 5; % The robot can adapt to my movements
Score_M1(2,2) = 4; % The robot can predict my movements.
Score_M1(2,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M1(2,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(2,5) = 4; % The robot aided my task and made it easier for me.
Score_M1(2,6) = 5; % The robot is safe.
% M2
Score_M2(2,1) = 4; % The robot can adapt to my movements
Score_M2(2,2) = 4; % The robot can predict my movements.
Score_M2(2,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M2(2,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(2,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(2,6) = 5; % The robot is safe.
% M3
Score_M3(2,1) = 4; % The robot can adapt to my movements
Score_M3(2,2) = 3; % The robot can predict my movements.
Score_M3(2,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M3(2,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(2,5) = 3; % The robot aided my task and made it easier for me.
Score_M3(2,6) = 5; % The robot is safe.
% M4
Score_M4(2,1) = 4; % The robot can adapt to my movements
Score_M4(2,2) = 4; % The robot can predict my movements.
Score_M4(2,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M4(2,4) = 3; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(2,5) = 3; % The robot aided my task and made it easier for me.
Score_M4(2,6) = 5; % The robot is safe.
% RANK
RANK(2,1) = 2;
RANK(2,2) = 1;
RANK(2,3) = 4;
RANK(2,4) = 3;


% S3
% M1
Score_M1(3,1) = 5; % The robot can adapt to my movements
Score_M1(3,2) = 1; % The robot can predict my movements.
Score_M1(3,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M1(3,4) = 3; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(3,5) = 1; % The robot aided my task and made it easier for me.
Score_M1(3,6) = 5; % The robot is safe.
% M2
Score_M2(3,1) = 4; % The robot can adapt to my movements
Score_M2(3,2) = 4; % The robot can predict my movements.
Score_M2(3,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M2(3,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(3,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(3,6) = 5; % The robot is safe.
% M3
Score_M3(3,1) = 5; % The robot can adapt to my movements
Score_M3(3,2) = 2; % The robot can predict my movements.
Score_M3(3,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M3(3,4) = 0; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(3,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(3,6) = 5; % The robot is safe.
% M4
Score_M4(3,1) = 5; % The robot can adapt to my movements
Score_M4(3,2) = 5; % The robot can predict my movements.
Score_M4(3,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M4(3,4) = 0; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(3,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(3,6) = 5; % The robot is safe.
% RANK
RANK(3,1) = 1;
RANK(3,2) = 3;
RANK(3,3) = 2;
RANK(3,4) = 4;

% S4
% M1
Score_M1(4,1) = 4; % The robot can adapt to my movements
Score_M1(4,2) = 4; % The robot can predict my movements.
Score_M1(4,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M1(4,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(4,5) = 5; % The robot aided my task and made it easier for me.
Score_M1(4,6) = 3; % The robot is safe.
% M2
Score_M2(4,1) = 4; % The robot can adapt to my movements
Score_M2(4,2) = 4; % The robot can predict my movements.
Score_M2(4,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M2(4,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(4,5) = 5; % The robot aided my task and made it easier for me.
Score_M2(4,6) = 2; % The robot is safe.
% M3
Score_M3(4,1) = 4; % The robot can adapt to my movements
Score_M3(4,2) = 4; % The robot can predict my movements.
Score_M3(4,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M3(4,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(4,5) = 5; % The robot aided my task and made it easier for me.
Score_M3(4,6) = 3; % The robot is safe.
% M4
Score_M4(4,1) = 5; % The robot can adapt to my movements
Score_M4(4,2) = 4; % The robot can predict my movements.
Score_M4(4,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M4(4,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(4,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(4,6) = 3; % The robot is safe.
% RANK
RANK(4,1) = 1;
RANK(4,2) = 4;
RANK(4,3) = 2;
RANK(4,4) = 3;

% S5
% M1
Score_M1(5,1) = 5; % The robot can adapt to my movements
Score_M1(5,2) = 1; % The robot can predict my movements.
Score_M1(5,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M1(5,4) = 1; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(5,5) = 1; % The robot aided my task and made it easier for me.
Score_M1(5,6) = 5; % The robot is safe.
% M2
Score_M2(5,1) = 4; % The robot can adapt to my movements
Score_M2(5,2) = 3; % The robot can predict my movements.
Score_M2(5,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M2(5,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(5,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(5,6) = 5; % The robot is safe.
% M3
Score_M3(5,1) = 4; % The robot can adapt to my movements
Score_M3(5,2) = 2; % The robot can predict my movements.
Score_M3(5,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M3(5,4) = 2; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(5,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(5,6) = 5; % The robot is safe.
% M4
Score_M4(5,1) = 4; % The robot can adapt to my movements
Score_M4(5,2) = 4; % The robot can predict my movements.
Score_M4(5,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M4(5,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(5,5) = 4; % The robot aided my task and made it easier for me.
Score_M4(5,6) = 5; % The robot is safe.
% RANK
RANK(5,1) = 1;
RANK(5,2) = 2;
RANK(5,3) = 3;
RANK(5,4) = 4;

% S6
% M1
Score_M1(6,1) = 3; % The robot can adapt to my movements
Score_M1(6,2) = 1; % The robot can predict my movements.
Score_M1(6,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M1(6,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(6,5) = 1; % The robot aided my task and made it easier for me.
Score_M1(6,6) = 5; % The robot is safe.
% M2
Score_M2(6,1) = 4; % The robot can adapt to my movements
Score_M2(6,2) = 2; % The robot can predict my movements.
Score_M2(6,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M2(6,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(6,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(6,6) = 5; % The robot is safe.
% M3
Score_M3(6,1) = 3; % The robot can adapt to my movements
Score_M3(6,2) = 2; % The robot can predict my movements.
Score_M3(6,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M3(6,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(6,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(6,6) = 5; % The robot is safe.
% M4
Score_M4(6,1) = 4; % The robot can adapt to my movements
Score_M4(6,2) = 4; % The robot can predict my movements.
Score_M4(6,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M4(6,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(6,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(6,6) = 5; % The robot is safe.
% RANK
RANK(6,1) = 1;
RANK(6,2) = 2;
RANK(6,3) = 3;
RANK(6,4) = 4;

% S7
% M1
Score_M1(7,1) = 4; % The robot can adapt to my movements
Score_M1(7,2) = 2; % The robot can predict my movements.
Score_M1(7,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M1(7,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(7,5) = 2; % The robot aided my task and made it easier for me.
Score_M1(7,6) = 5; % The robot is safe.
% M2
Score_M2(7,1) = 4; % The robot can adapt to my movements
Score_M2(7,2) = 2; % The robot can predict my movements.
Score_M2(7,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M2(7,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(7,5) = 3; % The robot aided my task and made it easier for me.
Score_M2(7,6) = 5; % The robot is safe.
% M3
Score_M3(7,1) = 4; % The robot can adapt to my movements
Score_M3(7,2) = 3; % The robot can predict my movements.
Score_M3(7,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M3(7,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(7,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(7,6) = 5; % The robot is safe.
% M4
Score_M4(7,1) = 4; % The robot can adapt to my movements
Score_M4(7,2) = 4; % The robot can predict my movements.
Score_M4(7,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M4(7,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(7,5) = 4; % The robot aided my task and made it easier for me.
Score_M4(7,6) = 5; % The robot is safe.
% RANK
RANK(7,1) = 1;
RANK(7,2) = 2;
RANK(7,3) = 3;
RANK(7,4) = 4;

% S8
% M1
Score_M1(8,1) = 1; % The robot can adapt to my movements
Score_M1(8,2) = 1; % The robot can predict my movements.
Score_M1(8,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M1(8,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(8,5) = 1; % The robot aided my task and made it easier for me.
Score_M1(8,6) = 1; % The robot is safe.
% M2
Score_M2(8,1) = 2; % The robot can adapt to my movements
Score_M2(8,2) = 2; % The robot can predict my movements.
Score_M2(8,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M2(8,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(8,5) = 2; % The robot aided my task and made it easier for me.
Score_M2(8,6) = 2; % The robot is safe.
% M3
Score_M3(8,1) = 4; % The robot can adapt to my movements
Score_M3(8,2) = 4; % The robot can predict my movements.
Score_M3(8,3) = 2; % I need to adjust my movement according to robot's movement.
Score_M3(8,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(8,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(8,6) = 4; % The robot is safe.
% M4
Score_M4(8,1) = 5; % The robot can adapt to my movements
Score_M4(8,2) = 5; % The robot can predict my movements.
Score_M4(8,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M4(8,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(8,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(8,6) = 5; % The robot is safe.
% RANK
RANK(8,1) = 1;
RANK(8,2) = 2;
RANK(8,3) = 3;
RANK(8,4) = 4;

% S9
% M1
Score_M1(9,1) = 2; % The robot can adapt to my movements
Score_M1(9,2) = 2; % The robot can predict my movements.
Score_M1(9,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M1(9,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(9,5) = 2; % The robot aided my task and made it easier for me.
Score_M1(9,6) = 4; % The robot is safe.
% M2
Score_M2(9,1) = 3; % The robot can adapt to my movements
Score_M2(9,2) = 2; % The robot can predict my movements.
Score_M2(9,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M2(9,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(9,5) = 2; % The robot aided my task and made it easier for me.
Score_M2(9,6) = 5; % The robot is safe.
% M3
Score_M3(9,1) = 4; % The robot can adapt to my movements
Score_M3(9,2) = 3; % The robot can predict my movements.
Score_M3(9,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M3(9,4) = 4; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(9,5) = 4; % The robot aided my task and made it easier for me.
Score_M3(9,6) = 5; % The robot is safe.
% M4
Score_M4(9,1) = 5; % The robot can adapt to my movements
Score_M4(9,2) = 5; % The robot can predict my movements.
Score_M4(9,3) = 1; % I need to adjust my movement according to robot's movement.
Score_M4(9,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(9,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(9,6) = 5; % The robot is safe.
% RANK
RANK(9,1) = 1;
RANK(9,2) = 3;
RANK(9,3) = 2;
RANK(9,4) = 4;

% S10
% M1
Score_M1(10,1) = 2; % The robot can adapt to my movements
Score_M1(10,2) = 1; % The robot can predict my movements.
Score_M1(10,3) = 4; % I need to adjust my movement according to robot's movement.
Score_M1(10,4) = 2; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M1(10,5) = 2; % The robot aided my task and made it easier for me.
Score_M1(10,6) = 4; % The robot is safe.
% M2
Score_M2(10,1) = 3; % The robot can adapt to my movements
Score_M2(10,2) = 3; % The robot can predict my movements.
Score_M2(10,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M2(10,4) = 2; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M2(10,5) = 4; % The robot aided my task and made it easier for me.
Score_M2(10,6) = 5; % The robot is safe.
% M3
Score_M3(10,1) = 4; % The robot can adapt to my movements
Score_M3(10,2) = 4; % The robot can predict my movements.
Score_M3(10,3) = 3; % I need to adjust my movement according to robot's movement.
Score_M3(10,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M3(10,5) = 5; % The robot aided my task and made it easier for me.
Score_M3(10,6) = 5; % The robot is safe.
% M4
Score_M4(10,1) = 5; % The robot can adapt to my movements
Score_M4(10,2) = 5; % The robot can predict my movements.
Score_M4(10,3) = 5; % I need to adjust my movement according to robot's movement.
Score_M4(10,4) = 5; % (If adjusted) I think it is more energy efficient after adjustment.
Score_M4(10,5) = 5; % The robot aided my task and made it easier for me.
Score_M4(10,6) = 5; % The robot is safe.
% RANK
RANK(10,1) = 1;
RANK(10,2) = 2;
RANK(10,3) = 3;
RANK(10,4) = 4;



%% Plot
f = figure(128);
M4Color = '#0D6ED4';
M3Color = '#71A9FF';
M2Color = '#C3A875';
M1Color = '#574416';
bar_width = 0.2;
bar_result =[ ];
std_result = [ ];
xlim = [0.3,6.7];
ylim = [0,8];
for i = 1:6
    result = [ mean(Score_M1(:,i)),  mean(Score_M2(:,i)), mean(Score_M3(:,i)), mean(Score_M4(:,i))];
    x = [i - bar_width*1.5, i - bar_width*0.5, i+bar_width*0.5, i+bar_width*1.5];
    bar_result = [bar_result; result];
    result = [ std(Score_M1(:,i)),  std(Score_M2(:,i)), std(Score_M3(:,i)), std(Score_M4(:,i))];
    std_result = [std_result ; result];
    %    bar(x, result, bar_width);
    hold on
%     for j = 1:4
%         text(j,result(j),num2str(result(j)),'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',12,'FontName','Times New Roman');
%     end
%    title(fig_title(i));
%     xticklabels({'Mode1','Mode2','Mode3','Mode4'})
end
result = [ mean(RANK(:,1)), mean(RANK(:,2)), mean(RANK(:,3)), mean(RANK(:,4))];
bar_result = [bar_result; result];
result = [ std(RANK(:,1)), std(RANK(:,2)), std(RANK(:,3)), std(RANK(:,4))];
std_result = [std_result ; result];

set(gcf,'unit','normalized','position',[0.2,0.2,0.6,0.7])
plot([0,8],[1,1],'Color','#D2DCDB','Linewidth',1.2)
plot([0,8],[2,2],'Color','#D2DCDB','Linewidth',1.2)
plot([0,8],[3,3],'Color','#D2DCDB','Linewidth',1.2)
plot([0,8],[4,4],'Color','#D2DCDB','Linewidth',1.2)
plot([0,8],[5,5],'Color','#D2DCDB','Linewidth',1.2)
b= bar(bar_result,0.9,'hist');

b(1).FaceColor = M1Color;
b(2).FaceColor = M2Color;
b(3).FaceColor = M3Color;
b(4).FaceColor = M4Color;
b(1).EdgeColor = M1Color;
b(2).EdgeColor = M2Color;
b(3).EdgeColor = M3Color;
b(4).EdgeColor = M4Color;
ax = gca;
ax.XLim = [0.3,7.7];
ax.YLim = [1,5];
xticks([1 2 3 4 5 6 7]);
xticklabels({'Q1','Q2','Q3','Q4','Q5','Q6','Q7'});
yticks([0 1 2 3 4 5 ]);
yticklabels({'0','1','2','3','4','5'})
xlabel('Question');
ylabel('Rating');

plot([0,8],[0,0],'k','Linewidth',1.2);
legend([b(1),b(2),b(3),b(4) ],'Mode1','Mode2','Mode3','Mode4','fontsize', 17);
set(gca, 'linewidth', 1.1, 'fontsize', 19, 'fontname', 'times' ) %去掉x，y坐标轴的刻度

x = [ 1-0.09*3,1-0.09,1+0.09,1+0.09*3; 2-0.09*3,2-0.09,2+0.09,2+0.09*3;  3-0.09*3,3-0.09,3+0.09,3+0.09*3; 4-0.09*3,4-0.09,4+0.09,4+0.09*3; 5-0.09*3,5-0.09,5+0.09,5+0.09*3; 6-0.09*3,6-0.09,6+0.09,6+0.09*3; 7-0.09*3,7-0.09,7+0.09,7+0.09*3]; 
%hE = errorbar(x,bar_result,std_result);
%set(hE, 'Linestyle', 'none', 'Color', 'k', 'LineWidth', 1.2)


