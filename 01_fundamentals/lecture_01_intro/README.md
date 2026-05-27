# المحاضرة 01 — Flutter Introduction 🚀

> **الفكرة الأساسية:**
> Flutter هو framework مفتوح المصدر من Google بيخليك تبني تطبيقات لـ Android وiOS والويب وDesktop من كود واحد بالظبط.
> بيستخدم Dart كلغة برمجة وبيرسم الـ UI بنفسه من الصفر بدل ما يعتمد على مكونات الـ OS.

---

## 📋 جدول المحتويات

1. [ما هو Flutter؟](#1--ما-هو-flutter)
2. [ليه Flutter؟](#2--ليه-flutter)
3. [Flutter Architecture](#3--flutter-architecture)
4. [Widget Tree](#4--widget-tree)
5. [أول تطبيق Flutter](#5--أول-تطبيق-flutter)
6. [MaterialApp و Scaffold](#6--materialapp-و-scaffold)
7. [Hot Reload vs Hot Restart](#7--hot-reload-vs-hot-restart)
8. [مقارنة مع React Native](#8--مقارنة-مع-react-native)
9. [أخطاء شائعة](#9--أخطاء-شائعة)
10. [Tips عملية](#10--tips-عملية)

---

## 1 — ما هو Flutter؟

Flutter هو **UI toolkit** من Google بيسمح بكتابة كود واحد يشتغل على:

| المنصة | الدعم |
|--------|-------|
| Android | ✅ كامل |
| iOS | ✅ كامل |
| Web | ✅ |
| Windows | ✅ |
| macOS | ✅ |
| Linux | ✅ |

أول إصدار stable كان **2018**، ودلوقتي في **Flutter 3.x** مع دعم كل المنصات.

---

## 2 — ليه Flutter؟

### مقارنة مع البدائل:

| الميزة | Flutter | React Native | Native |
|--------|---------|--------------|--------|
| لغة البرمجة | Dart | JavaScript | Swift/Kotlin |
| كود واحد | ✅ | ✅ | ❌ |
| الأداء | 🔥 ممتاز | جيد | ممتاز |
| مظهر UI | Pixel-perfect | شبه Native | Native |
| حجم الـ App | أكبر قليلاً | متوسط | أصغر |
| Hot Reload | ✅ | ✅ | ❌ |

### أقوى نقاط Flutter:
- **Skia/Impeller Engine** — Flutter بيرسم كل pixel بنفسه → مظهر ثابت على كل الأجهزة
- **Hot Reload** — تغيير في الكود يظهر في أقل من ثانية
- **Widget-based** — كل شيء في Flutter هو Widget
- **Dart** — لغة سهلة، strongly typed، مع Null Safety

---

## 3 — Flutter Architecture

```
┌─────────────────────────────────┐
│         Your App (Dart)         │  ← الكود بتاعك
├─────────────────────────────────┤
│         Flutter Framework       │  ← Widgets, Material, Cupertino
├─────────────────────────────────┤
│           Flutter Engine        │  ← Skia/Impeller, Dart VM
├─────────────────────────────────┤
│         Platform Embedder       │  ← Android / iOS / Web
└─────────────────────────────────┘
```

### الطبقات:
- **Your App** — الـ Widgets اللي بتكتبها
- **Flutter Framework** — Material Design، Cupertino، Animation، Painting
- **Flutter Engine** — مكتوب بـ C++ — بيتحكم في الرسم والـ Dart VM
- **Platform Embedder** — بيتكلم مع Android/iOS عشان يعرض الـ UI

---

## 4 — Widget Tree

كل حاجة في Flutter هي **Widget** — النصوص، الأزرار، التخطيط، حتى الـ padding.

```
MyApp
  └── MaterialApp
        └── Scaffold
              ├── AppBar
              │     └── Text('My App')
              └── Body
                    └── Center
                          └── Text('Hello Flutter!')
```

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Flutter'),
        ),
        body: const Center(
          child: Text('Welcome to Flutter! 🎉'),
        ),
      ),
    );
  }
}
```

> **القاعدة الذهبية:** كل Widget بيرجع Widget تاني من `build()` — هكذا بتتكون الشجرة.

---

## 5 — أول تطبيق Flutter

### هيكل المشروع:
```
my_app/
├── lib/
│   └── main.dart        ← نقطة الدخول الرئيسية
├── android/             ← كود Android الخاص
├── ios/                 ← كود iOS الخاص
├── pubspec.yaml         ← ملف الـ dependencies
└── test/                ← ملفات الاختبار
```

### pubspec.yaml:
```yaml
name: my_app
description: My first Flutter app

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

flutter:
  uses-material-design: true
```

---

## 6 — MaterialApp و Scaffold

### MaterialApp:
الـ Widget الجذر اللي بيحدد إعدادات التطبيق كله:

```dart
MaterialApp(
  title: 'My App',              // اسم التطبيق
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  ),
  home: const HomePage(),       // الصفحة الأولى
  debugShowCheckedModeBanner: false, // إخفاء شريط Debug
)
```

### Scaffold:
الهيكل الأساسي لكل صفحة — بيوفر AppBar، Body، FloatingActionButton، BottomNavigationBar:

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Home'),
    backgroundColor: Colors.blue,
    actions: [
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {},
      ),
    ],
  ),
  body: const Center(
    child: Text('Hello!'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
  ),
)
```

---

## 7 — Hot Reload vs Hot Restart

| | Hot Reload ⚡ | Hot Restart 🔄 |
|--|--------------|----------------|
| الاختصار | `r` في الـ terminal | `R` في الـ terminal |
| الوقت | < 1 ثانية | 2-5 ثواني |
| الـ State | محتفظ بيه ✅ | بيتمسح ❌ |
| متى تستخدمه | تغيير في الـ UI | تغيير في الـ Logic أو الـ State |
| الـ main() | مش بيتشغل تاني | بيتشغل من أول |

```
r → Hot Reload  (UI بس)
R → Hot Restart (كل حاجة)
q → Quit
```

---

## 8 — مقارنة مع React Native

| المفهوم | Flutter | React Native |
|---------|---------|---------------|
| اللغة | Dart | JavaScript/TypeScript |
| الـ UI Components | Widgets (مرسومة بـ Flutter) | Native Components |
| الأداء | ممتاز (60/120fps) | جيد |
| حجم المجتمع | كبير ومتنامي | أكبر |
| Google Apps | Google Pay، Stadia | - |
| Meta Apps | - | Facebook، Instagram |

---

## 9 — أخطاء شائعة

### الخطأ 1 — نسيان `const`
```dart
// ❌ بيعمل rebuild غير ضروري
Text('Hello')

// ✅ const = أسرع
const Text('Hello')
```

### الخطأ 2 — نسيان `runApp`
```dart
// ❌ مش هيشتغل
void main() {
  MyApp();
}

// ✅
void main() {
  runApp(const MyApp());
}
```

### الخطأ 3 — Widget بدون `build`
```dart
// ❌
class MyWidget extends StatelessWidget {}

// ✅ لازم تـ override build
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello');
  }
}
```

---

## 10 — Tips عملية

- **كل حاجة Widget** — مش بس الـ UI، حتى الـ Padding والـ Center والـ Align هم Widgets.
- **استخدم `const`** دايماً لما الـ Widget مش بتتغير — بيحسن الأداء.
- **Widget Tree != UI** — الـ tree ممكن تكون عميقة جداً وده طبيعي في Flutter.
- **`pubspec.yaml`** — ملف حساس جداً، خد بالك من المسافات (YAML بيتأثر بالـ indentation).
- **`flutter pub get`** بعد أي تغيير في `pubspec.yaml`.
- **DevTools** — أقوى أداة لتحليل الأداء وشجرة الـ Widgets.

---

> **ملخص سريع:**
> - Flutter = UI toolkit من Google بكود واحد لكل المنصات
> - كل حاجة في Flutter هي **Widget**
> - `main()` → `runApp()` → `MaterialApp` → `Scaffold` → محتوى الصفحة
> - **Hot Reload** = تغيير UI بدون فقدان الـ State
> - Flutter بيرسم الـ UI بنفسه → مظهر ثابت على كل الأجهزة
