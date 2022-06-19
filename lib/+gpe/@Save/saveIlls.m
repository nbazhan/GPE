function saveIlls(obj)
load([obj.Data, 't.mat'], 'ts')
load([obj.Data, 'l.mat'], 'ls')
load([obj.Data, 'Ub.mat'], 'Ubs')

font = 15;
width = 1.5;

sf = length(ts);
for s = 1:sf
load([obj.PsiMat, 'Psi', num2str(s), '.mat'], 'Psi')

PsiXY = sum(abs(Psi).^2, 3);
PhaseXY = angle(Psi(:, :, obj.grid.Nz/2));

cr = 10^6;
t = ts(s);

f = figure('visible', 'off', 'Position', [10 10 700 600]);
p = uipanel('Parent', f, 'BorderType', 'none'); 
p.Title = ['t = ', num2str(t, '%0.3f'), ' s']; 
p.TitlePosition = 'centertop'; 
p.FontSize = 24;
          
subplot(2, 2, 1, 'Parent', p);
imagesc(cr*obj.grid.r, cr*obj.grid.r, PsiXY);
axis image;
ylabel('y, $\mu m$', 'interpreter', 'latex', ...
                     'FontSize', font);
xlabel('x, $\mu m$', 'interpreter', 'latex', ...
                     'FontSize', font);
set(gca,'YDir','normal')
set(gca,'FontSize', font)
c = colorbar('Location','eastoutside');
c.Position = c.Position + [.05 0 0 0];
%c.Position = [0.5, 0.5, 0.2, 1];

subplot(2, 2, 2, 'Parent', p);
imagesc(cr*obj.grid.r, cr*obj.grid.r, PhaseXY);
axis image;
ylabel('y, $\mu m$', 'interpreter', 'latex', ...
                     'FontSize', font);
xlabel('x, $\mu m$', 'interpreter', 'latex', ...
                     'FontSize', font);
set(gca,'YDir','normal')
set(gca,'FontSize', font)
c = colorbar('Location','eastoutside');
c.Position = c.Position + [.05 0 0 0];
caxis([-pi, pi])

subplot(2, 2, [3, 4], 'Parent', p);
plot(ts, ls(:, 1), 'Color', 'blue', ...
                   'LineWidth', width);
hold on
plot(ts, ls(:, 2), 'Color', 'red', ...
                   'LineWidth', width);
hold on
set(gca,'FontSize', font)
ylabel('$L_i/N$', 'interpreter', 'latex', ...
                  'FontSize', font);
ylim([0, max(max(ls))+1])

yyaxis right
plot(ts, Ubs, 'Color', 'black', ...
              'LineWidth', width);
hold on;
set(gca,'FontSize', font)
ylabel('$U_b$', 'interpreter', 'latex', ...
                'FontSize', font);
xlabel('t, $\mu m$', 'interpreter', 'latex', ...
                     'FontSize', font);

plot(ts(s)*[1, 1], [min(Ubs), 1.1*max(Ubs)], 'Color', 'black', ...
                                             'LineWidth', width)
%xline(ts(s), 'Color', 'black', ...
%             'LineWidth', width)
                 
legend({'inner', 'outer', '$U_b$'}, ...
        'interpreter', 'latex', ...
        'FontSize', font, ...
        'Orientation','horizontal', ...
        'Location','northwest')
saveas(f,[obj.Ills, 'Ill' num2str(s) '.png']);
end
end