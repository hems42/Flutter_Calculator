class CalculatorModel {

   
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
   
   
   
   
   
   
   
   
   
   
   double? _current_calculate;

   double? _display;

   double? _first_number;

   double? _last_number;

   double? _number;

   List<double>? _numbers;

   double? _result;


  get current_calculate => this._current_calculate;

 set current_calculate( value) => this._current_calculate = value;

  get display => this._display;

 set display( value) => this._display = value;

  get first_number => this._first_number;

 set first_number( value) => this._first_number = value;

  get last_number => this._last_number;

 set last_number( value) => this._last_number = value;

  get number => this._number;

 set number( value) => this._number = value;

  get numbers => this._numbers;

 set numbers( value) => this._numbers = value;

  get result => this._result;

 set result( value) => this._result = value;
}
