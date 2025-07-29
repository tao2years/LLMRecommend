@echo off
REM CodeMind 项目设置脚本 (Windows版本)

echo 🚀 开始设置 CodeMind 项目...

REM 创建必要的目录
echo 📁 创建项目目录结构...
if not exist "backend\app\core" mkdir backend\app\core
if not exist "backend\app\models" mkdir backend\app\models
if not exist "backend\app\api" mkdir backend\app\api
if not exist "backend\app\utils" mkdir backend\app\utils
if not exist "backend\tests" mkdir backend\tests
if not exist "backend\data" mkdir backend\data
if not exist "backend\logs" mkdir backend\logs

if not exist "frontend\src\components" mkdir frontend\src\components
if not exist "frontend\src\hooks" mkdir frontend\src\hooks
if not exist "frontend\src\services" mkdir frontend\src\services
if not exist "frontend\src\store" mkdir frontend\src\store
if not exist "frontend\src\utils" mkdir frontend\src\utils

if not exist "docs" mkdir docs
if not exist "scripts" mkdir scripts

echo ✅ 目录结构创建完成

REM 检查Python环境
echo 🐍 检查Python环境...
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ Python 已安装
    python --version
) else (
    echo ❌ Python 未安装，请先安装Python
    pause
    exit /b 1
)

REM 检查Node.js环境
echo 📦 检查Node.js环境...
node --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ Node.js 已安装
    node --version
) else (
    echo ❌ Node.js 未安装，请先安装Node.js
    pause
    exit /b 1
)

REM 设置Python虚拟环境
echo 🔧 设置Python虚拟环境...
cd backend
if not exist "venv" (
    python -m venv venv
    echo ✅ 虚拟环境创建完成
) else (
    echo ✅ 虚拟环境已存在
)

REM 激活虚拟环境并安装依赖
echo 📦 安装Python依赖...
call venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt

REM 设置环境变量
if not exist ".env" (
    copy env.example .env
    echo ✅ 环境变量文件创建完成
    echo ⚠️  请编辑 .env 文件，添加你的 OpenAI API Key
) else (
    echo ✅ 环境变量文件已存在
)

cd ..

REM 安装前端依赖
echo 📦 安装前端依赖...
cd frontend
npm install

cd ..

echo 🎉 项目设置完成！
echo.
echo 📋 下一步操作：
echo 1. 编辑 backend\.env 文件，添加你的 OpenAI API Key
echo 2. 启动后端服务：cd backend ^&^& venv\Scripts\activate ^&^& uvicorn app.main:app --reload
echo 3. 启动前端服务：cd frontend ^&^& npm start
echo.
echo 🌐 访问地址：
echo - 前端: http://localhost:3000
echo - 后端API: http://localhost:8000
echo - API文档: http://localhost:8000/docs

pause 