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
### [StatefulWidget - 有狀態組件](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- 是一種 有狀態 (stateful) 的 widget。它可以在生命週期內改變其狀態 (state)，並且當狀態變化時，會自動重新 build UI 來反映這些變化。
- 包含兩部分：
1. StatefulWidget 本身 ➝ 不會變，類似殼
2. State 物件 ➝ 儲存可以變動的資料
- 用途: 點擊按鈕更新數字（計數器）、表單輸入（輸入框、驗證）、切換開關（Switch、Checkbox）、 動畫控制（動畫播放暫停）

| 常見widget              | 用途說明                                    |
| ----------------------- | -------------------------------------------|
| **TextField**           | 用來輸入文字，會隨著輸入內容更新顯示          |
| **Checkbox**            | 勾選框，勾選/取消勾選會改變狀態               |
| **Switch**              | 開關按鈕，切換開/關狀態                      |
| **Slider**              | 滑動條，拖動時數值會變                       |
| **AnimatedContainer**   | 支援動畫的 Container（屬性變化會自動過渡動畫）|
| **PageView**            | 可左右滑動切換頁面                          |
| **Form**                | 表單元件，內部可以管理多個輸入欄位的狀態      |
| **RefreshIndicator**    | 下拉刷新組件，可顯示刷新動畫                 |
| **BottomNavigationBar** | 底部導航欄，可以點擊切換不同的 tab           |
| **TabBarView**          | 搭配 TabBar 使用，切換不同頁籤              |
| **Radio**               | 單選按鈕，用來讓使用者 從一組選項中選擇一個。 |
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
### [SingleChildScrollView - 一個可以捲動單一小部件的方塊組件](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html)
- 是一個可以讓「單一子 widget」變得 可滾動 的容器。
- 只容納一個 child，不支援多child widget。
- 注意事項:
1. 高度無限制 (如果 child 是 Column，且 Column 的內容超過螢幕，必須避免「無限高度」錯誤。)
2. 不適合大量資料 (如果要顯示長列表，建議用 [ListView](#listview)，因為它支援懶加載。)
```
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(10, (index) => Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(8),
      color: Colors.blue,
      child: Center(child: Text('Box $index')),
    )),
  ),
)
```
---
### ListView
