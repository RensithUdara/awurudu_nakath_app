import 'package:flutter/material.dart';

class NewYearPage extends StatelessWidget {
  final String title;

  const NewYearPage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,  // No shadow
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent.shade200, Colors.deepOrange.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),  // Rounded bottom corners
            ),
          ),
        ),
        title: const Text(
          "අලුත් අවුරුදු උදා​ව",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,  // Center the title
        backgroundColor: Colors.transparent,  // Transparent background
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade50, Colors.orange.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/new_year.png',
                height: 250,
              ),
              const SizedBox(height: 20),  // Space between the image and text
              const Text(
                "අප්‍රේල් මස 14 වෙනි ඉරිදා දින අපර භාග 02.09 ට සිංහල අලුත් "
                "අවුරුද්ද උදාවෙයි.",
                style: TextStyle(color: Colors.black, fontSize: 22.0),
                textAlign: TextAlign.center,  // Center text
              )
            ],
          ),
        ),
      ),
    );
  }
}
