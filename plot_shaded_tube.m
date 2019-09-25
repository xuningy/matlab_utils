function varargout = plot_shaded_tube(x, y, vx, vy, dist, fstr);
% x: x coordinates
% y: either just one y vector, or 2xN or 3xN matrix of y-data
% fstr: format ('r' or 'b--' etc)

if size(y,2)<size(y,1)
    y=y';
    x=x';
    dist = dist';
    vx = vx';
    vy = vy';
end

x_ub = [];
x_lb = [];
y_lb = [];
y_ub = [];

for i = 1:length(vx)

  v_orth = [1, - (vx(i)) / vy(i)];     % compute the orthogonal vector at each point.
  v_orth = v_orth / norm(v_orth);  % normalize it
  v_orth = v_orth * dist(i);       % scale it wrt dist

  v_upper = [x(i), y(i)] + v_orth;
  v_lower = [x(i), y(i)] - v_orth;

  x_ub(end+1) = v_upper(1);
  x_lb(end+1) = v_lower(1);
  y_ub(end+1) = v_upper(2);
  y_lb(end+1) = v_lower(2);

end

px=[x_ub,fliplr(x_lb)];
py=[y_ub,fliplr(y_lb)];
patch(px,py,1,'FaceColor',fstr,'EdgeColor','none');
plot(x,y,'Color', fstr);


alpha(.2); % make patch transparent
