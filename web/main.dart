library myLib;

/**
 * import all global libaries
 */
import "dart:html";
import "dart:convert";
import "package:angular/angular.dart";
import "package:angular/application_factory.dart";
import 'package:intl/intl.dart';

/**
 * link to library files
 */
part "../lib/DriverCardController.dart";
part "../lib/cmp/CmpMenu.dart";
part "../lib/cmp/CmpOverview.dart";
part "../lib/cmp/CmpContentBox.dart";
part "../lib/cmp/CmpPriceGroups.dart";
part "../lib/objects/PriceGroup.dart";
part "../lib/objects/CardOption.dart";
part "../lib/formatters/FormatCurrency.dart";
part "../lib/cmp/CmpAdmin.dart";


/**
 * the module for initialize controller, components, formatters and more (like a linker in c++)
 */
class AppModule extends Module{
  AppModule() {
    type(DriverCardController);
    type(CmpMenu);
    type(CmpOverview);
    type(CmpContentBox);
    type(CmpPriceGroups);
    type(CmpAdmin);
    type(FormatCurrencyDe);
    type(FormatCurrencyUs);
  }
}

void main(){
  applicationFactory()
  .addModule(new AppModule())
  .run();
}