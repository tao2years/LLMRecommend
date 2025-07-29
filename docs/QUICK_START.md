# CodeMind 快速开始指南

## 🎯 项目概述

CodeMind是一个智能编程推荐系统，能够理解开发者的编程上下文和任务阶段，提供智能的问题推荐。

## ⚡ 5分钟快速启动

### 1. 环境检查
确保你的系统已安装：
- Python 3.8+
- Node.js 16+
- Git

### 2. 一键设置
```bash
# 克隆项目
git clone <your-repo-url>
cd CodeMind

# 运行设置脚本
# Linux/macOS:
chmod +x scripts/setup.sh
./scripts/setup.sh

# Windows:
scripts/setup.bat
```

### 3. 配置API密钥
```bash
# 编辑环境变量文件
cd backend
# 编辑 .env 文件，添加你的 OpenAI API Key
OPENAI_API_KEY=your_actual_api_key_here
```

### 4. 启动服务
```bash
# 启动后端 (终端1)
cd backend
source venv/bin/activate  # Linux/macOS
# 或 venv\Scripts\activate  # Windows
uvicorn app.main:app --reload

# 启动前端 (终端2)
cd frontend
npm start
```

### 5. 访问应用
- 前端界面: http://localhost:3000
- API文档: http://localhost:8000/docs

## 🧪 快速测试

### 测试聊天功能
1. 打开 http://localhost:3000
2. 在输入框中输入："这个项目是做什么的？"
3. 查看系统回答和推荐问题

### 测试推荐功能
1. 发送一个问题
2. 查看下方显示的3个推荐问题
3. 点击推荐问题测试交互

## 📋 开发检查清单

### 第一阶段：基础框架 ✅
- [x] 项目结构搭建
- [ ] 基础API接口
- [ ] 基础聊天UI

### 第二阶段：核心推荐引擎 🔄
- [ ] 输入感知器
- [ ] 对话状态建模器
- [ ] 任务阶段分类器
- [ ] 候选问题生成器

### 第三阶段：智能优化 ⏳
- [ ] 多因素排序器
- [ ] 反馈学习模块
- [ ] UI交互优化

## 🔧 常用开发命令

### 后端开发
```bash
# 启动开发服务器
cd backend
source venv/bin/activate
uvicorn app.main:app --reload

# 运行测试
pytest

# 代码格式化
black app/
flake8 app/
```

### 前端开发
```bash
# 启动开发服务器
cd frontend
npm start

# 构建生产版本
npm run build

# 代码检查
npm run lint
npm run type-check
```

## 🐛 常见问题解决

### 1. 端口被占用
```bash
# 查找占用端口的进程
lsof -i :8000  # Linux/macOS
netstat -ano | findstr :8000  # Windows

# 杀死进程
kill -9 <PID>
```

### 2. 依赖安装失败
```bash
# 清理缓存重新安装
pip cache purge
pip install -r requirements.txt --no-cache-dir
```

### 3. 前端构建失败
```bash
# 清理node_modules重新安装
rm -rf node_modules package-lock.json
npm install
```

## 📊 项目状态监控

### 健康检查
- [ ] 后端API响应正常
- [ ] 前端页面加载正常
- [ ] 数据库连接正常
- [ ] OpenAI API调用正常

### 性能指标
- API响应时间 < 2秒
- 推荐生成时间 < 1秒
- 页面加载时间 < 3秒

## 🚀 下一步计划

### 本周目标
1. 完成基础聊天功能
2. 实现简单推荐系统
3. 优化用户界面

### 下周目标
1. 完善推荐算法
2. 添加代码分析功能
3. 实现反馈学习

### 长期目标
1. 支持多语言
2. 添加插件系统
3. 优化推荐质量

## 📞 获取帮助

- 查看 [开发文档](./DEVELOPMENT.md)
- 查看 [架构文档](./ARCHITECTURE.md)
- 查看 [TODO列表](./TODO.md)
- 提交 Issue 或 Pull Request

## 🎉 恭喜！

你已经成功启动了CodeMind项目！现在可以开始开发你的智能编程推荐系统了。

记住：
- 保持代码整洁
- 编写测试用例
- 及时提交代码
- 享受编程的乐趣！ 