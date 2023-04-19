import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('list_view_test',
      (tester) async {

    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      // ignore: avoid_print
      print("延时2秒执行 then ");
    });
    await tester.pumpAndSettle();
    await tester.pump();
    expect(find.text('fair使用和介绍'), findsOneWidget);

    Finder fab = find.text('fair 模板代码');

    expect(fab, findsOneWidget);

    await tester.tap(fab);
    // Trigger a frame.
    await tester.pumpAndSettle();

    fab = find.text('Listview >>>');
    await tester.tap(fab);
    // Trigger a frame.
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      // ignore: avoid_print
      print("延时2秒执行 then ");
    });
    await tester.pump();
    await Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      // ignore: avoid_print
      print("延时2秒执行 then ");
    });
    await tester.pump();
    final itemFinder = find.text('Grand Royal Hotel');
    // final itemFinder = find.byKey(const ValueKey('item_2_text'));

    // Scroll until the item to be found appears.

    // Verify that the item contains the correct text.
    expect(itemFinder, findsNWidgets(2));

    await Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      // ignore: avoid_print
      print("延时1秒执行 then ");
    });

  });


}
