import 'package:flutter/material.dart';

class OilPage extends StatelessWidget {
  final String title;

  const OilPage(this.title, {super.key});

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
                'assets/oil.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "අප්‍රේල් මස 17 වෙනි බදාදා පූර්ව භාග 07.40 ට පළාවන් පැහැති "
                "වසත්‍රාභරණයෙන් සැරසී, නැගෙනහිර දිශාව බලා, හිසට "
                "කොහොඹ පත්ද, පයට කොලොන් පත් ද තබා, කොහොඹ පත් යුෂ මිශ්‍ර "
                "නානු ද තෙල් ද ගා, ස්නානය කිරීම මැනවි.",
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