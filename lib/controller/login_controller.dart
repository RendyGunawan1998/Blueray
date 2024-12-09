import 'package:http/http.dart' as http;
import '../core.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var isLoading = false.obs;

  Future login() async {
    final url = Uri.parse(LOGIN);
    if (emailController.text.isEmpty || passController.text.isEmpty) {
      Get.snackbar('Error', 'Email and Password are required');
      return;
    }
    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {"user_id": emailController.text, "password": passController.text}),
      );

      isLoading.value = false;
      print('S.CODE LOGIN :: ${response.statusCode}');
      // print('S.BODY LOGIN :: ${response.body}');
      // print(json.decode(response.body)['login']);
      if (response.statusCode == 200 &&
          json.decode(response.body)['login'] == true) {
        final data = jsonDecode(response.body);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', data['token']);
        Get.offAll(() => ProfileScreen());
      } else {
        Get.snackbar('Error',
            'Failed to login : ${json.decode(response.body)['message']}');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
      return false;
    }
  }
}
