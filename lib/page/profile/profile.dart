import '../../core.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    controller.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appbarProfile(() {
        showAlertDialog(context, 'Are you sure want to exit app?', () async {
          Navigator.of(context).pop();
          await controller.logout();
        });
      }),
      body: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.all(10),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.addressList.isEmpty) {
              return Center(child: Text("No addresses found."));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.addressList.length,
                  itemBuilder: (BuildContext context, int i) {
                    var data = controller.addressList[i];
                    return InkWell(
                      onDoubleTap: data.isPrimary == true
                          ? null
                          : () {
                              showAlertDialog(context,
                                  'Do you want to make this address primary?',
                                  () async {
                                Navigator.of(context).pop();
                                await controller
                                    .postPrimaryAddress(data.addressId);
                              });
                            },
                      child: cardData(
                        data.addressLabel,
                        data.name,
                        data.phoneNumber,
                        data.addressMap,
                        data.isPrimary,
                        () {
                          print('Edit');
                          controller.nama.text = data.name;
                          controller.nomor.text = data.phoneNumber;
                          controller.email.text = data.email;
                          controller.pin.text = data.addressMap;
                          controller.address.text = data.address;
                          controller.npwp.text = data.npwp;
                          controller.npwpLink.text = data.npwpFile;
                          controller.lat = data.lat;
                          controller.lng = data.long;
                          controller.label.text = data.addressLabel;
                          controller.addressID = data.addressId;
                          Get.to(() => UpdateProfile());
                        },
                        () async {
                          print('Delete');
                          showAlertDialog(
                              context, 'Are you sure dselete data address?',
                              () async {
                            Navigator.of(context).pop();
                            await controller.deleteAddress(data.addressId);
                          });
                        },
                      ),
                    );
                  });
            }
          })),
      bottomNavigationBar: Container(
        width: Get.width,
        height: 60,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: buttonBlue('Add Address', () {
            Get.to(() => AddProfileScreen());
          }),
        ),
      ),
    );
  }
}
