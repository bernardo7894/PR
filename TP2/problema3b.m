clear; close all;

syms f;

fc10 = 6.56e9;
fc20 = 13.1e9;
fc11 = 11.8e9;

beta = (2*pi*f)/physconst('LightSpeed');

beta_g_10 = beta * sqrt(1-(fc10/f)^2);
beta_g_20 = beta * sqrt(1-(fc20/f)^2);
beta_g_11 = beta * sqrt(1-(fc11/f)^2);


fplot(beta_g_10, 'LineWidth', 2), hold on;
fplot(beta_g_20, 'LineWidth', 2), hold on;
fplot(beta_g_11, 'LineWidth', 2), hold off;
xlim([fc10*0.75 fc11/0.25]);
xlabel('Frequência [Hz]'), ylabel('\beta_g'), ...
    title('Evolução da constante de propagação com a frequência');
legend('\beta_g_{10}', '\beta_g_{20}', '\beta_g_{11}');