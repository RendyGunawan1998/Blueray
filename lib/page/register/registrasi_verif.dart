import '../../core.dart';

class RegisterVerifEmailScreen extends StatefulWidget {
  RegisterVerifEmailScreen({
    super.key,
  });

  @override
  State<RegisterVerifEmailScreen> createState() =>
      _RegisterVerifEmailScreenState();
}

class _RegisterVerifEmailScreenState extends State<RegisterVerifEmailScreen> {
  final RegistrationController controller =
      Get.put(RegistrationController(), permanent: true);
  bool success = false;

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
            success == false
                ? hbox(0)
                : Icon(Icons.check_circle_outline_outlined,
                    color: Colors.green, size: 80),
            textFormat('Verifikasi Kontak', FontWeight.w700, 38, Colors.black),
            hbox(20),
            success == true
                ? textFormatAlign(
                    'Email Anda berhasil terverifikasi. Sekarang Anda\nbisa login dengan email',
                    FontWeight.w400,
                    14,
                    Colors.black45,
                    TextAlign.center)
                : textKodeVerif('DisiniEmail@gmail.com'),
            success == true ? hbox(25) : hbox(0),
            success == true
                ? textFormatAlign(
                    'Silahkan masukkan password yang kamu inginkan',
                    FontWeight.w400,
                    14,
                    Colors.black45,
                    TextAlign.center)
                : hbox(0),
            Container(height: Get.height * 0.06),
            tff(controller.codeController, 'Kode verifikasi',
                TextInputType.multiline),
            Container(height: Get.height * 0.06),
            success == true
                ? buttonBlue('Selanjutnya', () {
                    Get.to(() => ChangeProfileScreen());
                  })
                : buttonBlue('Masukkan Kode', () async {
                    var code = await controller.registerVerif();
                    if (code == 200) {
                      setState(() {
                        success = true;
                      });
                    }
                  }),
            hbox(25),
            textFormat('Tidak menerima kode verifikasi?', FontWeight.w400, 14,
                Colors.black87),
            hbox(4),
            InkWell(
              onTap: () async {
                await controller.resendCode();
              },
              child:
                  textFormat('Kirim Ulang', FontWeight.w500, 14, Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
