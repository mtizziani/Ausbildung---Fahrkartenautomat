part of myLib;

class CardOption {
  String name;
  double priceFactor;

  CardOption(this.name, this.priceFactor);

  int calcOptionPrice(int basic){
    // gibt die Zusatzkosten zurück
    return (basic * priceFactor).toInt();
  }
}
