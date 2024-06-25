import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/my_button.dart';
import 'package:nutritrackerapp/components/add_user_textfield.dart';

class IntralipidCalcPage extends StatefulWidget {
  const IntralipidCalcPage({super.key});

  @override
  State<IntralipidCalcPage> createState() => _IntralipidCalcPageState();
}

class _IntralipidCalcPageState extends State<IntralipidCalcPage> {

  //defining variables 
  double weight = 0; 
  double lipid = 0; 
  double ans = 0; 
  double overfill = 0;
  
  // Controllers for the patient info
  final weightController = TextEditingController();
  final lipidController = TextEditingController();

  // Form key
  final _formKey = GlobalKey<FormState>(); 

  @override
  void dispose(){
    weightController.dispose();
    lipidController.dispose();
    super.dispose();
  }

  //function for calculating intralipid
  void calcAns(){
    setState(() {
      weight = double.parse(weightController.text);
      lipid = double.parse(lipidController.text);
      ans = ((lipid * (weight / 1000)) * 10);
      overfill = (ans + (ans / 24));

      // Round ans and overfill to two decimal places
    ans = double.parse(ans.toStringAsFixed(2));
    overfill = double.parse(overfill.toStringAsFixed(2));
    });
  }

  //onTap funcution to calculate
  void calculate(BuildContext context){
    calcAns();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerWidth = (size.width - 100) / 2;
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
              // Custom AppBar-like section
              Container(
                padding: const EdgeInsets.only(left: 10, top: 26, right: 140),
                height: 42 + 26, // Account for padding
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
                        Navigator.of(context).pop(); // Navigate back to the previous page
                      },
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Intralipid Calculator',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: -0.02,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 180),
               Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
                  child: Container(
                    height: 130, // Adjust height as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
       
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Actual',
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            ),
                          ),

            SizedBox(height: 5),
             
            Container(
              height: 80, 
              width: containerWidth, 
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  '$ans',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),

       
        SizedBox(width: 10),

        
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Overfill',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 5), 

            Container(
              height: 80, 
              width: containerWidth, 
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: Text(
                  '$overfill',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
    ),
  ),
),

              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserTextfield(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      hintText: "Weight (grams)",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the weight";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    UserTextfield(
                      controller: lipidController,
                      keyboardType: TextInputType.number, 
                      hintText: "lipid", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter lipid";
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 20),

                    MyButton(
                      onTap: () => calculate(context),
                      text: "Calculate",
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
