
class UserModel{
  bool _signed_in=false;
  bool get online => _signed_in;
       set online(bool online) => _signed_in=online;

  String _token;
  String get token => _token;
         set token(String token) => _token=token;
}