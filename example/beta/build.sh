echo '开始自动测试'
cd ..
pwd

echo '开始执行编译'
flutter pub get
# 执行 编译
#flutter pub run build_runner clean
#flutter pub run build_runner build --delete-conflicting-outputs
#
#cp build/fair/*.fair.js assets/fair/
#cp build/fair/*.fair.json assets/fair/
#cp build/fair/*.fair.metadata assets/fair/
#cp build/fair/*.zip assets/fair/

#删除历史截图
rm -rf screenshots
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/fair_integration_test.dart




