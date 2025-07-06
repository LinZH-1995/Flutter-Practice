# flutter_application

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# **Widget - 組件**
### [StatelessWidget - 無狀態組件](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- 是一種 不可變 (immutable) 的 widget。它表示一個 UI 元素，在建立之後不會改變
- 當 widget 建立時，它會根據你給它的資料 (constructor 參數) 一次性渲染 UI。
- 如果資料改變了，它不會自己重新建構 UI，除非外部強制重新建立 (比如父 widget 重新 build)。
- 所有屬性都是 final，初始化後不能變。
- 沒有 setState()。不會隨著互動或資料變化而重新繪製。
- 如果需要重新顯示，必須由父 widget 傳入新的資料或重建 widget。
- 狀態由外部資料提供，不需要自己記錄狀態
- 用途: 固定內容，如標誌、按鈕、Logo、標題、靜態頁面

| 常見widget     | 用途說明                                     |
| ------------- | -------------------------------------------- |
| **Text**      | 顯示文字。                                    |
| **Icon**      | 顯示一個圖標（如 Material Icons）。             |
| **Image**     | 顯示圖片（asset、network、file 等）。           |
| **Row**       | 水平排列子 widget。                           |
| **Column**    | 垂直排列子 widget。                           |
| **Container** | 一個容器，可用來裝飾、設置 margin/padding 等。 |
| **SizedBox**  | 固定寬高的空間或 widget。                     |
| **Spacer**    | 在 Row/Column 中插入彈性空間。                |
| **Divider**   | 水平或垂直分隔線。                            |
| **Padding**   | 給子 widget 加內邊距。                       |
| **Align**     | 將子 widget 對齊到父 widget 的某個位置。      |
| **Center**    | 將子 widget 放置在父 widget 的正中央。        |
| **FittedBox** | 縮放子 widget 以適應父 widget 大小。          |
| **ClipRRect** | 裁剪子 widget 為圓角矩形。                    |
| **RichText**  | 顯示帶有不同樣式的多段文字。                   |
| **Opacity**   | 改變子 widget 的透明度。                      |
```
import 'package:flutter/material.dart';

class Frog extends StatelessWidget {
  const Frog({super.key, this.color = const Color(0xFF2DBD3A), this.child});

  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: color, child: child);
  }
}
```
---
### StatefulWidget - 有狀態組件
- StatefulWidget可以在App內無限次的被重繪集及更新狀態，它是mutable，需要重繪時可以調用setState()，去標記自己為dirty狀態，為下次更新做準備。
- 常見widget：**Radio**、**Form**、**Checkbox**

```
import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  const Bird({
    super.key,
    this.color = const Color(0xFFFFE306),
    this.child,
  });

  final Color color;
  final Widget? child;

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() { _size += 0.1; });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      transform: Matrix4.diagonal3Values(_size, _size, 1.0),
      child: widget.child,
    );
  }
}
```
---
### SingleChildScrollView

