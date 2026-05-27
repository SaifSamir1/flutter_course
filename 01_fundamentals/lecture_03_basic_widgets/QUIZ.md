# 📝 Quiz — المحاضرة 03: Basic Widgets

---

## 🏋️ Tasks (تمارين كود)

### Task 1 — 🟢 سهل: Product Card

اعمل `StatelessWidget` اسمها `ProductCard` بتاخد:
- `String title`
- `String imageUrl`
- `double price`
- `double rating`

وتعرض بطاقة منتج تحتوي على:
- صورة المنتج بارتفاع 160 مع `BoxFit.cover`
- اسم المنتج بخط عريض
- السعر بلون أخضر
- تقييم النجوم (يكفي النص مثل `⭐ 4.5`)

```dart
// الشكل المتوقع للاستخدام
ProductCard(
  title: 'سماعات لاسلكية',
  imageUrl: 'https://picsum.photos/seed/product/400/300',
  price: 299.99,
  rating: 4.5,
)
```

> 💡 Hint: استخدم `Card` مع `ClipRRect` فوق الصورة عشان الـ border radius يأثر على الصورة.

---

### Task 2 — 🟡 متوسط: Like Button

اعمل `StatefulWidget` اسمها `LikeButton` بتحتوي على:
- أيقونة قلب `Icons.favorite` بتتغير لونها لما تضغط عليها (رمادي → أحمر)
- عداد يزيد/ينقص مع كل ضغطة
- animation بسيطة: الأيقونة بتكبر لحظة الضغط باستخدام `AnimatedScale`

```dart
// الشكل المتوقع
LikeButton(initialCount: 142)
```

> 💡 Hint: استخدم `AnimatedScale` مع `setState` وغيّر الـ scale لوقت قصير ثم ارجعه.

---

### Task 3 — 🔴 صعب: Image Gallery

اعمل `StatefulWidget` اسمها `ImageGallery` بتعرض:
- قائمة أفقية `ScrollView` من 8 صور على الأقل
- لما تضغط على صورة بتتعرض في مربع كبير فوق القائمة
- زر لتحميل صورة جديدة بشكل عشوائي (غير الـ URL)
- مؤشر `CircularProgressIndicator` أثناء تحميل الصورة الكبيرة

> 💡 Hint: الصور من `https://picsum.photos/seed/{رقم}/400/300` — غير الرقم عشوائياً.
> استخدم `Key` مختلف لكل صورة عشان Flutter يعيد تحميلها.

---

## ❓ MCQ — أسئلة اختيار من متعدد

**السؤال 1:** إيه الفرق الأساسي بين `Container` و`SizedBox`؟

- A) SizedBox أسرع لأنها بتدعم الـ animation
- B) Container بيدعم decoration وpadding وmargin، بينما SizedBox بس للحجم والمسافات ✅
- C) SizedBox بتحتاج child دايماً
- D) Container مش بيقبل child

---

**السؤال 2:** لما بتعمل `onPressed: null` لزرار، إيه اللي بيحصل؟

- A) بيحصل compile error
- B) الزرار بيتحذف من الشاشة
- C) الزرار بيتعطل تلقائياً ومش بيستجيب للضغط ✅
- D) الزرار بيظهر بلون أحمر

---

**السؤال 3:** إيه الـ BoxFit المناسب عشان الصورة تغطي المساحة كاملاً حتى لو اتقصت؟

- A) `BoxFit.contain`
- B) `BoxFit.fill`
- C) `BoxFit.cover` ✅
- D) `BoxFit.none`

---

**السؤال 4:** إيه الـ widget المناسب لعرض نص بأكتر من style مختلف في نفس السطر؟

- A) `Text` عادية
- B) `RichText` مع `TextSpan` ✅
- C) `Row` من `Text` widgets
- D) `Column` من `Text` widgets

---

**السؤال 5:** عايز تضيف مسافة 16px بين عنصرين في Column. إيه الطريقة الأفضل؟

- A) `Container(height: 16)`
- B) `Padding(padding: EdgeInsets.all(16), child: SizedBox())`
- C) `const SizedBox(height: 16)` ✅
- D) `Divider(height: 16)`

---

## ✅ الإجابات

| السؤال | الإجابة |
|--------|---------|
| 1 | B |
| 2 | C |
| 3 | C |
| 4 | B |
| 5 | C |
