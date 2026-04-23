# 🎨 Bilgisayarlı Görme (Computer Vision) Projesi

> Matematiksel fonksiyonlar kullanarak yapay RGB görüntü üretimi ve 3×3 yapboz (puzzle) oluşturma.

---

## 📋 Proje Hakkında

Bu proje, **MATLAB** ortamında gerçekleştirilen iki temel görüntü işleme uygulamasından oluşmaktadır:

1. **Yapay RGB Görüntü Oluşturma** — Matematiksel (trigonometrik) fonksiyonlar kullanılarak sıfırdan özgün bir renkli görüntü üretilir.
2. **3×3 Yapboz (Puzzle) Üreticisi** — Üretilen görüntü 9 eşit parçaya bölünüp rastgele karıştırılarak 3 farklı bulmaca varyasyonu oluşturulur.

---

## 📁 Dosya Yapısı

```
gg/
├── islem1_rgb.m        # Yapay RGB görüntü oluşturma scripti
├── islem2_puzzle.m     # 3x3 yapboz üretici scripti
└── README.md           # Proje açıklama dosyası (bu dosya)
```

---

## 🔬 İşlem 1: Yapay RGB Görüntü Oluşturma

### Amaç
Rastgele piksellerle değil, **belirli matematiksel fonksiyonlarla** tanımlanmış yapay bir 300×300 piksel RGB görüntü üretmektir.

### Kullanılan Matematiksel Fonksiyonlar

Her renk kanalı farklı bir trigonometrik fonksiyon kombinasyonu ile hesaplanır:

| Kanal | Formül | Oluşan Desen |
|-------|--------|-------------|
| **Kırmızı (R)** | `sin(2√(x²+y²)) × cos(0.8x)` | Dairesel halkalar + yatay modülasyon |
| **Yeşil (G)** | `cos(0.3x²-0.3y²) × sin(y)` | Hiperbolik eğriler + dikey modülasyon |
| **Mavi (B)** | `0.7×sin(xy/6) + 0.3×cos(1.5√(x²+y²))` | Çapraz dalgalar + radyal desenler |

### İşlem Adımları

1. **Koordinat Izgarası Oluşturma**: `meshgrid` ile [-10, 10] aralığında 300×300'lük 2B koordinat ızgarası üretilir.
2. **Kanal Hesaplama**: Her kanal için trigonometrik fonksiyonlar hesaplanır.
3. **Normalizasyon**: Tüm değerler min-max normalizasyonu ile [0, 1] aralığına ölçeklenir.
4. **Birleştirme**: `cat(3, R, G, B)` ile 3 kanal birleştirilerek 300×300×3 boyutlu RGB görüntü oluşturulur.
5. **Görselleştirme**: 2D görüntü (`imshow`) ve 3D yüzey grafikleri (`mesh`) gösterilir.

### Çıktılar

- **Figür 1**: Oluşturulan yapay RGB görüntü (2D)
- **Figür 2**: R, G, B kanallarının 3D mesh grafikleri (yan yana)

---

## 🧩 İşlem 2: 3×3 Yapboz (Puzzle) Oluşturma

### Amaç
İşlem 1'de üretilen yapay RGB görüntüyü **3×3 = 9 eşit parçaya** bölmek ve bu parçaları rastgele karıştırarak **3 farklı puzzle varyasyonu** oluşturmaktır.

### İşlem Adımları

1. **Görüntü Üretimi**: İşlem 1'deki yöntemle aynı yapay RGB görüntü üretilir.
2. **Parça Boyutu Hesaplama**: `floor(300/3) = 100` piksel → Her parça 100×100×3 boyutundadır.
3. **Bölme İşlemi**: İç içe döngülerle görüntü 9 parçaya bölünüp `cell array`'e kaydedilir.
4. **Karıştırma**: `randperm(9)` ile her varyasyon için farklı bir rastgele sıra üretilir.
5. **Yeniden Birleştirme**: Parçalar yeni sıraya göre boş bir görüntüye yerleştirilir.
6. **Izgara Çizgileri**: Parça sınırlarını belirginleştirmek için beyaz çizgiler eklenir.

### Çıktılar

- **1 adet figür** içinde 4 alt grafik:
  - Orijinal görüntü
  - Puzzle Varyasyonu 1 (rastgele karışık)
  - Puzzle Varyasyonu 2 (rastgele karışık)
  - Puzzle Varyasyonu 3 (rastgele karışık)

---

## 🚀 Çalıştırma

### Gereksinimler

- **MATLAB** R2019b veya üzeri (sgtitle, xline, yline fonksiyonları için)
- Image Processing Toolbox (imshow fonksiyonu için)

### Adımlar

1. MATLAB'ı açın.
2. Proje klasörüne gidin veya **Add to Path** ile ekleyin.
3. Sırasıyla çalıştırın:

```matlab
% İlk olarak yapay RGB görüntü oluşturma:
islem1_rgb

% Ardından puzzle oluşturma:
islem2_puzzle
```

> **Not**: Her iki script de bağımsız çalışabilir. `islem2_puzzle.m` kendi içinde görüntüyü tekrar üretir, bu nedenle sırayla çalıştırmak zorunlu değildir.

---

## 🛠️ Kullanılan MATLAB Fonksiyonları

| Fonksiyon | Açıklama |
|-----------|----------|
| `meshgrid` | 2B koordinat ızgarası oluşturma |
| `linspace` | Eşit aralıklı sayı dizisi üretme |
| `sin`, `cos`, `sqrt` | Trigonometrik ve matematiksel işlemler |
| `cat` | Matrisleri belirtilen boyutta birleştirme |
| `imshow` | Görüntüyü 2D olarak gösterme |
| `mesh` | 3D yüzey (tel kafes) grafiği çizme |
| `subplot` | Figürü alt grafiklere bölme |
| `randperm` | Rastgele permütasyon üretme |
| `cell` | Hücre dizisi (cell array) oluşturma |
| `xline`, `yline` | Dikey/yatay referans çizgileri çizme |
| `floor` | Aşağı yuvarlama |

---

## 📝 Temel Kavramlar

### Min-Max Normalizasyon
```
X_norm = (X - X_min) / (X_max - X_min)
```
Veri değerlerini [0, 1] aralığına ölçeklendirir. Görüntü işlemede piksel değerlerinin geçerli aralıkta olmasını sağlar.

### Cell Array
MATLAB'da farklı boyut ve tipteki verileri saklamak için kullanılan esnek bir veri yapısıdır. Bu projede her puzzle parçası bir cell'de tutulur.

### Element-wise (Eleman Bazlı) İşlemler
MATLAB'da `.*`, `.^`, `./` operatörleri matris elemanlarının karşılıklı olarak işlenmesini sağlar. Normal `*` operatörü matris çarpımı yaparken, `.*` her elemanı ayrı ayrı çarpar.

---

## 👤 Geliştirici

Okul Projesi — Bilgisayarlı Görüş Dersi
