part of myLib;

@Controller(
  selector: "[driver-card]",
  publishAs: 'ctrl'
)

class DriverCardController {
  String ctrlTest = "Controller Test";
  String _activeMenu;
  PriceGroup _selectedPriceGroup;
  Set<CardOption> _selectedOptions = new Set();

  /**
   * standard constructor
   */
  DriverCardController() {
    //print("Controller started");
  }

  get activeMenu => _activeMenu;
  set activeMenu(String value){
    _activeMenu = value;
  }
  get selectedPriceGroup => _selectedPriceGroup;
  set selectedPriceGroup(PriceGroup value){
    _selectedPriceGroup = value;
  }
  get selectedOptions => _selectedOptions;
  set selectedOptions(CardOption value){
    _selectedOptions.add(value);
  }

  /**
   * listen if the selected menu changes
   */
  void menuChangeListener(String name){
    print(name);
    activeMenu = name;
  }
}
