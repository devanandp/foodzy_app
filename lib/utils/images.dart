///Defined the images to be used across the application as constant values in a Singleton Instance

class LocalImages {
  factory LocalImages() => _instance;

  LocalImages._();

  static final LocalImages _instance = LocalImages._();

  ///Images stored locally inside Assets
  String pizza = 'assets/images/pizza.jpeg';
  String pasta = 'assets/images/pasta.jpeg';
  String delivery = 'assets/images/delivery.png';
  String logo = 'assets/images/Foodzy.png';

  ///Gif Images
  String successGif = 'assets/images/success.gif';
}
