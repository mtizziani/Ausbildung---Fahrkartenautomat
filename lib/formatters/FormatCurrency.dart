part of myLib;

@Formatter(
  name: 'currencyFormat_DE'
)
class FormatCurrencyDe implements Function{
  final currencyFormatDE = new NumberFormat("#,##0.00", 'de_DE');
  String call(int price){
    double priceOut = price / 100.0;
    return currencyFormatDE.format(priceOut);
  }
}

@Formatter(
  name: 'currencyFomat_US'
)
class FormatCurrencyUs implements Function{
  final currencyFormatUS = new NumberFormat("#.##0,00", 'en_US');
  String call(int price){
    if(price == null)
      price = 0;
    double priceOut = price / 100.0;
    return currencyFormatUS.format(priceOut);
  }
}
