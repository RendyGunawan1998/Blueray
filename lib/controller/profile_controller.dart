import 'package:http/http.dart' as http;
import '../core.dart';

class ProfileController extends GetxController {
  final AuthService authService = AuthService();
  TextEditingController label = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController nomor = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController provinsi = TextEditingController();
  TextEditingController kab = TextEditingController();
  TextEditingController kec = TextEditingController();
  TextEditingController kode = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController npwp = TextEditingController();
  TextEditingController npwpLink = TextEditingController();
  var isLoading = false.obs;
  int? provinsiID;
  int? kabID;
  int? kecID;
  int? addressID;
  var addressList = <AddressModel>[].obs;
  var subList = <ProvinceModel>[].obs;
  List<Map<String, dynamic>> dropdownItems = [];
  double? lat;
  double? lng;

  Future logout() async {
    final url = Uri.parse(LOGOUT);
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.post(url, headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      });

      isLoading.value = false;
      print('S.CODE LOGIN :: ${response.statusCode}');
      if (response.statusCode == 204) {
        await authService.logout();
        Get.offAll(() => LoginScreen());
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

  Future getAddress() async {
    final url = Uri.parse(GET_ADDRESS);
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.get(url, headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      });

      isLoading.value = false;
      print('S.CODE GET ADDRESS :: ${response.statusCode}');
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        addressList.value = data.map((e) => AddressModel.fromJson(e)).toList();
        return addressList;
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

  Future<void> postAddress() async {
    const url = GET_ADDRESS;
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          "address_label": label.text,
          "name": nama.text,
          "phone_number": nomor.text,
          "email": email.text,
          "province_id": provinsiID,
          "sub_district_id": kabID,
          "district_id": kecID,
          "postal_code": kode.text,
          "lat": lat,
          "long": lng,
          "address_map": pin.text,
          "npwp": npwp.text,
          "npwp_file": npwpLink.text,
          "address": address.text,
        }),
      );

      isLoading.value = false;
      print('S.CODE CREATE PROFILE :: ${response.statusCode}');
      print('S.BODY CREATE PROFILE :: ${response.body}');
      if (response.statusCode == 201) {
        Get.snackbar("Success", "Address posted successfully!");
        nama.clear();
        nomor.clear();
        email.clear();
        pin.clear();
        address.clear();
        npwp.clear();
        npwpLink.clear();
        label.clear();
        Get.to(() => ProfileScreen());
      } else {
        final error = jsonDecode(response.body)['message'] ?? "Unknown error";
        Get.snackbar("Error", error);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to post address: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateAddress(String addressID) async {
    var url = '$GET_ADDRESS/$addressID';
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Token $token',
        },
        body: jsonEncode({
          "address_label": label.text,
          "name": nama.text,
          "phone_number": nomor.text,
          "email": email.text,
          "province_id": provinsiID,
          "sub_district_id": kabID,
          "district_id": kecID,
          "postal_code": kode.text,
          "lat": lat,
          "long": lng,
          "address_map": pin.text,
          "npwp": npwp.text,
          "npwp_file": npwpLink.text,
          "address": address.text,
        }),
      );

      isLoading.value = false;
      print('S.CODE UPDATE PROFILE :: ${response.statusCode}');
      print('S.BODY UPDATE PROFILE :: ${response.body}');
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Address updated successfully!");
        Get.to(() => ProfileScreen());
      } else {
        final error = jsonDecode(response.body)['message'] ?? "Unknown error";
        Get.snackbar("Error", error);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to post address: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteAddress(int addressId) async {
    String url = '$GET_ADDRESS/delete';

    Map<String, dynamic> body = {
      "address_id": addressId,
    };
    var token = await authService.getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
    try {
      isLoading.value = true;
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      isLoading.value = false;
      if (response.statusCode == 200) {
        print('Success delete: ${response.body}');
        getAddress();
      } else {
        print('Failed to delete address. Status code: ${response.statusCode}');
      }
    } catch (error) {
      isLoading.value = false;
      print('Error: $error');
    }
  }

  Future getSub(String search) async {
    final url = Uri.parse('$SUB_DISC$search');
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.get(url, headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      });

      isLoading.value = false;
      print('S.CODE GET SUBDISTRICT :: ${response.statusCode}');
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];

        return data;
      } else {
        Get.snackbar('Error',
            'Failed to search : ${json.decode(response.body)['message']}');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
      return false;
    }
  }

  Future getDisc(String search) async {
    final url = Uri.parse('$DISTRICT$search');
    var token = await authService.getToken();
    try {
      isLoading.value = true;
      final response = await http.get(url, headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      });

      isLoading.value = false;
      print('S.CODE GET DISTRICT :: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = jsonDecode(response.body);
        final data = decoded['data'];
        dropdownItems.add({
          'id': data['district_id'],
          'name': data['district_name'],
        });
        kec.text = '';
        return dropdownItems;
      } else {
        Get.snackbar('Error',
            'Failed to search : ${json.decode(response.body)['message']}');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Exception', e.toString());
      return false;
    }
  }

  Future<void> getAddressFromLatLng(
      double lat, double lng, String status) async {
    final String url =
        "https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng";
    print('URL MAP :: $url');
    try {
      final response = await http.get(Uri.parse(url));
      print('S.CODE MAP :: ${response.statusCode}');
      print('S.BODY MAP :: ${response.body}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        pin.text = data['display_name'];
        address.text = pin.text;
        status == "add"
            ? Get.to(() => AddProfileScreen())
            : Get.to(() => UpdateProfile());
      } else {
        print("Failed to fetch data. Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // return image;
        await uploadImage(image.path);
      }
    } catch (e) {
      print("Error picking image: $e");
    }
    return null;
  }

  Future uploadImage(String filePath) async {
    print('FILE PATH :: $filePath');
    const String url = UPLOAD_NPWP;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files
          .add(await http.MultipartFile.fromPath('image_file', filePath));

      final response = await request.send();
      final responseString = await response.stream.bytesToString();
      print('S.CODE NPWP UPLOAD :: ${response.statusCode}');
      print('RES NPWP UPLOAD :: $responseString');
      if (response.statusCode == 201) {
        print("Image uploaded successfully!");
        var link = json.decode(responseString)['image_url'];
        npwpLink.text = link;
        print('NPWP LINK :: ${npwpLink.text}');
      } else {
        print("Failed to upload image. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  Future<void> postPrimaryAddress(int addressId) async {
    String url = PRIMARY_ADDRESS;

    Map<String, dynamic> body = {
      "address_id": addressId,
    };
    var token = await authService.getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token',
    };
    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      isLoading.value = false;
      if (response.statusCode == 200) {
        print('Success: ${response.body}');
        getAddress();
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      isLoading.value = false;
      print('Error: $error');
    }
  }
}
