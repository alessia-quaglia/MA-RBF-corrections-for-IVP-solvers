function p = multistep_region(x, y, coeffs, face_color, edge_color, alpha_val)
%
% Usage:   p = multistep_region(x, y, coeffs, face_color, edge_color, alpha_val)
% Purpose: the function plots the filled stability region of a 
%          multistep method in the complex plane based on its 
%          characteristic polynomial 
% Input:   x = row vector defining the real axis of the 
%              complex plane
%          y = row vector defining the imaginary axis of the
%              complex plane
%     coeffs = function returning the characteristic 
%              polynomial coefficients of the method
% face_color = RGB vector or character for region fill 
% edge_color = RGB vector or character for boundary line 
%  alpha_val = transparency value 
% Output:  p = patch handle for creating a legend entry
%
[X, Y] = meshgrid(x, y);
Z = X + 1i*Y;
Stable = zeros(size(Z));
for i = 1:numel(Z)
    z = Z(i);
    poly_coeffs = coeffs(z);
    xi = roots(poly_coeffs);
    if all(abs(xi) <= 1)
        Stable(i) = 1;
    end
end
[~, h] = contourf(X, Y, Stable, [0.5 0.5]);
h.FaceColor = face_color;
h.FaceAlpha = alpha_val;
h.EdgeColor = edge_color;
h.LineWidth = 2;
p = patch(NaN, NaN, face_color, 'EdgeColor', edge_color, 'LineWidth', 1.8);
xlabel('\Re(h\lambda)');
ylabel('\Im(h\lambda)');
axis square;
grid on;