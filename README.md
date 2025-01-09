# راه‌اندازی GitLab با Docker و Nginx

این پروژه برای راه‌اندازی **GitLab CE** با استفاده از Docker Compose طراحی شده است و از Nginx به عنوان پروکسی معکوس استفاده می‌کند.

## پیش‌نیازها
1. نصب **Docker** و **Docker Compose** روی سیستم.
2. دامنه معتبر (مثلاً `gitlab.local`) که در فایل `/etc/hosts` یا DNS تنظیم شده باشد.
3. گواهی SSL در صورت استفاده از HTTPS (برای تست می‌توانید گواهی‌های خودامضا ایجاد کنید).

## مراحل راه‌اندازی

### 1. کلون کردن پروژه
ابتدا پروژه را کلون کنید و وارد دایرکتوری آن شوید:
```bash
git clone https://github.com/naderii/gitlab-nginx-docker.git
cd gitlab-nginx-docker
```

### 2. ویرایش فایل کانفیگ‌ها
فایل docker-compose.yml را ویرایش کنید و تنظیمات مربوط به gitlab-server و nginx را طبق نیاز خود تغییر دهید.
فایل کانفیگ Nginx در مسیر nginx/conf/gitlab.conf قرار دارد. در صورت استفاده از HTTPS مسیر گواهی‌ها را بررسی و تنظیم کنید.
### 3. ساخت و اجرای کانتینرها
برای ساخت ایمیج‌ها و اجرای کانتینرها، دستور زیر را اجرا کنی
```bash
docker-compose up --build -d
```
### 4. دسترسی به GitLab
پس از اجرا، می‌توانید از طریق مرورگر به GitLab دسترسی داشته باشید:

- HTTP: http://gitlab.local
- HTTPS: https://gitlab.local
### 5. بررسی وضعیت کانتینرها
برای مشاهده وضعیت کانتینرها
```bash
docker ps
```

## دیدن پسورد
‍‍‍``` bash
sudo docker exec -it gitlab-server grep 'Password:' /etc/gitlab/initial_root_password
```
### ریست پسورد
```bash
sudo docker exec -it gitlab-server bash
gitlab-rake "gitlab:password:reset"
```
