import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final dio = Dio();
  RxInt selectIndex = 0.obs;
  List kotList = [
    'KOT(50)',
    'Served KOT(8)',
    'Pending KOT(6)',
    'Cancel KOT(0)',
    'Cancel Items(0)',
  ];
  Map<String, List> groupedSections = {};
  DateTime currentTime = DateTime.now(); // Store the current time
  @override
  void onInit() {
    homeApi();
    super.onInit();
  }

  homeApi() async {
    try {
      var data = await dio.get('http://api.mystorestory.com/api/MenuMaster/GetPoskotForShop?shop_id=4591');
      dataShorting(data.data);
    } catch (e) {
      print('error');
    }
  }

  dataShorting(var data) {
    List orders = data['data']['order_list'];
    for (var order in orders) {
      for (var section in order['sectionData']) {
        String sectionName = section['section_name'];
        if (groupedSections.containsKey(sectionName)) {
          groupedSections[sectionName]!.addAll(section['itemList']);
        } else {
          groupedSections[sectionName] = section['itemList'];
        }
      }
    }
  }
}
