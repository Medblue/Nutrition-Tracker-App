import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/nutrient_widget.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

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
                children: const [
                  NutriWidget(mainText: "All"),
                  NutriWidget(mainText: "Intralipid"),
                  NutriWidget(mainText: "Aminoven"),
                  NutriWidget(mainText: "3% Saline"),
                  NutriWidget(mainText: "NS"),
                  NutriWidget(mainText: "KCl"),
                  NutriWidget(mainText: "CaGlucon"),
                  NutriWidget(mainText: "MVI"),
                  NutriWidget(mainText: "DV"),
                  NutriWidget(mainText: "D%"),
                  NutriWidget(mainText: "D 10%"),
                  NutriWidget(mainText: "D 25%"),
                  NutriWidget(mainText: "PN vol/rate"),
                  NutriWidget(mainText: "Feed 2hrly"),
                ],
              ),
             NutriWidget(mainText: "Calories"),
             SizedBox(height:24),
            ],
          ),
        ),
      ),
    );
  }
}
