import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  late Timer timer;
  @override
  void onInit() {
    // _startTimer();
    homeApi();
    super.onInit();
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      currentTime = DateTime.now();
      update();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Stop the timer when the widget is disposed
    super.dispose();
  }

  homeApi() async {
    try {
      var data = await dio.get('http://api.mystorestory.com/api/MenuMaster/GetPoskotForShop?shop_id=4591');
      dataShorting(data.data);
      /*  HomeModel model = HomeModel.fromJson(data.data);
      if (model.success!) {
        homeData = model.data;
        update();
      } else {}*/
    } catch (e) {
      print('error');
    }
  }

  dataShorting(var data) {
    List orders = data['data']['order_list'];
    print('ordersordersordersordersorders---------$orders');

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

    print('groupedSectionsgroupedSections---------$groupedSections');
  }

  Widget shadowContainer(String title, List showList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 1),
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            margin: const EdgeInsets.only(bottom: 30),
            child: Text(
              title.isEmpty ? 'N/A' : title,
              style: const TextStyle(
                letterSpacing: 1.1,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
              children: List.generate(
            showList.length,
            (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 20, right: 12, bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          showList[index].quantity,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          showList[index].itemName,
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.red,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: const Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
