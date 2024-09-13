#!/bin/bash
yum install -y httpd
systemctl start httpd
systemctl enable httpd
instance_id=$(ec2-metadata -i | cut -d ' ' -f 2)
private_ip=$(ec2-metadata -o | cut -d ' ' -f 2)
az_name=$(ec2-metadata -z | cut -d ' ' -f 2)
cat <<EOF > /var/www/html/index.html
<h1>서울 웹 서버에 오신 것을 환영합니다.</h1>
<h3>인스턴스 ID : ${instance_id}</h3>
<h3>사설 IP : ${private_ip}</h3>
<h3>가용영역 : ${az_name}</h3>
<img src="https://logos-world.net/wp-content/uploads/2021/08/Amazon-Web-Services-AWS-Logo-700x394.png" width="100">
EOF
