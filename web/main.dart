library myLib;

import "dart:html";
import "dart:convert";
import "package:angular/angular.dart";
import "package:angular/application_factory.dart";
import 'package:intl/intl.dart';

part "../lib/DriverCardController.dart";
part "../lib/cmp/CmpMenu.dart";
part "../lib/cmp/CmpOverview.dart";
part "../lib/cmp/CmpContentBox.dart";
part "../lib/cmp/CmpPriceGroups.dart";
part "../lib/objects/PriceGroup.dart";
part "../lib/objects/CardOption.dart";
part "../lib/formatters/FormatCurrency.dart";

class AppModule extends Module{
  AppModule() {
    type(DriverCardController);
    type(CmpMenu);
    type(CmpOverview);
    type(CmpContentBox);
    type(CmpPriceGroups);
    type(FormatCurrencyDe);
    type(FormatCurrencyUs);
  }
}

void main(){
  applicationFactory()
  .addModule(new AppModule())
  .run();
}