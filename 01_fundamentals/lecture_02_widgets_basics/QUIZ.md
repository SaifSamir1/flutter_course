# 📝 Quiz — المحاضرة 02: Widgets Basics

---

## 🏋️ Tasks (تمارين كود)

### Task 1 — 🟢 سهل: ProfileCard Widget

اعمل `StatelessWidget` اسمها `ProfileCard` بتاخد:
- `String name`
- `String email`
- `String avatarUrl` (URL لصورة)

وتعرض بطاقة تعريفية تحتوي على:
- صورة دائرية للمستخدم
- الاسم بخط كبير
- الإيميل بلون رمادي

```dart
// الشكل المتوقع للاستخدام
ProfileCard(
  name: 'أحمد محمد',
  email: 'ahmed@example.com',
  avatarUrl: 'https://i.pravatar.cc/150',
)
```

> 💡 Hint: استخدم `CircleAvatar` مع `NetworkImage` للصورة الدائرية.

---

### Task 2 — 🟡 متوسط: Toggle Theme Button

اعمل `StatefulWidget` اسمها `ThemeToggle` بتحتوي على:
- زر بيغير بين Dark وLight mode على مستوى الـ widget نفسها
- أيقونة بتتغير (🌙 / ☀️)
- الخلفية والنصوص بتتغير مع الـ theme

> 💡 Hint: استخدم `bool isDark` في الـ state وغير الـ colors يدوياً على مستوى الـ widget.

---

### Task 3 — 🔴 صعب: Stopwatch App

اعمل تطبيق ساعة إيقاف كاملة بـ `StatefulWidget`:
- عداد بيحسب الثواني والدقائق
- 3 أزرار: Start / Pause / Reset
- عرض الوقت بشكل `MM:SS`
- لون العداد بيتغير لما الوقت يعدى 30 ثانية (أحمر)

> 💡 Hint: استخدم `Timer.periodic` من `dart:async` لتحديث الوقت كل ثانية.
> تذكر إنك تعمل `cancel()` للـ Timer في `dispose()` عشان ما تحصلش memory leak!

---

## ❓ MCQ — أسئلة اختيار من متعدد

**السؤال 1:** ما الفرق الأساسي بين StatelessWidget وStatefulWidget؟

- A) StatelessWidget أبطأ في الـ performance
- B) StatefulWidget مش بتستخدم BuildContext
- C) StatelessWidget مش عندها state داخلية بتتغير بعد الـ build ✅
- D) StatefulWidget مش بتستخدم `build()` method

---

**السؤال 2:** إيه اللي بيحصل لو غيرت متغير في StatefulWidget بدون `setState()`؟

- A) بيحصل crash فوراً
- B) الـ UI مش بيتحدث على الشاشة ✅
- C) Flutter بتعمل rebuild تلقائياً
- D) بيحصل compile error

---

**السؤال 3:** إيه وظيفة `BuildContext`؟

- A) بتحفظ الـ state بتاع الـ widget
- B) بتحدد موقع الـ widget في الـ widget tree وبتوفر access للـ inherited data ✅
- C) بتعمل dispose للـ widget
- D) بتحدد الـ theme بتاع التطبيق

---

**السؤال 4:** أنت عندك `async` function بتعمل await وبعدين بتستخدم `context`. إيه الأفضل؟

- A) استخدام context مباشرة بعد الـ await
- B) استخدام `Future.delayed` قبل استخدام context
- C) التحقق من `mounted` قبل استخدام context بعد الـ await ✅
- D) تحويل الـ function لـ synchronous

---

**السؤال 5:** أي widget من دول هو الـ root widget المناسب لتطبيق Flutter بيستخدم Material Design؟

- A) `Scaffold`
- B) `Container`
- C) `MaterialApp` ✅
- D) `Center`

---

## ✅ الإجابات

| السؤال | الإجابة |
|--------|---------|
| 1 | C |
| 2 | B |
| 3 | B |
| 4 | C |
| 5 | C |
