# wechat-md

轻量的微信编辑器 [doocs/md](https://github.com/doocs/md) 的轻量容器镜像

目前支持如下平台, 见 [actions](.github/workflows/build-and-push-release-image.yml)

- linux/amd64
- linux/arm64
- linux/arm/v7

补充:

1. 搭建后.  编辑 -> 上传图片 -> 默认地址为原项目提供的随机 [github 或者 gitee 仓库](https://github.com/doocs/md/blob/main/src/api/config.js), 需要注意