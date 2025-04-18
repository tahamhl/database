# E-Ticaret Veritabanı Şeması

Bu doküman, e-ticaret veritabanı şemasının ayrıntılı açıklamasını içermektedir.

## Tablo Yapıları

### Kullanıcı Yönetimi

#### users
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| user_id            | INT             | Birincil anahtar, otomatik artan                         |
| email              | VARCHAR(100)    | Benzersiz, null olamaz                                   |
| password_hash      | VARCHAR(255)    | Şifre hash değeri, null olamaz                           |
| first_name         | VARCHAR(50)     | Ad, null olamaz                                          |
| last_name          | VARCHAR(50)     | Soyad, null olamaz                                       |
| phone              | VARCHAR(20)     | Telefon numarası                                         |
| registration_date  | DATETIME        | Kayıt tarihi, varsayılan olarak şu anki zaman           |
| last_login         | DATETIME        | Son giriş zamanı                                         |
| status             | ENUM            | Kullanıcı durumu (active, inactive, suspended)           |
| user_type          | ENUM            | Kullanıcı tipi (customer, seller, admin)                 |

#### user_addresses
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| address_id         | INT             | Birincil anahtar, otomatik artan                         |
| user_id            | INT             | Kullanıcı ID, dış anahtar, null olamaz                   |
| address_type       | ENUM            | Adres tipi (billing, shipping)                           |
| is_default         | BOOLEAN         | Varsayılan adres mi?, varsayılan olarak FALSE           |
| country            | VARCHAR(50)     | Ülke, null olamaz                                        |
| city               | VARCHAR(50)     | Şehir, null olamaz                                       |
| district           | VARCHAR(50)     | İlçe, null olamaz                                        |
| postal_code        | VARCHAR(20)     | Posta kodu, null olamaz                                  |
| address_line1      | VARCHAR(255)    | Adres satırı 1, null olamaz                              |
| address_line2      | VARCHAR(255)    | Adres satırı 2                                           |

### Ürün Kataloğu

#### categories
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| category_id        | INT             | Birincil anahtar, otomatik artan                         |
| parent_category_id | INT             | Üst kategori ID, dış anahtar                             |
| name               | VARCHAR(100)    | Kategori adı, null olamaz                                |
| description        | TEXT            | Kategori açıklaması                                      |
| image_url          | VARCHAR(255)    | Kategori resim URL'i                                     |
| is_active          | BOOLEAN         | Aktif mi?, varsayılan olarak TRUE                        |
| created_at         | DATETIME        | Oluşturulma tarihi, varsayılan olarak şu anki zaman     |
| updated_at         | DATETIME        | Güncellenme tarihi, güncelleme sırasında otomatik olarak |

#### sellers
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| seller_id          | INT             | Birincil anahtar, otomatik artan                         |
| user_id            | INT             | Kullanıcı ID, dış anahtar, null olamaz, benzersiz        |
| company_name       | VARCHAR(100)    | Şirket adı, null olamaz                                  |
| tax_id             | VARCHAR(50)     | Vergi kimlik numarası, null olamaz                       |
| contact_email      | VARCHAR(100)    | İletişim e-postası, null olamaz                          |
| contact_phone      | VARCHAR(20)     | İletişim telefonu, null olamaz                           |
| logo_url           | VARCHAR(255)    | Logo URL'i                                               |
| description        | TEXT            | Satıcı açıklaması                                        |
| rating             | DECIMAL(3,2)    | Satıcı puanı                                             |
| registration_date  | DATETIME        | Kayıt tarihi, varsayılan olarak şu anki zaman           |
| status             | ENUM            | Satıcı durumu (pending, active, suspended)               |

#### products
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| product_id         | INT             | Birincil anahtar, otomatik artan                         |
| seller_id          | INT             | Satıcı ID, dış anahtar, null olamaz                      |
| category_id        | INT             | Kategori ID, dış anahtar, null olamaz                    |
| name               | VARCHAR(255)    | Ürün adı, null olamaz                                    |
| description        | TEXT            | Ürün açıklaması, null olamaz                             |
| base_price         | DECIMAL(10,2)   | Temel fiyat, null olamaz                                 |
| discount_price     | DECIMAL(10,2)   | İndirimli fiyat                                          |
| sku                | VARCHAR(50)     | Stok Kodu, benzersiz, null olamaz                        |
| is_active          | BOOLEAN         | Aktif mi?, varsayılan olarak TRUE                        |
| created_at         | DATETIME        | Oluşturulma tarihi, varsayılan olarak şu anki zaman     |
| updated_at         | DATETIME        | Güncellenme tarihi, güncelleme sırasında otomatik olarak |

### Ürün Ayrıntıları

#### product_images
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| image_id           | INT             | Birincil anahtar, otomatik artan                         |
| product_id         | INT             | Ürün ID, dış anahtar, null olamaz                        |
| image_url          | VARCHAR(255)    | Resim URL'i, null olamaz                                 |
| is_primary         | BOOLEAN         | Ana resim mi?, varsayılan olarak FALSE                   |
| display_order      | INT             | Görüntüleme sırası, varsayılan olarak 0                  |

#### product_attributes
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| attribute_id       | INT             | Birincil anahtar, otomatik artan                         |
| name               | VARCHAR(50)     | Özellik adı, null olamaz                                 |
| display_name       | VARCHAR(50)     | Görüntülenen özellik adı, null olamaz                    |

#### product_variants
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| variant_id         | INT             | Birincil anahtar, otomatik artan                         |
| product_id         | INT             | Ürün ID, dış anahtar, null olamaz                        |
| sku                | VARCHAR(50)     | Stok Kodu, benzersiz, null olamaz                        |
| price_modifier     | DECIMAL(10,2)   | Fiyat düzenleyici, varsayılan olarak 0                   |
| stock_quantity     | INT             | Stok miktarı, varsayılan olarak 0                        |
| is_active          | BOOLEAN         | Aktif mi?, varsayılan olarak TRUE                        |

#### variant_attributes
| Sütun                | Veri Tipi     | Açıklama                                                 |
|----------------------|---------------|----------------------------------------------------------|
| variant_attribute_id | INT           | Birincil anahtar, otomatik artan                         |
| variant_id           | INT           | Varyant ID, dış anahtar, null olamaz                     |
| attribute_id         | INT           | Özellik ID, dış anahtar, null olamaz                     |
| attribute_value      | VARCHAR(100)  | Özellik değeri, null olamaz                              |

### Sipariş Yönetimi

#### carts
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| cart_id            | INT             | Birincil anahtar, otomatik artan                         |
| user_id            | INT             | Kullanıcı ID, dış anahtar, null olamaz                   |
| created_at         | DATETIME        | Oluşturulma tarihi, varsayılan olarak şu anki zaman     |
| updated_at         | DATETIME        | Güncellenme tarihi, güncelleme sırasında otomatik olarak |

#### cart_items
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| cart_item_id       | INT             | Birincil anahtar, otomatik artan                         |
| cart_id            | INT             | Sepet ID, dış anahtar, null olamaz                       |
| variant_id         | INT             | Varyant ID, dış anahtar, null olamaz                     |
| quantity           | INT             | Miktar, null olamaz                                      |
| added_at           | DATETIME        | Eklenme tarihi, varsayılan olarak şu anki zaman         |

#### orders
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| order_id           | INT             | Birincil anahtar, otomatik artan                         |
| user_id            | INT             | Kullanıcı ID, dış anahtar, null olamaz                   |
| order_date         | DATETIME        | Sipariş tarihi, varsayılan olarak şu anki zaman         |
| shipping_address_id| INT             | Teslimat adresi ID, dış anahtar, null olamaz             |
| billing_address_id | INT             | Fatura adresi ID, dış anahtar, null olamaz               |
| payment_method_id  | INT             | Ödeme yöntemi ID, dış anahtar, null olamaz               |
| subtotal           | DECIMAL(10,2)   | Ara toplam, null olamaz                                  |
| shipping_cost      | DECIMAL(10,2)   | Kargo ücreti, null olamaz                                |
| tax_amount         | DECIMAL(10,2)   | Vergi tutarı, null olamaz                                |
| discount_amount    | DECIMAL(10,2)   | İndirim tutarı, varsayılan olarak 0                      |
| total_amount       | DECIMAL(10,2)   | Toplam tutar, null olamaz                                |
| order_status       | ENUM            | Sipariş durumu (pending, processing, shipped, delivered, cancelled, refunded) |
| notes              | TEXT            | Notlar                                                   |

#### order_items
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| order_item_id      | INT             | Birincil anahtar, otomatik artan                         |
| order_id           | INT             | Sipariş ID, dış anahtar, null olamaz                     |
| variant_id         | INT             | Varyant ID, dış anahtar, null olamaz                     |
| quantity           | INT             | Miktar, null olamaz                                      |
| unit_price         | DECIMAL(10,2)   | Birim fiyatı, null olamaz                                |
| subtotal           | DECIMAL(10,2)   | Ara toplam, null olamaz                                  |

#### payment_methods
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| payment_method_id  | INT             | Birincil anahtar, otomatik artan                         |
| name               | VARCHAR(50)     | Ödeme yöntemi adı, null olamaz                           |
| description        | TEXT            | Açıklama                                                 |

#### payments
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| payment_id         | INT             | Birincil anahtar, otomatik artan                         |
| order_id           | INT             | Sipariş ID, dış anahtar, null olamaz, benzersiz          |
| payment_method_id  | INT             | Ödeme yöntemi ID, dış anahtar, null olamaz               |
| amount             | DECIMAL(10,2)   | Tutar, null olamaz                                       |
| transaction_id     | VARCHAR(100)    | İşlem ID                                                 |
| payment_status     | ENUM            | Ödeme durumu (pending, completed, failed, refunded)      |
| payment_date       | DATETIME        | Ödeme tarihi                                             |

### Kargo ve Teslimat

#### shipping_methods
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| shipping_method_id | INT             | Birincil anahtar, otomatik artan                         |
| name               | VARCHAR(50)     | Kargo yöntemi adı, null olamaz                           |
| description        | TEXT            | Açıklama                                                 |
| base_cost          | DECIMAL(10,2)   | Temel ücret, null olamaz                                 |

#### shipments
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| shipment_id        | INT             | Birincil anahtar, otomatik artan                         |
| order_id           | INT             | Sipariş ID, dış anahtar, null olamaz                     |
| shipping_method_id | INT             | Kargo yöntemi ID, dış anahtar, null olamaz               |
| tracking_number    | VARCHAR(100)    | Takip numarası                                           |
| shipment_date      | DATETIME        | Gönderim tarihi                                          |
| estimated_delivery | DATETIME        | Tahmini teslimat tarihi                                  |
| actual_delivery    | DATETIME        | Gerçek teslimat tarihi                                   |
| status             | ENUM            | Gönderim durumu (processing, shipped, in_transit, delivered, failed) |

### Değerlendirme ve Yorumlar

#### reviews
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| review_id          | INT             | Birincil anahtar, otomatik artan                         |
| product_id         | INT             | Ürün ID, dış anahtar, null olamaz                        |
| user_id            | INT             | Kullanıcı ID, dış anahtar, null olamaz                   |
| order_item_id      | INT             | Sipariş ürünü ID, dış anahtar, null olamaz               |
| rating             | INT             | Puan, null olamaz, 1 ile 5 arasında                      |
| comment            | TEXT            | Yorum                                                    |
| review_date        | DATETIME        | Değerlendirme tarihi, varsayılan olarak şu anki zaman   |
| status             | ENUM            | Durum (pending, approved, rejected)                      |

### İndirim ve Kampanyalar

#### coupons
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| coupon_id          | INT             | Birincil anahtar, otomatik artan                         |
| code               | VARCHAR(50)     | Kupon kodu, benzersiz, null olamaz                       |
| description        | TEXT            | Açıklama                                                 |
| discount_type      | ENUM            | İndirim tipi (percentage, fixed_amount)                  |
| discount_value     | DECIMAL(10,2)   | İndirim değeri, null olamaz                              |
| minimum_purchase   | DECIMAL(10,2)   | Minimum satın alma, varsayılan olarak 0                  |
| start_date         | DATETIME        | Başlangıç tarihi, null olamaz                            |
| end_date           | DATETIME        | Bitiş tarihi, null olamaz                                |
| usage_limit        | INT             | Kullanım limiti                                          |
| usage_count        | INT             | Kullanım sayısı, varsayılan olarak 0                     |
| is_active          | BOOLEAN         | Aktif mi?, varsayılan olarak TRUE                        |

#### promotions
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| promotion_id       | INT             | Birincil anahtar, otomatik artan                         |
| name               | VARCHAR(100)    | Promosyon adı, null olamaz                               |
| description        | TEXT            | Açıklama                                                 |
| discount_type      | ENUM            | İndirim tipi (percentage, fixed_amount)                  |
| discount_value     | DECIMAL(10,2)   | İndirim değeri, null olamaz                              |
| start_date         | DATETIME        | Başlangıç tarihi, null olamaz                            |
| end_date           | DATETIME        | Bitiş tarihi, null olamaz                                |
| is_active          | BOOLEAN         | Aktif mi?, varsayılan olarak TRUE                        |

#### promotion_products
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| promotion_product_id | INT           | Birincil anahtar, otomatik artan                         |
| promotion_id       | INT             | Promosyon ID, dış anahtar, null olamaz                   |
| product_id         | INT             | Ürün ID, dış anahtar, null olamaz                        |

### Stok Yönetimi

#### inventory_transactions
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| transaction_id     | INT             | Birincil anahtar, otomatik artan                         |
| variant_id         | INT             | Varyant ID, dış anahtar, null olamaz                     |
| quantity_change    | INT             | Miktar değişimi, null olamaz                             |
| transaction_type   | ENUM            | İşlem tipi (purchase, sale, return, adjustment)          |
| reference_id       | INT             | Referans ID                                              |
| notes              | TEXT            | Notlar                                                   |
| transaction_date   | DATETIME        | İşlem tarihi, varsayılan olarak şu anki zaman           |

### Tedarikçi Yönetimi

#### suppliers
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| supplier_id        | INT             | Birincil anahtar, otomatik artan                         |
| name               | VARCHAR(100)    | Tedarikçi adı, null olamaz                               |
| contact_person     | VARCHAR(100)    | İletişim kişisi                                          |
| email              | VARCHAR(100)    | E-posta                                                  |
| phone              | VARCHAR(20)     | Telefon                                                  |
| address            | TEXT            | Adres                                                    |
| status             | ENUM            | Durum (active, inactive)                                 |
| created_at         | DATETIME        | Oluşturulma tarihi, varsayılan olarak şu anki zaman     |

#### product_suppliers
| Sütun              | Veri Tipi       | Açıklama                                                 |
|--------------------|-----------------|----------------------------------------------------------|
| product_supplier_id | INT            | Birincil anahtar, otomatik artan                         |
| product_id         | INT             | Ürün ID, dış anahtar, null olamaz                        |
| supplier_id        | INT             | Tedarikçi ID, dış anahtar, null olamaz                   |
| supplier_sku       | VARCHAR(50)     | Tedarikçi stok kodu                                      |
| cost_price         | DECIMAL(10,2)   | Maliyet fiyatı, null olamaz                              |
| lead_time_days     | INT             | Tedarik süresi (gün)                                     |
| is_primary         | BOOLEAN         | Ana tedarikçi mi?, varsayılan olarak FALSE               |

## İndeksler

- users: email üzerinde UNIQUE indeks
- user_addresses: user_id üzerinde indeks
- categories: parent_category_id üzerinde indeks
- sellers: user_id üzerinde UNIQUE indeks
- products: seller_id, category_id, sku (UNIQUE) üzerinde indeksler
- product_variants: product_id, sku (UNIQUE) üzerinde indeksler
- carts: user_id üzerinde indeks
- cart_items: cart_id, variant_id üzerinde indeksler
- orders: user_id, shipping_address_id, billing_address_id üzerinde indeksler
- order_items: order_id, variant_id üzerinde indeksler
- payments: order_id (UNIQUE) üzerinde indeks
- shipments: order_id üzerinde indeks
- reviews: product_id, user_id üzerinde indeksler, (order_item_id, user_id) üzerinde UNIQUE indeks
- coupons: code üzerinde UNIQUE indeks
- promotion_products: promotion_id, product_id üzerinde indeksler
- inventory_transactions: variant_id üzerinde indeks
- product_suppliers: product_id, supplier_id üzerinde indeksler

## Veri Bütünlüğü Kısıtlamaları

- Tüm birincil anahtarlar NOT NULL ve AUTO_INCREMENT
- Dış anahtarlar genellikle CASCADE silme ve güncelleme kısıtlamalarına sahip
- reviews tablosunda rating sütunu için CHECK kısıtlaması (1 ile 5 arasında)
- Tekil sipariş öğesi başına bir değerlendirme kısıtlaması
- Her satıcının bir kullanıcı ile eşleştirilmesi gerekir 