import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_api_study/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'N Fact Fainder',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.grey.withOpacity(0.5)),
          useMaterial3: true,
        ),
        home: const NumberFactClass());
  }
}

class NumberFactClass extends StatefulWidget {
  const NumberFactClass({super.key});

  @override
  State<NumberFactClass> createState() => _NumberFactClassState();
}

class _NumberFactClassState extends State<NumberFactClass> {
  final _numberController = TextEditingController();

  String _resurlText = 'Type number and press, then it will get result';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "FAIND YOUR NUMBER FACT",
            style: GoogleFonts.aBeeZee(
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                wordSpacing: 1),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 10,
          height: MediaQuery.of(context).size.height * 10 / 10,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    controller: _numberController,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(gapPadding: 1),
                        hintText: "Enter a Number",
                        hintStyle: TextStyle(fontSize: 17)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final number = _numberController.text;
                    final result = await getNumberFact(number: number);
                    setState(
                      () {
                        _resurlText =
                            result.triviaText ?? "No trivia text found";
                      },
                    );
                  },
                  child: const Text("Click Me"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.09),
                    borderRadius: BorderRadius.lerp(BorderRadius.circular(10),
                        BorderRadius.circular(10), 10),
                  ),
                  width: MediaQuery.of(context).size.width * 10,
                  height: MediaQuery.of(context).size.width * 14 / 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _resurlText,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.k2d(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
