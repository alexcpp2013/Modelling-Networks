%% Розрахунок пропускної здатності неперервного гаусового каналу
EbNodB = (1/4) * Nvar + 5  % відношення енергії біта до спектральної густини потужності
Cawgn = W .* log2(1 + (10.^(0.1 .* EbNodB)) .* Rb ./ W)
%Cawgn = W .* log2(1 + (10 .^(0.1 .* EbNodB)) .* Cawgn ./ W)
plot(EbNodB,Cawgn,'ok'); grid on; hold on
%% Графік граничної пропускної здатності від EbNo при заданій ширині смуги
%% частоти
EbNo = [0 : 1: 13];
Cawgn = W .* log2(1 + (10.^(0.1 .* EbNo)) .* (Rb ./ W));
%Cawgn = W .* log2(1 + (10.^(0.1 .* EbNo)) .* (Cawgn ./ W));
plot(EbNo,Cawgn); grid on
xlabel('Eb/No, дБ'); ylabel('Cawgn, біт/с');
