# 共匪消消乐

这是一个 Codex 项目版本，方便后续查找、修改和继续开发。

## 文件结构

- `index.html`：游戏主文件，包含界面、关卡、消除逻辑、道具、存档和 Google 登录接入位。
- `assets/`：本地图片资源目录，目前保留之前下载过的头像素材。
- `start-server.ps1`：启动本地网页服务的 PowerShell 脚本。

## 运行方式

在当前项目目录运行：

```powershell
.\start-server.ps1
```

然后打开：

```text
http://127.0.0.1:8000/index.html
```

如果端口 8000 被占用，脚本会自动换到下一个可用端口。

## 常见修改位置

- 游戏名称：搜索 `共匪消消乐`
- Google 登录配置：搜索 `GOOGLE_CLIENT_ID`
- 人物头像：搜索 `const people`
- 关卡数量和规则：搜索 `const levels`
- 结算逻辑：搜索 `finishLevel`
- 道具逻辑：搜索 `useHammer`、`useShuffle`、`useExtraMoves`

## Google 登录

要启用真实 Google 登录，需要在 Google Cloud Console 创建 OAuth Client ID，然后把：

```js
YOUR_GOOGLE_CLIENT_ID.apps.googleusercontent.com
```

替换成你的真实 Client ID。

本地测试时，需要把授权来源加入 Google OAuth 配置：

```text
http://127.0.0.1:8000
```
