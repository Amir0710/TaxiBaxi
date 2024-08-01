class Actions {
  final String path;
  final String name;

  Actions({required this.name, required this.path});
}

class UserActionList {
  static List<Actions> get userActions {
    return [
      Actions(path: 'assets/image/icons/family.png', name: 'baxi'),
      Actions(path: 'assets/image/icons/woman.png', name: 'women'),
      Actions(path: 'assets/image/icons/box.png', name: 'box'),
      Actions(path: 'assets/image/icons/truck.png', name: 'truck'),
    ];
  }
}

List<Actions> userActions = UserActionList.userActions;

class DriverActionList {
  static List<Actions> get driverActoins {
    return [Actions(name: 'drive', path: 'assets/image/icons/taxi.png'),
      Actions(name: 'wallet', path: 'assets/image/icons/wallet.png'),
    ];
  }
}

List<Actions> driverActions = DriverActionList.driverActoins;

