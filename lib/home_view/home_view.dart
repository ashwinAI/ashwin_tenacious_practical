import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static String routes = '/homeView';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'POS',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                        Container(height: 1, color: Colors.black, width: 70),
                        const Text(
                          'FOODCHOW',
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: MediaQuery.of(context).size.width >= 600,
                      child: Row(
                        children: [
                          const Text(
                            'Language : ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 24,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'English',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),

                            /*child: DropdownButton<String>(
                          value: ,
                          items: controller.dropdDownList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        )*/
                          ),
                          Container(
                            height: 30,
                            width: 1.5,
                            color: Colors.black,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          const Icon(Icons.access_time_rounded, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(
                            DateFormat("dd-MM-yyyy  HH:mm:ss").format(controller.currentTime),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 1.5,
                            color: Colors.black,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          const Icon(Icons.person, color: Colors.grey),
                          const SizedBox(width: 5),
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Diana',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Casier',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).size.width < 600,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Language : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 24,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'English',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),

                        /*child: DropdownButton<String>(
                            value: ,
                            items: controller.dropdDownList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          )*/
                      ),
                      Container(
                        height: 30,
                        width: 1.5,
                        color: Colors.black,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      const Icon(Icons.access_time_rounded, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(
                        DateFormat("dd-MM-yyyy  HH:mm:ss").format(DateTime.now()),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 1.5,
                        color: Colors.black,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      const Icon(Icons.person, color: Colors.grey),
                      const SizedBox(width: 5),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Diana',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Casier',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  runSpacing: 6,
                  children: List.generate(controller.kotList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectIndex.value = index;
                        controller.update();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: index == controller.selectIndex.value
                              ? const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(2)))
                              : const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            controller.kotList[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: index == controller.selectIndex.value ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.25)),
              ),
              Visibility(
                visible: MediaQuery.of(context).size.width >= 500,
                child: Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    children: [
                      controller.groupedSections.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 400,
                                      child: Center(
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 20),
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                            border: Border(
                                              bottom: BorderSide(color: Colors.black, width: 1),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                          child: const Text(
                                            '00:05',
                                            style: TextStyle(
                                              fontSize: 16,
                                              wordSpacing: 1.1,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 400,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '#69358',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            'Table: 04',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 30,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      const Text(
                                        'KOT-4569',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      const Text(
                                        'Sujal',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 400,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Colors.black, width: 1),
                                      right: BorderSide(color: Colors.black, width: 1),
                                      bottom: BorderSide(color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Qnt',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 30),
                                            Text(
                                              'Items',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '08:11 AM',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 8),
                                        width: double.infinity,
                                        height: 1,
                                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
                                      ),
                                      Column(
                                        children: List.generate(
                                          controller.groupedSections.keys.length,
                                          (index) {
                                            String sectionName = controller.groupedSections.keys.elementAt(index);
                                            List items = controller.groupedSections[sectionName]!;
                                            return Container(
                                              margin: const EdgeInsets.only(left: 4, right: 4, bottom: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    spreadRadius: 5,
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 3),
                                                  ),
                                                ],
                                                border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(3),
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(
                                                      color: Colors.brown,
                                                    ),
                                                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                                                    margin: const EdgeInsets.only(bottom: 20),
                                                    child: Text(
                                                      sectionName.isEmpty ? 'N/A' : sectionName,
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
                                                      items.length,
                                                      (index) {
                                                        return Column(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Theme(
                                                                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                                                  child: ExpansionTile(
                                                                    trailing: const SizedBox(),
                                                                    title: Padding(
                                                                      padding: const EdgeInsets.only(top: 8, left: 2, right: 12, bottom: 8),
                                                                      child: Row(
                                                                        children: [
                                                                          Text(
                                                                            items[index]['quantity'],
                                                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                                                                          ),
                                                                          const SizedBox(width: 20),
                                                                          Text(
                                                                            items[index]['itemName'],
                                                                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    childrenPadding: const EdgeInsets.only(bottom: 5),
                                                                    children: List.generate(
                                                                      6,
                                                                      (secondIndex) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 18),
                                                                          child: Row(
                                                                            children: [
                                                                              const Text(
                                                                                '•',
                                                                                style: TextStyle(
                                                                                  fontSize: 24,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              Text(
                                                                                secondIndex == 0
                                                                                    ? 'Category Name: ${items[index]['category_name']}'
                                                                                    : secondIndex == 1
                                                                                        ? 'Size Name: ${items[index]['size_name']}'
                                                                                        : secondIndex == 2
                                                                                            ? 'Weight: ${items[index]['weight']}'
                                                                                            : secondIndex == 3
                                                                                                ? 'Unit: ${items[index]['unit']}'
                                                                                                : secondIndex == 4
                                                                                                    ? 'Customization Details: ${items[index]['customization_details']}'
                                                                                                    : 'Choice Details: ${items[index]['choice_details']}',
                                                                                style: const TextStyle(
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: 10,
                                                                  top: 15,
                                                                  child: Container(
                                                                    width: 80,
                                                                    alignment: Alignment.centerRight,
                                                                    decoration: const BoxDecoration(
                                                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                                                      color: Colors.red,
                                                                    ),
                                                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                                                    child: Center(
                                                                      child: Text(
                                                                        items[index]['item_status'],
                                                                        style: const TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontSize: 15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Container(
                                                              height: 1,
                                                              width: double.infinity,
                                                              color: Colors.grey,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 160,
                                        height: 35,
                                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(2.5)),
                                          color: Colors.grey,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Pending',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : const SizedBox(height: 100, width: 100, child: Center(child: CircularProgressIndicator())),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
