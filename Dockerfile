# استفاده از ایمیج پایه Nginx
FROM nginx:latest

# کپی کانفیگ‌ها
COPY conf/gitlab.conf /etc/nginx/conf.d/

# کپی فایل‌های SSL (اختیاری)
COPY ssl/fullchain.pem /etc/nginx/ssl/fullchain.pem
COPY ssl/privkey.pem /etc/nginx/ssl/privkey.pem

# تنظیم کاربر برای دسترسی مناسب
RUN chmod 600 /etc/nginx/ssl/*

# باز کردن پورت‌ها (در صورت نیاز)
EXPOSE 80
EXPOSE 443
