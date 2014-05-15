part of myLib;

/**
 * Component for the Menu
 */
@Component(
  selector: 'cmp-menu',
  publishAs: 'cmp',
  templateUrl: "views/menu.html",
  cssUrl: "css/component.css"
)
class CmpMenu {
  DriverCardController ctrl;
  String title = "Komponente Menü";
  List<String> menuItems = ["Tiket kaufen", "Administration"];

  /**
   * constructor initializing the controller and sets the active menu in controller to first list pointer
   */
  CmpMenu(this.ctrl) {
    ctrl.activeMenu = this.menuItems[0];
  }
}
