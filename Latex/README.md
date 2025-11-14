# LaTeX 文档项目说明

## 项目概述

本项目使用 XeLaTeX 编译系统，用于整理和撰写经导管心脏瓣膜介入治疗的临床研究文献综述。

## 文件结构

```
Latex/
├── main.tex                    # 主文档
├── Claude.md                   # 项目大纲和规划
├── README.md                   # 本说明文件
├── compile.sh                  # 编译脚本（待创建）
├── chapters/                   # 章节文件夹
│   └── lv_reverse_remodeling/  # LV逆向重塑章节
│       └── chapter.tex         # 章节内容
└── references.bib              # BibTeX文献库（可选）
```

## 编译环境要求

### 必需软件

1. **TeX发行版**（以下任一）：
   - TeX Live（推荐，Linux/Mac/Windows）
   - MiKTeX（Windows）
   - MacTeX（macOS）

2. **XeLaTeX编译器**：
   - 通常包含在上述TeX发行版中
   - 用于支持中文和UTF-8编码

3. **中文字体**（系统需安装）：
   - 宋体（SimSun）
   - 黑体（SimHei）
   - 楷体（KaiTi）
   - 仿宋（FangSong）

### 可选软件

- PDF阅读器（Adobe Reader、Sumatra PDF、Evince等）
- LaTeX编辑器（TeXstudio、TeXworks、VS Code + LaTeX Workshop等）

## 编译方法

### 方法1：命令行编译（推荐）

```bash
cd Latex
xelatex main.tex
xelatex main.tex  # 再次编译以生成正确的目录
```

如果需要生成完整的交叉引用和目录，建议运行两次。

### 方法2：使用编译脚本

```bash
cd Latex
chmod +x compile.sh
./compile.sh
```

### 方法3：使用LaTeX编辑器

1. 打开 `main.tex`
2. 在编辑器中设置编译引擎为 XeLaTeX
3. 点击编译按钮

## 文档结构说明

### 主文档 (main.tex)

主文档包含以下部分：

1. **导言区**：宏包引用和文档设置
2. **封面**：标题、作者、日期
3. **目录**：自动生成
4. **前言**：文档概述
5. **章节内容**：通过 `\input` 命令引用各章节
6. **参考文献**：手动列表或BibTeX

### 章节文件

- 每个章节存放在独立的子文件夹中
- 章节文件以 `chapter.tex` 命名
- 建议单个文件不超过500行

## 添加新章节

### 步骤1：创建章节文件夹

```bash
mkdir -p chapters/new_chapter_name
```

### 步骤2：创建章节文件

在新文件夹中创建 `chapter.tex`，内容格式：

```latex
\chapter{章节标题}
\label{chap:chapter_label}

\section{小节标题}
内容...
```

### 步骤3：在主文档中引用

在 `main.tex` 的适当位置添加：

```latex
\input{chapters/new_chapter_name/chapter.tex}
```

### 步骤4：更新 Claude.md 大纲

在 `Claude.md` 中添加新章节的规划信息。

## 常见问题

### 1. 中文显示为方框或乱码

**原因**：系统缺少中文字体或字体配置不正确

**解决方法**：
- Linux: 安装字体包 `apt-get install fonts-wqy-*`
- 检查系统是否安装了常用中文字体
- 在文档中明确指定字体（如需要）

### 2. 编译错误：找不到宏包

**原因**：TeX发行版不完整

**解决方法**：
- TeX Live: `tlmgr install package_name`
- MiKTeX: 通常会自动下载缺失宏包
- 或安装完整版TeX发行版

### 3. 目录、引用编号不正确

**原因**：需要多次编译

**解决方法**：运行 `xelatex main.tex` 至少两次

### 4. PDF中的超链接不工作

**原因**：hyperref宏包配置或PDF阅读器问题

**解决方法**：
- 检查 `main.tex` 中 hyperref 宏包配置
- 尝试使用不同的PDF阅读器

## 编译输出文件

编译成功后会生成以下文件：

- `main.pdf` - 最终的PDF文档（**目标文件**）
- `main.aux` - 辅助文件
- `main.log` - 编译日志
- `main.toc` - 目录信息
- `main.out` - hyperref信息
- `main.lof` - 插图目录
- `main.lot` - 表格目录

**注意**：除了 `main.pdf`，其他文件都是中间文件，可以删除。

## 清理中间文件

```bash
cd Latex
rm -f *.aux *.log *.toc *.out *.lof *.lot
```

或使用清理脚本（如果创建）：

```bash
./clean.sh
```

## 文献引用

### 当前方式：手动文献列表

在 `main.tex` 中直接维护 `thebibliography` 环境。

### 推荐方式：BibTeX（未来）

1. 创建 `references.bib` 文件
2. 在 `main.tex` 中启用 BibTeX 相关行
3. 编译命令变为：
   ```bash
   xelatex main.tex
   bibtex main
   xelatex main.tex
   xelatex main.tex
   ```

## 版本信息

- **版本**: 1.0
- **创建日期**: 2025-11-14
- **LaTeX引擎**: XeLaTeX
- **文档类**: ctexbook（中文书籍类）

## 维护说明

1. 每个章节应独立管理
2. 单个文件不超过500行
3. 大章节应拆分为多个小节文件
4. 及时更新 `Claude.md` 大纲
5. 保持文献引用的准确性

## 联系与支持

如有问题，请参考：
- LaTeX官方文档：https://www.latex-project.org/
- CTeX宏集文档：http://www.ctex.org/
- TeX Stack Exchange：https://tex.stackexchange.com/

---

最后更新：2025-11-14
