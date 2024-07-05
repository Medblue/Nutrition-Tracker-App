import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/my_button.dart';
import 'package:nutritrackerapp/components/add_user_textfield.dart';
import 'package:nutritrackerapp/calculator/all/all_op.dart';

class AllCalcIpPage extends StatefulWidget {
  const AllCalcIpPage({super.key});

  @override
  State<AllCalcIpPage> createState() => _AllCalcIpPageState();
}

class _AllCalcIpPageState extends State<AllCalcIpPage> {
  // Controllers for the patient info
  final weightController = TextEditingController();
  final fluidLimitController = TextEditingController();
  final feedController = TextEditingController();
  final lipidController = TextEditingController();
  final AAController = TextEditingController();
  final GDRController = TextEditingController();
  final Na3Controller = TextEditingController();
  final NaNSController = TextEditingController();
  final KController = TextEditingController();
  final CaController = TextEditingController();
  final MVIController = TextEditingController();
  final AbxController = TextEditingController();
  final ALineController = TextEditingController();
  final othersController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key

  void allOutput(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllCalcOpPage(
            weight: double.parse(weightController.text),
            fluidLimit: double.parse(fluidLimitController.text),
            feed: double.parse(feedController.text),
            lipid: double.parse(lipidController.text),
            AA: double.parse(AAController.text),
            GDR: double.parse(GDRController.text),
            Na3: double.parse(Na3Controller.text),
            NaNS: double.parse(NaNSController.text),
            K: double.parse(KController.text),
            Ca: double.parse(CaController.text),
            MVI: double.parse(MVIController.text),
            Abx: double.parse(AbxController.text),
            ALine: double.parse(ALineController.text),
            others: double.parse(othersController.text),
          ),
        ),
      );
    }
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
                        'All Nutri Calculator',
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
              const SizedBox(height: 100),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    UserTextfield(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      hintText: "Weight",
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
                      controller: fluidLimitController,
                      keyboardType: TextInputType.number,
                      hintText: "fluid limit",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the fluid limit";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: feedController,
                      keyboardType: TextInputType.number, 
                      hintText: "feed", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter feed";
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
                    UserTextfield(
                      controller: AAController,
                      keyboardType: TextInputType.number,
                      hintText: "A.A.",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the A.A.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: GDRController,
                      keyboardType: TextInputType.number,
                      hintText: "GDR",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the GDR";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: Na3Controller, 
                      keyboardType: TextInputType.number,
                      hintText: "Na(3%)", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter Na(3%)";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: NaNSController,
                      keyboardType: TextInputType.number, 
                      hintText: "Na(NS)", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter Na(NS)";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: KController,
                      keyboardType: TextInputType.number, 
                      hintText: "K", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter K";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: CaController,
                      keyboardType: TextInputType.number, 
                      hintText: "Ca", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter Ca";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: MVIController,
                      keyboardType: TextInputType.number, 
                      hintText: "MVI", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter MVI";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: AbxController,
                      keyboardType: TextInputType.number, 
                      hintText: "Abx", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter Abx";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: ALineController,
                      keyboardType: TextInputType.number, 
                      hintText: "A line", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter A line";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    UserTextfield(
                      controller: othersController,
                      keyboardType: TextInputType.number, 
                      hintText: "Enter 0", 
                      obscureText: false,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Please enter others";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      
                      child: MyButton(
                        onTap: () => allOutput(context),
                        text: "Calculate",
                      ),
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
