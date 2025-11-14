# LaTeX 文档撰写大纲

## 项目简介
本文档用于摘录和整理TAVR（经导管主动脉瓣置换术）及相关心血管介入治疗的重要信息，特别聚焦于左心室重塑、二尖瓣反流治疗等关键主题。

## 文档结构

### 1. LV 逆向重塑 (Left Ventricular Reverse Remodeling)
**文件夹**: `chapters/lv_reverse_remodeling/`
**主要内容**:
- LV逆向重塑的定义与机制
- 相关临床研究与设备
  - HighLife TMVR系统
  - ReValve Solutions TMVR系统
  - CARLEN系统
  - AccuCinch系统
  - Revivent系统
  - Carillon系统
  - CLEVE技术
  - M-TEER技术

**参考PDF文献**: 9篇

### 2. [待添加章节]
**文件夹**: `chapters/[章节名称]/`
**主要内容**: 待定
**参考PDF文献**: 待定

### 3. [待添加章节]
**文件夹**: `chapters/[章节名称]/`
**主要内容**: 待定
**参考PDF文献**: 待定

## 编译说明
- 使用 XeLaTeX 编译（支持中文）
- 主文档: `main.tex`
- 编译命令: `xelatex main.tex`
- 可能需要多次编译以生成完整的目录和交叉引用

## 章节编写原则
1. 每个章节独立于子文件夹中
2. 单个章节文件不超过500行代码
3. 如需要，可将大章节拆分为多个小节文件
4. 所有章节通过主文档引用（`\input` 或 `\include`）

## 文献引用规范
- 每个PDF文献需在文中明确标注来源
- 建议使用BibTeX管理文献
- 文献列表文件: `references.bib`

## 版本控制
- 文档版本: 1.0
- 最后更新: 2025-11-14
- 维护者: Claude AI Assistant
