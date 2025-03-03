---
tags:
  - "#html"
  - ai生成
---

# 标签

## `<html>`
- **根元素**：`<html>` 标签是 HTML 文档的根元素，所有其他元素都包含在其中。
  
```html
<html>
    <!-- 页面内容 -->
</html>
```

## `<head>`
- **头部**：`<head>` 标签包含页面的元数据，如标题、字符集、样式表和脚本。
  
```html
<head>
    <meta charset="UTF-8">
    <title>页面标题</title>
</head>
```

## `<body>`
- **主体**：`<body>` 标签包含页面的主要内容，如文本、图像、链接等。
  
```html
<body>
    <h1>这是一个标题</h1>
    <p>这是一个段落。</p>
</body>
```

## `<h1> ~ <h6>`
- **标题标签**：`<h1>` 到 `<h6>` 标签用于定义不同级别的标题，`<h1>` 是最高级别，`<h6>` 是最低级别。
  
```html
<h1>一级标题</h1>
<h2>二级标题</h2>
<h3>三级标题</h3>
<h4>四级标题</h4>
<h5>五级标题</h5>
<h6>六级标题</h6>
```

## `<p> 和 <br>`
- **`<p>`**：段落标签，用于定义文本段落。
  
```html
<p>这是一个段落。</p>
```

- **`<br>`**：换行标签，用于在文本中强制换行。
  
```html
这是第一行<br>这是第二行
```

## `<strong>` 和 `<b>`
- **`<strong>`**：表示强调，通常显示为粗体，但具有语义意义。
  
```html
<strong>重要内容</strong>
```

- **`<b>`**：表示粗体，仅用于视觉上的加粗，无语义意义。
  
```html
<b>加粗内容</b>
```

## `<em>` 和 `<i>`
- **`<em>`**：表示强调，通常显示为斜体，具有语义意义。
  
```html
<em>强调内容</em>
```

- **`<i>`**：表示斜体，仅用于视觉上的倾斜，无语义意义。
  
```html
<i>斜体内容</i>
```

## `<ins>` 和 `<u>`
- **`<ins>`**：表示插入的文本，通常显示为下划线，具有语义意义。
  
```html
<ins>插入内容</ins>
```

- **`<u>`**：表示下划线，仅用于视觉上的下划线，无语义意义。
  
```html
<u>下划线内容</u>
```

## `<del>` 和 `<s>`
- **`<del>`**：表示删除的文本，通常显示为删除线。
  
```html
<del>删除内容</del>
```

- **`<s>`**：表示删除线，仅用于视觉效果。
  
```html
<s>删除内容</s>
```

# 属性

## `lang`
- **作用**：定义文档的语言或元素的语言，帮助浏览器和搜索引擎理解页面的内容。
- **用法**：
```html
<html lang="zh-CN"></html>
```
- `zh-CN` 表示页面是简体中文，`en` 表示英文，`ja` 表示日文等。
- **意义**：辅助屏幕阅读器等工具正确发音，或搜索引擎更好地索引内容。

## `charset`
- **作用**：定义页面的字符编码，确保浏览器正确显示文本。
- **用法**：
```html
<meta charset="UTF-8">
```
- `UTF-8` 是最常用的字符编码，支持多语言，包括中文、英文、日文等。
- **意义**：避免乱码，确保页面内容正确显示。

## `id` 和 `class`
- **`id`**：为元素指定唯一标识，常用于 CSS 或 JavaScript 操作。

```html
<div id="header"></div>
```

- **`class`**：为元素指定类名，可用于 CSS 样式或分组元素。

```html
<div class="container"></div>
```

## `src` 和 `href`
- **`src`**：指定外部资源（如图片、脚本、视频）的路径。

```html
<img src="image.jpg">
<script src="script.js"></script>
```

- **`href`**：指定链接或样式表的路径。

```html
<a href="https://example.com">链接</a>
<link href="styles.css" rel="stylesheet">
```

## `alt`
- **作用**：为图片提供替代文本，当图片无法加载时显示。

```html
<img src="image.jpg" alt="描述文本">
```

## `title`
- **作用**：为元素提供额外信息，鼠标悬停时显示。

```html
<a href="https://example.com" title="点击访问">链接</a>
```

## `style`
- **作用**：直接在元素中定义 CSS 样式。

```html
<p style="color: red;">红色文本</p>
```

## `target`
- **作用**：指定链接的打开方式，通常用于 `<a>` 标签。

```html
<a href="https://example.com" target="_blank">在新标签页打开</a>
```

## `disabled` 和 `readonly`
- **`disabled`**：禁用输入元素，用户无法操作。

```html
<input type="text" disabled>
```

- **`readonly`**：使输入元素只读，用户可以查看但无法修改。

```html
<input type="text" readonly>
```

## `required`
- **作用**：指定输入字段为必填项。

```html
<input type="text" required>
```