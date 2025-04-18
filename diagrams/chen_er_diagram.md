# Chen ER Diyagramı - E-Ticaret Veritabanı

## Varlıklar (Entities)

### Kullanıcı Yönetimi
- **Kullanıcı** (user_id, email, password_hash, first_name, last_name, phone, registration_date, last_login, status, user_type)
- **Adres** (address_id, address_type, is_default, country, city, district, postal_code, address_line1, address_line2)

### Ürün Kataloğu
- **Kategori** (category_id, name, description, image_url, is_active, created_at, updated_at)
- **Satıcı** (seller_id, company_name, tax_id, contact_email, contact_phone, logo_url, description, rating, registration_date, status)
- **Ürün** (product_id, name, description, base_price, discount_price, sku, is_active, created_at, updated_at)
- **Ürün Görseli** (image_id, image_url, is_primary, display_order)
- **Ürün Özelliği** (attribute_id, name, display_name)
- **Ürün Varyantı** (variant_id, sku, price_modifier, stock_quantity, is_active)

### Sipariş Yönetimi
- **Sepet** (cart_id, created_at, updated_at)
- **Sepet Ürünü** (cart_item_id, quantity, added_at)
- **Sipariş** (order_id, order_date, subtotal, shipping_cost, tax_amount, discount_amount, total_amount, order_status, notes)
- **Sipariş Ürünü** (order_item_id, quantity, unit_price, subtotal)
- **Ödeme Yöntemi** (payment_method_id, name, description)
- **Ödeme** (payment_id, amount, transaction_id, payment_status, payment_date)

### Kargo ve Teslimat
- **Kargo Yöntemi** (shipping_method_id, name, description, base_cost)
- **Gönderi** (shipment_id, tracking_number, shipment_date, estimated_delivery, actual_delivery, status)

### Değerlendirme ve Yorumlar
- **Değerlendirme** (review_id, rating, comment, review_date, status)

### İndirim ve Kampanyalar
- **Kupon** (coupon_id, code, description, discount_type, discount_value, minimum_purchase, start_date, end_date, usage_limit, usage_count, is_active)
- **Promosyon** (promotion_id, name, description, discount_type, discount_value, start_date, end_date, is_active)

### Stok Yönetimi
- **Envanter İşlemi** (transaction_id, quantity_change, transaction_type, reference_id, notes, transaction_date)

### Tedarikçi Yönetimi
- **Tedarikçi** (supplier_id, name, contact_person, email, phone, address, status, created_at)

## İlişkiler (Relationships)

### Kullanıcı İlişkileri
- **Kullanıcı - Adres**: Bir kullanıcının birçok adresi olabilir (1:N)
- **Kullanıcı - Satıcı**: Bir kullanıcı bir satıcı olabilir (1:1)
- **Kullanıcı - Sepet**: Bir kullanıcının bir sepeti olabilir (1:1)
- **Kullanıcı - Sipariş**: Bir kullanıcının birçok siparişi olabilir (1:N)
- **Kullanıcı - Değerlendirme**: Bir kullanıcı birçok değerlendirme yapabilir (1:N)

### Ürün İlişkileri
- **Kategori - Kategori**: Bir kategori birçok alt kategoriye sahip olabilir (1:N)
- **Kategori - Ürün**: Bir kategori birçok ürüne sahip olabilir (1:N)
- **Satıcı - Ürün**: Bir satıcı birçok ürün satabilir (1:N)
- **Ürün - Ürün Görseli**: Bir ürün birçok görsele sahip olabilir (1:N)
- **Ürün - Ürün Varyantı**: Bir ürün birçok varyanta sahip olabilir (1:N)
- **Ürün Varyantı - Ürün Özelliği**: Bir varyant birçok özelliğe sahip olabilir (M:N)

### Sipariş İlişkileri
- **Sepet - Sepet Ürünü**: Bir sepet birçok ürün içerebilir (1:N)
- **Sepet Ürünü - Ürün Varyantı**: Bir sepet ürünü bir ürün varyantı ile ilişkilidir (N:1)
- **Sipariş - Sipariş Ürünü**: Bir sipariş birçok ürün içerebilir (1:N)
- **Sipariş - Ödeme**: Bir sipariş bir ödemeye sahiptir (1:1)
- **Sipariş - Adres**: Bir sipariş bir fatura ve bir teslimat adresine sahiptir (1:2)
- **Sipariş - Gönderi**: Bir sipariş bir gönderiye sahiptir (1:1)

### Diğer İlişkiler
- **Ürün - Değerlendirme**: Bir ürün birçok değerlendirmeye sahip olabilir (1:N)
- **Sipariş Ürünü - Değerlendirme**: Bir sipariş ürünü bir değerlendirmeye sahip olabilir (1:1)
- **Ürün - Promosyon**: Bir ürün birçok promosyona dahil olabilir (M:N)
- **Ürün Varyantı - Envanter İşlemi**: Bir varyant birçok envanter işlemine sahip olabilir (1:N)
- **Ürün - Tedarikçi**: Bir ürün birçok tedarikçiden temin edilebilir (M:N)

## Öznitelikler (Attributes)

Her varlık için öznitelikler yukarıda parantez içinde listelenmiştir. Anahtar öznitelikler (_id ile bitenler) birincil anahtarlardır. 