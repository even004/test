#!/bin/bash

# Remove packages
rm -rf feeds/packages/net/v2ray-geodata

# Add packages
git clone -b js --single-branch https://github.com/gngpp/luci-theme-design package/luci-theme-design
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic

# 加入OpenClash核心
chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
$GITHUB_WORKSPACE/N1/preset-clash-core.sh

echo "
# 主题
CONFIG_PACKAGE_luci-theme-design=y
CONFIG_PACKAGE_luci-app-mosdns=y
" >> .config

# 修改默认IP
sed -i 's/192.168.1.1/192.168.0.2/g' package/base-files/files/bin/config_generate

# 修改默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改主机名
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 修改系统信息
cp -f $GITHUB_WORKSPACE/N1/99-default-settings package/emortal/default-settings/files/99-default-settings
cp -f $GITHUB_WORKSPACE/N1/banner package/base-files/files/etc/banner

# 修改主题背景
cp -f $GITHUB_WORKSPACE/argon/img/bg1.jpg feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
cp -f $GITHUB_WORKSPACE/argon/img/argon.svg feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/img/argon.svg
cp -f $GITHUB_WORKSPACE/argon/favicon.ico feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/favicon.ico
cp -f $GITHUB_WORKSPACE/argon/icon/android-icon-192x192.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/android-icon-192x192.png
cp -f $GITHUB_WORKSPACE/argon/icon/apple-icon-144x144.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-144x144.png
cp -f $GITHUB_WORKSPACE/argon/icon/apple-icon-60x60.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-60x60.png
cp -f $GITHUB_WORKSPACE/argon/icon/apple-icon-72x72.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/apple-icon-72x72.png
cp -f $GITHUB_WORKSPACE/argon/icon/favicon-16x16.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-16x16.png
cp -f $GITHUB_WORKSPACE/argon/icon/favicon-32x32.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-32x32.png
cp -f $GITHUB_WORKSPACE/argon/icon/favicon-96x96.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/favicon-96x96.png
cp -f $GITHUB_WORKSPACE/argon/icon/ms-icon-144x144.png feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/icon/ms-icon-144x144.png
cp -f $GITHUB_WORKSPACE/argon/favicon.ico package/luci-theme-design/htdocs/luci-static/design/favicon.ico
