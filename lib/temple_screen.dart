import 'package:flutter/material.dart';

class TemplePage extends StatelessWidget {
  final String title;

  const TemplePage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent.shade200, Colors.deepOrange.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
                'assets/temple.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "අප්‍රේල් මස 14 වෙනි ඉරිදා පූර්ව භාග 07.45 සිට එදින අපර භාග "
                "08.33 දක්වා පුණ්‍ය කාලය බැවින්, අප්‍රේල් මස 14 වෙනි ඉරිදා දින "
                "පූර්ව භාග 07.45 ට පළමුව ආහාර පාන ගෙන සියලු වැඩ අත හැර, "
                "ආගමික වතාවත් වල යෙදීම මැනවි.",
                style: TextStyle(color: Colors.black, fontSize: 22.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}