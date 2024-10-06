import 'dart:async';
import 'package:awurudu_nakath_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:awurudu_nakath_app/bath_screen.dart';
import 'package:awurudu_nakath_app/cook_screen.dart';
import 'package:awurudu_nakath_app/eat_screen.dart';
import 'package:awurudu_nakath_app/job_screen.dart';
import 'package:awurudu_nakath_app/moon_screen.dart';
import 'package:awurudu_nakath_app/new_year_screen.dart';
import 'package:awurudu_nakath_app/oil_screen.dart';
import 'package:awurudu_nakath_app/temple_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatTime(DateTime.now());
    // Update the time every second
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = _formatTime(DateTime.now());
      });
    });
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),  // Increased height to accommodate clock
        child: AppBar(
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
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "2025 අලුත් අවුරුදු නැකත්",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0), // Space between title and clock
              Text( "දැන් වේලාව : " +
                _currentTime,  // Display the current time below the title
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,  // Center the title and clock
          backgroundColor: Colors.transparent,  // Transparent background
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,  // Two columns for product cards
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,  // Aspect ratio to control card height/width
          children: <Widget>[
            _buildProductCard(context, "නව සඳ බැලී​ම", 'assets/moon.png', const MoonPage("නව සඳ බැලී​ම")),
            _buildProductCard(context, "පරණ අවුරුද්ද සඳහා ස්නාන​ය", 'assets/bath.png', const BathPage("පරණ අවුරුද්ද සඳහා ස්නාන​ය")),
            _buildProductCard(context, "අලුත් අවුරුදු උදා​ව", 'assets/new_year.png', const NewYearPage("අලුත් අවුරුදු උදා​ව")),
            _buildProductCard(context, "පුණ්‍ය කාල​ය", 'assets/temple.png', const TemplePage("පුණ්‍ය කාල​ය")),
            _buildProductCard(context, "ආහාර පිසී​ම", 'assets/cook.png', CookPage("ආහාර පිසී​ම")),
            _buildProductCard(context, "වැඩ ඇල්ලීම හා ආහාර අනුභව​ය", 'assets/eat.png', const EatPage("වැඩ ඇල්ලීම හා ආහාර අනුභව​ය")),
            _buildProductCard(context, "හිස තෙල් ගෑ​ම", 'assets/oil.png', const OilPage("හිස තෙල් ගෑ​ම")),
            _buildProductCard(context, "රැකී රක්ෂා සඳහා පිටත්ව යා​ම", 'assets/job.png', const JobPage("රැකී රක්ෂා සඳහා පිටත්ව යා​ම")),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String title, String imagePath, Widget page) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => page,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text("නැකත බලමු" , style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(178, 0, 0, 0),
              ),),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
