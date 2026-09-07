function table_latex(met_name, N, met_err, met_ord)
%
% Usage:        table(met_name, N, met_err, met_ord)
% Purpose:      it generates a LaTeX table showing the global errors and 
%               the convergence orders versus different values of N
%               for the analyzed methods
% Input: met_name = each element is a string containing the names of the methods
%               N = vector containing the number of steps considered
%         met_err = each element is a vector of global errors
%         met_ord = each element is a vector of convergence orders
% Output:       this function does not return values; it prints the LaTeX 
%               code directly to the command window
%
num_methods = length(met_name);
num_N = length(N);
fprintf('\\begin{table}[!htbp]\n');
fprintf('\\centering\n');
fprintf('\\small\n');
fprintf('\\setlength{\\tabcolsep}{4.5pt}\n');
col_spec = ['@{}c', repmat(' cc', 1, num_methods), '@{}'];
fprintf('\\begin{tabular}{%s}\n', col_spec);
fprintf('\\toprule\n');
header_methods = '&';
for m = 1:num_methods
    header_methods = [header_methods, sprintf('\\multicolumn{2}{c}{%s}', met_name{m})];
    if m < num_methods
        header_methods = [header_methods, ' &'];
    end
end
fprintf('%s \\\\\n', header_methods);
cmidrules = '';
for m = 1:num_methods
    c_start = 2 + (m - 1) * 2;
    c_end   = c_start + 1;
    cmidrules = [cmidrules, sprintf('\\cmidrule(lr){%d-%d}', c_start, c_end)];
end
fprintf('%s\n', strtrim(cmidrules));
header_cols = '$N$';
for m = 1:num_methods
    header_cols = [header_cols, ' & $E_N$ & $p_N$'];
end
fprintf('%s \\\\\n', header_cols);
fprintf('\\midrule\n');
for i = 1:num_N
    row_str = sprintf('%d', N(i));
    for m = 1:num_methods
        err_val = met_err{m}(i);
        ord_val = met_ord{m}(i);
        err_str = sprintf('%.2E', err_val);
        if i == 1 || isnan(ord_val)
            ord_str = '--';
        else
            ord_str = sprintf('%.4f', ord_val);
        end
        row_str = [row_str, sprintf(' & %s & %s', err_str, ord_str)];
    end
    fprintf('%s \\\\\n', row_str);
end
fprintf('\\bottomrule\n');
fprintf('\\end{tabular}\n');
fprintf('\\end{table}\n');
end
