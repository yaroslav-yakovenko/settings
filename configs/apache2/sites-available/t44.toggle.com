<VirtualHost 127.0.0.1:80>
    ServerName t44.toggle.com
    DocumentRoot /var/www/toggle3/public_html/
</VirtualHost>