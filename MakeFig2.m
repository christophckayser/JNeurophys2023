

% This script loads the Integration data and produces Figure 2.
% The data are loaded from Excel Tables that hold the judgement errors and the slopes respectively.

clear; close all;

dva{1} = [15,5,-5,-15];;
dva{2} = [30,15,-15,-30];

Integ{1} = readtable('Exp1_ integrationl_xq.xls');
Integ{2} = readtable('Exp2_ integrationl_xq.xls');

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
  subplot(1,3,e); hold on;
  JE = table2array(Integ{e});
  
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
  xlabel('visuo-motor discrepancy [deg]'); ylabel('judgement error [deg]')
  
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

subplot(1,3,3); hold on;

for e=1:2
  tmp  = table2array(Sl{e});
  % convert string to num
  for s=1:size(tmp,1)
    for i=[1,4]
      Slope(s,i) = str2num(tmp{s,i});
      Slope(s,i) = str2num(tmp{s,i});
    end
  end
  tmp = Slope(:,[1,4]);
  for o=1:2
    MV(o) = mean(tmp(:,o));
    [~,~,ci] = ttest(tmp(:,o),0,'alpha',0.05,'tail','both');
    CI(o) = MV(o)-ci(1);
  end
   sanity_slope(e,:) = MV;
  % first show single participant data
  for s=1:size(tmp,1)
    h = line([1,2]+(e-1)*2,[tmp(s,1),tmp(s,2)]);
    set(h,'LineWidth',1,'color',[0.7 0.7 0.7]);
  end
  for o=1:2
    h = errorbar(o+(e-1)*2,MV(o),CI(o),'o');
    set(h,'LineWidth',2,'color',colors(o,:),'LineStyle',LS{o});
    h = plot(o+(e-1)*2,MV(o),'o');
    set(h,'MarkerFaceColor',colors2(o,:),'MarkerEdgeColor',colors(o,:),'MarkerSize',8);
  end
end

h = line([0 5],[0 0]);
set(h,'LineWidth',1,'color',[0.7 0.7 0.7],'LineStyle','--');

axis([0 5 -0.2 1]);
set(gca,'XTick',[1.5,3.5],'XTickLabel',{'Exp 1','Exp 2 '},'YTick',[0:0.2:1])
xlabel(''); ylabel('slopes')

text(0.2,0.95,'c','FontSize',15,'FontWeight','Bold');

set(gcf,'Position',[ 65         209        1263         309])



