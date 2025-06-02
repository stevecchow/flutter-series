#### 0 others

1. vscode refactor

     - 在 vscode 中选中一部分代码，可以使用鼠标右键选择你要 refactor 的操作
     - 比如 try catch，remove files etc.
2. debug
     - 

#### 1 widget inside widget

- 一个 widget 就是一个函数
- 一个 widget 作为另一个 widget 的子组件，形成嵌套结构。
- 比如：
  - Text 是 Container 的 child
  - Container 又是 Center 的 child

#### 2 types

- String：字符串
  - `String name = "hello world"`
- int：整数
  - `int number = 1`
- double：浮点数
  - `double number = 1.0`
- List：数组
  - `List list = ['hello', 'world']`
- Map：对象
  - `Map m = {"name" : "steve"}`
- Map with <>：
  - `Map<String, Dynamic> m = {'name':'steve','age':20}`

#### 3 widget

##### 1 container

| **属性**       | **作用**       | **注意点**                                          |
| -------------- | -------------- | --------------------------------------------------- |
| width / height | 设置尺寸       | 不设置时由子元素撑开                                |
| padding        | 内容内边距     | 实现类似 padding: 8px                               |
| margin         | 外边距         | 影响父布局对该容器的约束                            |
| alignment      | 内容对齐       | Alignment.center, Alignment.topLeft                 |
| decoration     | 背景装饰       | 用 BoxDecoration 设置背景色、圆角、边框、阴影等     |
| color          | 快速设置背景色 | 实际是 decoration.color，不能与 decoration 同时设置 |
| constraints    | 尺寸约束       | 限定最大宽高，比如用 BoxConstraints.tightFor()      |
| transform      | 变换           | 平移、旋转、缩放，如 Matrix4.rotationZ              |
| child          | 子组件         | 可以是任何 widget                                   |

##### 2 column

| **属性**           | **类型**           | **说明**                               |
| ------------------ | ------------------ | -------------------------------------- |
| children           | List<Widget>       | 必需：要显示的子组件                   |
| mainAxisAlignment  | MainAxisAlignment  | **主轴方向对齐方式**（垂直方向）       |
| crossAxisAlignment | CrossAxisAlignment | **交叉轴对齐方式**（水平方向）         |
| mainAxisSize       | MainAxisSize       | 控制 Column 是否占满主轴空间           |
| textDirection      | TextDirection      | 控制从左到右或从右到左的排列方向       |
| verticalDirection  | VerticalDirection  | 控制从上到下或从下到上的子组件排列顺序 |

##### 3 row

| **属性**           | **类型**           | **说明**                                                   |
| ------------------ | ------------------ | ---------------------------------------------------------- |
| children           | List<Widget>       | Row 中的子组件                                             |
| mainAxisAlignment  | MainAxisAlignment  | 控制主轴（横向）对齐方式                                   |
| crossAxisAlignment | CrossAxisAlignment | 控制交叉轴（纵向）对齐方式                                 |
| mainAxisSize       | MainAxisSize       | 控制 Row 是否占据整个主轴空间                              |
| textDirection      | TextDirection      | 控制从左到右（默认）或右到左                               |
| verticalDirection  | VerticalDirection  | 控制纵向布局方向，影响 crossAxisAlignment.start 的具体方向 |

##### 4 center

| **属性**     | **类型** | **说明**             |
| ------------ | -------- | -------------------- |
| child        | Widget?  | 中间放置的子组件     |
| widthFactor  | double?  | 子组件宽度的缩放倍数 |
| heightFactor | double?  | 子组件高度的缩放倍数 |

##### 5 images

1. images 的几种来源方式

   | **来源**     | **用法**                      | **说明**                       |
   | ------------ | ----------------------------- | ------------------------------ |
   | 本地资源图片 | Image.asset('assets/img.png') | 需先注册在 pubspec.yaml 中     |
   | 网络图片     | Image.network('https://...')  | 可带缓存策略，但依赖网络       |
   | 内存图片     | Image.memory(Uint8List)       | 常用于截图、相机、Base64       |
   | 文件图片     | Image.file(File(...))         | 用于用户本地文件，如图片上传等 |

2. images 的常用属性

   | **属性**               | **类型**                          | **说明**                              |
   | ---------------------- | --------------------------------- | ------------------------------------- |
   | width / height         | double?                           | 图片的宽高（不设置则按原图）          |
   | fit                    | BoxFit                            | 控制图片如何适应容器                  |
   | alignment              | Alignment                         | 图片在容器内的位置                    |
   | color / colorBlendMode | Color / BlendMode                 | 给图片加颜色或滤镜（常用于灰色/蒙层） |
   | repeat                 | ImageRepeat                       | 是否重复平铺图片                      |
   | filterQuality          | FilterQuality                     | 控制图片缩放质量（性能 vs 清晰度）    |
   | loadingBuilder         | (context, child, loadingProgress) | 网络图加载中回调                      |
   | errorBuilder           | (context, error, stackTrace)      | 图片加载失败时的兜底组件              |

3. 常用 fit 取值解析（重点）

   | **值**           | **含义**                               |
   | ---------------- | -------------------------------------- |
   | BoxFit.fill      | 拉伸填满容器，可能变形                 |
   | BoxFit.contain   | 等比缩放，完整显示                     |
   | BoxFit.cover     | 等比缩放，裁剪填满（常用于头像背景图） |
   | BoxFit.fitWidth  | 宽度填满，高度按比例缩放               |
   | BoxFit.fitHeight | 高度填满，宽度按比例缩放               |

4. 如何使用

   1. 一定要在 pubspec.yaml 里注册资源路径
   2. 文件夹路径必须以 / 结尾
   3. 热重载不生效时，需要重启应用或重新构建

5. 网络图建议使用 cached_network_image

   ```dart
   CachedNetworkImage(
     imageUrl: "https://example.com/img.jpg",
     placeholder: (_, __) => CircularProgressIndicator(),
     errorWidget: (_, __, ___) => Icon(Icons.error),
   )
   ```

   1. 自动缓存图片
   2. 支持加载进度、失败处理
   3. 可设置缓存策略

##### 6 Stack

| **属性**     | **类型**     | **说明**                               |
| ------------ | ------------ | -------------------------------------- |
| children     | List<Widget> | 要叠放的子组件（最早的在底层）         |
| alignment    | Alignment    | 控制未定位子组件的对齐方式（默认左上） |
| fit          | StackFit     | 决定非 Positioned 子组件如何适应 Stack |
| clipBehavior | Clip         | 控制是否裁剪超出 Stack 区域的内容      |
