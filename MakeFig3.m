
% This script loads the Recalibration data and produces Figure 3.
% The data are loaded from Excel Tables that hold the judgement errors and the slopes respectively.


clear; close all;

dva{1} = [15,5,-5,-15];;
dva{2} = [30,15,-15,-30];

Integ{1} = readtable('Exp1_recalibrationt_xq.xls');
Integ{2} = readtable('Exp2_recalibrationt_xq.xls');

colors(1,:) = [0 0 0]; 
colors(2,:) = [0.4 0.4 0.4];
colors2(1,:) = [0 0 0]; 
colors2(2,:) = [1 1 1 ];

LS = {'-','--'};
LAB = {'a','b'};

figure(1);clf;

%-----------------------------------
% mean error for exp 1/2

for e=1:2
  subplot(2,2,e); hold on;
  JE = table2array(Integ{e});
  JE = JE(:,[17:24]);
  
  for o=1:2 % same  / opposite
    for d=1:4
      MV(o,d) = mean(JE(:,d+(o-1)*4));
      [~,~,ci] = ttest(JE(:,d+(o-1)*4),0,'alpha',0.05,'tail','both');
      CI(o,d) = MV(o,d)-ci(1);
    end
  end
  
  for o=1:2
    h = errorbar(dva{e},MV(o,:),CI(o,:),'o-');
    set(h,'LineWidth',2,'color',colors(o,:),'LineStyle',LS{o});
     set(h,'MarkerFaceColor',colors2(o,:),'MarkerEdgeColor',colors(o,:),'MarkerSize',8);
  end
  h = line([-30 30],[0 0]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  h = line([-30 30],[-30 30]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  h = line([0 0],[-20 20]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  
  
  axis([-35 35 -20 20]);
  set(gca,'XTick',[-30,-15,-5,5,15,30],'YTick',[-15:5:15])
  xlabel('visuo-motor discrepancy [deg]'); ylabel('recalibration bias [deg]')
  
  text(-32,18,LAB{e},'FontSize',15,'FontWeight','Bold');
  if e==1
    legend({'same','opposite'});
  end
end


%-----------------------------------
% Slopes for both
MV=[]; CI=[];

Sl{1} = readtable('Exp1_judge_slope.xls');
Sl{2} = readtable('Exp2_judge_slope.xls');

subplot(2,2,3); hold on;

for e=1:2
  tmp  = table2array(Sl{e});
  for o = 1:2 % same / opposite directions
    offset= [1,4];
    % convert string to num
    for s=1:size(tmp,1)
      for i=1:2
        Slope(s,i) = str2num(tmp{s,i+offset(o)});
        Slope(s,i) = str2num(tmp{s,i+offset(o)});
      end
    end
    % pre-test and post-test slopes
    for c=1:2
      MV(c) = mean(Slope(:,c));
      [~,~,ci] = ttest(Slope(:,c),0,'alpha',0.05,'tail','both');
      CI(c) = MV(c)-ci(1);
    end
     sanity_slope(e,o,:) = MV;
    % first show single participant data
    for s=1:size(Slope,1)
      h = line([1,2]+(o-1)*2+(e-1)*5,[Slope(s,1),Slope(s,2)]);
      set(h,'LineWidth',1,'color',[0.7 0.7 0.7]);
    end
    
    for c=1:2
      h = errorbar(c+(o-1)*2+(e-1)*5,MV(c),CI(c),'o');
      set(h,'LineWidth',2,'color',colors(o,:),'LineStyle',LS{o});
      set(h,'MarkerFaceColor',colors2(o,:),'MarkerEdgeColor',colors(o,:),'MarkerSize',8);
    end
  end
end

h = line([0 10],[0 0]);
set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
h = line([5 5],[-0.4 0.4]);
set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
text(2,-0.4,'Exp 1','FontSize',10);
text(7,-0.4,'Exp 2','FontSize',10);


axis([0 10 -0.5 0.5]);
set(gca,'XTick',[1.5,3.5,6.5,8.5],'XTickLabel',{'same','opposite'},'YTick',[-.5:0.25:0.5])
xlabel(''); ylabel('slopes')

text(0.5,0.45,'c','FontSize',15,'FontWeight','Bold');




%-----------------------------------
% errors in pre-test
MV=[]; CI=[];

subplot(2,2,4); hold on;
for e=1:2
  JE = table2array(Integ{e});
  JE = JE(:,[1:8]);
  
  for o=1:2 % same  / opposite
    for d=1:4
      MV(o,d) = mean(JE(:,d+(o-1)*4));
      [~,~,ci] = ttest(JE(:,d+(o-1)*4),0,'alpha',0.05,'tail','both');
      CI(o,d) = MV(o,d)-ci(1);
    end
  end
  
  for o=1:2
    h = errorbar(dva{e},MV(o,:),CI(o,:),'o-');
    set(h,'LineWidth',2,'color',colors(o,:),'LineStyle',LS{o});
    set(h,'MarkerFaceColor',colors2(o,:),'MarkerEdgeColor',colors(o,:),'MarkerSize',8);
  end

  h = line([-30 30],[0 0]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  h = line([-30 30],[-30 30]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  h = line([0 0],[-20 20]);
  set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');
  
  
  axis([-35 35 -20 20]);
  set(gca,'XTick',[-30,-15,-5,5,15,30],'YTick',[-15:5:15])
  xlabel('visuo-motor discrepancy [deg]'); ylabel('judgement errror [deg]')
  text(-32,18,'d','FontSize',15,'FontWeight','Bold');
end













set(gcf,'Position',[ 65         235        1353         552])

