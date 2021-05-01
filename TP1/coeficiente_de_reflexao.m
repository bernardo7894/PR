function [modulo, fase, pin] = coeficiente_de_reflexao(f, ZL, Z0, alfa, v, l)
    % obter apenas a impedância de entrada da função feita anteriormente
    [~,~,Zin] = impedancia_de_entrada(f, ZL, Z0, alfa, v, l);
    
    % coeficiente de reflexão
    pin = (Zin-Z0)./(Zin + Z0);
    
    % módulo e fase do coeficiente de reflexão
    modulo = abs(pin);
    fase = angle(pin);
end