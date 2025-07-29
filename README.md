# CodeMind - 智能编程推荐系统

一个面向编程场景的智能推荐系统，能够理解开发者所处的代码上下文与任务阶段，基于开发行为、对话内容、代码结构等多维信号，智能生成具备引导性、实用性和连续性的后续问题建议。

## 🎯 项目目标

- 提升开发者在IDE内对话助手的使用体验
- 构建"有点懂你"的对话伙伴，能够顺着开发者的思路往下走
- 实现可控、可调、可积累的推荐引擎

## 🏗️ 系统架构

### 核心模块设计

1. **输入感知器（Input Perception）** - 捕捉用户当前问题 + IDE编程上下文
2. **对话状态建模器（Dialog Tracker）** - 保存近N轮对话，构建任务状态图
3. **代码焦点提取器（Code Context Extractor）** - 提取当前代码文件结构、所在函数、周边API
4. **任务阶段分类器（Task Stage Classifier）** - 将问题归类为认知类、设计类、Debug类、重构类
5. **语义匹配器（Semantic Matcher）** - 与FAQ、文档、历史对话构建向量索引
6. **目标规划器（Goal Planner）** - 基于目标图谱与上下文状态，规划下一个推荐路径
7. **候选问题生成器（Question Generator）** - 模板驱动 + LLM生成
8. **多因素排序器（Ranker）** - 综合打分排序
9. **反馈学习模块（Feedback Engine）** - 用户操作行为日志，驱动排序器/生成器微调

### 技术栈

- **后端**: Python + FastAPI
- **前端**: React + TypeScript
- **数据库**: SQLite + 向量数据库
- **AI集成**: OpenAI API + 本地向量嵌入
- **代码分析**: AST解析 + 静态分析工具

## 🚀 快速开始

### 环境要求

- Python 3.8+
- Node.js 16+
- OpenAI API Key

### 安装步骤

1. 克隆项目
```bash
git clone <repository-url>
cd CodeMind
```

2. 安装后端依赖
```bash
cd backend
pip install -r requirements.txt
```

3. 安装前端依赖
```bash
cd frontend
npm install
```

4. 配置环境变量
```bash
cp .env.example .env
# 编辑.env文件，添加你的OpenAI API Key
```

5. 启动服务
```bash
# 启动后端
cd backend
uvicorn main:app --reload

# 启动前端（新终端）
cd frontend
npm start
```

## 📁 项目结构

```
CodeMind/
├── backend/                 # 后端服务
│   ├── app/
│   │   ├── core/           # 核心引擎模块
│   │   ├── models/         # 数据模型
│   │   ├── api/            # API路由
│   │   └── utils/          # 工具函数
│   ├── tests/              # 测试文件
│   └── requirements.txt    # Python依赖
├── frontend/               # 前端应用
│   ├── src/
│   │   ├── components/     # React组件
│   │   ├── hooks/          # 自定义hooks
│   │   ├── services/       # API服务
│   │   └── types/          # TypeScript类型定义
│   └── package.json        # Node.js依赖
├── docs/                   # 文档
├── data/                   # 数据存储
└── README.md              # 项目说明
```

## 🎨 UI设计参考

- 主界面：参考GPT/Deepseek的聊天界面设计
- 推荐展示：在用户消息下方显示3个推荐问题卡片
- 交互：点击推荐问题直接发送，悬停显示更多信息

## 📋 开发计划

### 第一阶段：基础框架（1天）
- [x] 项目结构搭建
- [ ] 基础API接口
- [ ] 基础聊天UI

### 第二阶段：核心推荐引擎（2-3天）
- [ ] 输入感知器
- [ ] 对话状态建模器
- [ ] 任务阶段分类器
- [ ] 候选问题生成器

### 第三阶段：智能优化（1-2天）
- [ ] 多因素排序器
- [ ] 反馈学习模块
- [ ] UI交互优化

## 🤝 贡献指南

欢迎提交Issue和Pull Request！

## �� 许可证

MIT License
