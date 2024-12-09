// ignore_for_file: deprecated_member_use

import '../../core.dart';

class ChangeProfileScreen extends StatefulWidget {
  ChangeProfileScreen({
    super.key,
  });

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  final RegistrationController controller =
      Get.put(RegistrationController(), permanent: true);
  bool visible = false;

  bool man = false;
  bool woman = false;

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
          centerTitle: true,
          title: textFormat('Ubah Profil', FontWeight.w700, 14, Colors.blue)),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey, width: 1),
                    shape: BoxShape.circle),
                child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Center(
                        child: Icon(
                      Icons.person_4,
                      size: 75,
                      color: Colors.grey,
                    ))),
              ),
              hbox(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textProfile('Nama Depan'),
                  hbox(8),
                  tff(controller.firstController, 'Nama Depan',
                      TextInputType.name),
                  hbox(16),
                  textProfile('Nama Belakang'),
                  hbox(8),
                  tff(controller.lastController, 'Nama Belakang',
                      TextInputType.name),
                  hbox(16),
                  textFormat('Email', FontWeight.w500, 14, Colors.black),
                  hbox(8),
                  tffEmail(controller.emailController),
                  hbox(16),
                  textFormat('Password', FontWeight.w500, 14, Colors.black),
                  hbox(8),
                  tffPass(controller.passController, 'Create Password', visible,
                      () {
                    setState(() {
                      visible = !visible;
                    });
                  }),
                  hbox(16),
                  textFormat(
                      'Nomor Telepon', FontWeight.w500, 14, Colors.black),
                  hbox(8),
                  tff(controller.phoneController, 'Nomor Telepon',
                      TextInputType.number),
                  hbox(16),
                  textFormat('Alamat', FontWeight.w500, 14, Colors.black),
                  hbox(8),
                  tff(controller.addressController, 'Alamat',
                      TextInputType.datetime),
                  hbox(16),
                  textFormat('Apa jenis kelamin anda?', FontWeight.w500, 14,
                      Colors.black),
                  rowJK(
                      man,
                      (bool? value) {
                        setState(() {
                          man = value!;
                          woman = false;
                        });
                      },
                      woman,
                      (bool? value) {
                        setState(() {
                          woman = value!;
                          man = false;
                        });
                      }),
                  hbox(20),
                  buttonBlue('Simpan', () async {
                    await controller.registerMandatory();
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
