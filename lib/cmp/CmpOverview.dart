part of myLib;

@Component(
  selector: 'cmp-overview',
  publishAs: 'cmp',
  templateUrl: 'views/overview.html',
  cssUrl: 'css/component.css'
)
class CmpOverview {
  String title = 'Übersicht';
  int moneyInput = 0;
  int moneyOutput = 0;

  DriverCardController ctrl;
  CmpOverview(this.ctrl);

  List<Map> _inputMoney = new List();
  List<Map> _outputMoney = new List();
  List<Map> _backMoney = new List();

  List<Map> paperMoney = [
      {"value": 50000,"image": "500eur.jpeg"},
      {"value": 20000,"image": "200eur.jpeg"},
      {"value": 10000,"image": "100eur.jpeg"},
      {"value": 5000,"image": "50eur.jpeg"},
      {"value": 2000,"image": "20eur.jpeg"},
      {"value": 1000,"image": "10eur.jpeg"},
      {"value": 500,"image": "5eur.jpeg"}
  ];
  List<Map> metalMoney = [
      {"value": 200,"image": "2eur.jpeg"},
      {"value": 100,"image": "1eur.jpeg"},
      {"value": 50,"image": "50cent.jpeg"},
      {"value": 20,"image": "20cent.jpeg"},
      {"value": 10,"image": "10cent.jpeg"},
      {"value": 5,"image": "5cent.jpeg"},
      {"value": 2,"image": "2cent.jpeg"},
      {"value": 1,"image": "1cent.jpeg"}
  ];

  void cancelPayment(){
    print('clicked Button Cancel');
    ctrl.selectedPriceGroup = null;
    ctrl.selectedOptions.clear();
    _calcOutput();
  }

  void inputMyMoney(Map money){
    _inputMoney.add(money);
    _calcInput();
  }
  void _calcInput(){
    int tmpMoney = 0;
    for(Map input in _inputMoney){
      tmpMoney += input['value'];
    }
    moneyInput = tmpMoney;
    _calcOutput();
  }

  void _calcOutput(){
    print('berechne rückgeld');
    int tmpMoney = 0;
    if(ctrl.selectedPriceGroup != null){
      tmpMoney -= ctrl.selectedPriceGroup.price;
    }
    tmpMoney += moneyInput;
    moneyOutput = tmpMoney;
    calcOuputMoney();
  }

  get calculatedPrice{
    int price = 0;
    if(ctrl.selectedPriceGroup != null){
      price += ctrl.selectedPriceGroup.price;
      for(CardOption option in ctrl.selectedOptions){
        price += option.calcOptionPrice(ctrl.selectedPriceGroup.price);
      }
    }
    return price;
  }

  get backMoney => _backMoney;

  int _calcThisMoneyBack(Map money, int input){
    double number = input / money['value'];
    int rest = input % money['value'];
    if(number.toInt() != 0)
      _backMoney.add({'image' : money['image'], 'counter': number.toInt()});
    return rest;
  }

  void calcOuputMoney(){
    if(moneyOutput > 0){
      _backMoney.clear();
      int tmp = moneyOutput;
      for(Map money in paperMoney){
        tmp = _calcThisMoneyBack(money, tmp);
      }
      for(Map money in metalMoney){
        tmp =_calcThisMoneyBack(money, tmp);
      }
    }
  }
}
