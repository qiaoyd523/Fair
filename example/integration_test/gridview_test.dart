
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  as IntegrationTestWidgetsFlutterBinding;

  testWidgets('grid_view_test',
      (tester) async {

    app.main();
    await tester.pumpAndSettle();

    await delayed();

    await binding.convertFlutterSurfaceToImage();

    await tester.pumpAndSettle();
    await tester.pump();

    await takeScreenshot(tester, binding);

    await delayed();
    expect(find.text('fair使用和介绍'), findsOneWidget);

    Finder fab = find.text('fair 模板代码');

    expect(fab, findsOneWidget);

    await tester.tap(fab);
    // Trigger a frame.
    await tester.pumpAndSettle();

    await delayed();

    fab = find.text('Gridview >>>');
    await tester.tap(fab);
    // Trigger a frame.
    await tester.pumpAndSettle();
    await delayed();
    await tester.pump();
    await delayed();
    await tester.pump();
    final itemFinder = find.byType(Image);
    // Verify that the item contains the correct text.
    expect(itemFinder, findsNWidgets(8));
    //截图
    await takeScreenshot(tester, binding);
    await delayed();

  });

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