#!/bin/bash

# LaTeX 中间文件清理脚本

echo "========================================="
echo "清理 LaTeX 编译产生的中间文件..."
echo "========================================="
echo ""

# 要清理的文件扩展名列表
extensions=(
    "aux"
    "log"
    "toc"
    "out"
    "lof"
    "lot"
    "bbl"
    "blg"
    "synctex.gz"
    "fdb_latexmk"
    "fls"
    "nav"
    "snm"
    "vrb"
)

# 计数器
count=0

# 清理主目录下的中间文件
for ext in "${extensions[@]}"; do
    files=$(find . -maxdepth 1 -name "*.${ext}" 2>/dev/null)
    if [ -n "$files" ]; then
        echo "删除 *.${ext} 文件..."
        rm -f *.${ext}
        count=$((count + 1))
    fi
done

# 清理章节目录下的中间文件
for ext in "${extensions[@]}"; do
    files=$(find ./chapters -name "*.${ext}" 2>/dev/null)
    if [ -n "$files" ]; then
        echo "删除 chapters/ 中的 *.${ext} 文件..."
        find ./chapters -name "*.${ext}" -delete
        count=$((count + 1))
    fi
done

echo ""
if [ $count -gt 0 ]; then
    echo "清理完成！已删除 ${count} 种类型的中间文件"
else
    echo "没有找到需要清理的中间文件"
fi

echo ""
echo "注意: main.pdf 文件已保留"
echo "========================================="
