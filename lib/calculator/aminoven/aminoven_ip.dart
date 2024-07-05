import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/my_button.dart';
import 'package:nutritrackerapp/components/add_user_textfield.dart';
import 'package:nutritrackerapp/models/entities.dart';
import 'package:nutritrackerapp/objectbox.dart';
//import 'package:objectbox/objectbox.dart';

class AminovenCalcPage extends StatefulWidget {
  const AminovenCalcPage({super.key});

  @override
  State<AminovenCalcPage> createState() => _AminovenCalcPageState();
}

class _AminovenCalcPageState extends State<AminovenCalcPage> {
  List<WeightEntry> storedWeight = []; // Store retrieved weights

  @override
  void initState() {
    super.initState();
    _getWeight(); // Fetch weights on initialization
  }

  Future<void> _getWeight() async {
    final weightBox = objectbox.store.box<WeightEntry>();
    storedWeight = weightBox.getAll(); // Retrieve all weights
    setState(() {}); // Update UI to reflect changes
  }

  // Defining variables
  double weight = 0;
  double aminoAcids = 0;
  double ans = 0;
  double overfill = 0;
  double osmolality = 0;

  // Controllers for the patient info
  final weightController = TextEditingController();
  final AAController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key

  @override
  void dispose() {
    weightController.dispose();
    AAController.dispose();
    super.dispose();
  }

  // Function for calculating aminoven
  void calcAns() {
  setState(() {
    weight = double.parse(weightController.text);
    aminoAcids = double.parse(AAController.text);
    ans = ((aminoAcids * (weight / 1000)) * 10);
    overfill = (ans * 1.2);
    osmolality = (overfill * 1);

    ans = double.parse(ans.toStringAsFixed(2));
    overfill = double.parse(overfill.toStringAsFixed(2));
    osmolality = double.parse(osmolality.toStringAsFixed(2));

    // Store the weight entry
    final weightEntry = WeightEntry(weight: weight);
    final weightBox = objectbox.store.box<WeightEntry>();
    weightBox.put(weightEntry);

    // Update storedWeight list after storing
    _getWeight();

    // Log to verify storage
    print('Weight saved to ObjectBox: $weightEntry');
  });
}


  // onTap function to calculate
  void calculate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      calcAns();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerWidth = (size.width - 48) / 3; // Adjust based on padding and number of containers

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
                height: 68, // Account for padding
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
                        'Aminoven Calculator',
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
              const SizedBox(height: 180),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Osmolality',
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
                                '$osmolality',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
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
                      controller: AAController,
                      keyboardType: TextInputType.number,
                      hintText: "A.A.",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Amino Acids";
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
