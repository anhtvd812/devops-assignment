#!/bin/sh

# Đặt giá trị mặc định là "local" nếu biến APP_ENV không được cung cấp
CURRENT_ENV=${APP_ENV:-"local"}

# Dựa vào môi trường để chọn màu nền cho badge
case "$CURRENT_ENV" in
  "dev")
    COLOR="#3498db" # Xanh dương
    ;;
  "test")
    COLOR="#f1c40f" # Vàng
    ;;
  "staging")
    COLOR="#e67e22" # Cam
    ;;
  "prod")
    COLOR="#e74c3c" # Đỏ
    ;;
  *)
    COLOR="#95a5a6" # Xám
    ;;
esac

# Tìm và thay thế các placeholder trong file template và ghi kết quả ra file index.html
sed -e "s|__ENVIRONMENT__|${CURRENT_ENV}|g" -e "s|__ENV_COLOR__|${COLOR}|g" /usr/share/nginx/templates/index.html.template > /usr/share/nginx/html/index.html

echo "Starting Nginx..."
# Khởi động Nginx ở chế độ foreground
nginx -g 'daemon off;'