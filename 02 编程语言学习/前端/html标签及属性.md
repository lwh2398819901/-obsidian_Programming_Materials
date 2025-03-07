---
tags:
  - "#html"
  - ai生成
---

# HTML 标签与属性指南

## 文档基础结构标签

### `<html>`
- **定义**: HTML文档的根元素
- **用途**: 包含整个HTML文档的所有内容
- **示例**:
```html
<html lang="zh-CN">
    <!-- 文档内容 -->
</html>
```

### `<head>`
- **定义**: 文档头部区域
- **用途**: 包含元数据、标题、样式表等
- **示例**:
```html
<head>
    <meta charset="UTF-8">
    <title>页面标题</title>
</head>
```

### `<body>`
- **定义**: 文档主体区域
- **用途**: 包含所有可见的内容
- **示例**:
```html
<body>
    <h1>主标题</h1>
    <p>正文内容</p>
</body>
```

## 常用属性

### 全局属性
| 属性 | 用途 | 示例 |
|------|------|------|
| `id` | 唯一标识符 | `<div id="header">` |
| `class` | 类名 | `<div class="container">` |
| `style` | 行内样式 | `<p style="color: red;">` |
| `title` | 提示信息 | `<span title="更多信息">` |

### 特定元素属性
| 属性 | 适用元素 | 用途 | 示例 |
|------|----------|------|------|
| `src` | img, script等 | 资源路径 | `<img src="image.jpg">` |
| `href` | a, link等 | 链接地址 | `<a href="https://example.com">` |
| `alt` | img | 替代文本 | `<img alt="图片描述">` |
| `target` | a | 链接打开方式 | `<a target="_blank">` |

### 表单相关属性
| 属性 | 用途 | 示例 |
|------|------|------|
| `disabled` | 禁用元素 | `<input disabled>` |
| `readonly` | 只读属性 | `<input readonly>` |
| `required` | 必填字段 | `<input required>` |

### 文档属性
| 属性 | 用途 | 示例 |
|------|------|------|
| `lang` | 语言定义 | `<html lang="zh-CN">` |
| `charset` | 字符编码 | `<meta charset="UTF-8">` |

## 文本结构标签

### 标题标签 (`<h1>` - `<h6>`)
- **定义**: 六个级别的标题
- **用途**: 定义文档的层级结构
- **示例**:
```html
<h1>一级标题</h1>
<h2>二级标题</h2>
<!-- 以此类推到 h6 -->
```

### 段落相关标签
- **`<p>`**: 段落标签
- **`<br>`**: 换行标签
```html
<p>这是一个段落</p>
这是第一行<br>这是第二行
```

## 文本格式化标签


### 强调类标签
| 标签 | 语义 | 视觉效果 | 示例 |
|------|------|----------|------|
| `<strong>` | 强调重要 | <strong>粗体效果</strong> | `<strong>重要内容</strong>` |
| `<em>` | 强调 | <em>斜体效果</em> | `<em>强调内容</em>` |
| `<b>` | 无语义 | <b>粗体效果</b> | `<b>粗体文本</b>` |
| `<i>` | 无语义 | <i>斜体效果</i> | `<i>斜体文本</i>` |



### 修饰类标签
| 标签      | 语义   | 视觉效果             | 示例                 |
| ------- | ---- | ---------------- | ------------------ |
| `<ins>` | 插入内容 | <ins>下划线效果</ins> | `<ins>插入的文本</ins>` |
| `<del>` | 删除内容 | <del>删除线效果</del> | `<del>删除的文本</del>` |
| `<u>`   | 无语义  | <u>下划线效果</u>     | `<u>下划线文本</u>`     |
| `<s>`   | 无语义  | <s>删除线效果</s>     | `<s>删除线文本</s>`     |

## 布局标签
| 标签       | 语义                                    | 示例                                                   |
| -------- | ------------------------------------- | ---------------------------------------------------- |
| `<div>`  | 盒子标签  div 是 division 缩写，表示分割，分区，单独站一行 | `<div id="header"><h1>网站标题</h1></div>`               |
| `<span>` | 盒子标签 span 意为跨度、跨距，可以多行并列              | `<p>这是一个<span style="color: red;">红色</span>的文本。</p>` |


## 图像标签

`<img>`:图像标签,src属性指定图片路径,alt属性指定图片描述，<font color="#ff0000">src为必填属性</font>

| 属性 | 用途 | 示例 |
|------|------|------|
| `src` | 图片路径,可以是相对路径，也可以是绝对路径 | `<img src="image.jpg">` |
| `alt` | 图片描述,图片无法显示时显示的文本 | `<img alt="图片描述">` |
| `width` | 图片宽度,单位为像素 | `<img width="100">` |
| `height` | 图片高度,单位为像素 | `<img height="100">` |
| `title` | 图片提示信息,鼠标悬停时显示 | `<img title="图片提示信息">` |
| `border` | 图片边框,单位为像素 | `<img border="1">` |
| `align` | 图片对齐方式,left,right,top,bottom | `<img align="left">` |

```html
<img src="image.jpg" alt="图片描述" width="100" height="100" title="图片提示信息" border="1" align="left">
```

## 链接标签

`<a>`:链接标签,href属性指定链接地址,target属性指定链接打开方式

```html
<a href="https://www.baidu.com" target="_blank" title="链接提示信息">链接文本</a>
```

| 属性 | 用途 | 示例 |
|------|------|------|
| `href` | 链接地址,分为外部链接和内部链接 | `<a href="https://www.baidu.com">` |
| `target` | 链接打开方式,blank,self,parent,top | `<a target="_blank">` |
| `title` | 链接提示信息 | `<a title="链接提示信息">` |
| `rel` | 链接关系，rel属性指定链接与当前文档的关系 | `<a rel="nofollow">` |
| `download` | 下载链接 | `<a download="image.jpg">` |
| `ping` | 链接点击事件 | `<a ping="https://www.baidu.com">` |
| `referrerpolicy` | 链接引用策略 | `<a referrerpolicy="no-referrer">` |


`<a>`:锚点标签,href属性指定锚点地址,name属性指定锚点名称

```html
<a href="#锚点名称">锚点文本</a>
<h1 id="锚点名称">锚点文本</h1>
```
示例:
```html
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>链接标签综合示例</title>
</head>
<body>

    <h1>链接标签综合示例</h1>

    <h2>外部链接</h2>
    <p>
        使用 <code>&lt;a&gt;</code> 标签创建一个指向百度的外部链接：
        <a href="https://www.baidu.com" target="_blank" title="访问百度">访问百度</a>
    </p>

    <h2>内部链接</h2>
    <p>
        使用 <code>&lt;a&gt;</code> 标签创建一个指向同一文档内的链接：
        <a href="#section1" title="跳转到第一部分">跳转到第一部分</a>
    </p>

    <h2>锚点链接</h2>
    <h3 id="section1">第一部分</h3>
    <p>这是第一部分的内容。</p>

    <h2>下载链接</h2>
    <p>
        使用 <code>&lt;a&gt;</code> 标签创建一个下载链接：
        <a href="path/to/file.pdf" download="文件名.pdf" title="下载文件">下载文件</a>
    </p>

    <h2>结合多个属性的示例</h2>
    <p>
        <a href="https://www.baidu.com" target="_blank" rel="noopener noreferrer" title="访问示例网站">访问示例网站</a>
    </p>

</body>
</html>
```











