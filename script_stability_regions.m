% The following script generates the absolute stability regions 
% for the developed MA-RBF corrections, with a comparative analysis 
% against classical methods and their MQ-RBF counterparts.

addpath('Stability region')

% Figure 1(a)
x = linspace(-3, 3, 400);
y = linspace(-3, 3, 400);
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;                    
R = 1 + Z;                        % Euler
figure
onestep_boundary(x, y, R, 'k');
hold on 
R1 = 1 + Z + Z.^2/2 + Z.^3/2;     % MQ-RBF Euler 
onestep_boundary(x, y, R1, 'b');
R2 = 1 + Z + Z.^2/2 - Z.^3/2;     % MA-RBF Euler
onestep_boundary(x, y, R2, 'g');
legend('Euler', 'MQ-RBF Euler', 'MA-RBF Euler', 'Location', 'best');
axis([-3 3 -3 3])
axis square
hold off;


%% Figure 1(b)
figure
N = 5000;
eta = linspace(-2, 2, N);
z_val = zeros(3, N);
for k = 1:N
    z_val(:,k) = roots([1, 0, 6, -3i * eta(k)]);
end
z = z_val(:);
plot([0, 0], [-1, 1], 'Color', 'b', 'LineWidth', 2, ...      % Midpoint
    'DisplayName', 'Midpoint');
hold on
plot(real(z), imag(z), '.', 'Color', 'r', 'MarkerSize', ...  % MQ/MA-RBF midpoint
    4, 'HandleVisibility', 'off');
plot(nan, nan, '-', 'Color', 'r', 'LineWidth', 2, ...
    'DisplayName', 'MQ/MA-RBF midpoint');
legend('Location', 'best')
xlabel('\Re(h\lambda)');
ylabel('\Im(h\lambda)');
axis([-3 3.2 -3 3])
axis square;
box on; grid on;
hold off;


%% Figure 2(a)
figure
AB2_classical_stability                                      % AB2
hold on
x = linspace(-3, 3, 800);  
y = linspace(-3, 3, 800);   
coeffs_MQ = @(z)[ 1, -(1+3/2*z-7/24*z^3), 1/2*z-17/24*z^3];  % MQ-RBF AB2
multistep_boundary(x,y,coeffs_MQ,'r')
coeffs_MA = @(z)[ 1, -(1+3/2*z+41/24*z^3), 1/2*z+31/24*z^3]; % MA-RBF AB2
multistep_boundary(x,y,coeffs_MA,'g')
legend('AB2', 'MQ-RBF AB2', 'MA-RBF AB2', 'Location', 'best')
axis([-2 1 -1.5 1.5])
hold off;


%% Figure 2(b)
figure
x = linspace(-6, 6, 600);
y = linspace(-6, 6, 600);
coeffs_AM1 = @(z) [(1 - z/2), -(1 + z/2)];
coeffs_RBF_AM1 = @(z) [(1 - z/2 + z^3/24), -(1 + z/2 - z^3/24)];
p1 = multistep_region(x, y, coeffs_AM1, [1 0.75 0.75], 'r', 0.7);   % AM1
hold on
p2 = multistep_region(x, y, coeffs_RBF_AM1, [0.6 0.8 1], 'b', 0.7); % MQ/MA-RBF AM1
legend([p1, p2], {'AM1', 'MQ/MA-RBF AM1'}, 'Location', 'best');
axis([-6 6 -6 6])
hold off;
