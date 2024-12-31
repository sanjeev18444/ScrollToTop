import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll to Top Example',
      theme: ThemeData(
      colorScheme: ColorScheme.dark(brightness:
      Brightness.dark),
      ),
      home: ScrollToTopScreen(),
    );
  }
}
class ScrollToTopScreen extends StatefulWidget {
  const ScrollToTopScreen({super.key});

  @override
  State<ScrollToTopScreen> createState() => _ScrollToTopScreenState();
}

class _ScrollToTopScreenState extends State<ScrollToTopScreen> {
  final ScrollController _scrollController = ScrollController();
    void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
 
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
      List<String> items = List.generate(50, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll to Top Example'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
            ),
          ),
        ],
      ),
    );
  }
}
