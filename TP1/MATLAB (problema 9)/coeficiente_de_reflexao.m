function [modulo, fase, pin] = coeficiente_de_reflexao(f, ZL, Z0, alfa, v, l)
    % obter apenas a imped�ncia de entrada da fun��o feita anteriormente
    [~,~,Zl] = impedancia_lt(f, ZL, Z0, alfa, v, l);
    
    % coeficiente de reflex�o
    pin = (Zl-Z0)./(Zl + Z0);
    
    % m�dulo e fase do coeficiente de reflex�o
    modulo = abs(pin);
    fase = angle(pin);
end