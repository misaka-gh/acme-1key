# Acme.sh 域名证书一键申请脚本

此脚本可以帮助你使用acme.sh脚本申请域名的ssl证书，并将证书文件保存到 `/root` 文件夹下

如对脚本不放心，可使用此沙箱先测一遍再使用：https://killercoda.com/playgrounds/scenario/ubuntu

## 使用方法

```shell
wget -N --no-check-certificate https://raw.githubusercontents.com/Misaka-blog/acme-1key/master/acme1key.sh && bash acme1key.sh
```

快捷方式 `bash acme1key.sh`

说明文档：https://owo.misaka.rest/acme-1key/

## 赞助我们

![afdian-MisakaNo.jpg](https://s2.loli.net/2021/12/25/SimocqwhVg89NQJ.jpg)

## 交流群
[Telegram](https://t.me/misakanetcn)

## 关于脚本被不要脸的YouTuber抄的经过

我在2021年12月份发布本脚本，初衷是因为需要帮助大家更容易地申请证书。由于GitHub项目是开源的。故代码被知名YouTuber甬哥侃侃侃抄去了。我个人认为抄不要紧，但是在其代码加密，并在注释上喷原作的行为实在是太不友好了。既违反了GPL 3.0开源协议，而且又自己害得自己招受不必要的麻烦，何必呢？

![image](https://user-images.githubusercontent.com/96560028/160876628-2065d996-c4a0-4c84-8536-2ad5280cc20c.png)

图1: 其代码和本仓库第一次Commits时间对比

![image](https://user-images.githubusercontent.com/96560028/160876668-2d594f74-853b-4368-a263-7a3332532593.png)

图2: 其加密代码注释内容（红框处）

![image](https://user-images.githubusercontent.com/96560028/160877033-b9a72e3f-ca9e-48c6-8593-685e18a4ed8b.png)

![image](https://user-images.githubusercontent.com/96560028/160877039-df0490b2-25d8-4c2d-a7b4-ddbc1e79398b.png)

希望能看到之后浪子回头。知错能改不是一个大问题。

## 感谢列表

感谢他们的贡献，让脚本得到进一步完善

Acme.sh https://github.com/acmesh-official/acme.sh

wulabing: https://github.com/wulabing/Xray_onekey
