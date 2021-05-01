function [parte_real, parte_imag, Zin] = impedancia_de_entrada( f, ZL, Z0, alfa, v, l )
    % comprimento de onda
    lambda = v./f;

    % constante de fase
    beta = (2*pi) ./ lambda;

    % constante de propagação
    y = alfa + 1j*beta;
    
    % caso ZL seja infinito muda-se a expressão porque há uma
    % indeterminação que o MATLAB não sabe resolver
    if ZL == Inf
        Zin = Z0 ./ tanh(y*l);
        parte_real = real(Zin);
        parte_imag = imag(Zin);
    else
        Zin = Z0 * (ZL+Z0*tanh(y*l))./(Z0+ZL*tanh(y*l));
        parte_real = real(Zin);
        parte_imag = imag(Zin);
    end
end