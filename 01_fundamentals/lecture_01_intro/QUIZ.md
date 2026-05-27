# QUIZ — المحاضرة 01: Flutter Introduction 🚀

> حاول تحل كل تمرين بنفسك الأول، وبعدين شوف الحل.

---

## 📝 القسم الأول — تمارين الكود (Tasks)

---

### Task 1 — سهل 🟢

**المطلوب:**
اعمل تطبيق Flutter بسيط بيعرض اسمك في المنتصف مع:
- AppBar فيه عنوان `'My First App'`
- Body فيه `Text` باسمك بحجم خط 32 ولون أزرق
- FloatingActionButton بـ icon `Icons.star`

**Expected Result:**
```
AppBar: My First App
Body (center): [اسمك] بخط كبير أزرق
FAB: ⭐
```

<details>
<summary>💡 Hint</summary>

- `TextStyle(fontSize: 32, color: Colors.blue)`
- `FloatingActionButton(child: Icon(Icons.star), onPressed: () {})`

</details>

<details>
<summary>✅ الحل</summary>

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
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
      ),
      body: const Center(
        child: Text(
          'Ahmed',
          style: TextStyle(
            fontSize: 32,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.star),
      ),
    );
  }
}
```

</details>

---

### Task 2 — متوسط 🟡

**المطلوب:**
اعمل تطبيق فيه **Profile Card** في المنتصف يحتوي على:
- `CircleAvatar` بحرف أول اسمك
- اسم كامل تحيه
- وصف وظيفي (مثلاً: Flutter Developer)
- زر `ElevatedButton` مكتوب فيه `'Follow'`

**Expected Result:**
```
┌─────────────────┐
│       [A]        │  ← CircleAvatar
│    Ahmed Ali     │  ← اسم
│ Flutter Developer│  ← وصف
│   [ Follow ]     │  ← زر
└─────────────────┘
```

<details>
<summary>💡 Hint</summary>

- استخدم `Column` مع `mainAxisAlignment: MainAxisAlignment.center`
- `CircleAvatar(radius: 50, child: Text('A'))`
- `SizedBox(height: 16)` للمسافات بين العناصر

</details>

<details>
<summary>✅ الحل</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ahmed Ali',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
```

</details>

---

### Task 3 — صعب 🔴

**المطلوب:**
اعمل **App Dashboard** بيحتوي على:
- `AppBar` مع عنوان واسم المستخدم على اليمين
- `Body` فيه `ListView` بـ 4 بطاقات (Cards)، كل بطاقة فيها:
  - Icon معبرة
  - عنوان
  - وصف قصير
- `BottomNavigationBar` بـ 3 عناصر: Home، Explore، Profile

<details>
<summary>💡 Hint</summary>

- `ListView` مع `padding`
- `Card` مع `ListTile(leading: Icon(...), title: Text(...), subtitle: Text(...))`
- `BottomNavigationBar` مع `currentIndex` ثابت على 0 (مش محتاج state دلوقتي)

</details>

<details>
<summary>✅ الحل</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  final List<Map<String, dynamic>> _items = const [
    {'icon': Icons.analytics, 'title': 'Analytics', 'desc': 'View your stats'},
    {'icon': Icons.people, 'title': 'Users', 'desc': 'Manage users'},
    {'icon': Icons.shopping_cart, 'title': 'Orders', 'desc': 'Track orders'},
    {'icon': Icons.settings, 'title': 'Settings', 'desc': 'App settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              child: Text('A'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(item['icon'] as IconData, color: Colors.blue),
              title: Text(item['title'] as String),
              subtitle: Text(item['desc'] as String),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
```

</details>

---

## ❓ القسم الثاني — أسئلة MCQ

---

**السؤال 1:** ما هي نقطة دخول أي تطبيق Flutter؟
- A) `MyApp()`
- B) `runApp()`
- C) `MaterialApp()`
- D) `Scaffold()`

---

**السؤال 2:** ما الفرق بين Hot Reload وHot Restart؟
- A) لا فرق
- B) Hot Reload بيحافظ على الـ State، Hot Restart بيمسحه
- C) Hot Restart أسرع من Hot Reload
- D) Hot Reload بيشغل `main()` من أول

---

**السؤال 3:** ما الـ Widget اللي بيوفر هيكل الصفحة الأساسي (AppBar + Body + FAB)؟
- A) `MaterialApp`
- B) `Container`
- C) `Scaffold`
- D) `Column`

---

**السؤال 4:** ليه بنستخدم `const` قبل الـ Widgets؟
- A) لأن Flutter بيشترطه
- B) لتحسين الأداء — الـ Widget مش بتتعمل rebuild غير ضروري
- C) لتغيير لون الـ Widget
- D) لا فائدة منه

---

**السؤال 5:** ما طبقة Flutter المسؤولة عن رسم الـ UI على الشاشة؟
- A) Dart VM
- B) Platform Embedder
- C) Flutter Engine (Skia/Impeller)
- D) Your App Layer

---

## ✅ إجابات MCQ

| السؤال | الإجابة | التفسير |
|--------|---------|----------|
| 1 | **B** | `runApp()` هي نقطة الدخول اللي بتشغل أول Widget |
| 2 | **B** | Hot Reload بيحافظ على الـ State، Hot Restart بيمسحه |
| 3 | **C** | `Scaffold` هو هيكل الصفحة الأساسي |
| 4 | **B** | `const` بيمنع الـ rebuild غير الضروري |
| 5 | **C** | Flutter Engine (Skia/Impeller) هو اللي بيرسم الـ UI |
