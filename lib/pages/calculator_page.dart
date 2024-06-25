import 'package:flutter/material.dart';
import 'package:nutritrackerapp/calculator/CaGlucon/glucon_ip.dart';
import 'package:nutritrackerapp/calculator/Feed/feed_2hrly_ip.dart';
import 'package:nutritrackerapp/calculator/KCl/kcl_ip.dart';
import 'package:nutritrackerapp/calculator/MVI/mvi_ip.dart';
import 'package:nutritrackerapp/calculator/NS/ns_ip.dart';
import 'package:nutritrackerapp/calculator/Saline/saline_ip.dart';
import 'package:nutritrackerapp/calculator/all/all_ip.dart';
import 'package:nutritrackerapp/calculator/intralipid/intralipid_ip.dart';
import 'package:nutritrackerapp/calculator/aminoven/aminoven_ip.dart';
import 'package:nutritrackerapp/components/nutrient_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key});

  void allInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AllCalcPage()),
    );
  }

  void intralipidInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IntralipidCalcPage()),
    );
  }

  void aminoAcidInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AminovenCalcPage()),
    );
  }

  void Na3Input(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SalineCalcPage()),
    );
  }

  void NaNSInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NSCalcPage()),
    );
  }

  void KInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KClCalcPage()),
    );
  }

  void CaInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CaGluconCalcPage()),
    );
  }

  void MVIInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MVICalcPage()),
    );
  }

  void FeedInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FeedCalcPage()),
    );
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 26, right: 10),
                height: 68,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Calculator',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: -0.02,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 38), // Placeholder to balance the row
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 1.2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25.0),
                children: [
                  NutriWidget(
                    onTap: () => allInput(context),
                    mainText: "All",
                  ),
                  NutriWidget(
                    onTap: () => intralipidInput(context),
                    mainText: "Intralipid",
                  ),
                  NutriWidget(
                    onTap: () => aminoAcidInput(context),
                    mainText: "Aminoven",
                  ),
                  NutriWidget(
                    onTap: () => Na3Input(context),
                    mainText: "3% Saline",
                  ),
                  NutriWidget(
                    onTap: () => NaNSInput(context),
                    mainText: "NS",
                  ),
                  NutriWidget(
                    onTap: () => KInput(context),
                    mainText: "KCl",
                  ),
                  NutriWidget(
                    onTap: () => CaInput(context),
                    mainText: "CaGlucon",
                  ),
                  NutriWidget(
                    onTap: () => MVIInput(context),
                    mainText: "MVI",
                  ),
                  NutriWidget(
                    onTap: () {},
                    mainText: "DV",
                  ),
                  NutriWidget(
                    onTap: () {},
                    mainText: "D%",
                  ),
                  NutriWidget(
                    onTap: () {},
                    mainText: "D 10%",
                  ),
                  NutriWidget(
                    onTap: () {},
                    mainText: "D 25%",
                  ),
                  NutriWidget(
                    onTap: () {},
                    mainText: "PN vol/rate",
                  ),
                  NutriWidget(
                    onTap: () => FeedInput(context),
                    mainText: "Feed 2hrly",
                  ),
                ],
              ),
              NutriWidget(
                onTap: () {},
                mainText: "Calories",
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
