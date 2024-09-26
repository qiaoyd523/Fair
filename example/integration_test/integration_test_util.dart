import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_data.dart';

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
        case 'ListTile':
          finder = find.byType(ListTile);
          break;
        case 'Drawer':
          finder = find.byType(Drawer);
          break;
        case 'AppBar':
          finder = find.byType(AppBar);
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
  return commonTestByConfigData(ConfigData.fromMap(userMap), tester, binding, finder);
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

