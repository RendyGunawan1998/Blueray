import 'package:http/http.dart' as http;
import '../core.dart';

class RegistrationController extends GetxController {
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final phoneController = TextEditingController();
  final firstController = TextEditingController();
  final fullController = TextEditingController();
  final addressController = TextEditingController();
  final lastController = TextEditingController();
  final passController = TextEditingController();
  var isLoading = false.obs;

  var headers = {
    'AccessToken':
        'fe17d6c84394e37f804b614871f7fdf60b71f3685df902ee2b5cf59ba5b7da887158ce2702a0f7b2a9ad44e357af6c678bf1',
    'Content-Type': 'application/json',
  };

  Future checkEmailStatus() async {
    final url = Uri.parse(REGISTER_MINI);
    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'user_id': emailController.text,
        }),
      );

      isLoading.value = false;
      print('S.CODE CHECK EMAIL :: ${response.statusCode}');
      print('S.BODY CHECK EMAIL :: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        Get.snackbar('Error',
            'Failed to check email status: ${json.decode(response.body)['message']}');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
      return false;
    }
  }

  Future resendCode() async {
    final url = Uri.parse(RESEND_CODE);
    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          'user_id': emailController.text,
        }),
      );

      isLoading.value = false;
      print('S.CODE RESEND CODE :: ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == '201') {
          return data;
        } else {
          Get.snackbar('Limit', data['message']);
        }
      } else {
        Get.snackbar('Error',
            'Failed to check email status: ${json.decode(response.body)['message']}');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
      return false;
    }
  }

  Future registerVerif() async {
    final url = Uri.parse(REGISTER_VERIFY);
    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(
            {"user_id": emailController.text, "code": codeController.text}),
      );

      isLoading.value = false;
      print('S.CODE VERIF :: ${response.statusCode}');
      // print('S.BODY VERIF :: ${response.body}');
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Verification successful');
      } else {
        Get.snackbar('Error', 'Registration failed: ${response.body}');
      }
      return response.statusCode;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }

  Future registerMandatory() async {
    final url = Uri.parse(REGISTER_MANDATORY);
    try {
      isLoading.value = true;
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "user_id": emailController.text,
          "first_name": firstController.text,
          "last_name": lastController.text,
          "password": passController.text,
          "code": codeController.text,
          "id_card_number": "1234567890",
          "id_card_image": "1",
          "id_card_address": addressController.text,
          "id_card_name": '${firstController.text} ${lastController.text}'
        }),
      );

      isLoading.value = false;
      print('S.CODE MANDATORY :: ${response.statusCode}');
      print('S.BODY MANDATORY :: ${response.body}');
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Registration successful');
        Get.offAll(() => LoginScreen());
      } else {
        Get.snackbar('Error', 'Registration failed: ${response.body}');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
