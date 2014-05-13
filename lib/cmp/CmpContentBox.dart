part of myLib;

@Component(
  selector: 'cmp-contentbox',
  publishAs: 'cmp',
  templateUrl: 'views/contentbox.html',
  cssUrl: 'css/component.css'
)
class CmpContentBox {
  String title = "Ansichten";
  DriverCardController ctrl;
  CmpContentBox(this.ctrl);
}
