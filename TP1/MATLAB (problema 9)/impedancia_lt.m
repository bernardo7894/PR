function [parte_real, parte_imag, Zl] = impedancia_lt( f, ZL, Z0, alfa, v, l )
    % comprimento de onda
    lambda = v./f;

    % constante de fase
    beta = (2*pi) ./ lambda;

    % constante de propagação
    y = alfa + 1j*beta;
    
    % caso ZL seja infinito muda-se a expressão porque há uma
    % indeterminação que o MATLAB não sabe resolver
    if ZL == Inf
        Zl = Z0 ./ tanh(y*l);
        parte_real = real(Zl);
        parte_imag = imag(Zl);
    else
        Zl = Z0 * (ZL+Z0*tanh(y*l))./(Z0+ZL*tanh(y*l));
        parte_real = real(Zl);
        parte_imag = imag(Zl);
    end
end