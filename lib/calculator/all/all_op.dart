import 'package:flutter/material.dart';

class AllCalcOpPage extends StatefulWidget {
  final double weight;
  final double fluidLimit;
  final double feed;
  final double lipid;
  final double AA;
  final double GDR;
  final double Na3;
  final double NaNS;
  final double K;
  final double Ca;
  final double MVI;
  final double Abx;
  final double ALine;
  final double others;

  const AllCalcOpPage({
    Key? key,
    required this.weight,
    required this.fluidLimit,
    required this.feed,
    required this.lipid,
    required this.AA,
    required this.GDR,
    required this.Na3,
    required this.NaNS,
    required this.K,
    required this.Ca,
    required this.MVI,
    required this.Abx,
    required this.ALine,
    required this.others,
  }) : super(key: key);

  @override
  State<AllCalcOpPage> createState() => _AllCalcOpPageState();
}

class _AllCalcOpPageState extends State<AllCalcOpPage> {
  List<bool> _isExpanded = List.generate(7, (_) => false);
  final ValueNotifier<bool> _updateNotifier = ValueNotifier<bool>(false);

  // Perform calculations
  void _performCalculations() {
    calcIntralipid();
    calcAminoven();
    calcSaline();
    calcNS();
    calcKCl();
    calcGlucon();
    calcMVI();
    _updateNotifier.value = !_updateNotifier.value; // Trigger update
  }

  // Intralipid
  double intralipid_ans = 0;
  double intralipid_overfill = 0;

  void calcIntralipid() {
    double calculatedAns = ((widget.lipid * (widget.weight / 1000)) * 10);
    double calculatedOverfill = (calculatedAns / 24);

    intralipid_ans = double.parse(calculatedAns.toStringAsFixed(2));
    intralipid_overfill = double.parse(calculatedOverfill.toStringAsFixed(2));
  }

  // Aminoven
  double aminoven_ans = 0;
  double aminoven_overfill = 0;
  double aminoven_osmolality = 0;

  void calcAminoven() {
    double calculatedAns= ((widget.AA * (widget.weight / 1000)) * 10);
    double calculatedOverfill = (calculatedAns * 1.2);
    double calculatedOsmolality = (calculatedOverfill * 1);

    aminoven_ans = double.parse(calculatedAns.toStringAsFixed(2));
    aminoven_overfill = double.parse(calculatedOverfill.toStringAsFixed(2));
    aminoven_osmolality = double.parse(calculatedOsmolality.toStringAsFixed(2));
  }

  // 3% Saline
  double saline_ans = 0;
  double saline_overfill = 0;
  double saline_osmolality = 0;

  void calcSaline() {
    saline_ans = ((widget.Na3 * (widget.weight / 1000)) * 2);
    saline_overfill = (saline_ans * 1.2);
    saline_osmolality = (saline_overfill * 1);

    saline_ans = double.parse(saline_ans.toStringAsFixed(2));
    saline_overfill = double.parse(saline_overfill.toStringAsFixed(2));
    saline_osmolality = double.parse(saline_osmolality.toStringAsFixed(2));
  }

  // NS
  double NS_ans = 0;
  double NS_overfill = 0;
  double NS_osmolality = 0;

  void calcNS() {
    NS_ans = ((widget.NaNS * (widget.weight / 1000)) * 6.5);
    NS_overfill = (NS_ans * 1.2);
    NS_osmolality = (NS_overfill * 0.31);

    NS_ans = double.parse(NS_ans.toStringAsFixed(2));
    NS_overfill = double.parse(NS_overfill.toStringAsFixed(2));
    NS_osmolality = double.parse(NS_osmolality.toStringAsFixed(2));
  }

  // KCl
  double KCl_ans = 0;
  double KCl_overfill = 0;
  double KCl_osmolality = 0;

  void calcKCl() {
    KCl_ans = ((widget.K * (widget.weight / 1000)) * 0.5);
    KCl_overfill = (KCl_ans * 1.2);
    KCl_osmolality = (KCl_overfill * 4);

    KCl_ans = double.parse(KCl_ans.toStringAsFixed(2));
    KCl_overfill = double.parse(KCl_overfill.toStringAsFixed(2));
    KCl_osmolality = double.parse(KCl_osmolality.toStringAsFixed(2));
  }

  // CaGlucon
  double Glucon_ans = 0;
  double Glucon_overfill = 0;
  double Glucon_osmolality = 0;

  void calcGlucon() {
    Glucon_ans = (widget.Ca * (widget.weight / 1000));
    Glucon_overfill = (Glucon_ans * 1.2);
    Glucon_osmolality = (Glucon_overfill * 0.68);

    Glucon_ans = double.parse(Glucon_ans.toStringAsFixed(2));
    Glucon_overfill = double.parse(Glucon_overfill.toStringAsFixed(2));
    Glucon_osmolality = double.parse(Glucon_osmolality.toStringAsFixed(2));
  }

  // MVI
  double MVI_ans = 0;
  double MVI_overfill = 0;
  double MVI_osmolality = 0;

  void calcMVI() {
    MVI_ans = widget.MVI;
    MVI_overfill = MVI_ans;
    MVI_osmolality = 4;

    MVI_ans = double.parse(MVI_ans.toStringAsFixed(2));
    MVI_overfill = double.parse(MVI_overfill.toStringAsFixed(2));
    MVI_osmolality = double.parse(MVI_osmolality.toStringAsFixed(2));
  }

  @override
  void initState() {
    super.initState();
    print("initState called");
    _performCalculations();
  }

  @override
  void didUpdateWidget(AllCalcOpPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.weight != oldWidget.weight || widget.lipid != oldWidget.lipid) {
      _performCalculations();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _updateNotifier,
      builder: (context, _, __) {
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
                    padding: const EdgeInsets.only(left: 10, top: 26, right: 120),
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

                  SizedBox(height: 20),

                  Container(
                    decoration: const BoxDecoration(
                    color: Colors.transparent,
                    ), 
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: ExpansionPanelList(
                        elevation: 0, // Remove default elevation
                        expandedHeaderPadding: EdgeInsets.zero, // Remove header padding when expanded
                        expansionCallback: (int index, bool isExpanded) {
                          if (index >= 0 && index < _isExpanded.length) {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index];
                            });
                          }
                        },
                        children: [
                          ExpansionPanel(
                            backgroundColor: Color(0xFFA7E6FF),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return const ListTile(title: 
                              Text("Intralipid",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),));
                            },
                            body: Builder(
                              builder: (BuildContext context) {
                                calcIntralipid(); // Recalculate here as well
                                return Container(
                                  color: Color(0xFFA7E6FF),
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Absolute: ${intralipid_ans.toStringAsFixed(2)}'),
                                        Text('Overfill: ${intralipid_overfill.toStringAsFixed(2)}'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            isExpanded: _isExpanded[0],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
