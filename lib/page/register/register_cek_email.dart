import '../../core.dart';

class RegisterCekEmailScreen extends StatefulWidget {
  RegisterCekEmailScreen({
    super.key,
  });

  @override
  State<RegisterCekEmailScreen> createState() => _RegisterCekEmailScreenState();
}

class _RegisterCekEmailScreenState extends State<RegisterCekEmailScreen> {
  final RegistrationController controller =
      Get.put(RegistrationController(), permanent: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.blue,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormat('Pendaftaran', FontWeight.w700, 38, Colors.black),
            hbox(20),
            textFormatAlign(
                'Silahkan isi data dengan benar\nuntuk membuat akun Blueray Cargo',
                FontWeight.w400,
                14,
                Colors.black45,
                TextAlign.center),
            Container(height: Get.height * 0.06),
            tffEmail(controller.emailController),
            Container(height: Get.height * 0.06),
            buttonBlue('Daftar Sekarang', () async {
              if (controller.emailController.text.isNotEmpty &&
                  controller.emailController.text != '') {
                var data = await controller.checkEmailStatus();
                print('DATA :: $data');
                if (data['status'] == 201) {
                  if (mounted) {
                    setState(() {
                      Get.to(() => RegisterVerifEmailScreen());
                    });
                  }
                } else if (data['status'] == 200) {
                  Get.snackbar('Limit', data['message']);
                }
              }
            }),
            hbox(18),
            textFormat('Dengan mendaftar anda telah menyetujui',
                FontWeight.w400, 14, Colors.black87),
            hbox(8),
            textSK()
          ],
        ),
      ),
    );
  }
}
