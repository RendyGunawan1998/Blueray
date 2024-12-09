import 'package:blueray/core.dart';

hbox(double h) {
  return SizedBox(
    height: h,
  );
}

wbox(double w) {
  return SizedBox(
    width: w,
  );
}

textFormat(String text, FontWeight fw, double size, Color color) {
  return Text(
    text,
    style: TextStyle(fontWeight: fw, fontSize: size, color: color),
  );
}

textFormatAlign(
    String text, FontWeight fw, double size, Color color, TextAlign align) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(fontWeight: fw, fontSize: size, color: color),
  );
}

textFormatAlign2(
    String text, FontWeight fw, double size, Color color, TextAlign align) {
  return Text(
    text,
    textAlign: align,
    maxLines: 2,
    softWrap: true,
    style: TextStyle(fontWeight: fw, fontSize: size, color: color),
  );
}

tffEmail(TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Email',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Email can't be empty!";
          }
          if (!value.contains('@gmail.com')) {
            return 'Email should @gmail.com';
          }
          return null;
        },
      ),
    ),
  );
}

tffPass(TextEditingController controller, String hint, bool visible,
    Function() func) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: visible,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: IconButton(
            icon: Icon(
              visible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: func,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hint can't be empty!";
          } else if (value.length < 8) {
            return "$hint can't be less than 8 character!";
          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
            return 'Password must contain at least one uppercase letter';
          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
            return 'Password must contain at least one number';
          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
            return 'Password must contain at least one special character';
          }
          return null;
        },
      ),
    ),
  );
}

tff(TextEditingController controller, String hint, TextInputType type) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hint can't be empty!";
          }
          return null;
        },
      ),
    ),
  );
}

tffSubmitted(TextEditingController controller, String hint, TextInputType type,
    Function(String) funcSearch) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hint can't be empty!";
          }
          return null;
        },
        onFieldSubmitted: funcSearch,
      ),
    ),
  );
}

containerMap(String data) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(padding: EdgeInsets.all(10), child: Text(data)),
  );
}

tffAddress(TextEditingController controller, String hint, TextInputType type) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: 4,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$hint can't be empty!";
          }
          return null;
        },
      ),
    ),
  );
}

buttonBlue(String text, Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Center(
        child: textFormat(text, FontWeight.w600, 14, Colors.white),
      ),
    ),
  );
}

containerImage(String asset) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey, width: 1),
    ),
    padding: EdgeInsets.all(6),
    child: Center(
      child: Image.asset(
        asset,
        height: 40,
      ),
    ),
  );
}

textSK() {
  return RichText(
    text: TextSpan(
      text: 'Syarat & Ketentuan',
      style: TextStyle(
          fontWeight: FontWeight.w500, color: Colors.blue, fontSize: 12),
      children: <TextSpan>[
        TextSpan(
          text: ' dan ',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        TextSpan(
          text: 'Kebijakan Privasi',
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.blue, fontSize: 12),
        ),
      ],
    ),
  );
}

textProfile(String text1) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: TextStyle(
          fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),
      children: <TextSpan>[
        TextSpan(
          text: ' *',
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.red, fontSize: 14),
        ),
      ],
    ),
  );
}

textKodeVerif(String email) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: 'Masukkan kode verifikasi yang telah kami kirim\n',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black45),
      children: [
        TextSpan(
          text: 'ke ',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black45,
              fontSize: 14),
        ),
        TextSpan(
          text: email,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.blue, fontSize: 14),
        ),
      ],
    ),
  );
  // Column(
  //   children: [
  //     textFormat('Masukkan kode verifikasi yang telah kami kirim\n',
  //         FontWeight.w400, 14, Colors.black45),
  //     // Row(
  //     //   mainAxisSize: MainAxisSize.min,
  //     //   mainAxisAlignment: MainAxisAlignment.center,
  //     //   children: [
  //     //     textFormat('ke ', FontWeight.normal, 14, Colors.black),
  //     //     textFormat(email, FontWeight.w500, 14, Colors.blue)
  //     //   ],
  //     // ),
  //     RichText(
  //       text: TextSpan(
  //         text: 'ke ',
  //         children: [
  //           TextSpan(
  //             text: email,
  //             style: TextStyle(
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.blue,
  //                 fontSize: 14),
  //           ),
  //         ],
  //       ),
  //     )

  //   ],
  // );
}

rowJK(
  bool value1,
  Function(bool?) func1,
  bool value2,
  Function(bool?) func2,
) {
  return Row(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: value1,
            shape: CircleBorder(),
            onChanged: func1,
          ),
          textFormat('Laki-laki', FontWeight.w400, 14, Colors.black54)
        ],
      ),
      wbox(10),
      Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.blue,
            value: value2,
            shape: CircleBorder(),
            onChanged: func2,
          ),
          textFormat('Perempuan', FontWeight.w400, 14, Colors.black54)
        ],
      ),
    ],
  );
}

appbarProfile(Function() add) {
  return AppBar(
    title: textFormat('Daftar Alamat', FontWeight.w600, 14, Colors.blue),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: BackButton(
      color: Colors.blue,
    ),
    actions: [
      InkWell(
          onTap: add,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          ))
    ],
  );
}

Divider dividerr() => Divider(
      indent: 0,
      endIndent: 0,
      color: Colors.grey[400],
      thickness: 0.5,
    );

cardData(String rumah, String nama, String nomor, String alamat, bool primary,
    Function() edit, Function() delete) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15),
    child: Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: primary == true ? Colors.blue[100] : Colors.white,
      ),
      child: Expanded(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.home_outlined),
                    wbox(10),
                    textFormat(rumah, FontWeight.w600, 14, Colors.black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(onTap: edit, child: Icon(Icons.edit_outlined)),
                    wbox(4),
                    InkWell(
                        onTap: delete,
                        child: Icon(Icons.delete_outline_outlined))
                  ],
                ),
              ],
            ),
            dividerr(),
            Row(
              children: [
                Icon(Icons.person_outline_outlined),
                wbox(10),
                textFormat(nama, FontWeight.w300, 14, Colors.black54),
              ],
            ),
            dividerr(),
            Row(
              children: [
                Icon(Icons.phone_in_talk_outlined),
                wbox(10),
                textFormat(nomor, FontWeight.w300, 14, Colors.black54),
              ],
            ),
            dividerr(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.pin_drop_outlined),
                wbox(10),
                Expanded(
                  child: textFormatAlign2(alamat, FontWeight.w300, 14,
                      Colors.black54, TextAlign.left),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String text, Function() func) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: func,
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
