import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/view/calculator_2/constants/constant_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //DİSPLAY...

  // current
  String d_current = '';
  String d_current_all = '';

  // result
  String d_result = '';

  // history
  String d_result_history = '';
  String d_calculating_current_history = '';
  String d_calculating_all_history = '';

  // operand
  String d_operand = '';

  // calculating
  String d_calculating = '0';
  String d_calculating_all = '';

  // flag
  bool d_isUsedDot = false;
  bool d_isUsedCalculatingAll = false;

  // CALCULATİNG...

  // current
  double? c_current;
  List<double>? c_list_current;

  // result
  double? c_result;

  // calculating
  double? c_calculating;

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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    calculator_display(),
                    calculator_keybord(),
                  ],
                ),
              ),
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
                  d_calculating_all.toString(),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 10),
                child: Text(
                  d_calculating.toString(),
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 22,
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
      height: 350,
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
                  KeyboardConstants.CE,
                  KeyboardConstants.SOL_PARANTEZ,
                  KeyboardConstants.SAG_PARANTEZ,
                  KeyboardConstants.KOKLU_SAYI),
              calculator_keybord_row(
                  KeyboardConstants.C,
                  KeyboardConstants.ARTI_EKSI,
                  KeyboardConstants.YUZDE,
                  KeyboardConstants.BOLME),
              calculator_keybord_row(
                  KeyboardConstants.YEDI,
                  KeyboardConstants.SEKIZ,
                  KeyboardConstants.DOKUZ,
                  KeyboardConstants.CARPMA),
              calculator_keybord_row(
                  KeyboardConstants.DORT,
                  KeyboardConstants.BES,
                  KeyboardConstants.ALTI,
                  KeyboardConstants.CIKARMA),
              calculator_keybord_row(
                  KeyboardConstants.BIR,
                  KeyboardConstants.IKI,
                  KeyboardConstants.UC,
                  KeyboardConstants.TOPLAMA),
              calculator_keybord_row(
                  KeyboardConstants.SIFIR,
                  KeyboardConstants.NOKTA,
                  KeyboardConstants.SILME,
                  KeyboardConstants.ESITTIR),
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
            button_functions(title);
          },
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )),
    );
  }

  // button functions

  void button_functions(String title) {
    switch (title) {
      case KeyboardConstants.CE:
        button_function_ce();
        break;

      case KeyboardConstants.SOL_PARANTEZ:
        button_function_left_parenthesis();
        break;

      case KeyboardConstants.SAG_PARANTEZ:
        button_function_right_parenthesis();
        break;

      case KeyboardConstants.KOKLU_SAYI:
        button_function_rooted_number();
        break;

      case KeyboardConstants.C:
        button_function_c();
        break;

      case KeyboardConstants.ARTI_EKSI:
        break;

      case KeyboardConstants.YUZDE:
        break;

      case KeyboardConstants.BOLME:
      add_calculating_operand(KeyboardConstants.BOLME);
        break;

      case KeyboardConstants.YEDI:
        show_value(KeyboardConstants.YEDI);
        break;

      case KeyboardConstants.SEKIZ:
        show_value(KeyboardConstants.SEKIZ);
        break;

      case KeyboardConstants.DOKUZ:
        show_value(KeyboardConstants.DOKUZ);
        break;

      case KeyboardConstants.CARPMA:
        add_calculating_operand(KeyboardConstants.CARPMA);
        break;

      case KeyboardConstants.DORT:
        show_value(KeyboardConstants.DORT);
        break;

      case KeyboardConstants.BES:
        show_value(KeyboardConstants.BES);
        break;

      case KeyboardConstants.ALTI:
        show_value(KeyboardConstants.ALTI);
        break;

      case KeyboardConstants.CIKARMA:
      add_calculating_operand(KeyboardConstants.CIKARMA);
        break;

      case KeyboardConstants.BIR:
        show_value(KeyboardConstants.BIR);
        break;

      case KeyboardConstants.IKI:
        show_value(KeyboardConstants.IKI);
        break;

      case KeyboardConstants.UC:
        show_value(KeyboardConstants.UC);
        break;

      case KeyboardConstants.TOPLAMA:
        add_calculating_operand(KeyboardConstants.TOPLAMA);
        break;

      case KeyboardConstants.SIFIR:
        show_value(KeyboardConstants.SIFIR);
        break;

      case KeyboardConstants.NOKTA:
        button_function_dot();
        break;

      case KeyboardConstants.SILME:
        remove_last_number_on_display();
        break;

      case KeyboardConstants.ESITTIR:
        break;

      default:
    }

    setState(() {});
  }

  void button_function_c() {
    clear_d_calculating_all();
    clear_d_calculating();
    clear_d_current();
    clear_d_curent_all();
    reset_d_calculating();
    setUsedDotFlag(false);
    setUsedCalculatingAllFlag(false);
  }

  void button_function_ce() {
    clear_d_calculating();
    clear_d_current();
    clear_d_curent_all();
    reset_d_calculating();
    setUsedDotFlag(false);
    setUsedCalculatingAllFlag(false);
  }

  void button_function_left_parenthesis() {}

  void button_function_right_parenthesis() {}

  void button_function_rooted_number() {}

  void button_function_factorial() {}

  void button_function_number(String number) {}

  void button_function_percent() {}

  void button_function_dot() {
    if (d_current_all.length == 0) {
      if (d_calculating.length == 1) {
        if (d_calculating[0] == KeyboardConstants.SIFIR)
          d_current_all += KeyboardConstants.SIFIR;
      } else if (d_calculating.length > 1) {
        if (d_calculating[d_calculating.length - 1] == KeyboardConstants.SIFIR)
          d_current_all += KeyboardConstants.SIFIR;
      }
    }

    if (!d_isUsedDot) {
      d_calculating += KeyboardConstants.NOKTA;
      d_current_all += KeyboardConstants.NOKTA;
      setUsedDotFlag(true);
    }
  }

  void show_value(String title) {
    // print('title ile gelen ${title.toString()}');
    if (d_calculating.startsWith(KeyboardConstants.SIFIR)) {
      //  print('sıfıra girdi $title');
      if (d_calculating.length == 1) {
        if (title != KeyboardConstants.NOKTA) {
          //  print('noktaya girdi $title');
          clear_d_calculating();
        } else {
          d_current_all += '0';
        }
      }
    }

    if (d_isUsedCalculatingAll) {
      clear_d_calculating();
      setUsedCalculatingAllFlag(false);
    }

    if (d_calculating.length < 20) {
      d_current = title;
      d_current_all += d_current;
      d_calculating += d_current;

      // print(          'eklenen anlık değer: $d_current  d_calculating: $d_calculating  d_current_all $d_current_all ...');
      clear_d_current();
    } else {
      show_exceed_arrange_message();
    }
  }


  //show mesage
  Future<dynamic> show_exceed_arrange_message() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 15,
            backgroundColor: Colors.red.shade900,
            content: Text(
              'En Fazla 20 Basamak Girilebilir!!!!',
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('TAMAM', style: TextStyle(color: Colors.white))),
            ],
          );
        });
  }

  
  //add
  void add_calculating_operand(String operand) {
    switch (operand) {
      case KeyboardConstants.TOPLAMA:
        add_operand_d_calculating_all(KeyboardConstants.TOPLAMA);
        break;

      case KeyboardConstants.CIKARMA:
        add_operand_d_calculating_all(KeyboardConstants.CIKARMA);
        break;

         case KeyboardConstants.CARPMA:
        add_operand_d_calculating_all(KeyboardConstants.CARPMA);
        break;

         case KeyboardConstants.BOLME:
        add_operand_d_calculating_all(KeyboardConstants.BOLME);
        break;
    }
  }

  void add_operand_d_calculating_all(String operand) {
    /*   if (d_calculating_all.length > 0) {
      int a=d_calculating_all.length-1;
      d_calculating_all=d_calculating_all.substring(0,a)+operand;
    } else {
      d_calculating_all =
          d_calculating_all + ' ' + d_calculating + ' ' + operand;
      setUsedDotFlag(false);
      setUsedCalculatingAllFlag(true);
    } */

    d_calculating_all = d_calculating_all + ' ' + d_calculating + ' ' + operand;
    setUsedDotFlag(false);
    setUsedCalculatingAllFlag(true);
  }


  //remove
  void remove_last_number_on_current_all() {

    d_current_all[d_current_all.length - 1] == KeyboardConstants.NOKTA
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




  //set flag
  void setUsedDotFlag(bool state) {
    d_isUsedDot = state;
  }

  void setUsedCalculatingAllFlag(bool state) {
    d_isUsedCalculatingAll = state;
  }


  //set number
  void set_d_calculating(String value){}

  void set_d_calculating_all(String value){}

  void set_d_calculating_current(String value){}

  void set_d_calculating_current_all(String value){}




  //logic
  
  
  
  
  //reset
  void reset_d_calculating() {
    d_calculating = '0';
  }

  void reset_d_calculating_all() {
    d_calculating_all = '0';
  }

  void reset_d_current_all() {
    d_current_all = '0';
  }

  void reset_d_current() {
    d_current = '0';
  }



  //clear
  void clear_d_curent_all() {
    d_current_all = '';
  }

  void clear_d_current() {
    d_current = '';
  }

  void clear_d_calculating() {
    d_calculating = '';
  }

  void clear_d_calculating_all() {
    d_calculating_all = '';
  }
}
