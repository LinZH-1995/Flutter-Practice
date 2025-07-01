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
- 狀態由外部資料提供，不需要自己記錄狀態
- App初始化之後就不能改變，想要改變就得建立一個新的StatelessWidget Instance去做更換
- 常見widget：**Icon**、**Text**、**RaisedButton**

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
### StatefulWidget - 有狀態組件
### SingleChildScrollView

