#!/bin/bash

# .env dosyasını yükle
if [ -f .env ]; then
  source .env
else
  echo ".env dosyası bulunamadı."
  exit 1
fi

# Alan adı ve e-posta bilgisi (manuel olarak tanımlayın)
DOMAIN=$WP_URL # Alan adını buraya yazın
EMAIL=$WP_USER_EMAIL # E-posta adresini buraya yazın

# Certbot'un kurulu olup olmadığını kontrol edin
if ! command -v certbot &> /dev/null; then
    echo "Certbot yüklü değil. Şimdi kurulum yapılıyor..."
    apt update
    apt install certbot -y

    # Certbot kurulum kontrolü
    if ! command -v certbot &> /dev/null; then
        echo "Certbot yüklenemedi. Lütfen elle kontrol edin."
        exit 1
    fi
fi

echo "Certbot yüklü."


# Ana makinenin IP'sini bul
HOST_IP=$(hostname -I | awk '{print $1}')
echo "Makinenizin IP adresi: $HOST_IP"

# SSL sertifikası almak için certbot'u çalıştır
echo "Let's Encrypt üzerinden sertifika alınıyor..."
certbot certonly --standalone -d $DOMAIN --email $EMAIL --agree-tos --no-eff-email --preferred-challenges http --http-01-address $HOST_IP --non-interactive


# Sertifika oluşturma sonucu kontrol
if [ $? -eq 0 ]; then
    echo "Sertifika başarıyla oluşturuldu!"
    echo "SSL sertifikaları şu dizinde yer almaktadır:"
    echo "/etc/letsencrypt/live/$DOMAIN/"
else
    echo "Sertifika oluşturulamadı. Lütfen hata mesajlarını kontrol edin."
    exit 2
fi

if [ -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ] && [ -f /etc/letsencrypt/live/$DOMAIN/privkey.pem ]; then
    echo "Sertifikalar kopyalanıyor..."
    sudo  cp /etc/letsencrypt/live/$DOMAIN/fullchain.pem ./srcs/requirements/nginx/tools/fullchain.pem
    sudo cp /etc/letsencrypt/live/$DOMAIN/privkey.pem ./srcs/requirements/nginx/tools/privkey.pem
    echo "Sertifikalar başarıyla kopyalandı!"
else
    echo "Sertifikalar bulunamadı. Lütfen oluşturma sürecini kontrol edin."
    exit 2
fi

# Sertifika yenileme bilgisi
echo "-----------------------------"
echo "Not: Sertifika 90 gün geçerlidir. Yenilemek için şu komutu çalıştırabilirsiniz:"
echo "sudo certbot renew"