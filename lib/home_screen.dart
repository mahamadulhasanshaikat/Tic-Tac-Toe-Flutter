import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:tic_tac_toe/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                        color: controller.isX.value == false
                            ? Colors.blue
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "O",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Obx(() => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.isX.value == false
                              ? Colors.grey[800]
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "X",
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 50),
              Expanded(
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          log(index.toString());
                          controller.addValue(index);
                        },
                        child: Obx(
                          () => Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(controller.gameValue[index],
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
