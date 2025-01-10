import 'dart:async';

import 'package:awurudu_nakath_app/bath_screen.dart';
import 'package:awurudu_nakath_app/cook_screen.dart';
import 'package:awurudu_nakath_app/eat_screen.dart';
import 'package:awurudu_nakath_app/job_screen.dart';
import 'package:awurudu_nakath_app/moon_screen.dart';
import 'package:awurudu_nakath_app/new_year_screen.dart';
import 'package:awurudu_nakath_app/oil_screen.dart';
import 'package:awurudu_nakath_app/temple_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _currentTime;
  late Duration _timeUntilNewYear;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatTime(DateTime.now());
    _timeUntilNewYear = _calculateTimeUntilNewYear();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = _formatTime(DateTime.now());
        _timeUntilNewYear = _calculateTimeUntilNewYear();
      });
    });
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  Duration _calculateTimeUntilNewYear() {
    final now = DateTime.now();
    final newYear = DateTime(2025, 4, 14, 2, 9); // Example: April 14, 2025, 02:09 AM
    return newYear.difference(now);
  }

  String _formatDuration(Duration duration) {
    final months = (duration.inDays / 30).floor();
    final days = duration.inDays % 30;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return "මාස: $months, දින: $days, පැය: $hours, මිනි.: $minutes";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0), // Increased height for the new design
        child: AppBar(
          elevation: 10, // Add shadow
          flexibleSpace: ClipPath(
            clipper: _CustomAppBarClipper(), // Custom shape for the AppBar
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent.shade200,
                    Colors.deepOrange.shade500,
                    Colors.deepOrange.shade700,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "2025 අලුත් අවුරුදු නැකත්",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "දැන් වේලාව : $_currentTime",
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black54,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "අලුත් අවුරුද්ද උදාවට තව ${_formatDuration(_timeUntilNewYear)}",
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black54,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75,
          children: <Widget>[
            _buildProductCard(context, "නව සඳ බැලීම", 'assets/moon.png', const MoonPage("නව සඳ බැලීම")),
            _buildProductCard(context, "පරණ අවුරුද්ද සඳහා ස්නානය", 'assets/bath.png', const BathPage("පරණ අවුරුද්ද සඳහා ස්නානය")),
            _buildProductCard(context, "අලුත් අවුරුදු උදාව", 'assets/new_year.png', const NewYearPage("අලුත් අවුරුදු උදාව")),
            _buildProductCard(context, "පුණ්‍ය කාලය", 'assets/temple.png', const TemplePage("පුණ්‍ය කාලය")),
            _buildProductCard(context, "ආහාර පිසීම", 'assets/cook.png', const CookPage("ආහාර පිසීම")),
            _buildProductCard(context, "වැඩ ඇල්ලීම හා ආහාර අනුභවය", 'assets/eat.png', const EatPage("වැඩ ඇල්ලීම හා ආහාර අනුභවය")),
            _buildProductCard(context, "හිස තෙල් ගෑම", 'assets/oil.png', const OilPage("හිස තෙල් ගෑම")),
            _buildProductCard(context, "රැකී රක්ෂා සඳහා පිටත්ව යාම", 'assets/job.png', const JobPage("රැකී රක්ෂා සඳහා පිටත්ව යාම")),
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
            child: const Text(
              "නැකත බලමු",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class _CustomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height - 30);
    path.quadraticBezierTo(size.width * 3 / 4, size.height - 60, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}