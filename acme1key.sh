#!/bin/bash

IP=$(curl ipget.net)

green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}

yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}

red(){
    echo -e "\033[31m$1\033[0m";
}

if [[ $(id -u) != 0 ]]; then
    red "请在root用户下运行脚本"
    rm -f acme1key.sh
    exit 0
fi

if [[ -f /etc/redhat-release ]]; then
    release="Centos"
elif cat /etc/issue | grep -q -E -i "debian"; then
    release="Debian"
elif cat /etc/issue | grep -q -E -i "ubuntu"; then
    release="Ubuntu"
elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
    release="Centos"
elif cat /proc/version | grep -q -E -i "debian"; then
    release="Debian"
elif cat /proc/version | grep -q -E -i "ubuntu"; then
    release="Ubuntu"
elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
    release="Centos"
fi	   

function acme(){
    if [ $release = "Centos" ]; then
        yum -y update && yum install curl -y && yum install -y socat 
    else
        apt update -y && apt install curl -y && apt install -y socat
    fi
    curl https://get.acme.sh | sh
    read -p "请输入注册邮箱：" email
    bash /root/.acme.sh/acme.sh --register-account -m ${email}
    read -p "输入需要申请SSL证书的域名域名:" domain
    domainIP=$(curl ipget.net/?ip="$domain")
    yellow "VPS本机IP：$IP"
    yellow "当前的域名解析到的IP：$domainIP"
    if [ $IP = $domainIP ]; then
        if echo $domainIP | grep -q ":"; then
            bash /root/.acme.sh/acme.sh  --issue -d ${domain} --standalone -k ec-256 --server letsencrypt --listen-v6
        else
            bash /root/.acme.sh/acme.sh  --issue -d ${domain} --standalone -k ec-256 --server letsencrypt
        fi
        bash /root/.acme.sh/acme.sh --installcert -d ${domain} --key-file /root/private.key --fullchain-file /root/cert.crt --ecc
        green "域名证书（cert.crt）和私钥（private.key）已保存到 /root 文件夹，请注意保存"
    else
        red "域名解析IP不匹配"
        green "请确认DNS已正确解析到VPS，或CloudFlare的小云朵没关闭，请关闭小云朵后重试"
        exit 0
    fi
}

function renew(){
    read -p "你的域名:" domain
    bash /root/.acme.sh/acme.sh --renew -d ${domain} --force --ecc
}

function update(){
    wget -N https://cdn.jsdelivr.net/gh/Misaka-blog/acme1key@master/acme1key.sh && chmod -R 777 acme1key.sh && bash acme1key.sh
}

function start_menu(){
    clear
    red "=================================="
    echo "                           "
    red "    Acme.sh 域名证书一键申请脚本     "
    red "          by 小御坂的破站           "
    echo "                           "
    red "  Site: https://blog.misaka.rest  "
    echo "                           "
    red "=================================="
    echo "                           "
    echo "                           "
    echo "1. 申请证书"
    echo "2. 续期证书"
    echo "v. 更新脚本"
    echo "0. 退出脚本"
    echo "                           "
    echo "                           "
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in     
        1 ) acme ;;
        2 ) renew ;;
        v ) update ;;
        0 ) exit 0
    ;;       
    esac
}   

start_menu
