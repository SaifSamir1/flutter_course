import 'package:flutter/material.dart';

// ========================================
// المحاضرة 02 — Widgets Basics
// أمثلة عملية على StatelessWidget و StatefulWidget
// ========================================

void main() {
  runApp(const MyApp());
}

// ─────────────────────────────────────────
// MaterialApp — Root Widget
// ─────────────────────────────────────────
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Basics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ─────────────────────────────────────────
// HomePage — Scaffold Example
// ─────────────────────────────────────────
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets Basics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مثال على StatelessWidget
            GreetingCard(name: 'سيف', role: 'Flutter Developer'),
            SizedBox(height: 24),
            // مثال على StatefulWidget
            CounterSection(),
            SizedBox(height: 24),
            // مثال على BuildContext
            ThemeInfoWidget(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// StatelessWidget Example
// ─────────────────────────────────────────
class GreetingCard extends StatelessWidget {
  final String name;
  final String role;

  const GreetingCard({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أهلاً يا $name! 👋',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              role,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// StatefulWidget Example
// ─────────────────────────────────────────
class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int _count = 0;

  void _increment() => setState(() => _count++);
  void _decrement() => setState(() => _count--);
  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'العداد: $_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 12),
                IconButton.filled(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// BuildContext Example
// ─────────────────────────────────────────
class ThemeInfoWidget extends StatelessWidget {
  const ThemeInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام context للوصول للـ Theme و MediaQuery
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'معلومات الشاشة (من BuildContext)',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('العرض: ${size.width.toStringAsFixed(0)} px'),
            Text('الارتفاع: ${size.height.toStringAsFixed(0)} px'),
            Text('Primary Color: ${theme.colorScheme.primary}'),
          ],
        ),
      ),
    );
  }
}
