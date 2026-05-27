# المحاضرة 03 — Basic Widgets

## 🎯 نظرة عامة

في الـ Flutter فيه مئات الـ widgets الجاهزة، لكن فيه مجموعة أساسية بتتكرر في كل تطبيق. في المحاضرة دي هنشوف الـ widgets الأكتر استخداماً مع كل خصائصها وأمثلة عملية.

---

## 📝 Text

أبسط widget وأكتر واحدة بتتكرر — بتعرض نص على الشاشة.

```dart
// أبسط استخدام
const Text('مرحباً بالعالم!')

// مع تنسيق كامل
Text(
  'عنوان المقال',
  style: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.5,
    height: 1.4,          // line height
    decoration: TextDecoration.underline,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,  // ... لما النص يطول
)
```

### RichText — نص بأكتر من style

```dart
RichText(
  text: const TextSpan(
    style: TextStyle(fontSize: 16, color: Colors.black),
    children: [
      TextSpan(text: 'مرحباً '),
      TextSpan(
        text: 'Flutter',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextSpan(text: '! 🚀'),
    ],
  ),
)
```

### استخدام Theme بدل hardcoded values

```dart
// ❌ غلط — hardcoded
Text('عنوان', style: TextStyle(fontSize: 24, color: Colors.black))

// ✅ صح — من الـ theme
Text(
  'عنوان',
  style: Theme.of(context).textTheme.headlineMedium,
)
```

---

## 🖼️ Image

بتعرض صور من مصادر مختلفة.

```dart
// صورة من الـ network
Image.network(
  'https://picsum.photos/300/200',
  width: 300,
  height: 200,
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return const CircularProgressIndicator();
  },
  errorBuilder: (context, error, stackTrace) {
    return const Icon(Icons.broken_image, size: 50);
  },
)

// صورة من الـ assets (محلية)
Image.asset(
  'assets/images/logo.png',
  width: 100,
)

// صورة دائرية باستخدام CircleAvatar
CircleAvatar(
  radius: 40,
  backgroundImage: const NetworkImage('https://i.pravatar.cc/150'),
  backgroundColor: Colors.grey[200],
)
```

### BoxFit Options

| القيمة | الوصف |
|--------|-------|
| `BoxFit.cover` | تغطي المساحة كاملاً (بتقص لو لازم) |
| `BoxFit.contain` | تظهر كاملاً جوا المساحة |
| `BoxFit.fill` | تملا المساحة (ممكن تتشوه) |
| `BoxFit.fitWidth` | عرضها = عرض المساحة |
| `BoxFit.fitHeight` | ارتفاعها = ارتفاع المساحة |
| `BoxFit.none` | حجمها الأصلي بدون تغيير |

---

## 🎨 Icon

```dart
// أيقونة بسيطة
const Icon(Icons.home)

// مع تنسيق
const Icon(
  Icons.favorite,
  color: Colors.red,
  size: 32,
)

// مع tooltip
IconButton(
  icon: const Icon(Icons.share),
  tooltip: 'مشاركة',
  onPressed: () {},
)
```

---

## 🔘 Buttons

Flutter 3 عنده 5 أنواع أزرار رئيسية:

```dart
// 1. ElevatedButton — زر بارز (أكتر استخداماً)
ElevatedButton(
  onPressed: () => print('ضُغط!'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text('تأكيد'),
)

// 2. OutlinedButton — زر بإطار
OutlinedButton(
  onPressed: () {},
  child: const Text('إلغاء'),
)

// 3. TextButton — زر نص بس
TextButton(
  onPressed: () {},
  child: const Text('تفاصيل أكتر'),
)

// 4. FilledButton — زر مملوء (Material 3)
FilledButton(
  onPressed: () {},
  child: const Text('حفظ'),
)

// 5. IconButton — زر أيقونة
IconButton(
  icon: const Icon(Icons.delete),
  color: Colors.red,
  onPressed: () {},
)
```

### تعطيل الزر
```dart
// لما onPressed = null الزر بيتعطل تلقائياً
ElevatedButton(
  onPressed: isLoading ? null : () => submit(),
  child: isLoading
      ? const CircularProgressIndicator()
      : const Text('إرسال'),
)
```

---

## 📦 Container

الـ widget الأكتر مرونة — بيجمع تنسيق، حجم، لون، وهامش في حاجة واحدة.

```dart
Container(
  width: 200,
  height: 100,
  margin: const EdgeInsets.all(8),         // مسافة خارجية
  padding: const EdgeInsets.all(16),        // مسافة داخلية
  decoration: BoxDecoration(
    color: Colors.blue[50],
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
    // أو gradient بدل اللون
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: const Text('محتوى الـ Container'),
)
```

### ⚠️ Container vs SizedBox

```dart
// ❌ استخدام Container لمجرد الحجم — مبالغة
Container(
  width: 20,
  height: 20,
)

// ✅ SizedBox أخف وأسرع للحجم فقط
const SizedBox(width: 20, height: 20)

// SizedBox.expand — لملء المساحة كاملاً
const SizedBox.expand(child: Text('ملء المساحة'))

// SizedBox.shrink — لأصغر حجم ممكن
const SizedBox.shrink()
```

---

## 🔲 Padding

```dart
// مسافة من كل الاتجاهات
Padding(
  padding: const EdgeInsets.all(16),
  child: const Text('نص بمسافة'),
)

// مسافة من اتجاهات محددة
Padding(
  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16),
  child: const Text('نص'),
)

// مسافة أفقية وعمودية
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  child: const Text('نص'),
)
```

### Padding vs Container padding

```dart
// كلاهم بينتج نفس النتيجة
// لكن Padding أخف لما مش محتاج باقي خصائص Container

Padding(
  padding: const EdgeInsets.all(16),
  child: myWidget,
)

Container(
  padding: const EdgeInsets.all(16),
  child: myWidget,
)
```

---

## 🃏 Card

بيوفر Surface مرتفعة مع shadow تلقائي.

```dart
Card(
  elevation: 4,              // ارتفاع الـ shadow
  margin: const EdgeInsets.all(8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  color: Colors.white,
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('عنوان البطاقة',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        const Text('محتوى البطاقة هنا...'),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text('إلغاء')),
            ElevatedButton(onPressed: () {}, child: const Text('تأكيد')),
          ],
        )
      ],
    ),
  ),
)
```

---

## 📊 مقارنة الـ Widgets الأساسية

| Widget | الاستخدام | يحتاج child | ملاحظات |
|--------|-----------|-------------|----------|
| `Text` | عرض نص | ❌ | استخدم TextTheme |
| `Image` | عرض صور | ❌ | حدد width/height دايماً |
| `Icon` | أيقونات | ❌ | من Material Icons |
| `ElevatedButton` | أزرار رئيسية | ✅ | onPressed=null لتعطيل |
| `Container` | تنسيق + حجم + لون | اختياري | استخدم SizedBox للحجم فقط |
| `SizedBox` | مسافة أو حجم | اختياري | أخف من Container |
| `Padding` | مسافة داخلية فقط | ✅ | أخف من Container |
| `Card` | بطاقة مرتفعة | ✅ | elevation تلقائية |

---

## 🚨 أخطاء شائعة

### 1. عدم تحديد حجم الصورة
```dart
// ❌ بيسبب layout shift
Image.network('https://...')

// ✅ دايماً حدد الحجم
Image.network('https://...', width: 300, height: 200, fit: BoxFit.cover)
```

### 2. استخدام Container بدل SizedBox
```dart
// ❌ Container ثقيل للمسافات البسيطة
Container(height: 16)

// ✅ SizedBox أخف
const SizedBox(height: 16)
```

### 3. عدم معالجة خطأ الصورة
```dart
// ❌ لو الصورة اتكسرت الـ app هيظهر ببشاعة
Image.network(url)

// ✅ دايماً أضف errorBuilder
Image.network(
  url,
  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
)
```

### 4. Hardcoded colors بدل Theme
```dart
// ❌ مش بيدعم Dark Mode
Text('عنوان', style: TextStyle(color: Colors.black))

// ✅ من الـ theme تلقائياً
Text('عنوان') // بياخد اللون من الـ theme
```

---

## 💡 Tips من التجربة العملية

1. **دايماً استخدم `const`** لأي widget مش بتتغير — بيوفر memory وبيسرع الـ rebuild
2. **`SizedBox` بدل `Container`** لما محتاج حجم فقط بدون decoration
3. **`Padding` بدل `Container`** لما محتاج padding فقط
4. **`TextTheme` بدل hardcoded sizes** — بيدعم accessibility scaling
5. **`errorBuilder` في Image.network** — المستخدم دايماً ممكن يبقى عنده مشكلة في الـ network
