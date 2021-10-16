import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/view/_product/_widgets/card/calculator_abckground_card.dart';
import 'package:flutter_calculator/view/_product/enum/calculator_background_enum.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Display
  String? dsp_history;
  String? dsp_current_calculate;
  String? dsp_result;
  String? dsp_current_number;

  //Calculate
  double? clt_history;
  double? clt_result;
  double? clt_current_calculate;
  double? clt_current_number;

  String deger = '0';
  String sonuc = '';

  int birinci_deger = 0;

  int ikinci_deger = 0;

  int sonuc_deger = 0;

  String islem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade300,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19),
                  bottomRight: Radius.circular(19),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Container(
                          height: 334,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(19),
                                bottomRight: Radius.circular(19),
                                bottomLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 22),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            sonuc,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            deger.toString(),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 22),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  height: 120,
                                  width: 228,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setState(() {
                                        sonuc = '';
                                        deger = '0';
                                      });
                                    },
                                    child: Text('C'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setState(() {
                                        if (!this.deger.startsWith('0')) {
                                          if (this.deger.startsWith('+')) {
                                            removeFirs();
                                            this.deger = '-' + this.deger;
                                          } else if (this
                                              .deger
                                              .startsWith('-')) {
                                            removeFirs();
                                            this.deger = '+' + this.deger;
                                          } else {
                                            this.deger = '+' + this.deger;
                                          }
                                        }
                                      });
                                    },
                                    child: Text('+/-'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {},
                                    child: Text('%'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      degerEkle(int.parse(deger), '/');
                                      setNumber('/');
                                    },
                                    child: Text('/'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('7');
                                    },
                                    child: Text('7'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('8');
                                    },
                                    child: Text('8'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('9');
                                    },
                                    child: Text('9'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      degerEkle(int.parse(deger), '*');
                                      setNumber('*');
                                    },
                                    child: Text('X'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('4');
                                    },
                                    child: Text('4'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('5');
                                    },
                                    child: Text('5'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('6');
                                    },
                                    child: Text('6'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      degerEkle(int.parse(deger), '-');
                                      setNumber('-');
                                    },
                                    child: Text('-'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('1');
                                    },
                                    child: Text('1'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('2');
                                    },
                                    child: Text('2'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('3');
                                    },
                                    child: Text('3'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      degerEkle(int.parse(deger), '+');
                                      setNumber('+');
                                    },
                                    child: Text('+'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('0');
                                    },
                                    child: Text('0'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setNumber('.');
                                    },
                                    child: Text('.'),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            MaterialStateProperty.all(20)),
                                    onPressed: () {
                                      setState(() {
                                        if (!this.deger.startsWith('0')) {
                                          this.deger = this.deger.substring(
                                              0, this.deger.length - 1);

                                          if (this.deger.length == 0) {
                                            this.deger = '0';
                                          }
                                        }
                                      });
                                    },
                                    child: Text('<='),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  calculator_button(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                calculateBackground(Backgrounds.BG)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton calculator_button() {
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(10)),
      onPressed: () {
        setState(() {
          sonuc_deger = hesapla();

          sonuc = '=  ' + sonuc_deger.toString();
          deger = '';
        });
      },
      child: Text('='),
    );
  }

  degerEkle(int deger, String islem) {
    if (islem == '/') {
      islem = '/';
    } else if (islem == '+') {
      islem = '+';
    } else if (islem == '-') {
      islem = '-';
    } else if (islem == '*') {
      islem = '*';
    }

    if (birinci_deger == 0) {
      birinci_deger = deger;
    } else if (ikinci_deger == 0) {
      ikinci_deger = deger;
    }
  }

  int hesapla() {
    int sonuc = 0;
    print('birnci deger = $birinci_deger  ikinci deger  =$ikinci_deger');

    if (ikinci_deger == 0) {
      sonuc = birinci_deger;
      islem = '';
    } else if (birinci_deger == 0) {
      sonuc = birinci_deger;
      islem = '';
    } else if (birinci_deger != 0 && ikinci_deger != 0) {
      if (islem == '/') {
        sonuc = birinci_deger ~/ ikinci_deger;
      } else if (islem == '+') {
        sonuc = birinci_deger + ikinci_deger;
      } else if (islem == '-') {
        sonuc = birinci_deger - ikinci_deger;
      } else if (islem == '*') {
        sonuc = birinci_deger * ikinci_deger;
      }
    }

    islem = '';
    return sonuc;
  }

  removeFirs() {
    String gelen = this.deger;

    String son = gelen.substring(1, gelen.length);
    this.deger = son;
  }

  setNumber(String deger) {
    setState(() {
      sonuc = '';
      this.deger.substring(0) == '0' ? this.deger = '' : null;
      this.deger += deger;
    });
  }
}
