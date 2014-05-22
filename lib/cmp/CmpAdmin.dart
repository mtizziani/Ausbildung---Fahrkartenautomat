part of myLib;

@Component(
  selector: 'cmp-admin',
  publishAs:  'cmp',
  templateUrl: 'views/admin.html',
  cssUrl: 'css/component.css'
)
class CmpAdmin {
  String userName;
  String userPass;


  bool _loginSuccess = false;

  DriverCardController ctrl;
  CmpAdmin(this.ctrl);

  set loginSuccess(bool success) {
    _loginSuccess = success;
  }
  get loginSuccess => _loginSuccess;

  test(){
    print('testing');
  }
  login(){
    print('login start');
    if((userName != null && userName.length > 0) && (userPass != null && userPass.length > 0)) {
      FormData _loginData = new FormData();
      _loginData.append('type', 'login');
      _loginData.append('user', userName);
      _loginData.append('pass', userPass);
      _login(_loginData);
      return;
    }
    print('nicht ausführen');
    return;
  }


  _login(FormData data){
    String _requestUrl = 'verkehr_admin.php';

    HttpRequest.request(_requestUrl, method: 'POST', sendData: data)
    .then(_loginResult)
    .catchError((error){
      window.alert('Es ist ein Fehler aufgetreten');
    });
  }
  _loginResult(HttpRequest result){
    List<Map> resultList = JSON.decode(result.responseText);
    int _numResults = int.parse(resultList[0]['results']);
    if(_numResults > 0){
      loginSuccess = true;
    } else {
      loginSuccess = false;
    }
  }
}
