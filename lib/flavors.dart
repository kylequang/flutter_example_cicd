enum Flavor {
  dev,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Example CICD Dev';
      case Flavor.prod:
        return 'Example CICD Prod';
    }
  }

}
