import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class ConfigData extends Object {
  // 事件类型  pumpAndSettle（刷新跳转页面） 、pump（刷新页面）、tap（点击）、enterText（输入文字 必须有text）、drag（拖动必须有 offsetX 、offsetX）、find.text（文字查找 必须有text）、find.byKey（查找元素 必须有key）、find.byType（查找元素 必须有type）、expect（预期 必须有expect ）、takeScreenshot （截屏）、delayed （延时）
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


Future<Finder?> commonTestByConfigData(
    ConfigData configData,
    WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding,
    Finder? finder) async {
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
      } else {
        print("暂不支持 tap finder is null");
      }
      break;
    case 'drag':
      if (finder != null) {
        await tester.drag(
            finder, Offset(configData.offsetX, configData.offsetY));
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
          print("暂不支持 type " + configData.type);
          break;
      }
      break;
    case 'enterText':
      if (null != finder) {
        await tester.enterText(finder.first, configData.text);
        await tester.enterText(finder.last, configData.text);
      } else {
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
      } else {
        print("暂不支持 expect finder is null");
      }
      break;
    default:
      print("暂不支持 action " + configData.action);
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


Future<void> takeScreenshot(
    WidgetTester tester, IntegrationTestWidgetsFlutterBinding binding) async {
  // Trigger a frame.
  await tester.pumpAndSettle();
  await binding
      .takeScreenshot('screenshot-${DateTime.now().millisecondsSinceEpoch}');
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
  return commonTestByConfigData(configData, tester, binding, finder);
}


Future<void> integrationTestByDataList(WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, List<ConfigData> array) async {
  Finder? finder;

  await Future.forEach(array, (item) async {
    finder = await commonTestByConfigData(item as ConfigData, tester, binding, finder);
  });
}

Future<void> integrationTestByJson(WidgetTester tester,
    IntegrationTestWidgetsFlutterBinding binding, String jsonArray) async {
  Finder? finder;
  List items = jsonDecode(jsonArray);

  await Future.forEach(items, (item) async {
    finder = await commonTest(item as Map, tester, binding, finder);
  });
}

