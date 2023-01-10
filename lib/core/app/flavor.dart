// ignore_for_file: constant_identifier_names

enum FlavorType { DEV, STG, PRD }

class Flavor {
  Flavor._internal();

  static final Flavor _instance = Flavor._internal();

  static Flavor get instance => _instance;

  FlavorType _flavor = FlavorType.DEV;

  set setFlavor(FlavorType flavor) => _flavor = flavor;

  FlavorType get value => _flavor;
  bool _isPhysicalDevice = true;

  set setPhysicalDevice(bool value) => _isPhysicalDevice = value;

  bool get isPhysicalDevice {
    switch (value) {
      case FlavorType.DEV:
        return _isPhysicalDevice;
      case FlavorType.STG:
        return true;
      case FlavorType.PRD:
        return true;
      default:
        return true;
    }
  }

  bool get showChuck {
    switch (_flavor) {
      case FlavorType.DEV:
        return true;
      case FlavorType.STG:
        return true;
      case FlavorType.PRD:
        return false;
    }
  }
}
