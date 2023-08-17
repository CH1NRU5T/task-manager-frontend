import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/services/api.dart';

class LoginService {
  void login(String username) async {
    (String?, dynamic) response =
        await getRequest('$baseUrl/getAllTasks/c111a1');
    if (response.$1 == null) {
      // no error
      print(response.$2);
    } else {
      //error
      print(response.$1);
    }
  }
}
