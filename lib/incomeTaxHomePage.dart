import 'package:flutter/material.dart';
import 'package:income_tax_calculator/widgets/inputbox.dart';
import 'package:income_tax_calculator/widgets/typer.dart';
import 'package:income_tax_calculator/widgets/rt.dart';
import 'package:income_tax_calculator/pages/userIncome.dart';
import 'package:income_tax_calculator/widgets/selector.dart';
import 'package:income_tax_calculator/classes/DataVariables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Income Tax Calc',
      theme: ThemeData(
        // This is the theme of the application.

        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'Income Tax Calculator', newuser: User()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.newuser})
      : super(key: key);

  final User newuser;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  final nameController = TextEditingController();

  namecallback(newinput) {
    name = newinput;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(widget.title,
            style: const TextStyle(color: Color(0xffFFFFFF))),
        centerTitle: true,
        backgroundColor: const Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            rt("Hello ${widget.newuser.GetName.length != 0 ? widget.newuser.GetName : 'user'}!"),
            typer(
                'Enter your personal details to get started'),
            inputbox(
              a: 'Enter name',
              b: 'Name cannot be Empty',
              keyboardType: TextInputType.name,
              userCallback: namecallback,
              returnnum: false,
              myController: nameController,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text('Gender'),
            ),
            const selector(
              userVal: [
                'Male',
                'Female',
                'Transgender',
                'none'
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text('Age'),
            ),
            const selector(userVal: [
              'Below 60',
              '61 - 80',
              'Above 81',
              'none'
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.newuser.SetName = name;
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
          setState(() => widget.newuser.SetName = name);

          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => intro1(
                newuser: widget.newuser,
              ),
            ),
          );
        },
        backgroundColor: Colors.red,
        tooltip: 'Next',
        child: const Icon(Icons.arrow_forward_ios),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
