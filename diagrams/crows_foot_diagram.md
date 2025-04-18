# Kazayağı (Crow's Foot) ER Diyagramı - E-Ticaret Veritabanı

Bu doküman, kapsamlı e-ticaret veritabanının Kazayağı notasyonu kullanılarak oluşturulmuş ER diyagramını açıklamaktadır.

## Diyagram Notasyonu Açıklaması

Kazayağı notasyonunda ilişkiler şu şekilde gösterilir:

- **Bir-Çok (1:N)**: Bir tarafta tek çizgi, diğer tarafta kazayağı (çatallanmış çizgi)
- **Bir-Bir (1:1)**: Her iki tarafta da tek çizgi
- **Çok-Çok (M:N)**: Her iki tarafta da kazayağı (genellikle aradaki ilişki tablosu ile gösterilir)

## Tablolar ve İlişkiler

### Kullanıcı Modülü
```
users (PK: user_id)
|
|---- 1 ---< user_addresses (PK: address_id, FK: user_id)
|
|---- 1 ---- sellers (PK: seller_id, FK: user_id)
|
|---- 1 ---< carts (PK: cart_id, FK: user_id)
|
|---- 1 ---< orders (PK: order_id, FK: user_id)
|
|---- 1 ---< reviews (PK: review_id, FK: user_id)
```

### Ürün Modülü
```
categories (PK: category_id)
|
|---- 1 ---< categories (PK: category_id, FK: parent_category_id) [Öz-ilişki]
|
|---- 1 ---< products (PK: product_id, FK: category_id)

sellers (PK: seller_id)
|
|---- 1 ---< products (PK: product_id, FK: seller_id)

products (PK: product_id)
|
|---- 1 ---< product_images (PK: image_id, FK: product_id)
|
|---- 1 ---< product_variants (PK: variant_id, FK: product_id)
|
|---- 1 ---< reviews (PK: review_id, FK: product_id)
|
|---- M ---< promotion_products >--- N --- promotions (İlişki tablosu üzerinden)
|
|---- M ---< product_suppliers >--- N --- suppliers (İlişki tablosu üzerinden)

product_variants (PK: variant_id)
|
|---- M ---< variant_attributes >--- N --- product_attributes (İlişki tablosu üzerinden)
|
|---- 1 ---< inventory_transactions (PK: transaction_id, FK: variant_id)
|
|---- 1 ---< cart_items (PK: cart_item_id, FK: variant_id)
|
|---- 1 ---< order_items (PK: order_item_id, FK: variant_id)
```

### Sipariş Modülü
```
carts (PK: cart_id)
|
|---- 1 ---< cart_items (PK: cart_item_id, FK: cart_id)

orders (PK: order_id)
|
|---- 1 ---< order_items (PK: order_item_id, FK: order_id)
|
|---- 1 ---- payments (PK: payment_id, FK: order_id)
|
|---- 1 ---- shipments (PK: shipment_id, FK: order_id)
|
|---- 1 ---- user_addresses [shipping_address_id] (FK ilişkisi)
|
|---- 1 ---- user_addresses [billing_address_id] (FK ilişkisi)

payment_methods (PK: payment_method_id)
|
|---- 1 ---< payments (PK: payment_id, FK: payment_method_id)

shipping_methods (PK: shipping_method_id)
|
|---- 1 ---< shipments (PK: shipment_id, FK: shipping_method_id)
```

### Değerlendirme Modülü
```
order_items (PK: order_item_id)
|
|---- 1 ---- reviews (PK: review_id, FK: order_item_id)
```

### Kampanya Modülü
```
coupons (PK: coupon_id) [Bağımsız tablo]

promotions (PK: promotion_id)
|
|---- 1 ---< promotion_products (PK: promotion_product_id, FK: promotion_id)
```

### Tedarikçi Modülü
```
suppliers (PK: supplier_id)
|
|---- 1 ---< product_suppliers (PK: product_supplier_id, FK: supplier_id)
```

## Kardinalite Özeti

1. Bir kullanıcı (users) birçok adres (user_addresses) ekleyebilir (1:N)
2. Bir kullanıcı (users) bir satıcı (sellers) olabilir (1:1)
3. Bir kullanıcı (users) bir sepet (carts) sahibi olabilir (1:1)
4. Bir kullanıcı (users) birçok sipariş (orders) verebilir (1:N)
5. Bir kategori (categories) birçok alt kategori (categories) içerebilir (1:N)
6. Bir kategori (categories) birçok ürün (products) içerebilir (1:N)
7. Bir satıcı (sellers) birçok ürün (products) satabilir (1:N)
8. Bir ürün (products) birçok ürün görseli (product_images) içerebilir (1:N)
9. Bir ürün (products) birçok varyant (product_variants) içerebilir (1:N)
10. Bir ürün varyantı (product_variants) birçok özelliğe (product_attributes) sahip olabilir (M:N)
11. Bir sepet (carts) birçok sepet ürünü (cart_items) içerebilir (1:N)
12. Bir sipariş (orders) birçok sipariş ürünü (order_items) içerebilir (1:N)
13. Bir sipariş (orders) bir ödemeye (payments) sahiptir (1:1)
14. Bir ürün (products) birçok tedarikçi (suppliers) tarafından tedarik edilebilir (M:N)
15. Bir ürün (products) birçok promosyona (promotions) dahil olabilir (M:N)

## Veri Bütünlüğü Kuralları

1. Silinen bir kullanıcıya ait tüm adresler, siparişler ve sepet de silinir (CASCADE)
2. Silinen bir ürüne ait tüm görseller, varyantlar ve yorumlar da silinir (CASCADE)
3. Silinen bir siparişe ait tüm sipariş ürünleri, ödemeler ve kargolar da silinir (CASCADE)
4. Bir sipariş ürünü için yalnızca bir değerlendirme yapılabilir (UNIQUE KEY constraint) 