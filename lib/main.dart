import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_api_study/apis.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Number Fact Fainder',
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

  String _resurlText = 'Type a number and press, then the result will be come ';
  String lottie = 'assets/lotties/lottie.json';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(26)),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "FIND NUMBERS FACT",
                  style: GoogleFonts.kadwa(
                      color: const Color.fromARGB(179, 0, 0, 0),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      wordSpacing: 1),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 10,
          height: MediaQuery.of(context).size.height * 10 / 10,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(1),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, top: 5),
                      child: TextFormField(
                        controller: _numberController,
                        cursorColor: Colors.black,
                        style: GoogleFonts.kadwa(
                            color: const Color.fromARGB(179, 0, 0, 0),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 1),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter a Number",
                            hintStyle: TextStyle(fontSize: 17)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white38,
                        child: Lottie.asset(lottie,width: 100,height: 100)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
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
                          style:
                              ElevatedButton.styleFrom(shadowColor: Colors.black),
                          child: const Text(
                            "Click Me",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white38,
                        
                        child: Lottie.asset(lottie,width: 100,height: 100)),
                        
                    ],
                  ),
                ),
                const SizedBox(height: 7.5,),
                const Divider(),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.000),
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
                        color: Colors.white,
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
