clear, close all;

a = 2e-2; % a = 2 cm

v = physconst('LightSpeed');

syms f;

lambda = v/f;

tan_delta = 5.8e7;

w = 2*pi*f;

i = 1;

% a = b
b = a;

for m = 0:3
    for n = 0:3
        fc_ab(m+1,n+1) = v/2 * sqrt((m/a)^2+(n/b)^2);
        i = i + 1;
    end
end

i = 1;

% a = 2b
b = a/2;

for m = 0:3
    for n = 0:3
        fc_a2b(m+1,n+1) = v/2 * sqrt((m/a)^2+(n/b)^2);
        i = i + 1;
    end
end

for i = 1:3
    for j = 1:3
        atenuacao_ab(i,j) = pi/lambda * tan_delta / sqrt(1-(fc_ab(i,j)/f)^2);
        atenuacao_a2b(i,j) = pi/lambda * tan_delta / sqrt(1-(fc_a2b(i,j)/f)^2);
    end
end

modos_ab = fc_ab((fc_ab < 16e9) & (fc_ab > 6.5e9))'
modos_a2b = fc_a2b((fc_a2b < 16e9) & (fc_a2b > 6.5e9))'

mu0 = 4*pi*1e-7;
mur = 1;

mu = mur * mu0;

epsilon0 = 8.85e-12;
epsilonr = 1;

epsilon = epsilon0 * epsilonr; 

Rs = sqrt(((2*pi*f)*mu)/(2*5.8e7));

Z = sqrt(mu / epsilon);

% quando a = b

b = a;

ac_TE10_ab = Rs/Z * 1./sqrt(1-(modos_ab(1)/f).^2) .* (1/b + 2/a * (modos_ab(1)/f).^2);

ac_TE01_ab = ac_TE10_ab;

ac_TE11_ab = (2*Rs) / (Z*b) .* 1./sqrt(1-(modos_ab(4)/f).^2) .* ...
    ( (1+b/a)*(modos_ab(4)/f).^2+(1-(modos_ab(4)/f).^2)*(m^2*(b/a)^2+n^2*b/a)/ ...
    (m^2 * (b/a)^2 + n^2));

ac_TM11_ab = (2*Rs) / (Z*b) .* 1./sqrt(1-(modos_ab(4)/f).^2) .* ...
    (m^2 * (b/a)^3 + n^2) / (m^2 * (b/a)^2 + n^2);

ac_TE20_ab =  Rs/Z * 1./sqrt(1-(modos_ab(2)/f).^2) .* (1/b + 2/a * (modos_ab(2)/f).^2);

ac_TE02_ab = ac_TE20_ab;

% quando a = 2b

b = a/2;

ac_TE10_a2b = Rs/Z * 1./sqrt(1-(modos_a2b(1)/f).^2) .* (1/b + 2/a * (modos_a2b(1)/f).^2);

ac_TE20_a2b =  Rs/Z * 1./sqrt(1-(modos_a2b(3)/f).^2) .* (1/b + 2/a * (modos_a2b(3)/f).^2);

ac_TE01_a2b = ac_TE20_a2b;

% a = b

figure;
fplot(ac_TE10_ab, 'LineWidth', 2); hold on
fplot(ac_TE01_ab, '--', 'LineWidth', 2); hold on;
fplot(ac_TE02_ab, 'LineWidth', 2); hold on;
fplot(ac_TE20_ab, '--', 'LineWidth', 2); hold on;
fplot(ac_TM11_ab, 'LineWidth', 2); hold on;
fplot(ac_TE11_ab, 'LineWidth', 2); hold on;
hold off;

xlim([5e9 20e9]), ylim([0 0.1]);
    xlabel('Frequência [Hz]'), ylabel('\alpha [Np/m]'), ...
        title('Atenuação no guia quadrado em função da frequência');
legend('TE_{10}', 'TE_{01}', 'TE_{02}', 'TE_{20}', 'TM_{11}', 'TE_{11}');

% a = 2b

figure;
fplot(ac_TE10_a2b, 'LineWidth', 2); hold on;
fplot(ac_TE20_a2b, 'LineWidth', 2); hold on;
fplot(ac_TE01_a2b, '--', 'LineWidth', 2); hold on;
hold off;


xlim([5e9 20e9]), ylim([0 0.1]);
    xlabel('Frequência [Hz]'), ylabel('\alpha [Np/m]'), ...
        title('Atenuação no guia retangular (a = 2b) em função da frequência');
legend('TE_{10}', 'TE_{20}', 'TE_{01}');
