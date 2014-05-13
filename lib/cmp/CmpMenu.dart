part of myLib;

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

  CmpMenu(this.ctrl) {
    ctrl.activeMenu = this.menuItems[0];
  }
}
