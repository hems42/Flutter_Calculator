import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/view/calculator_2/constants/constant_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String d_current = '';
  String d_current_all = '';
  String? d_result = '';
  String? d_history = '';
  String? d_operand = '';
  String d_calculating = '0';
  bool d_isUsedDot = false;

  double? c_current;
  double? c_result;
  double? c_calculating;
  List<double>? c_list_current;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white54),
            child: Container(
              height: 600,
              width: 450,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white54),
              child: Expanded(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    calculator_display(),
                    calculator_keybord(),
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  // atomic

  Container calculator_display() {
    return Container(
      height: 150,
      width: 300,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.black54, width: 0.5),
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      padding: EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        elevation: 8,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 10),
                child: Text(
                  d_calculating.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          height: 150,
          width: 300,
          decoration: BoxDecoration(
              //border: Border.all(color: Colors.black54, width: 0.5),
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }

  Container calculator_keybord() {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.black54, width: 0.5),
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 290,
      width: 300,
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              calculator_keybord_row(
                  KeyboardConstatns.C,
                  KeyboardConstatns.ARTI_EKSI,
                  KeyboardConstatns.YUZDE,
                  KeyboardConstatns.BOLME),
              calculator_keybord_row(
                  KeyboardConstatns.YEDI,
                  KeyboardConstatns.SEKIZ,
                  KeyboardConstatns.DOKUZ,
                  KeyboardConstatns.CARPMA),
              calculator_keybord_row(
                  KeyboardConstatns.DORT,
                  KeyboardConstatns.BES,
                  KeyboardConstatns.ALTI,
                  KeyboardConstatns.CIKARMA),
              calculator_keybord_row(
                  KeyboardConstatns.BIR,
                  KeyboardConstatns.IKI,
                  KeyboardConstatns.UC,
                  KeyboardConstatns.TOPLAMA),
              calculator_keybord_row(
                  KeyboardConstatns.SIFIR,
                  KeyboardConstatns.NOKTA,
                  KeyboardConstatns.SILME,
                  KeyboardConstatns.ESITTIR),
            ],
          ),
          height: 270,
          width: 300,
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black54, width: 0.5),
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }

  Container calculator_keybord_row(
      String title1, String title2, String title3, String title4) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5,
                  color: Colors.black26,
                  style: BorderStyle.solid))),
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          calculator_button(title1),
          calculator_button(title2),
          calculator_button(title3),
          calculator_button(title4),
        ],
      ),
    );
  }

  Widget calculator_button(String title, {Function? getCurrent}) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  CircleBorder(side: BorderSide.none)),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.white, width: 1.5)),
              fixedSize: MaterialStateProperty.all(Size(40, 40)),
              elevation: MaterialStateProperty.all(25),
              //  shape: MaterialStateProperty.all(OutlinedBorder()),
              backgroundColor: MaterialStateProperty.all(Colors.red.shade900)),
          onPressed: () {
            button_function(title);
          },
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )),
    );
  }

  // fonsiyon

  void button_function(String title) {
    switch (title) {
      case KeyboardConstatns.C:
        clear_d_calculating();
        d_calculating = '0';
        clear_d_current();
        break;

      case KeyboardConstatns.ARTI_EKSI:
        break;

      case KeyboardConstatns.YUZDE:
        break;

      case KeyboardConstatns.BOLME:
        break;

      case KeyboardConstatns.YEDI:
        display_value(KeyboardConstatns.YEDI);
        break;

      case KeyboardConstatns.SEKIZ:
        display_value(KeyboardConstatns.SEKIZ);
        break;

      case KeyboardConstatns.DOKUZ:
        display_value(KeyboardConstatns.DOKUZ);
        break;

      case KeyboardConstatns.CARPMA:
        break;

      case KeyboardConstatns.DORT:
        display_value(KeyboardConstatns.DORT);
        break;

      case KeyboardConstatns.BES:
        display_value(KeyboardConstatns.BES);
        break;

      case KeyboardConstatns.ALTI:
        display_value(KeyboardConstatns.ALTI);
        break;

      case KeyboardConstatns.CIKARMA:
        break;

      case KeyboardConstatns.BIR:
        display_value(KeyboardConstatns.BIR);
        break;

      case KeyboardConstatns.IKI:
        display_value(KeyboardConstatns.IKI);
        break;

      case KeyboardConstatns.UC:
        display_value(KeyboardConstatns.UC);
        break;

      case KeyboardConstatns.TOPLAMA:
        break;

      case KeyboardConstatns.SIFIR:
        display_value(KeyboardConstatns.SIFIR);
        break;

      case KeyboardConstatns.NOKTA:
        display_dot();
        break;

      case KeyboardConstatns.SILME:
        remove_last_number_on_display();
        break;

      case KeyboardConstatns.ESITTIR:
        break;

      default:
    }

    setState(() {});
  }

  void display_value(String title) {
    if (d_calculating.startsWith(KeyboardConstatns.SIFIR)) {
      if (d_calculating.length == 1) {
        if (title != KeyboardConstatns.NOKTA) {
          clear_d_calculating();
        }
      }
    }

    if (d_calculating.length < 20) {
      d_current = title;
      d_calculating += d_current;
      d_current_all += d_current;
      clear_d_current();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('En Fazla 20 Basamak Girilebilir!!!!'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('TAMAM')),
              ],
            );
          });
    }
  }

  void display_dot() {
    add_dot();
  }

  void add_dot() {
    if (!d_isUsedDot) {
      if (d_calculating.startsWith(KeyboardConstatns.SIFIR)) {
        d_calculating += KeyboardConstatns.NOKTA;
        setUsedDotFlag(true);
      }
    }
  }

  void remove_last_number_on_current_all() {
    d_current_all.contains(KeyboardConstatns.NOKTA)
        ? setUsedDotFlag(false)
        : null;
    d_current_all = d_current_all.substring(0, d_current_all.length - 1);
  }

  void remove_last_number_on_calculating() {
    d_calculating = d_calculating.substring(0, d_calculating.length - 1);
    d_calculating.length == 0 ? d_calculating = '0' : null;
    clear_d_current();
  }

  void remove_last_number_on_display() {
    remove_last_number_on_calculating();
    remove_last_number_on_current_all();
  }

  void setUsedDotFlag(bool state) {
    d_isUsedDot = state;
  }

  void add_number_calculate() {}

  void clear_d_current() {
    d_current = '';
  }

  void clear_d_calculating() {
    d_calculating = '';
  }
}
