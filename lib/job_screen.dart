import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  final String title;

  const JobPage(this.title, {super.key});

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
                'assets/job.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "අප්‍රේල් මස 18 වන බ්‍රහස්පතින්දා පූර්ව භාග 04.52 ට පළාවන් "
                "පැහැති වස්ත්‍රාභරණයෙන් සැරසී, හකුරු සහ තල මෝරු මිශ්‍ර "
                "කිරිබතක් අනුභව කර, නැගෙනහිර දිශාව බලා, රැකි රක්ෂා "
                "සඳහා පිටත්ව යාම මැනවි.",
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