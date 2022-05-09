import 'package:flutter/material.dart';
import 'package:income_tax_calculator/widgets/inputbox.dart';
import 'package:income_tax_calculator/widgets/typer.dart';
import 'package:income_tax_calculator/widgets/rt.dart';
import 'package:income_tax_calculator/pages/userDeductions.dart';
import 'package:income_tax_calculator/classes/DataVariables.dart';

class intro1 extends StatefulWidget {
  intro1({Key? key, required this.newuser}) : super(key: key);
  User newuser;

  @override
  State<intro1> createState() => _intro1state();
}

class _intro1state extends State<intro1> {
  int salary = 0;
  final salaryController = TextEditingController();
  int hra = 0;
  final hraController = TextEditingController();
  int bankinterest = 0;
  final bankinterestController = TextEditingController();
  int rent = 0;
  final rentController = TextEditingController();
  int other = 0;
  final otherController = TextEditingController();
  int cg = 0;
  final cgController = TextEditingController();

  salarycallback(value) {
    salary = value;
  }

  hracallback(value) {
    hra = value;
  }

  bankinterestcallback(value) {
    bankinterest = value;
  }

  rentcallback(value) {
    rent = value;
  }

  othercallback(value) {
    other = value;
  }

  cgcallback(value) {
    cg = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Income Tax Calculator", style: TextStyle(color: Color(0xffFFFFFF))),
        centerTitle: true,
        backgroundColor: const Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            rt("Welcome, ${widget.newuser.GetName.length != 0 ? widget.newuser.GetName : 'user'}"),
            typer('Please provide your income sources'),
            inputbox(
              a: 'Salary',
              b: 'Cannot be Empty, Use 0',
              userCallback: salarycallback,
              keyboardType: TextInputType.number,
              returnnum: true,
              myController: salaryController,
            ),
            inputbox(
              a: 'House Rent Allowance',
              b: 'Cannot be Empty, Use 0',
              userCallback: hracallback,
              keyboardType: TextInputType.number,
              returnnum: true,
              myController: hraController,
            ),
            inputbox(
              a: 'Income from Interest',
              b: 'Cannot be Empty, Use 0',
              userCallback: bankinterestcallback,
              keyboardType: TextInputType.number,
              returnnum: true,
              myController: bankinterestController,
            ),
            inputbox(
                a: 'Income from Rent',
                b: 'Cannot be Empty, Use 0',
                userCallback: rentcallback,
                keyboardType: TextInputType.number,
                returnnum: true,
                myController: rentController),
            inputbox(
              a: 'Capital Gains',
              b: 'Cannot be Empty, Use 0',
              userCallback: cgcallback,
              keyboardType: TextInputType.number,
              returnnum: true,
              myController: cgController,
            ),
            inputbox(
                a: 'Income from Other Sources',
                b: 'Cannot be Empty, Use 0',
                userCallback: othercallback,
                keyboardType: TextInputType.number,
                returnnum: true,
                myController: otherController),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.newuser.SetNetSalaryIncome = salary;
                    widget.newuser.SetHouseRentAllowance = hra;
                    widget.newuser.SetIncomeFromBankInterest = bankinterest;
                    widget.newuser.SetIncomeFromRent = rent;
                    widget.newuser.SetIncomeFromOtherSources = other;
                    widget.newuser.SetCapitalGains = cg;
                  });
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.newuser.SetNetSalaryIncome = salary;
            widget.newuser.SetHouseRentAllowance = hra;
            widget.newuser.SetIncomeFromBankInterest = bankinterest;
            widget.newuser.SetIncomeFromRent = rent;
            widget.newuser.SetIncomeFromOtherSources = other;
            widget.newuser.SetCapitalGains = cg;
          });
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => intro2(
                newuser: widget.newuser,
              ),
            ),
          );
        },
        backgroundColor: Colors.red,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
