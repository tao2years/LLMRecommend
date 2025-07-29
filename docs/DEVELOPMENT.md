# CodeMind 开发指南

## 🚀 快速开始

### 环境准备

1. **Python环境**
```bash
# 创建虚拟环境
python -m venv venv

# 激活虚拟环境
# Windows
venv\Scripts\activate
# macOS/Linux
source venv/bin/activate

# 安装依赖
cd backend
pip install -r requirements.txt
```

2. **Node.js环境**
```bash
# 安装前端依赖
cd frontend
npm install
```

3. **环境配置**
```bash
# 复制环境变量文件
cd backend
cp env.example .env

# 编辑.env文件，添加你的OpenAI API Key
OPENAI_API_KEY=your_actual_api_key_here
```

### 启动开发服务器

1. **启动后端**
```bash
cd backend
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

2. **启动前端**
```bash
cd frontend
npm start
```

3. **访问应用**
- 前端: http://localhost:3000
- 后端API: http://localhost:8000
- API文档: http://localhost:8000/docs

## 📁 项目结构详解

### 后端结构
```
backend/
├── app/
│   ├── __init__.py
│   ├── main.py                 # FastAPI应用入口
│   ├── config.py               # 配置管理
│   ├── core/                   # 核心引擎模块
│   │   ├── __init__.py
│   │   ├── input_perception.py # 输入感知器
│   │   ├── dialog_tracker.py   # 对话状态建模器
│   │   ├── code_context_extractor.py # 代码焦点提取器
│   │   ├── task_stage_classifier.py # 任务阶段分类器
│   │   ├── semantic_matcher.py # 语义匹配器
│   │   ├── goal_planner.py     # 目标规划器
│   │   ├── question_generator.py # 候选问题生成器
│   │   ├── ranker.py          # 多因素排序器
│   │   └── feedback_engine.py # 反馈学习模块
│   ├── models/                 # 数据模型
│   │   ├── __init__.py
│   │   ├── message.py         # 消息模型
│   │   ├── recommendation.py  # 推荐模型
│   │   ├── dialog_state.py    # 对话状态模型
│   │   └── task_stage.py      # 任务阶段枚举
│   ├── api/                   # API路由
│   │   ├── __init__.py
│   │   ├── chat.py           # 聊天API
│   │   └── recommendations.py # 推荐API
│   └── utils/                 # 工具函数
│       ├── __init__.py
│       ├── logger.py         # 日志工具
│       └── helpers.py        # 辅助函数
├── tests/                     # 测试文件
├── data/                      # 数据存储
├── logs/                      # 日志文件
├── requirements.txt           # Python依赖
└── env.example               # 环境变量示例
```

### 前端结构
```
frontend/
├── public/
│   ├── index.html
│   └── favicon.ico
├── src/
│   ├── components/            # React组件
│   │   ├── ChatInterface.tsx  # 主聊天界面
│   │   ├── MessageBubble.tsx  # 消息气泡
│   │   ├── RecommendationCard.tsx # 推荐问题卡片
│   │   ├── CodeContextPanel.tsx # 代码上下文面板
│   │   └── InputBox.tsx       # 输入框组件
│   ├── hooks/                 # 自定义hooks
│   │   ├── useChat.ts         # 聊天逻辑
│   │   ├── useRecommendations.ts # 推荐逻辑
│   │   └── useCodeContext.ts  # 代码上下文逻辑
│   ├── services/              # API服务
│   │   ├── api.ts            # API调用
│   │   └── types.ts          # TypeScript类型
│   ├── store/                 # 状态管理
│   │   ├── chatStore.ts      # 聊天状态
│   │   └── recommendationStore.ts # 推荐状态
│   ├── utils/                 # 工具函数
│   │   ├── constants.ts      # 常量定义
│   │   └── helpers.ts        # 辅助函数
│   ├── App.tsx               # 主应用组件
│   ├── index.tsx             # 应用入口
│   └── index.css             # 全局样式
├── package.json              # Node.js依赖
└── tsconfig.json             # TypeScript配置
```

## 🔧 开发规范

### 代码风格

**Python (后端)**
- 遵循PEP8规范
- 使用类型注解
- 编写文档字符串
- 使用Black进行代码格式化

```bash
# 格式化代码
black app/
# 检查代码风格
flake8 app/
# 类型检查
mypy app/
```

**TypeScript (前端)**
- 遵循ESLint规范
- 使用严格的TypeScript配置
- 组件使用函数式编程
- 使用Hooks进行状态管理

```bash
# 检查代码风格
npm run lint
# 修复代码风格
npm run lint:fix
# 类型检查
npm run type-check
```

### Git工作流

1. **分支命名**
   - 功能分支: `feature/模块名称`
   - 修复分支: `fix/问题描述`
   - 文档分支: `docs/文档类型`

2. **提交信息格式**
```
type(scope): description

[optional body]

[optional footer]
```

示例:
```
feat(chat): add message bubble component
fix(api): resolve CORS issue
docs(readme): update installation guide
```

3. **提交类型**
   - `feat`: 新功能
   - `fix`: 修复bug
   - `docs`: 文档更新
   - `style`: 代码格式调整
   - `refactor`: 代码重构
   - `test`: 测试相关
   - `chore`: 构建过程或辅助工具的变动

### 测试规范

**后端测试**
```bash
# 运行所有测试
pytest

# 运行特定测试
pytest tests/test_chat.py

# 生成覆盖率报告
pytest --cov=app tests/
```

**前端测试**
```bash
# 运行测试
npm test

# 运行测试并生成覆盖率
npm test -- --coverage
```

## 🚀 部署指南

### 开发环境部署

1. **后端部署**
```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

2. **前端部署**
```bash
cd frontend
npm install
npm run build
# 将build目录部署到Web服务器
```

### 生产环境部署

1. **使用Docker**
```bash
# 构建镜像
docker build -t codemind .

# 运行容器
docker run -p 8000:8000 codemind
```

2. **使用Docker Compose**
```bash
docker-compose up -d
```

## 🔍 调试指南

### 后端调试

1. **日志查看**
```bash
tail -f logs/codemind.log
```

2. **API调试**
- 访问 http://localhost:8000/docs 查看API文档
- 使用Postman或curl测试API

3. **代码调试**
```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### 前端调试

1. **浏览器开发者工具**
- 使用React Developer Tools
- 查看Network面板监控API调用
- 使用Console查看日志

2. **状态调试**
```typescript
// 在组件中添加调试日志
console.log('Chat state:', chatState);
```

## 📊 性能优化

### 后端优化

1. **数据库优化**
- 使用连接池
- 添加索引
- 优化查询语句

2. **缓存策略**
- 使用Redis缓存
- 实现本地缓存
- 缓存推荐结果

3. **异步处理**
- 使用异步函数
- 实现任务队列
- 优化API响应时间

### 前端优化

1. **组件优化**
- 使用React.memo
- 实现虚拟滚动
- 优化重渲染

2. **网络优化**
- 实现请求缓存
- 使用CDN
- 压缩资源

## 🐛 常见问题

### 后端问题

1. **OpenAI API错误**
   - 检查API Key是否正确
   - 确认API配额是否充足
   - 检查网络连接

2. **数据库连接错误**
   - 检查数据库文件权限
   - 确认数据库路径正确
   - 检查SQLite版本

### 前端问题

1. **CORS错误**
   - 检查后端CORS配置
   - 确认代理设置正确
   - 检查请求头设置

2. **组件渲染错误**
   - 检查TypeScript类型定义
   - 确认props传递正确
   - 查看控制台错误信息

## 📚 学习资源

- [FastAPI官方文档](https://fastapi.tiangolo.com/)
- [React官方文档](https://react.dev/)
- [TypeScript官方文档](https://www.typescriptlang.org/)
- [Ant Design组件库](https://ant.design/)
- [OpenAI API文档](https://platform.openai.com/docs) 