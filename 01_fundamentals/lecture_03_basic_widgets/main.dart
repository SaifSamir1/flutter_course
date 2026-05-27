import 'package:flutter/material.dart';

// ========================================
// المحاضرة 03 — Basic Widgets
// أمثلة عملية على أهم الـ Widgets الأساسية
// ========================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const BasicWidgetsPage(),
    );
  }
}

class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle('📝 Text Widget'),
            TextExamples(),
            SizedBox(height: 24),
            _SectionTitle('🖼️ Image Widget'),
            ImageExamples(),
            SizedBox(height: 24),
            _SectionTitle('🔘 Buttons'),
            ButtonsExamples(),
            SizedBox(height: 24),
            _SectionTitle('📦 Container & SizedBox'),
            ContainerExamples(),
            SizedBox(height: 24),
            _SectionTitle('🃏 Card Widget'),
            CardExample(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// Helper: Section Title
// ─────────────────────────────────────────
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// Text Examples
// ─────────────────────────────────────────
class TextExamples extends StatelessWidget {
  const TextExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text بسيط
        const Text('نص عادي بسيط'),
        const SizedBox(height: 8),

        // Text مع TextStyle
        const Text(
          'نص بتنسيق مخصص',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),

        // Text مع overflow
        const Text(
          'هذا نص طويل جداً وسيظهر بعلامة النقاط الثلاث إذا تجاوز الحد المسموح به في السطر الواحد',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),

        // RichText
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black87),
            children: [
              TextSpan(text: 'أنا أحب '),
              TextSpan(
                text: 'Flutter',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: ' كثيراً! 💙'),
            ],
          ),
        ),

        const SizedBox(height: 8),
        // Text من الـ Theme
        Text(
          'نص من TextTheme',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// Image Examples
// ─────────────────────────────────────────
class ImageExamples extends StatelessWidget {
  const ImageExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Network Image مع loading وerror handler
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://picsum.photos/seed/flutter/400/200',
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                height: 150,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (_, __, ___) => Container(
              height: 150,
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.broken_image, size: 48, color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        // CircleAvatar
        const Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'),
            ),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=2'),
            ),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.indigo,
              child: Text('S', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// Buttons Examples
// ─────────────────────────────────────────
class ButtonsExamples extends StatelessWidget {
  const ButtonsExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('ElevatedButton'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('OutlinedButton'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('TextButton'),
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('FilledButton'),
        ),
        // زر معطل
        ElevatedButton(
          onPressed: null,
          child: const Text('Disabled'),
        ),
        // زر مع أيقونة
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.send),
          label: const Text('إرسال'),
        ),
        IconButton(
          icon: const Icon(Icons.favorite),
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// Container & SizedBox Examples
// ─────────────────────────────────────────
class ContainerExamples extends StatelessWidget {
  const ContainerExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container مع decoration
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade400, Colors.purple.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            'Container مع Gradient',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 12),

        // SizedBox كمسافة
        const Text('↑ SizedBox(height: 12) كمسافة فوق'),
        const SizedBox(height: 12),

        // Container مع border
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('Container مع Border'),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// Card Example
// ─────────────────────────────────────────
class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=5'),
                  radius: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('سيف سمير',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('Flutter Developer',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.verified, color: Colors.blue),
              ],
            ),
            const Divider(height: 24),
            const Text(
              'مطور Flutter بخبرة 3 سنوات في بناء تطبيقات الـ mobile والـ web.',
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(onPressed: () {}, child: const Text('رسالة')),
                const SizedBox(width: 8),
                FilledButton(onPressed: () {}, child: const Text('تابع')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
