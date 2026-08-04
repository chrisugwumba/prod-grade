#!/bin/bash

# Update the system
yum update -y

# Install Apache Web Server
yum install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Retrieve EC2 metadata securely using IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/instance-id)

HOSTNAME=$(hostname)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/local-ipv4)

AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create the HTML landing page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Terraform EC2 Demo</title>

<style>
body{
    font-family:Segoe UI,Tahoma,Geneva,Verdana,sans-serif;
    background:linear-gradient(135deg,#74ebe1 0%,#d4a1ff 100%);
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    background:#fff;
    padding:40px;
    border-radius:16px;
    width:700px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,.15);
}

h1{
    color:#4A00E0;
    margin-bottom:10px;
}

h2{
    color:#333;
}

.info{
    margin-top:25px;
    text-align:left;
    background:#f5f5f5;
    padding:20px;
    border-radius:10px;
}

.info p{
    font-size:18px;
    margin:10px 0;
}

.badge{
    display:inline-block;
    margin-top:20px;
    background:#00c853;
    color:#fff;
    padding:10px 18px;
    border-radius:30px;
    font-weight:bold;
}

.footer{
    margin-top:20px;
    color:#777;
}
</style>

</head>

<body>

<div class="container">

<h1>🚀 Terraform Infrastructure Demo</h1>

<h2>Application Load Balancer Test</h2>

<p>
This web server was provisioned automatically using
<strong>Terraform + EC2 User Data</strong>.
</p>

<div class="info">

<p><strong>Hostname:</strong> $HOSTNAME</p>

<p><strong>Instance ID:</strong> $INSTANCE_ID</p>

<p><strong>Private IP:</strong> $PRIVATE_IP</p>

<p><strong>Availability Zone:</strong> $AZ</p>

</div>

<div class="badge">
Server Status: Online
</div>

<div class="footer">

<p>
Refresh this page several times.
If the <strong>Hostname</strong> or <strong>Instance ID</strong>
changes, your Application Load Balancer is successfully distributing
traffic between multiple EC2 instances.
</p>

</div>

</div>

</body>
</html>

EOF

# Restart Apache
systemctl restart httpd