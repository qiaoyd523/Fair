import 'package:example/best_flutter_ui/best_ui_page.dart';
import 'package:example/public_widget.dart';
import 'package:example/template/template_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text('fair使用和介绍'),
        ),
        body: ListView(
          children: [
            addItem('fair @FairProps 注解的使用', () {
              showWidget(
                fairArguments: {'fairText': '路由是个好东西，要进一步封装'},
                fairPath:
                    'assets/fair/lib_fair_widget_fair_props_widget.fair.json',
              );
            }),
            addItem('fair delegate的使用', () {
              showWidget(
                fairArguments: {'fairText': '路由是个好东西，要进一步封装'},
                fairPath:
                    'assets/fair/lib_fair_widget_fair_delegate_widget.fair.json',
              );
            }),
            addItem('fair plugin的使用', () {
              showWidget(
                fairArguments: {'fairText': '路由是个好东西，要进一步封装'},
                fairPath:
                    'assets/fair/lib_fair_widget_fair_plugin_widget.fair.json',
              );
            }),
            addItem('fair bestUI演示', () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return BestUiPage();
              }));
            }),
            addItem('fair 模板代码', () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                return TemplatePage();
              }));
            }),
            addItem('appbar_template入口', () {
              showWidget(
                fairArguments: {'fairText': 'appbar_template 展示测试'},
                fairPath:
                'assets/fair/lib_template_appbar_appbar_template.fair.json',
              );
            }),
            addItem('detail_page入口', () {
              showWidget(
                fairArguments: {'fairText': 'appbar_template 展示测试'},
                fairPath:
                'assets/fair/lib_template_detail_page_fair_detail.fair.json',
              );
            }),
            addItem('drawer_template入口', () {
              showWidget(
                fairArguments: {'fairText': 'appbar_template 展示测试'},
                fairPath:
                'assets/fair/lib_template_drawer_drawer_template.fair.json',
              );
            }),
            addItem('fab_template入口', () {
              showWidget(
                fairArguments: {'fairText': 'appbar_template 展示测试'},
                fairPath:
                'assets/fair/lib_template_fab_fab_template.fair.json',
              );
            }),
          ],
        ),
      ),
    );
  }

  void showWidget({fairPath, fairArguments}) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
      return PublicWidget(
        fairArguments: fairArguments,
        fairPath: fairPath,
      );
    }));
  }

  Widget addItem(String itemName, dynamic onPress) {
    return GestureDetector(
        child: Container(
            alignment: Alignment.centerLeft,
            height: 100,
            padding: const EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.5), width: 0.5))),
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
            )),
        onTap: onPress);
  }
}
