%% 3x3 Yapboz (Puzzle) Oluşturma
% Yapay RGB görüntüyü 9 parçaya bölüp rastgele karıştırarak
% 3 farklı puzzle varyasyonu üretir.

clc; clear; close all;

%% Yapay RGB görüntü üretimi (İşlem 1 ile aynı)
N = 300;
[x, y] = meshgrid(linspace(-10, 10, N), linspace(-10, 10, N));

R = sin(2 * sqrt(x.^2 + y.^2)) .* cos(0.8 * x);
G = cos(0.3 * x.^2 - 0.3 * y.^2) .* sin(y);
B = 0.7 * sin(x .* y / 6) + 0.3 * cos(1.5 * sqrt(x.^2 + y.^2));

R = (R - min(R(:))) / (max(R(:)) - min(R(:)));
G = (G - min(G(:))) / (max(G(:)) - min(G(:)));
B = (B - min(B(:))) / (max(B(:)) - min(B(:)));

RGB = cat(3, R, G, B);

%% Görüntüyü 3x3 parçaya bölme
parca = 3;
h = floor(N / parca);  % Her parçanın yüksekliği (piksel)
w = floor(N / parca);  % Her parçanın genişliği (piksel)

parcalar = cell(parca^2, 1);  % 9 parçayı saklayacak cell array
k = 1;

for i = 1:parca
    for j = 1:parca
        satir_bas = (i-1)*h + 1;
        satir_bit = i*h;
        sutun_bas = (j-1)*w + 1;
        sutun_bit = j*w;

        parcalar{k} = RGB(satir_bas:satir_bit, sutun_bas:sutun_bit, :);
        k = k + 1;
    end
end

%% Orijinal + 3 puzzle varyasyonunu gösterme
figure('Color','w');

subplot(1,4,1);
imshow(RGB);
title('Orijinal Görüntü');

for v = 1:3
    karisik_sira = randperm(9);  % Parçaları rastgele sırala
    yeni_resim = zeros(h*3, w*3, 3);

    % Parçaları karışık sırayla yerleştirme
    k = 1;
    for i = 1:3
        for j = 1:3
            satir_bas = (i-1)*h + 1;
            satir_bit = i*h;
            sutun_bas = (j-1)*w + 1;
            sutun_bit = j*w;

            yeni_resim(satir_bas:satir_bit, sutun_bas:sutun_bit, :) = parcalar{karisik_sira(k)};
            k = k + 1;
        end
    end

    subplot(1,4,v+1);
    imshow(yeni_resim);
    title(['Puzzle Varyasyonu ', num2str(v)]);
    hold on;

    % Parça sınırlarını beyaz çizgilerle belirtme
    for cizgi = 1:2
        xline(cizgi*w + 0.5, 'w', 'LineWidth', 0.7);
        yline(cizgi*h + 0.5, 'w', 'LineWidth', 0.7);
    end

    hold off;
end

sgtitle('3x3 Yapay RGB Bulmaca Seçenekleri');
