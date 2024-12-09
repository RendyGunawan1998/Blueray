import '../../core.dart';

class AddProfileScreen extends StatefulWidget {
  AddProfileScreen({
    super.key,
  });

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final ProfileController controller =
      Get.put(ProfileController(), permanent: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              textFormat('Alamat Pengiriman', FontWeight.w600, 14, Colors.blue),
          leading: BackButton(color: Colors.blue)),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textProfile('Label Alamat'),
                hbox(8),
                tff(controller.label, 'Label Alamat', TextInputType.name),
                hbox(16),
                textProfile('Nama'),
                hbox(8),
                tff(controller.nama, 'Nama Anda', TextInputType.name),
                hbox(16),
                textProfile('Nomor Telepon'),
                hbox(8),
                tff(controller.nomor, '08xxx', TextInputType.number),
                hbox(16),
                textFormat('Email', FontWeight.w500, 14, Colors.black),
                hbox(8),
                tffEmail(controller.email),
                hbox(16),
                textProfile('Pin Alamat'),
                hbox(8),
                InkWell(
                  onTap: () {
                    Get.to(() => MapScreen(
                          status: 'add',
                        ));
                  },
                  child: containerMap(controller.pin.text != ''
                      ? controller.pin.text
                      : 'Pilih Lokasi Alamat Anda'),
                ),
                hbox(16),
                textProfile('Alamat'),
                hbox(8),
                tff(controller.address, 'Alamat', TextInputType.streetAddress),
                hbox(16),
                textProfile('NPWP'),
                hbox(8),
                tff(controller.npwp, 'Nomor NPWP', TextInputType.streetAddress),
                hbox(16),
                textProfile('Unggah File NPWP'),
                hbox(8),
                InkWell(
                  onTap: () async {
                    await controller.pickImage();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: containerMap(controller.npwpLink.text != ''
                      ? controller.npwpLink.text
                      : 'Unggah File NPWP'),
                ),
                hbox(16),
                controller.npwpLink.text.isEmpty
                    ? hbox(0)
                    : textProfile('Province'),
                controller.npwpLink.text.isEmpty ? hbox(0) : hbox(8),
                controller.npwpLink.text.isEmpty
                    ? hbox(0)
                    : tffSubmitted(
                        controller.provinsi, 'Province', TextInputType.name,
                        (value) async {
                        print('Province :: $value');
                        List data = await controller.getSub(value.toString());
                        if (mounted) {
                          setState(() {
                            controller.subList.value = data
                                .map((e) => ProvinceModel.fromJson(e))
                                .toList();
                          });
                        }
                      }),
                controller.subList.isEmpty ? hbox(0) : hbox(16),
                controller.subList.isEmpty
                    ? hbox(0)
                    : textProfile('Sub District'),
                controller.subList.isEmpty ? hbox(0) : hbox(8),
                controller.subList.isEmpty
                    ? hbox(0)
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: DropdownButton(
                            isExpanded: true,
                            value: controller.kabID ??
                                controller.subList.first.subDistrictId,
                            hint: Text(controller.kab.text != ""
                                ? controller.kab.text
                                : "Sub District"),
                            items: controller.subList.map((province) {
                              return DropdownMenuItem(
                                value: province.subDistrictId,
                                child: Text(province.subDistrict),
                              );
                            }).toList(),
                            onChanged: (value) async {
                              controller.kabID = int.tryParse(value.toString());
                              var data = controller.subList
                                  .where((x) => x.subDistrictId == value)
                                  .map((address) => address.subDistrict)
                                  .toSet()
                                  .toList();
                              controller.kab.text = data[0];
                              var kec = controller.subList
                                  .where((x) => x.subDistrictId == value)
                                  .map((address) => address.districtId)
                                  .toSet()
                                  .toList();
                              controller.kecID = kec[0];
                              var pro = controller.subList
                                  .where((x) => x.subDistrictId == value)
                                  .map((address) => address.provinceId)
                                  .toSet()
                                  .toList();
                              controller.provinsiID = pro[0];
                              print('KAB :: ${controller.kabID}');
                              print('KEC :: ${controller.kecID}');
                            },
                          ),
                        ),
                      ),
                controller.npwpLink.text.isEmpty
                    ? hbox(0)
                    : textProfile('Kode Pos'),
                controller.npwpLink.text.isEmpty ? hbox(0) : hbox(8),
                controller.npwpLink.text.isEmpty
                    ? hbox(0)
                    : tff(controller.kode, 'Kode Pos', TextInputType.number),
                controller.npwpLink.text.isEmpty ? hbox(0) : hbox(16),
                buttonBlue('Simpan', () async {
                  await controller.postAddress();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
