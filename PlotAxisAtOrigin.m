function PlotAxisAtOrigin(x,y, c);
%PlotAxisAtOrigin Plot 2D axes through the origin
%   This is a 2D version of Plot3AxisAtOrigin written by Michael Robbins
%   File exchange ID: 3245. 
%
%   Have hun! 
%
%   Example:
%   x = -2*pi:pi/10:2*pi;
%   y = sin(x);
%   PlotAxisAtOrigin(x,y)
%

axiscolor = [0.5, 0.5, 0.5, 1];
% PLOT
if nargin == 3 
    plot(x,y, 'Color', c);
    hold on;
else
    display('   Not 2D Data set !')
end;

% GET TICKS
X=get(gca,'Xtick');
Y=get(gca,'Ytick');

% GET LABELS
XL=get(gca,'XtickLabel');
YL=get(gca,'YtickLabel');

% GET OFFSETS
Xoff=diff(get(gca,'XLim'))./40;
Yoff=diff(get(gca,'YLim'))./40;

% DRAW AXIS LINEs
plot(get(gca,'XLim'),[0 0],'Color',axiscolor);
plot([0 0],get(gca,'YLim'),'Color', axiscolor);

% Plot new ticks  
for i=1:length(X)
    plot([X(i) X(i)],[0 Yoff],'-', 'Color',axiscolor);
end
for i=1:length(Y)
   plot([Xoff, 0],[Y(i) Y(i)],'-', 'Color', axiscolor);
end

% ADD LABELS
text(X,zeros(size(X))-2.*Yoff,XL, 'Color', axiscolor);
text(zeros(size(Y))-3.*Xoff,Y,YL, 'Color', axiscolor);

box off;
% axis square;
axis off;
set(gcf,'color','w');

