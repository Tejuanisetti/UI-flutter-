import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Responsive UI Demo",
      home: ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    double screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    bool isDesktop = screenWidth >= 1200;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery & Breakpoints")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile) {
            // 📱 Mobile Layout
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBox("Mobile Layout", Colors.blue),
                buildBox("Screen width: ${screenWidth.toStringAsFixed(0)}px", Colors.green),
              ],
            );
          } else if (isTablet) {
            // 📊 Tablet Layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBox("Tablet Layout", Colors.orange),
                buildBox("Screen width: ${screenWidth.toStringAsFixed(0)}px", Colors.purple),
              ],
            );
          } else {
            // 🖥 Desktop Layout
            return GridView.count(
              crossAxisCount: 3,
              children: [
                buildBox("Desktop Layout", Colors.red),
                buildBox("Screen width: ${screenWidth.toStringAsFixed(0)}px", Colors.teal),
                buildBox("More Space Available!", Colors.brown),
              ],
            );
          }
        },
      ),
    );
  }

  // Reusable widget
  Widget buildBox(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
