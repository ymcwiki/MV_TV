#!/bin/bash

# LaTeX 文档编译脚本
# 使用 XeLaTeX 编译主文档

echo "========================================="
echo "开始编译 LaTeX 文档..."
echo "========================================="
echo ""

# 检查 xelatex 是否安装
if ! command -v xelatex &> /dev/null; then
    echo "错误: 未找到 xelatex 命令"
    echo "请先安装 TeX Live 或其他 LaTeX 发行版"
    exit 1
fi

# 第一次编译
echo "第一次编译..."
xelatex -interaction=nonstopmode main.tex

if [ $? -ne 0 ]; then
    echo ""
    echo "编译失败！请检查 main.log 文件查看错误详情"
    exit 1
fi

# 第二次编译（生成正确的目录和交叉引用）
echo ""
echo "第二次编译（生成目录）..."
xelatex -interaction=nonstopmode main.tex

if [ $? -ne 0 ]; then
    echo ""
    echo "编译失败！请检查 main.log 文件查看错误详情"
    exit 1
fi

echo ""
echo "========================================="
echo "编译成功！"
echo "输出文件: main.pdf"
echo "========================================="

# 询问是否打开PDF
read -p "是否打开生成的PDF文件？(y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # 根据操作系统选择合适的打开命令
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        xdg-open main.pdf 2>/dev/null || evince main.pdf 2>/dev/null || echo "请手动打开 main.pdf"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        open main.pdf
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        start main.pdf
    else
        echo "请手动打开 main.pdf"
    fi
fi
