<VirtualHost 127.0.0.1:80>
    ServerName download.toggle.com
    DocumentRoot /var/www/toggle_inf_down_installer_local/
</VirtualHost>