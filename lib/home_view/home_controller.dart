import 'package:ashwin_practical/home_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final dio = Dio();
  RxInt selectIndex = 0.obs;
  List kotList = [
    'KOT(0)',
    'Served KOT(0)',
    'Pending KOT(0)',
    'Cancel KOT(0)',
    'Cancel Items(0)',
  ];
  Map<String, List> groupedSections = {};
  DateTime currentTime = DateTime.now();

  HomeModel? homeModel; // Store the current time
  @override
  void onInit() {
    homeApi();
    super.onInit();
  }

  homeApi() async {
    try {
      var data = await dio.get('http://api.mystorestory.com/api/MenuMaster/GetPoskotForShop?shop_id=4591');
      HomeModel model = HomeModel.fromJson(data.data);
      if (model.success!) {
        homeModel = model;
        kotList[0] = 'KOT(${homeModel!.data!.orderList!.length})';
        timerStart();
        /*Timer.periodic(const Duration(seconds: 1), (timer) {
        });*/
      } else {
        print('error');
      }
      // dataShorting(data.data);
    } catch (e) {
      print('error');
    }
  }

  List<RxString> timerList = [];

  timerStart() {
    timerList = [];
    currentTime = DateTime.now();
    timerList = List.generate(homeModel!.data!.orderList!.length, (index) {
      DateTime targetDateTime = DateFormat("MM/dd/yyyy HH:mm:ss").parse(homeModel!.data!.orderList![index].kotStartTime!);
      Duration difference = currentTime.difference(targetDateTime);
      String hours = difference.inHours.toString().padLeft(2, '0');
      String minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
      String seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');
      return "$hours:$minutes:$seconds".obs;
    });
    update();
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
