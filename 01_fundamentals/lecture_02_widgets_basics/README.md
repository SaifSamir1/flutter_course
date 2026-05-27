# المحاضرة 02 — Widgets Basics

## 🎯 ما هو الـ Widget؟

في Flutter، **كل شيء هو Widget**. الـ Widget هو وصف لجزء من واجهة المستخدم. فكر فيه كـ blueprint أو قالب — مش الـ UI نفسه، لكن وصف ليه.

Flutter بيبني الـ UI من خلال **Widget Tree** — شجرة متداخلة من الـ Widgets، كل widget بتيجي جوا التانية.

```
MaterialApp
  └── Scaffold
        ├── AppBar
        │     └── Text('My App')
        └── Center
              └── Column
                    ├── Text('Hello')
                    └── ElevatedButton
                          └── Text('Click me')
```

---

## 🔵 StatelessWidget

Widget **لا تتغير** بعد ما اتبنت — مفيش state داخلية بتتغير.

```dart
class GreetingWidget extends StatelessWidget {
  final String name;

  const GreetingWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text('مرحباً يا $name!');
  }
}
```

### متى تستخدم StatelessWidget؟
- لما الـ UI مش بيتغير بعد الـ build
- أزرار، نصوص، أيقونات ثابتة
- Components بسيطة مش بتحتاج data تتغير

---

## 🟠 StatefulWidget

Widget **بتتغير** أثناء تشغيل التطبيق — عندها state داخلية.

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;  // ← هذا هو الـ state

  void _increment() {
    setState(() {      // ← لازم تستخدم setState عشان Flutter يعيد بناء الـ widget
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('العدد: $_count'),
        ElevatedButton(
          onPressed: _increment,
          child: const Text('زيادة'),
        ),
      ],
    );
  }
}
```

### ⚠️ قاعدة مهمة جداً
> **لا تغير الـ state أبداً بدون `setState()`**
> لو غيرت المتغير مباشرة بدون setState، Flutter مش هتعرف إنها لازم تعمل rebuild وهتشوف التغيير مش اتعمل على الشاشة.

### الفرق بين StatelessWidget و StatefulWidget

| الموضوع | StatelessWidget | StatefulWidget |
|---------|----------------|----------------|
| الـ State | ❌ مفيش | ✅ موجودة |
| الـ rebuild | بس لما الـ parent يتغير | عند setState() |
| الـ Performance | أحسن (أسرع) | أبطأ قليلاً |
| الاستخدام | UI ثابت | UI ديناميكي |

---

## 🧠 BuildContext

الـ `BuildContext` هو **موقع الـ widget في شجرة الـ widgets**. بيستخدم عشان:
- تعرف الـ widget موجودة فين في الشجرة
- توصل للـ data اللي فوقها في الشجرة (Theme، MediaQuery، Navigator، إلخ)

```dart
@override
Widget build(BuildContext context) {
  // استخدام context للوصول للـ Theme
  final theme = Theme.of(context);
  final screenWidth = MediaQuery.of(context).size.width;

  return Text(
    'Hello',
    style: theme.textTheme.headlineMedium,
  );
}
```

### ⚠️ خطأ شائع
استخدام `context` بعد ما الـ widget اتشالت من الشجرة (مثلاً في async function). دايماً تحقق `mounted` الأول:

```dart
Future<void> fetchData() async {
  await Future.delayed(const Duration(seconds: 2));

  if (!mounted) return;  // ← مهم جداً!
  setState(() { /* ... */ });
}
```

---

## 🏗️ MaterialApp

الـ root widget لأي تطبيق Flutter بيستخدم Material Design.

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيقي',
      debugShowCheckedModeBanner: false,  // يشيل banner الـ debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
```

### أهم خصائص MaterialApp

| الخاصية | الوصف |
|---------|-------|
| `title` | اسم التطبيق في task manager |
| `home` | الصفحة الرئيسية |
| `theme` | الـ theme الخاص بالـ light mode |
| `darkTheme` | الـ theme الخاص بالـ dark mode |
| `routes` | Named routes للـ navigation |
| `debugShowCheckedModeBanner` | إخفاء شريط الـ debug |
| `locale` | لغة التطبيق |

---

## 🦴 Scaffold

بيوفر **هيكل أساسي** لصفحة Material Design — زي الـ skeleton بتاع الصفحة.

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('عنوان الصفحة'),
    backgroundColor: Colors.blue,
    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  body: const Center(
    child: Text('محتوى الصفحة'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
    ],
    currentIndex: 0,
    onTap: (index) {},
  ),
  drawer: const Drawer(),
)
```

### مناطق الـ Scaffold

```
┌─────────────────────────┐
│         AppBar          │
├─────────────────────────┤
│                         │
│          Body           │
│                         │
│              [FAB]      │
├─────────────────────────┤
│    BottomNavigationBar  │
└─────────────────────────┘
```

---

## 🆚 مقارنة مع Android/iOS النيتيف

| الموضوع | Flutter | Android Native | iOS Native |
|---------|---------|----------------|------------|
| اللغة | Dart | Kotlin/Java | Swift |
| الـ UI unit | Widget | View/ViewGroup | UIView |
| الـ State | setState/Provider | ViewModel | @State |
| الـ Root | MaterialApp | Activity | UIViewController |
| الـ Layout container | Scaffold | Activity layout | UINavigationController |

---

## 🚨 أخطاء شائعة للمبتدئين

### 1. نسيان `const`
```dart
// ❌ غلط — بيعمل object جديد كل rebuild
Text('Hello')

// ✅ صح — بيستخدم cached object
const Text('Hello')
```

### 2. تغيير الـ State بدون setState
```dart
// ❌ غلط — الـ UI مش هيتحدث
void _increment() {
  _count++;
}

// ✅ صح
void _increment() {
  setState(() {
    _count++;
  });
}
```

### 3. استخدام Context بعد async gap
```dart
// ❌ خطير — ممكن يسبب crash
async void onPressed() async {
  await someOperation();
  Navigator.push(context, ...); // context ممكن يكون stale
}

// ✅ صح
async void onPressed() async {
  await someOperation();
  if (!mounted) return;
  Navigator.push(context, ...);
}
```

### 4. Widget Tree عميقة جداً (Callback Hell)
```dart
// ❌ صعب القراءة والصيانة
Container(
  child: Padding(
    child: Center(
      child: Column(
        children: [
          Container(
            child: Text('...'),
          ),
        ],
      ),
    ),
  ),
)

// ✅ افصل لـ widgets منفصلة
class MySection extends StatelessWidget { ... }
```

---

## 💡 Tips من التجربة العملية

1. **استخدم `const` في كل حاجة ممكنة** — بيحسن الـ performance بشكل ملحوظ
2. **افصل كل جزء UI في widget منفصلة** — أسهل في الصيانة والـ reuse
3. **الـ StatefulWidget مش دايماً الحل** — في أغلب الحالات State Management library أحسن
4. **اتعلم الـ Widget Inspector في DevTools** — بيساعدك تفهم الـ widget tree بصرياً
5. **الـ `key` مهم جداً في القوائم** — بيساعد Flutter تتبع الـ widgets بشكل صحيح
