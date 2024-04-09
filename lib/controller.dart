import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxList<String> gameValue = ["", "", "", "", "", "", "", "", ""].obs;
  RxBool isX = false.obs;
  RxBool isWinner = false.obs;
  RxInt click = 0.obs;

  void addValue(int index) {
    if (gameValue[index] == "") {
      if (isX.value) {
        gameValue[index] = 'X';
        isX.value = !isX.value;
        click++;
      } else {
        gameValue[index] = 'O';
        isX.value = !isX.value;
        click++;
      }
    } else {
      log("Invalid Clicked");
    }
    // log("Clicked $click");
    // matchDrawMessage(click);
    checkWiner();
    if (isWinner.value == false) {
      matchDrawMessage(click);
    }
  }

  void matchDrawMessage(click) {
    if (click == 9) {
      Get.defaultDialog(
        title: "Match Draw",
        cancel: TextButton(
          onPressed: () {},
          child: const Text("Cancel"),
        ),
        confirm: TextButton(
          onPressed: () {
            gameValue.value = ["", "", "", "", "", "", "", "", ""];
            click.value = 0;
            Get.back();
          },
          child: const Text("Play Again"),
        ),
      );
    }
  }

  void checkWiner() {
    //varticaly
    if (gameValue[0] == gameValue[1] &&
        gameValue[0] == gameValue[2] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[3] == gameValue[4] &&
        gameValue[3] == gameValue[5] &&
        gameValue[3] != "") {
      winnerDialogBox();
    } else if (gameValue[6] == gameValue[7] &&
        gameValue[6] == gameValue[8] &&
        gameValue[6] != "") {
      winnerDialogBox();
    } //horizontal
    else if (gameValue[0] == gameValue[3] &&
        gameValue[0] == gameValue[6] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      winnerDialogBox();
    } else if (gameValue[2] == gameValue[5] &&
        gameValue[2] == gameValue[8] &&
        gameValue[2] != "") {
      winnerDialogBox();
    }
    //diagonals
    else if (gameValue[3] == gameValue[5] &&
        gameValue[3] == gameValue[8] &&
        gameValue[3] != "") {
      winnerDialogBox();
    } else if (gameValue[0] == gameValue[4] &&
        gameValue[0] == gameValue[8] &&
        gameValue[0] != "") {
      winnerDialogBox();
    } else {}
  }

  void winnerDialogBox() {
    isWinner.value = true;
    Get.defaultDialog(
      title: "Winner",
      content: Column(
        children: [
          const Icon(
            Icons.confirmation_num_rounded,
            size: 50,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          isX.value
              ? const Text(
                  "X is Winner",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              : const Text(
                  "O is Winner",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close),
                label: const Text("Close"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  gameValue.value = ["", "", "", "", "", "", "", "", ""];
                  click.value = 0;
                  isWinner.value = false;
                  Get.back();
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Play Again"),
              )
            ],
          )
        ],
      ),
    );
  }
}
