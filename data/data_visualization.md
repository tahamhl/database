# E-Ticaret Veritabanı Veri Görselleştirmesi

Bu dokümanda, e-ticaret veritabanı örnek verilerinin görselleştirme açıklamaları yer almaktadır. Gerçek bir uygulamada bu görselleştirmeler dinamik olarak oluşturulacaktır.

## Kullanıcı Dağılımı

```
Kullanıcı Tipi   | Sayı
----------------|-----
Müşteri         |  3
Satıcı          |  2
Admin           |  1
Toplam          |  6
```

## Kategori Dağılımı

```
Ana Kategori     | Alt Kategori Sayısı | Ürün Sayısı
----------------|-------------------|------------
Elektronik      |         3         |      3
Giyim           |         3         |      3
Ev & Yaşam      |         2         |      0
Kitap & Kırtasiye|         2         |      0
Toplam          |        10         |      6
```

## Ürün Analizi

```
Kategori        | Ürün Sayısı | Toplam Varyant | Ortalama Fiyat
---------------|------------|---------------|---------------
Cep Telefonları |      1     |        4      |    9.500 ₺
Bilgisayarlar   |      1     |        2      |   14.200 ₺
Aksesuarlar     |      1     |        2      |    1.800 ₺
Erkek Giyim     |      1     |        6      |      250 ₺
Kadın Giyim     |      1     |        6      |      450 ₺
Çocuk Giyim     |      1     |        6      |      120 ₺
```

## Varyant Analizi

```
Varyant Türü    | Sayı
---------------|-----
Renk           |  26
Beden          |  18
Depolama       |   4
RAM            |   2
```

## Sipariş İstatistikleri

```
Durum          | Sipariş Sayısı
---------------|---------------
Teslim Edildi  |       1
Kargoda        |       1
İşlemde        |       1
Toplam         |       3
```

## Satış Analizi

```
Ürün Adı         | Satılan Adet | Toplam Gelir
----------------|-------------|-------------
Smartphone X     |      1      |    9.500 ₺
Laptop Pro       |      1      |   14.200 ₺
Kadın Elbise     |      1      |      450 ₺
Çocuk Tişört     |      2      |      120 ₺
```

## Ödeme Yöntemi Dağılımı

```
Ödeme Yöntemi    | Kullanım Sayısı | Toplam Tutar
----------------|----------------|-------------
Kredi Kartı     |        2       |   28.006 ₺
Havale/EFT      |        1       |      692 ₺
Kapıda Ödeme    |        0       |        0 ₺
```

## Kargo Durumu

```
Durum           | Gönderi Sayısı
---------------|---------------
Teslim Edildi  |       1
Taşınıyor      |       1
İşlemde        |       1
```

## Müşteri Değerlendirmeleri

```
Puan           | Değerlendirme Sayısı
---------------|----------------------
5 Yıldız       |          1
4 Yıldız       |          1
3 Yıldız       |          0
2 Yıldız       |          0
1 Yıldız       |          0
Ortalama       |         4.5
```

## Stok Durumu

```
Ürün Kategorisi | Toplam Stok | Kritik Stok (< 20)
---------------|------------|-------------------
Elektronik     |    360     |         2
Giyim          |    450     |         3
```

## Promosyon Etkisi

```
Promosyon Adı    | Etkilenen Ürün | Satış Artışı (%)
----------------|---------------|----------------
Elektronik İnd. |       3       |      +25%
Giyim Kampanyası|       3       |      +18%
```

Bu görselleştirmeler, gerçek bir e-ticaret platformunda kullanılabilecek veri analizlerinin basitleştirilmiş versiyonlarıdır. Gerçek bir uygulamada, bu veriler dinamik olarak oluşturulur ve interaktif grafikler, ısı haritaları ve tablolar aracılığıyla sunulur. 