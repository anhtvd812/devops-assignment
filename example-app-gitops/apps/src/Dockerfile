# Stage 1: Sử dụng base image Nginx gọn nhẹ
FROM nginx:1.25-alpine

# Xóa file cấu hình mặc định của Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Sao chép file cấu hình Nginx tùy chỉnh
COPY nginx.conf /etc/nginx/nginx.conf

# Sao chép file template HTML vào thư mục templates bên trong image
COPY templates/ /usr/share/nginx/templates/

# Sao chép và cấp quyền thực thi cho script khởi động
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Mở port 80
EXPOSE 80

# Chạy script khởi động khi container bắt đầu
ENTRYPOINT ["/entrypoint.sh"]