# 多巴胺日历 — GitHub Pages 免费部署指南

不用装任何软件，全程在浏览器操作，5 分钟搞定。

---

## 第一步：创建 GitHub 账号

打开 https://github.com → 点右上角 Sign up → 用邮箱注册
（已有账号跳过此步）

---

## 第二步：创建仓库

1. 登录后，点右上角 **+** → **New repository**
2. Repository name 填：**dopamine-calendar**
3. 选 **Public**（公开）
4. ✅ 勾选 **Add a README file**
5. 点 **Create repository**

---

## 第三步：上传文件

1. 进入刚创建的仓库
2. 点 **Add file** → **Upload files**
3. 把电脑上 `C:\Users\ADMIN\dopamine-calendar\` 里的文件全部拖进去：
   - index.html
   - manifest.json
   - sw.js
   - icon.ico
   （README.md 可以保留或替换）
4. 底部 Commit message 填：`初始化多巴胺日历`
5. 点 **Commit changes**

---

## 第四步：开启 GitHub Pages

1. 在仓库页面，点顶部 **Settings**
2. 左侧菜单点 **Pages**
3. Branch 选 **main** → 点 **Save**
4. 等 1-2 分钟，页面刷新后会显示：
   ```
   ✅ Your site is live at https://你的用户名.github.io/dopamine-calendar/
   ```

---

## 第五步：安卓手机安装为 App

1. 用手机 Chrome 打开上面的网址
2. 地址栏会出现一个安装图标，或弹出「添加到主屏幕」
3. 如果没有弹出：点 Chrome 菜单(⋮) → **添加到主屏幕**
4. 桌面出现「多巴胺日历」图标，秒开全屏！

> 💡 注意：必须用 **Chrome 浏览器**，其他浏览器（如 UC/QQ 浏览器）不支持 PWA 安装

---

## 后续同步

电脑端编辑 → 点「📤 导出备份」→ 发到手机 → 手机端点「📥 导入备份」
反之亦然。
