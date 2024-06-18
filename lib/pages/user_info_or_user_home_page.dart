import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nutritrackerapp/pages/calculator_page.dart';
import 'package:nutritrackerapp/pages/faq_page.dart';
import 'package:nutritrackerapp/pages/reference_page.dart';
import 'package:nutritrackerapp/pages/new_user_homepage.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    NewUserHomepage(),
    CalculatorPage(),
    ReferencePage(),
    FAQPage()
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF40E0D0),
              Color(0xFF1C1563),
            ],
          ),
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 159, 188, 204),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 159, 188, 204),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black,
            padding: const EdgeInsets.all(16),
            gap: 8,
            onTabChange: _onTabChange,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.calculate,
                text: "Calculator",
              ),
              GButton(
                icon: Icons.book_outlined,
                text: "Reference",
              ),
              GButton(
                icon: Icons.folder_copy_rounded,
                text: "FAQs",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
