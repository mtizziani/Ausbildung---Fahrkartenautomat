part of myLib;

/**
 * Component for the content box.
 * the content box is for showing several views
 */
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
