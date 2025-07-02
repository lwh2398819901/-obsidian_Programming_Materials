---
tags:
  - "#html"
  - ai生成
---

# HTML 标签与属性指南

## 注释标签


```html
<!-- 这是一个HTML注释 -->
<!-- 注释不会在浏览器中显示，但可以在源代码中查看 -->
```

### 注释的作用
- **解释代码**: 帮助开发者理解代码的功能和用途。
- **调试**: 临时禁用某些代码段，方便调试。
- **协作**: 在团队开发中，提供额外的上下文信息。

### 示例
```html
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注释示例</title>
</head>
<body>

    <!-- 这是页面的主标题 -->
    <h1>欢迎来到我的网站</h1>

    <!-- 
        这是一个多行注释
        可以用于解释复杂的代码段
    -->
    <p>这是一个段落。</p>

    <!-- 临时禁用的代码段 -->
    <!-- <p>这个段落暂时被注释掉了。</p> -->

</body>
</html>
```

### 注意事项
- **嵌套注释**: HTML不支持嵌套注释。例如，`<!-- <!-- 内层注释 --> -->`会导致解析错误。
- **隐藏敏感信息**: 虽然注释不会在浏览器中显示，但仍可以通过查看源代码看到，因此不要在注释中包含敏感信息。

通过合理使用注释，可以提高代码的可读性和可维护性。






## 特殊字符

在HTML中，某些字符具有特殊意义，例如 `<`、`>`、`&` 等。为了在网页中正确显示这些字符，需要使用HTML实体（Entity）或字符引用。

### 常用特殊字符及其HTML实体

| 字符 | HTML实体 | 描述 |
|------|----------|------|
| `<`  | `&lt;`   | 小于号 |
| `>`  | `&gt;`   | 大于号 |
| `&`  | `&amp;`  | 和号 |
| `"`  | `&quot;` | 双引号 |
| `'`  | `&apos;` | 单引号 |
| `©`  | `&copy;` | 版权符号 |
| `®`  | `&reg;`  | 注册商标符号 |
| `™`  | `&trade;`| 商标符号 |
| ` `   | `&nbsp;` | 非换行空格 |

### 示例

```html
<p>在HTML中，使用 &lt;p&gt;标签表示段落。</p>
<p>版权符号：©</p>
<p>注册商标符号：®</p>
<p>商标符号：™</p>
<p>这是一个非换行空格： 文本</p>
```

### Unicode字符

除了HTML实体外，还可以使用Unicode字符编码来显示特殊字符。

#### Unicode示例

```html
<p>笑脸表情：😊 (Unicode: U+1F60A)</p>
<p>心形符号：❤ (Unicode: U+2764)</p>
```

### ASCII码字符

ASCII码中的一些特殊字符也可以通过HTML实体来表示。

#### ASCII码示例

```html
<p>&amp;#169; （ASCII码169）表示©。</p>
```

### CSS中的特殊字符

在某些情况下，CSS也可以用来插入特殊字符。例如，使用伪元素`:before`或`:after`来插入内容。

#### CSS示例

```html
<style>
    .heart::before {
        content: "\2665"; /* Unicode编码表示心形符号 */
    }
</style>

<p class="heart"></p>
```











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



## 布局标签
| 标签       | 语义                                    | 示例                                                   |
| -------- | ------------------------------------- | ---------------------------------------------------- |
| `<div>`  | 盒子标签  div 是 division 缩写，表示分割，分区，单独站一行 | `<div id="header"><h1>网站标题</h1></div>`               |
| `<span>` | 盒子标签 span 意为跨度、跨距，可以多行并列              | `<p>这是一个<span style="color: red;">红色</span>的文本。</p>` |
### 表格标签

1. `<table>` 标签
`<table>` 标签是表格的容器，用于定义一个 HTML 表格的开始和结束，所有表格相关的内容都要放在这个标签内部。

2. `<tr>` 标签
`<tr>` 表示表格中的一行（table row），一个 `<tr>` 标签代表表格中的一行数据，它通常包含一个或多个 `<td>` 或 `<th>` 标签。

3. `<td>` 标签
`<td>` 代表表格中的一个单元格（table data cell），用于存放表格中的具体数据。多个 `<td>` 标签组合在一个 `<tr>` 标签内，就构成了表格的一行。

4. `<th>` 标签
`<th>` 用于定义表格的表头单元格（table header cell），通常出现在表格的第一行或第一列，用于标识表格列或行的内容。它的文本默认会加粗显示，与普通的数据单元格 `<td>` 有所区分。

5. `<caption>` 标签

`<caption>` 标签用于为表格添加标题，它必须紧跟在 `<table>` 标签之后，用于描述表格的主题或内容。

```html
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Table Example</title>
</head>

<body>
    <table border="1">
        <caption>学生成绩表</caption>
        <thead>
            <tr>
                <th>姓名</th>
                <th>语文</th>
                <th>数学</th>
                <th>英语</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>张三</td>
                <td>85</td>
                <td>90</td>
                <td>88</td>
            </tr>
            <tr>
                <td>李四</td>
                <td>78</td>
                <td>82</td>
                <td>75</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <th>平均分</th>
                <td>81.5</td>
                <td>86</td>
                <td>81.5</td>
            </tr>
        </tfoot>
    </table>
</body>

</html>
```

#### `<table>` 标签的常用属性
- `<align>`
	- `left`：表格在页面中左对齐。
	- `center`：表格在页面中居中对齐。
	- `right`：表格在页面中右对齐。
- **`border`**：设置表格的边框宽度，单位为像素。例如 `border="1"` 表示表格边框宽度为 1 像素。不过，现在更推荐使用 CSS 来设置边框样式。
- **`width`**：指定表格的宽度，可以使用像素值（如 `width="500"`）或百分比（如 `width="80%"`）。
- **`cellpadding`**：定义单元格内容与边框之间的间距，单位为像素。例如 `cellpadding="5"` 表示单元格内容与边框之间有 5 像素的间距。
- **`cellspacing`**：设置单元格之间的间距，单位为像素。例如 `cellspacing="2"` 表示相邻单元格之间有 2 像素的间距。

#### `<td>` 和 `<th>` 标签的常用属性

- **`colspan`**：规定单元格跨越多列。例如 `colspan="2"` 表示该单元格跨越两列。
- **`rowspan`**：规定单元格跨越多行。例如 `rowspan="3"` 表示该单元格跨越三行。




## 列表标签

### 无序列表

`<ul>`：无序列表标签，unordered list 的缩写，表示无序列表  注意 ul标签中只能放置 li标签
`<li>`：列表项标签，list item 的缩写，表示列表中的每一项  注意 li标签中可以放任何元素

| 属性 | 用途 | 示例 |
|------|------|------|
| `type` | 列表项标记类型：disc（实心圆点，默认）、circle（空心圆圈）、square（实心方块） | `<ul type="circle">` |
| `start` | 列表项标记的起始编号 | `<ol start="5">` |
| `value` | 列表项标记的编号 | `<li value="5">` |


```html
<h3>我的爱好</h3>
<ul>
    <li>编程</li>
    <li>阅读</li>
    <li>音乐</li>
    <li>运动</li>
</ul>

<!-- 不同标记类型 -->
<ul type="disc">
    <li>实心圆点（默认）</li>
</ul>
<ul type="circle">
    <li>空心圆圈</li>
</ul>
<ul type="square">
    <li>实心方块</li>
</ul>
```

### 有序列表

`<ol>`：有序列表标签，ordered list 的缩写，表示有序列表
`<li>`：列表项标签，list item 的缩写，表示列表中的每一项

| 属性 | 用途 | 示例 |
|------|------|------|
| `type` | 编号类型：1（数字，默认）、A（大写字母）、a（小写字母）、I（大写罗马数字）、i（小写罗马数字） | `<ol type="A">` |
| `start` | 起始编号，指定从哪个数字开始 | `<ol start="3">` |
| `reversed` | 倒序排列 | `<ol reversed>` |

```html
<h3>学习计划</h3>
<ol>
    <li>学习HTML基础</li>
    <li>学习CSS样式</li>
    <li>学习JavaScript</li>
    <li>完成项目实战</li>
</ol>

<!-- 不同编号类型 -->
<ol type="1">
    <li>数字编号（默认）</li>
</ol>
<ol type="A">
    <li>大写字母编号</li>
</ol>
<ol type="a">
    <li>小写字母编号</li>
</ol>
<ol type="I">
    <li>大写罗马数字</li>
</ol>
<ol type="i">
    <li>小写罗马数字</li>
</ol>

<!-- 指定起始编号 -->
<ol start="5">
    <li>从第5项开始</li>
    <li>第6项</li>
    <li>第7项</li>
</ol>

<!-- 倒序排列 -->
<ol reversed>
    <li>倒序第一项</li>
    <li>倒序第二项</li>
    <li>倒序第三项</li>
</ol>
```

### 自定义列表

`<dl>`：自定义列表标签，description list 的缩写，表示定义列表
`<dt>`：定义术语标签，description term 的缩写，表示被定义的术语
`<dd>`：定义描述标签，description description 的缩写，表示术语的描述

```html
<h3>前端技术词汇</h3>
<dl>
    <dt>HTML</dt>
    <dd>超文本标记语言，用于创建网页的标准标记语言</dd>
    
    <dt>CSS</dt>
    <dd>层叠样式表，用于描述HTML文档的样式和布局</dd>
    
    <dt>JavaScript</dt>
    <dd>一种动态编程语言，用于为网页添加交互功能</dd>
    
    <dt>响应式设计</dt>
    <dd>一种网页设计方法，使网页能够适应不同设备的屏幕尺寸</dd>
    <dd>包括桌面电脑、平板电脑和移动设备</dd>
</dl>
```

### 嵌套列表

列表可以相互嵌套，创建多层级的列表结构：

```html
<h3>前端学习路线</h3>
<ol>
    <li>HTML基础
        <ul>
            <li>HTML标签</li>
            <li>HTML属性</li>
            <li>表格和表单</li>
        </ul>
    </li>
    <li>CSS样式
        <ul>
            <li>CSS基础语法</li>
            <li>布局技术
                <ol>
                    <li>Flexbox布局</li>
                    <li>Grid布局</li>
                    <li>响应式设计</li>
                </ol>
            </li>
            <li>CSS动画</li>
        </ul>
    </li>
    <li>JavaScript编程
        <ul>
            <li>基础语法</li>
            <li>DOM操作</li>
            <li>事件处理</li>
        </ul>
    </li>
</ol>
```

### 完整示例

```html
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>列表标签综合示例</title>
</head>
<body>

    <h1>列表标签综合示例</h1>

    <h2>无序列表示例</h2>
    <h3>购物清单</h3>
    <ul>
        <li>牛奶</li>
        <li>面包</li>
        <li>鸡蛋</li>
        <li>水果</li>
    </ul>

    <h2>有序列表示例</h2>
    <h3>做菜步骤</h3>
    <ol>
        <li>准备食材</li>
        <li>清洗食材</li>
        <li>切配食材</li>
        <li>开始烹饪</li>
        <li>调味品尝</li>
        <li>装盘上桌</li>
    </ol>

    <h2>自定义列表示例</h2>
    <h3>编程语言介绍</h3>
    <dl>
        <dt>Python</dt>
        <dd>一种高级编程语言，语法简洁明了</dd>
        <dd>广泛应用于数据分析、机器学习、Web开发等领域</dd>
        
        <dt>Java</dt>
        <dd>面向对象的编程语言，具有跨平台特性</dd>
        
        <dt>JavaScript</dt>
        <dd>主要用于网页开发的脚本语言</dd>
        <dd>现在也可以用于服务器端开发</dd>
    </dl>

    <h2>嵌套列表示例</h2>
    <h3>网站开发流程</h3>
    <ol>
        <li>项目规划
            <ul>
                <li>需求分析</li>
                <li>技术选型</li>
                <li>时间安排</li>
            </ul>
        </li>
        <li>设计阶段
            <ul>
                <li>UI设计</li>
                <li>交互设计</li>
                <li>数据库设计</li>
            </ul>
        </li>
        <li>开发阶段
            <ul>
                <li>前端开发
                    <ol>
                        <li>HTML结构</li>
                        <li>CSS样式</li>
                        <li>JavaScript交互</li>
                    </ol>
                </li>
                <li>后端开发</li>
                <li>数据库开发</li>
            </ul>
        </li>
        <li>测试上线
            <ul>
                <li>功能测试</li>
                <li>性能测试</li>
                <li>部署上线</li>
            </ul>
        </li>
    </ol>

</body>
</html>
```

#todo 前端学习看到这里
[09-无序列表_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1RK4y1X7qd?spm_id_from=333.788.videopod.episodes&vd_source=ccbe0c793ac5e34ebb735794692f049e&p=38)