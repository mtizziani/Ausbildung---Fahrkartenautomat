part of myLib;

/**
 * Component for the view of Price Groups
 */
@Component (
  selector: 'cmp-pricegroups',
  publishAs: 'cmp',
  templateUrl: 'views/pricegroups.html',
  cssUrl: 'css/component.css'
)
class CmpPriceGroups {
  List<PriceGroup> priceGroups = new List();
  List<CardOption> cardOptions = new List();
  DriverCardController ctrl;

  /**
   * Constructor
   */
  CmpPriceGroups(this.ctrl) {
    _initPriceGroups();
    _initCardOptions();
  }

  /**
   * Build the initial PriceGroups
   */
  void _initPriceGroups(){
    priceGroups.add(new PriceGroup(1, 'A', 210));
    priceGroups.add(new PriceGroup(2, 'B', 350));
    priceGroups.add(new PriceGroup(3, 'C', 420));
    priceGroups.add(new PriceGroup(4, 'D', 980));
  }

  /**
   * Build the initial CardOptions
   */
  void _initCardOptions(){
    cardOptions.add(new CardOption('Hin- u. Rückfahrt', 1.0));
    cardOptions.add(new CardOption('Fahrrad', 0.5));
    cardOptions.add(new CardOption('Zusatztiket', 0.7));
  }
}
