class AssetsHelper {
  static String imgGoogle = img("google.png");
  static String imgApple = img("apple.jpg");

  // static String icEye = ic("eye.png");
  // static String icPen = ic("pen.png");

  static String img(String name) {
    return "assets/images/$name";
  }

  static String ic(String name) {
    return "assets/icons/$name";
  }
}
