import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;
import 'integration_test_data.dart';
import 'integration_test_util.dart';

void main() {

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;


  testWidgets("通用测试", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await binding.convertFlutterSurfaceToImage();
    Finder? finder;
    //gridview  OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.text","text":"Gridview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":8},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //hotel_listview OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"Listview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"Grand Royal Hotel"},{"action":"expect","expect":2},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //list_card
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListCard >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //list_page
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListPage >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //login_page OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView"},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"Login >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"TextField"},{"action":"enterText","text":"hi"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"Login"},{"action":"tap"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //pageview
    var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"PageView >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":2},{"action":"takeScreenshot"}]';

    //TabBar
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.byType","type":"ListView"},{"action":"expect","expect":1},{"action":"drag","offsetY":-600.0},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"TabBar >>>"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"All"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0},{"action":"find.text","text":"Active"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0},{"action":"find.text","text":"Inactive"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0},{"action":"delayed"},{"action":"delayed"}]';
    //StaggeredView
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"StaggeredView >>>"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';
    //ScrollView
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"Scrollview >>>"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"Flutter Best UI x Fair 最佳实践"},{"action":"expect","expect":1},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"delayed"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';
    //PageView
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"PageView >>>"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"delayed"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    await integrationTestByJson( tester, binding,jsonArray);



    List<ConfigData> dataList= [ConfigData.delayed(),ConfigData.delayed(),ConfigData.pumpAndSettle(),ConfigData.pump(),ConfigData.findText('fair使用和介绍'),ConfigData.expect(1),ConfigData.findText('fair 模板代码'),ConfigData.expect(1),ConfigData.tap(),ConfigData.pumpAndSettle(),ConfigData.pump(),ConfigData.delayed(),ConfigData.findText('StaggeredView >>>'),ConfigData.expect(1),ConfigData.tap(),ConfigData.pumpAndSettle(),ConfigData.pump(),ConfigData.delayed(),ConfigData.delayed(),ConfigData.pumpAndSettle(),ConfigData.pump(),ConfigData.takeScreenshot(),ConfigData.findText('click show message!'),ConfigData.expect(0)];

    // await integrationTestByDataList(tester, binding, dataList);
  });

}

