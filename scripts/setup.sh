#!/bin/bash

# CodeMind 项目设置脚本
echo "🚀 开始设置 CodeMind 项目..."

# 创建必要的目录
echo "📁 创建项目目录结构..."
mkdir -p backend/app/core
mkdir -p backend/app/models
mkdir -p backend/app/api
mkdir -p backend/app/utils
mkdir -p backend/tests
mkdir -p backend/data
mkdir -p backend/logs

mkdir -p frontend/src/components
mkdir -p frontend/src/hooks
mkdir -p frontend/src/services
mkdir -p frontend/src/store
mkdir -p frontend/src/utils

mkdir -p docs
mkdir -p scripts

echo "✅ 目录结构创建完成"

# 检查Python环境
echo "🐍 检查Python环境..."
if command -v python3 &> /dev/null; then
    echo "✅ Python3 已安装"
    python3 --version
else
    echo "❌ Python3 未安装，请先安装Python3"
    exit 1
fi

# 检查Node.js环境
echo "📦 检查Node.js环境..."
if command -v node &> /dev/null; then
    echo "✅ Node.js 已安装"
    node --version
else
    echo "❌ Node.js 未安装，请先安装Node.js"
    exit 1
fi

# 设置Python虚拟环境
echo "🔧 设置Python虚拟环境..."
cd backend
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✅ 虚拟环境创建完成"
else
    echo "✅ 虚拟环境已存在"
fi

# 激活虚拟环境并安装依赖
echo "📦 安装Python依赖..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# 设置环境变量
if [ ! -f ".env" ]; then
    cp env.example .env
    echo "✅ 环境变量文件创建完成"
    echo "⚠️  请编辑 .env 文件，添加你的 OpenAI API Key"
else
    echo "✅ 环境变量文件已存在"
fi

cd ..

# 安装前端依赖
echo "📦 安装前端依赖..."
cd frontend
npm install

cd ..

echo "🎉 项目设置完成！"
echo ""
echo "📋 下一步操作："
echo "1. 编辑 backend/.env 文件，添加你的 OpenAI API Key"
echo "2. 启动后端服务：cd backend && source venv/bin/activate && uvicorn app.main:app --reload"
echo "3. 启动前端服务：cd frontend && npm start"
echo ""
echo "🌐 访问地址："
echo "- 前端: http://localhost:3000"
echo "- 后端API: http://localhost:8000"
echo "- API文档: http://localhost:8000/docs" 