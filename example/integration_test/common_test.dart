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
  // 事件类型  pumpAndSettle（刷新跳转页面） 、pump（刷新页面）、tap（点击）、enterText（输入文字必须有text）、drag（拖动必须有 offsetX 、offsetX）、find.text（文字查找 必须有text）、find.byKey（查找元素 必须有key）、find.byType（查找元素 必须有type）、expect（预期 必须有expect ）
  String action = '';
  // key
  String key = '';
  // 元素类型  （Image、Text、Icon、TextField、ListView）
  String type = '';
  // 文字
  String text = '';
  // 期望数量  _FindsWidgetMatcher(null, 0)
  int expect = 0;
  // drag offset.dx
  double offsetX = 0.0;
  // drag offset.dy
  double offsetY = 0.0;
}

Future<void> test( WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, Finder? finder) async {
  Finder? finder;

  //gridview
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Gridview >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":8},{"action":"takeScreenshot","type":"","text":"","expect":0}]';

  //hotel_listview
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Listview >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Grand Royal Hotel","expect":0},{"action":"expect","type":"","text":"","expect":2},{"action":"takeScreenshot","type":"","text":"","expect":0}]';

  //list_card
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"ListView","text":"","expect":0},{"action":"drag","type":"","text":"","expect":0,"offsetY":-600.0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"ListCard >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":3},{"action":"takeScreenshot","type":"","text":"","expect":0}]';

  //list_page
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"ListView","text":"","expect":0},{"action":"drag","type":"","text":"","expect":0,"offsetY":-600.0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"ListPage >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"Image","text":"","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"takeScreenshot","type":"","text":"","expect":0}]';

  //login_page
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"ListView","text":"","expect":0},{"action":"drag","type":"","text":"","expect":0,"offsetY":-600.0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Login >>>","expect":0},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"find.byType","type":"TextField","text":"hi","expect":0},{"action":"enterText","type":"","text":"hi","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Login","expect":0},{"action":"tap","type":"","text":"","expect":0}]';

  //pageview
  var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"PageView >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":2},{"action":"takeScreenshot"}]';

  //TabBar
  // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"ListView","text":"","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"drag","type":"","text":"","expect":0,"offsetY":-600.0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"TabBar >>>","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"All","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Active","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Inactive","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0}]';

  List items = jsonDecode(jsonArray);

  await Future.forEach(items, (item) async {
    finder = await commonTest(item as Map,tester,binding,finder);
  });


}

Future<Finder?> commonTest(Map userMap, WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, Finder? finder) async {
  var configData = ConfigData();
  if (userMap['action'] != null) {
    configData.action = userMap['action'];
  }
  if (userMap['type'] != null) {
    configData.type = userMap['type'];
  }
  if (userMap['text'] != null) {
    configData.text = userMap['text'];
  }
  if (userMap['expect'] != null) {
    configData.expect = userMap['expect'];
  }
  if (userMap['offsetX'] != null) {
    configData.offsetX = userMap['offsetX'];
  }
  if (userMap['offsetY'] != null) {
    configData.offsetY = userMap['offsetY'];
  }

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
    case 'drag':
      if (finder != null) {
        await tester.drag(finder,Offset(configData.offsetX, configData.offsetY));
      } else {
        print("暂不支持 drag finder is null");
      }
      break;
    case 'pump':
      await tester.pump();
      break;
    case 'find.byKey':
      finder = find.byKey(Key(configData.key));
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
        case 'ListView':
          finder = find.byType(ListView);
          break;
        case 'TextField':
          finder = find.byType(TextField);
          break;
        default:
          print("暂不支持type "+configData.type);
          break;
      }
      break;
    case 'enterText':
      if(null!=finder){
        await tester.enterText(finder.first,configData.text);
        await tester.enterText(finder.last,configData.text);
      }else{
        print("暂不支持 enterText finder is null");
      }
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
      }else{
        print("暂不支持 expect finder is null");
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
