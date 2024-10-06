import 'package:flutter/material.dart';

class CookPage extends StatelessWidget {
  final String title;

  const CookPage(this.title, {super.key});

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
          "ආහාර පිසී​ම",
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
                'assets/cook.png',
                height: 190,
              ),
              const SizedBox(height: 20),  // Space between the image and text
              const Text(
                "අප්‍රේල් මස 14 වෙනි ඉරිදා අපර භාග 02.42 ට රතු සහ කහ මිශ්‍ර "
                "(තඹ පැහැති) වස්ත්‍රාභරණයෙන් සැරසී, නැගෙනහිර දිශාව බලා "
                "ලිප් බැඳ, ගිනි මොලවා හකුරු මිශ්‍ර කිරිබතක් ද, තිකුළු මිශ්‍ර "
                "(ඉඟුරු, ගම්මිරිස්, තිප්පිලි යන කුළු බඩු දමා) අග්ගලා සහ කැවුම් "
                "යන කැවිලි වර්ගද පිළියෙළ කරගැනීම මැනවි.",
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
