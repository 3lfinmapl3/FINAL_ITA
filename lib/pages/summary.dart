
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:income_tax_calculator/classes/DataVariables.dart';
import 'package:income_tax_calculator/classes/TaxCaluclations.dart';



class tax extends StatefulWidget {
  final User newuser;

  const tax({Key? key, required this.newuser}) : super(key: key);

  @override
  State<tax> createState() => _taxstate();
}

class _taxstate extends State<tax> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Income Tax Calculator", style: TextStyle(color: Color(0xffFFFFFF))),
        centerTitle: true,
        backgroundColor: const Color(0xff000000),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text:
                      "Your income tax to be paid this month via'Old Scheme' is ",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                          ))),
                  TextSpan(
                      text:
                      "\n${calculateTaxAsPerOldRules(widget.newuser.CalculateIncome(), widget.newuser.CalculateDeduction())}\n",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            backgroundColor: Color(0xffFBFAF5),

                            fontSize: 38,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                  TextSpan(
                      text:
                      "And your income tax to be paid this month via the 'New Scheme' is ",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 38,
                            color: Colors.black,
                          ))),
                  TextSpan(
                      text:
                      "\n${calculateTaxAsPerNewRules(widget.newuser.CalculateIncome())} ",
                      style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            backgroundColor: Color(0xffFBFAF5),
                            fontSize: 38,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ))),
                ])),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
