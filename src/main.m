%%%%% Main %%%%%
%
% Computes an approximation of pi using Monte Carlo methods
%
% Author: sgalella
% https://github.com/sgalella

% Set origin and radius
x = 0;
y = 0;
radius = 1;

% Set number of points
N = 100;

% Plot circle
figure()
viscircles([x, y], radius, 'Color', 'r');
hold on;

% Generate N random points and determine if they are inside or outside the
% circle
newPoints = zeros(N, 3);
newPoints(:, 1:2) = -radius + 2*radius*rand(N, 2);
newPoints(:, 3) = newPoints(:, 1).^2 + newPoints(:, 2).^2 <= radius^2;

% Plot points
gscatter(newPoints(:,1), newPoints(:,2), newPoints(:,3),'br','..')
xlim([-radius radius])
ylim([-radius radius])

% Calculate pi from the points
approxPi = 4*sum(newPoints(:,3)) / N;
approxAreaCircle = 4*radius^2*sum(newPoints(:,3)) / N;

title(strcat('Area circle $\approx \ $', num2str(approxAreaCircle, 5), '$ \ (\pi \approx \ $ ', num2str(approxPi, 5), ')'), 'interpreter','latex', 'fontSize', 20)
legend off;
axis off;
set(gcf,'color','w');