import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;


void main() {

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;


  testWidgets("通用测试", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await binding.convertFlutterSurfaceToImage();
    Finder? finder;
    await test( tester, binding, finder);
  });

}

class ConfigData extends Object {
  // 事件类型  pumpAndSettle 、tap、find.text、enterText、
  String action = '';
  // 元素类型  （Image、Text、Icon）
  String type = '';
  // 文字
  String text = '';
  // 期望组件数  _FindsWidgetMatcher(null, 0)
  int expect = 0;
}

Future<void> test( WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, Finder? finder) async {
  Finder? finder;
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Listview >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Grand Royal Hotel","expect":0},{"action":"expect","type":"","text":"","expect":2},{"action":"takeScreenshot","type":"","text":"","expect":0}]';
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Gridview >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":8},{"action":"takeScreenshot","type":"","text":"","expect":0}]';
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"PageView >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":8},{"action":"takeScreenshot","type":"","text":"","expect":0}]';
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"ListCard >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":8},{"action":"takeScreenshot","type":"","text":"","expect":0}]';
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"ListPage >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":8},{"action":"takeScreenshot","type":"","text":"","expect":0}]';
  var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Login >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"enterText","type":"Image","text":"hi","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Login","expect":0}]';
  List items = jsonDecode(jsonArray);

  await Future.forEach(items, (item) async {
    finder = await commonTest(item as Map,tester,binding,finder);
  });


}

Future<Finder?> commonTest(Map userMap, WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, Finder? finder) async {
  var configData = ConfigData();
  configData.action = userMap['action'];
  configData.type = userMap['type'];
  configData.text = userMap['text'];
  configData.expect = userMap['expect'];
  print(userMap.toString());
  switch (configData.action) {
    case 'delayed':
      await delayed();
      break;
    case 'takeScreenshot':
      await takeScreenshot(tester, binding);
      break;
    case 'pumpAndSettle':
      await tester.pumpAndSettle();
      break;
    case 'find.text':
      finder = find.text(configData.text);
      break;
    case 'tap':
      if (finder != null) {
        await tester.tap(finder);
      }else{
        print("暂不支持 tap finder is null" );
      }
      break;
    case 'pump':
      await tester.pump();
      break;
    case 'find.byType':
      switch (configData.type) {
        case 'Image':
          finder = find.byType(Image);
          break;
        case 'Icon':
          finder = find.byType(Icon);
          break;
        case 'Text':
          finder = find.byType(Text);
          break;
        default:
          print("暂不支持type "+configData.type);
          break;
      }
      break;
    case 'enterText':
      var find1 = find.byType(TextField);
      await tester.enterText(find1,configData.text);
      break;
    case 'expect':
      if (finder != null) {
        switch (configData.expect) {
          case 0:
            expect(finder, findsNothing);
            break;
          case 1:
            expect(finder, findsOneWidget);
            break;
          default:
            expect(finder, findsNWidgets(configData.expect));
            break;
        }
      }
      break;
    default:
      print("暂不支持action "+configData.action);
      break;
  }
  return Future.value(finder);
}


Future<void> delayed() async {
  await Future.delayed(const Duration(milliseconds: 2000)).then((value) {
    // ignore: avoid_print
    print("延时2秒执行 then ");
  });
}


Future<void> takeScreenshot(WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding) async {
  // Trigger a frame.
  await tester.pumpAndSettle();
  await binding
      .takeScreenshot('screenshot-${DateTime
      .now()
      .millisecondsSinceEpoch}');
}
