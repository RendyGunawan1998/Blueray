import '../../core.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller =
      Get.put(LoginController(), permanent: true);
  bool visible = true;

  @override
  void initState() {
    // controller.emailController.text = "rendygunawan19071998@gmail.com";
    // controller.passController.text = 'Passw@rd123';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.cancel, color: Colors.grey),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textFormat('Login', FontWeight.w700, 26, Colors.black),
            hbox(10),
            textFormatAlign(
                'Silahkan masuk untuk dapat menggunakan semua fitur aplikasi Blueray Cargo',
                FontWeight.w400,
                14,
                Colors.black45,
                TextAlign.center),
            hbox(20),
            tffEmail(controller.emailController),
            hbox(6),
            tffPass(controller.passController, 'Password', visible, () {
              setState(() {
                visible = !visible;
              });
            }),
            hbox(15),
            Align(
                alignment: Alignment.centerRight,
                child: textFormat(
                    'Lupa Password?', FontWeight.normal, 14, Colors.blue)),
            Container(height: Get.height * 0.046),
            textFormatAlign('atau masuk menggunakan\nmetode yang lain',
                FontWeight.w400, 14, Colors.black54, TextAlign.center),
            hbox(20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              containerImage(AssetsHelper.imgGoogle),
              wbox(10),
              containerImage(AssetsHelper.imgApple)
            ]),
            Container(height: Get.height * 0.042),
            buttonBlue('Login', () async {
              await controller.login();
            }),
            hbox(18),
            textFormat(
                'Tidak memiliki akun?', FontWeight.w400, 14, Colors.black87),
            hbox(8),
            InkWell(
              onTap: () {
                Get.to(() => RegisterCekEmailScreen());
              },
              child: textFormat(
                  'Daftar Sekarang', FontWeight.w500, 14, Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
