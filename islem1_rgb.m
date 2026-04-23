%% Yapay RGB Görüntü Oluşturma
% Matematiksel fonksiyonlarla yapay bir RGB görüntü üretir ve
% her kanalın 3D yüzey grafiğini çizer.

clc; clear; close all;

% Görüntü çözünürlüğü ve koordinat ızgarası
N = 300;
[x, y] = meshgrid(linspace(-10, 10, N), linspace(-10, 10, N));

% Renk kanallarının trigonometrik fonksiyonlarla hesaplanması
R = sin(2 * sqrt(x.^2 + y.^2)) .* cos(0.8 * x);       % Dairesel halkalar + yatay modülasyon
G = cos(0.3 * x.^2 - 0.3 * y.^2) .* sin(y);            % Hiperbolik desen + dikey modülasyon
B = 0.7 * sin(x .* y / 6) + 0.3 * cos(1.5 * sqrt(x.^2 + y.^2)); % Çapraz + radyal dalgalar

% Min-max normalizasyon: değerleri [0,1] aralığına ölçeklendirme
R = (R - min(R(:))) / (max(R(:)) - min(R(:)));
G = (G - min(G(:))) / (max(G(:)) - min(G(:)));
B = (B - min(B(:))) / (max(B(:)) - min(B(:)));

% 3 kanalı birleştirerek 300x300x3 RGB görüntü oluşturma
RGB = cat(3, R, G, B);

% Yapay RGB görüntüyü gösterme
figure;
imshow(RGB);
title('Yapay RGB Görüntü');

% Her kanalın 3D mesh grafiği
figure;

subplot(1,3,1);
mesh(x, y, R);
title('R Kanalı');

subplot(1,3,2);
mesh(x, y, G);
title('G Kanalı');

subplot(1,3,3);
mesh(x, y, B);
title('B Kanalı');

sgtitle('Matematiksel Fonksiyonların 3D Görselleştirilmesi');
