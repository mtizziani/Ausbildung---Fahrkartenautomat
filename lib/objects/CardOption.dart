part of myLib;

/**
 * Simple class for creating a Card Option
 * Constructor needs a name and a calculating factor
 */


class CardOption {
  String name;
  double priceFactor;

  CardOption(this.name, this.priceFactor);

  /**
   * calculate the Price with the initialized factor
   */
  int calcOptionPrice(int basic){
    // gibt die Zusatzkosten zurück
    return (basic * priceFactor).toInt();
  }
}
