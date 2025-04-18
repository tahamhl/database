-- Örnek Veri - E-Ticaret Veritabanı

-- Kullanıcılar
INSERT INTO users (email, password_hash, first_name, last_name, phone, user_type) VALUES
('admin@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Admin', 'User', '+905551234567', 'admin'),
('seller1@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Satıcı', 'Bir', '+905552345678', 'seller'),
('seller2@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Satıcı', 'İki', '+905553456789', 'seller'),
('customer1@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Müşteri', 'Bir', '+905554567890', 'customer'),
('customer2@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Müşteri', 'İki', '+905555678901', 'customer'),
('customer3@example.com', '$2a$12$BF9tWq5zKhrbYxK3pTl.oOz8jdASEmrpVd.X5ULmuYHMHHwBMPTm2', 'Müşteri', 'Üç', '+905556789012', 'customer');

-- Kullanıcı Adresleri
INSERT INTO user_addresses (user_id, address_type, is_default, country, city, district, postal_code, address_line1, address_line2) VALUES
(4, 'billing', true, 'Türkiye', 'İstanbul', 'Kadıköy', '34710', 'Caferağa Mah. Moda Cad.', 'No: 123 Kat: 4'),
(4, 'shipping', true, 'Türkiye', 'İstanbul', 'Kadıköy', '34710', 'Caferağa Mah. Moda Cad.', 'No: 123 Kat: 4'),
(5, 'billing', true, 'Türkiye', 'Ankara', 'Çankaya', '06690', 'Kızılay Mah. Atatürk Bulvarı', 'No: 456 Daire: 8'),
(5, 'shipping', true, 'Türkiye', 'Ankara', 'Çankaya', '06690', 'Kızılay Mah. Atatürk Bulvarı', 'No: 456 Daire: 8'),
(6, 'billing', true, 'Türkiye', 'İzmir', 'Konak', '35210', 'Alsancak Mah. Kordon', 'No: 789 Blok A Daire: 12'),
(6, 'shipping', true, 'Türkiye', 'İzmir', 'Konak', '35210', 'Alsancak Mah. Kordon', 'No: 789 Blok A Daire: 12');

-- Kategoriler
INSERT INTO categories (name, description, image_url, is_active) VALUES
('Elektronik', 'Elektronik ürünler kategorisi', 'categories/electronics.jpg', true),
('Giyim', 'Giyim ürünleri kategorisi', 'categories/clothing.jpg', true),
('Ev & Yaşam', 'Ev ve yaşam ürünleri kategorisi', 'categories/home.jpg', true),
('Kitap & Kırtasiye', 'Kitap ve kırtasiye ürünleri kategorisi', 'categories/books.jpg', true);

-- Alt Kategoriler
INSERT INTO categories (parent_category_id, name, description, image_url, is_active) VALUES
(1, 'Cep Telefonları', 'Cep telefonları kategorisi', 'categories/phones.jpg', true),
(1, 'Bilgisayarlar', 'Bilgisayarlar kategorisi', 'categories/computers.jpg', true),
(1, 'Aksesuarlar', 'Elektronik aksesuarlar kategorisi', 'categories/accessories.jpg', true),
(2, 'Erkek Giyim', 'Erkek giyim kategorisi', 'categories/men.jpg', true),
(2, 'Kadın Giyim', 'Kadın giyim kategorisi', 'categories/women.jpg', true),
(2, 'Çocuk Giyim', 'Çocuk giyim kategorisi', 'categories/kids.jpg', true),
(3, 'Mobilya', 'Mobilya kategorisi', 'categories/furniture.jpg', true),
(3, 'Mutfak', 'Mutfak ürünleri kategorisi', 'categories/kitchen.jpg', true),
(4, 'Kitaplar', 'Kitaplar kategorisi', 'categories/books.jpg', true),
(4, 'Kırtasiye', 'Kırtasiye ürünleri kategorisi', 'categories/stationery.jpg', true);

-- Satıcılar
INSERT INTO sellers (user_id, company_name, tax_id, contact_email, contact_phone, logo_url, description, status) VALUES
(2, 'ABC Elektronik Ltd. Şti.', '1234567890', 'info@abcelektronik.com', '+902121234567', 'sellers/abc.jpg', 'Elektronik ürünler satan e-ticaret şirketi', 'active'),
(3, 'XYZ Tekstil A.Ş.', '0987654321', 'info@xyztekstil.com', '+902123456789', 'sellers/xyz.jpg', 'Tekstil ürünleri satan e-ticaret şirketi', 'active');

-- Ürünler
INSERT INTO products (seller_id, category_id, name, description, base_price, discount_price, sku, is_active) VALUES
(1, 5, 'Smartphone X', 'Son teknoloji akıllı telefon', 10000.00, 9500.00, 'PHN-X-001', true),
(1, 6, 'Laptop Pro', '15 inç profesyonel dizüstü bilgisayar', 15000.00, 14200.00, 'LPT-PRO-002', true),
(1, 7, 'Kablosuz Kulaklık', 'Gürültü önleyici kablosuz kulaklık', 2000.00, 1800.00, 'ACC-HP-003', true),
(2, 8, 'Erkek Gömlek', '%100 pamuklu erkek gömleği', 300.00, 250.00, 'MEN-SHT-001', true),
(2, 9, 'Kadın Elbise', 'Şık tasarım kadın elbisesi', 500.00, 450.00, 'WMN-DRS-002', true),
(2, 10, 'Çocuk Tişört', 'Renkli çocuk tişörtü', 150.00, 120.00, 'KID-TSH-003', true);

-- Ürün Görselleri
INSERT INTO product_images (product_id, image_url, is_primary, display_order) VALUES
(1, 'products/smartphone-x-1.jpg', true, 1),
(1, 'products/smartphone-x-2.jpg', false, 2),
(1, 'products/smartphone-x-3.jpg', false, 3),
(2, 'products/laptop-pro-1.jpg', true, 1),
(2, 'products/laptop-pro-2.jpg', false, 2),
(3, 'products/wireless-headphones-1.jpg', true, 1),
(4, 'products/men-shirt-1.jpg', true, 1),
(4, 'products/men-shirt-2.jpg', false, 2),
(5, 'products/women-dress-1.jpg', true, 1),
(6, 'products/kid-tshirt-1.jpg', true, 1);

-- Ürün Özellikleri
INSERT INTO product_attributes (name, display_name) VALUES
('color', 'Renk'),
('size', 'Beden'),
('storage', 'Depolama'),
('ram', 'RAM'),
('material', 'Materyal');

-- Ürün Varyantları
INSERT INTO product_variants (product_id, sku, price_modifier, stock_quantity, is_active) VALUES
(1, 'PHN-X-001-BLK-128', 0.00, 50, true),
(1, 'PHN-X-001-BLK-256', 1000.00, 30, true),
(1, 'PHN-X-001-WHT-128', 0.00, 40, true),
(1, 'PHN-X-001-WHT-256', 1000.00, 25, true),
(2, 'LPT-PRO-002-SLV-16', 0.00, 20, true),
(2, 'LPT-PRO-002-SLV-32', 2000.00, 15, true),
(3, 'ACC-HP-003-BLK', 0.00, 100, true),
(3, 'ACC-HP-003-WHT', 0.00, 80, true),
(4, 'MEN-SHT-001-WHT-M', 0.00, 30, true),
(4, 'MEN-SHT-001-WHT-L', 0.00, 25, true),
(4, 'MEN-SHT-001-WHT-XL', 0.00, 20, true),
(4, 'MEN-SHT-001-BLU-M', 0.00, 30, true),
(4, 'MEN-SHT-001-BLU-L', 0.00, 25, true),
(4, 'MEN-SHT-001-BLU-XL', 0.00, 20, true),
(5, 'WMN-DRS-002-BLK-S', 0.00, 20, true),
(5, 'WMN-DRS-002-BLK-M', 0.00, 25, true),
(5, 'WMN-DRS-002-BLK-L', 0.00, 15, true),
(5, 'WMN-DRS-002-RED-S', 0.00, 20, true),
(5, 'WMN-DRS-002-RED-M', 0.00, 25, true),
(5, 'WMN-DRS-002-RED-L', 0.00, 15, true),
(6, 'KID-TSH-003-BLU-3', 0.00, 40, true),
(6, 'KID-TSH-003-BLU-4', 0.00, 35, true),
(6, 'KID-TSH-003-BLU-5', 0.00, 30, true),
(6, 'KID-TSH-003-RED-3', 0.00, 40, true),
(6, 'KID-TSH-003-RED-4', 0.00, 35, true),
(6, 'KID-TSH-003-RED-5', 0.00, 30, true);

-- Varyant Özellikleri
INSERT INTO variant_attributes (variant_id, attribute_id, attribute_value) VALUES
(1, 1, 'Siyah'),
(1, 3, '128GB'),
(2, 1, 'Siyah'),
(2, 3, '256GB'),
(3, 1, 'Beyaz'),
(3, 3, '128GB'),
(4, 1, 'Beyaz'),
(4, 3, '256GB'),
(5, 1, 'Gümüş'),
(5, 4, '16GB'),
(6, 1, 'Gümüş'),
(6, 4, '32GB'),
(7, 1, 'Siyah'),
(8, 1, 'Beyaz'),
(9, 1, 'Beyaz'),
(9, 2, 'M'),
(10, 1, 'Beyaz'),
(10, 2, 'L'),
(11, 1, 'Beyaz'),
(11, 2, 'XL'),
(12, 1, 'Mavi'),
(12, 2, 'M'),
(13, 1, 'Mavi'),
(13, 2, 'L'),
(14, 1, 'Mavi'),
(14, 2, 'XL'),
(15, 1, 'Siyah'),
(15, 2, 'S'),
(16, 1, 'Siyah'),
(16, 2, 'M'),
(17, 1, 'Siyah'),
(17, 2, 'L'),
(18, 1, 'Kırmızı'),
(18, 2, 'S'),
(19, 1, 'Kırmızı'),
(19, 2, 'M'),
(20, 1, 'Kırmızı'),
(20, 2, 'L'),
(21, 1, 'Mavi'),
(21, 2, '3 Yaş'),
(22, 1, 'Mavi'),
(22, 2, '4 Yaş'),
(23, 1, 'Mavi'),
(23, 2, '5 Yaş'),
(24, 1, 'Kırmızı'),
(24, 2, '3 Yaş'),
(25, 1, 'Kırmızı'),
(25, 2, '4 Yaş'),
(26, 1, 'Kırmızı'),
(26, 2, '5 Yaş');

-- Sepetler
INSERT INTO carts (user_id) VALUES
(4),
(5),
(6);

-- Sepet Ürünleri
INSERT INTO cart_items (cart_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 7, 2),
(2, 5, 1),
(3, 16, 1),
(3, 21, 2);

-- Ödeme Yöntemleri
INSERT INTO payment_methods (name, description) VALUES
('Kredi Kartı', 'Kredi kartı ile ödeme'),
('Havale/EFT', 'Banka havalesi veya EFT ile ödeme'),
('Kapıda Ödeme', 'Teslimat sırasında nakit ödeme');

-- Kargo Yöntemleri
INSERT INTO shipping_methods (name, description, base_cost) VALUES
('Standart Kargo', '3-5 iş günü içinde teslimat', 20.00),
('Hızlı Kargo', '1-2 iş günü içinde teslimat', 35.00),
('Aynı Gün Teslimat', 'Siparişin verildiği gün içinde teslimat', 60.00);

-- Siparişler
INSERT INTO orders (user_id, order_date, shipping_address_id, billing_address_id, payment_method_id, subtotal, shipping_cost, tax_amount, discount_amount, total_amount, order_status) VALUES
(4, '2023-05-01 10:30:00', 2, 1, 1, 9500.00, 20.00, 1710.00, 0.00, 11230.00, 'delivered'),
(5, '2023-05-02 14:45:00', 4, 3, 1, 14200.00, 20.00, 2556.00, 0.00, 16776.00, 'shipped'),
(6, '2023-05-03 16:20:00', 6, 5, 2, 570.00, 20.00, 102.60, 0.00, 692.60, 'processing');

-- Sipariş Ürünleri
INSERT INTO order_items (order_id, variant_id, quantity, unit_price, subtotal) VALUES
(1, 1, 1, 9500.00, 9500.00),
(2, 5, 1, 14200.00, 14200.00),
(3, 16, 1, 450.00, 450.00),
(3, 21, 2, 60.00, 120.00);

-- Ödemeler
INSERT INTO payments (order_id, payment_method_id, amount, transaction_id, payment_status, payment_date) VALUES
(1, 1, 11230.00, 'TRX123456789', 'completed', '2023-05-01 10:35:00'),
(2, 1, 16776.00, 'TRX234567890', 'completed', '2023-05-02 14:50:00'),
(3, 2, 692.60, 'TRX345678901', 'completed', '2023-05-03 16:25:00');

-- Gönderi
INSERT INTO shipments (order_id, shipping_method_id, tracking_number, shipment_date, estimated_delivery, actual_delivery, status) VALUES
(1, 1, 'SHP123456789', '2023-05-02 09:00:00', '2023-05-05 17:00:00', '2023-05-04 14:30:00', 'delivered'),
(2, 1, 'SHP234567890', '2023-05-03 10:15:00', '2023-05-06 17:00:00', NULL, 'in_transit'),
(3, 1, 'SHP345678901', NULL, '2023-05-08 17:00:00', NULL, 'processing');

-- Değerlendirmeler
INSERT INTO reviews (product_id, user_id, order_item_id, rating, comment, status) VALUES
(1, 4, 1, 5, 'Harika bir telefon. Tüm beklentilerimi karşıladı.', 'approved'),
(2, 5, 2, 4, 'Çok iyi bir bilgisayar, ancak biraz ısınma sorunu var.', 'approved');

-- Kuponlar
INSERT INTO coupons (code, description, discount_type, discount_value, minimum_purchase, start_date, end_date, usage_limit, is_active) VALUES
('WELCOME10', 'Hoş geldin kuponu', 'percentage', 10.00, 100.00, '2023-01-01 00:00:00', '2023-12-31 23:59:59', 1000, true),
('SUMMER2023', 'Yaz sezonu özel indirimi', 'percentage', 15.00, 200.00, '2023-06-01 00:00:00', '2023-08-31 23:59:59', 500, true),
('FREESHIP', 'Ücretsiz kargo kuponu', 'fixed_amount', 20.00, 150.00, '2023-05-01 00:00:00', '2023-05-31 23:59:59', 300, true);

-- Promosyonlar
INSERT INTO promotions (name, description, discount_type, discount_value, start_date, end_date, is_active) VALUES
('Elektronik İndirimi', 'Elektronik ürünlerde %10 indirim', 'percentage', 10.00, '2023-05-01 00:00:00', '2023-05-31 23:59:59', true),
('Giyim Kampanyası', 'Giyim ürünlerinde %20 indirim', 'percentage', 20.00, '2023-06-01 00:00:00', '2023-06-30 23:59:59', true);

-- Promosyon Ürünleri
INSERT INTO promotion_products (promotion_id, product_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6);

-- Tedarikçiler
INSERT INTO suppliers (name, contact_person, email, phone, address, status) VALUES
('Mega Elektronik A.Ş.', 'Ahmet Demir', 'info@megaelektronik.com', '+902163456789', 'İstanbul, Ümraniye', 'active'),
('Anadolu Tekstil Ltd. Şti.', 'Ayşe Yılmaz', 'info@anadolutekstil.com', '+902124567890', 'İstanbul, Merter', 'active');

-- Ürün Tedarikçileri
INSERT INTO product_suppliers (product_id, supplier_id, supplier_sku, cost_price, lead_time_days, is_primary) VALUES
(1, 1, 'S-PHN-X-001', 8000.00, 3, true),
(2, 1, 'S-LPT-PRO-002', 12000.00, 5, true),
(3, 1, 'S-ACC-HP-003', 1500.00, 2, true),
(4, 2, 'S-MEN-SHT-001', 200.00, 7, true),
(5, 2, 'S-WMN-DRS-002', 300.00, 7, true),
(6, 2, 'S-KID-TSH-003', 80.00, 7, true);

-- Envanter İşlemleri
INSERT INTO inventory_transactions (variant_id, quantity_change, transaction_type, reference_id, notes) VALUES
(1, 50, 'purchase', NULL, 'İlk Stok'),
(2, 30, 'purchase', NULL, 'İlk Stok'),
(3, 40, 'purchase', NULL, 'İlk Stok'),
(4, 25, 'purchase', NULL, 'İlk Stok'),
(5, 20, 'purchase', NULL, 'İlk Stok'),
(6, 15, 'purchase', NULL, 'İlk Stok'),
(7, 100, 'purchase', NULL, 'İlk Stok'),
(8, 80, 'purchase', NULL, 'İlk Stok'),
(9, 30, 'purchase', NULL, 'İlk Stok'),
(10, 25, 'purchase', NULL, 'İlk Stok'),
(11, 20, 'purchase', NULL, 'İlk Stok'),
(12, 30, 'purchase', NULL, 'İlk Stok'),
(13, 25, 'purchase', NULL, 'İlk Stok'),
(14, 20, 'purchase', NULL, 'İlk Stok'),
(15, 20, 'purchase', NULL, 'İlk Stok'),
(16, 25, 'purchase', NULL, 'İlk Stok'),
(17, 15, 'purchase', NULL, 'İlk Stok'),
(18, 20, 'purchase', NULL, 'İlk Stok'),
(19, 25, 'purchase', NULL, 'İlk Stok'),
(20, 15, 'purchase', NULL, 'İlk Stok'),
(21, 40, 'purchase', NULL, 'İlk Stok'),
(22, 35, 'purchase', NULL, 'İlk Stok'),
(23, 30, 'purchase', NULL, 'İlk Stok'),
(24, 40, 'purchase', NULL, 'İlk Stok'),
(25, 35, 'purchase', NULL, 'İlk Stok'),
(26, 30, 'purchase', NULL, 'İlk Stok'),
(1, -1, 'sale', 1, 'Sipariş #1'),
(5, -1, 'sale', 2, 'Sipariş #2'),
(16, -1, 'sale', 3, 'Sipariş #3'),
(21, -2, 'sale', 3, 'Sipariş #3'); 