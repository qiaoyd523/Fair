class ConfigData{
  // 事件类型  pumpAndSettle（刷新跳转页面） 、pump（刷新页面）、tap（点击）、enterText（输入文字 必须有text）、drag（拖动必须有 offsetX 、offsetX）、find.text（文字查找 必须有text）、find.byKey（查找元素 必须有key）、find.byType（查找元素 必须有type）、expect（预期 必须有expect ）、takeScreenshot （截屏）、delayed （延时）
  String action = '';

  // key
  String key = '';

  // 元素类型  （Image、Text、Icon、TextField、ListView 、ListTile、Drawer）
  String type = '';

  // 文字
  String text = '';

  // 期望数量  _FindsWidgetMatcher(null, 0)
  int expect = 0;

  // drag offset.dx
  double offsetX = 0.0;

  // drag offset.dy
  double offsetY = 0.0;

  ConfigData.fromMap(userMap) {
    if (userMap['action'] != null) {
      action = userMap['action'];
    }
    if (userMap['type'] != null) {
      type = userMap['type'];
    }
    if (userMap['text'] != null) {
      text = userMap['text'];
    }
    if (userMap['expect'] != null) {
      expect = userMap['expect'];
    }
    if (userMap['offsetX'] != null) {
      offsetX = userMap['offsetX'];
    }
    if (userMap['offsetY'] != null) {
      offsetY = userMap['offsetY'];
    }
  }

  ConfigData();

  ConfigData.pumpAndSettle() {
    action = 'pumpAndSettle';
  }

  ConfigData.pump() {
    action = 'pump';
  }

  ConfigData.tap() {
    action = 'tap';
  }

  ConfigData.enterText(this.text) {
    action = 'enterText';
  }

  ConfigData.drag(this.offsetX, this.offsetY) {
    action = 'drag';
  }

  ConfigData.findText(this.text) {
    action = 'find.text';
  }

  ConfigData.findByKey(this.key) {
    action = 'find.byKey';
  }

  ConfigData.findByType(this.type) {
    action = 'find.byType';
  }

  ConfigData.expect(this.expect) {
    action = 'expect';
  }
  /// Takes a screenshot.
  ConfigData.takeScreenshot() {
    action = 'takeScreenshot';
  }
  /// delayed
  ConfigData.delayed() {
    action = 'delayed';
  }
}
