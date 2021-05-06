function [modulo, fase, pin] = coeficiente_de_reflexao(f, ZL, Z0, alfa, v, l)
    % obter apenas a impedância de entrada da função feita anteriormente
    [~,~,Zl] = impedancia_lt(f, ZL, Z0, alfa, v, l);
    
    % coeficiente de reflexão
    pin = (Zl-Z0)./(Zl + Z0);
    
    % módulo e fase do coeficiente de reflexão
    modulo = abs(pin);
    fase = angle(pin);
end