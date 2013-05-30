<VirtualHost 127.0.0.1:800>
    ServerName dev.software112.com
    ServerAlias linux.software112.com
    DocumentRoot /var/www/toggle3/public_html/
</VirtualHost>