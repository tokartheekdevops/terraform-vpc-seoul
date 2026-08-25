#!/bin/bash

set -e

apt-get update -y

apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Jenkins Infrastructure</title>
</head>
<body>
    <h1>This infrastructure is created by Terraform through Jenkins</h1>
    <p>Region: ap-northeast-2 (Seoul)</p>
    <p>Application: Nginx</p>
</body>
</html>
EOF

systemctl restart nginx
