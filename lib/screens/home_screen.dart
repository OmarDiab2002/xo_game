import 'dart:async';
import 'package:flutter/material.dart';
import 'package:xo_game/core/app_colors.dart';
import 'package:xo_game/widgets/background_widget.dart';
import 'package:xo_game/widgets/tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  late bool playerX;
  String winner = "";
  int counter = 0;
  int seconds = 0;
  int minutes = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Fixed: Start a repeating timer
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        seconds++;
        if (seconds == 60) {
          seconds = 0;
          minutes++;
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool arg = ModalRoute.of(context)!.settings.arguments as bool;
    playerX = arg;
  }

  @override
  void dispose() {
    // Cancel the timer when leaving the screen
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(44)),
                      child: Text(
                        "$minutes:${seconds.toString().padLeft(2, '0')}",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 32),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Player ${playerX ? "X" : "O"}'s Turn",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(44)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: TabWidget(
                                  onTap: onTap,
                                  title: board[0],
                                  index: 0,
                                )),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[1], index: 1)),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[2], index: 2)),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.black,
                        height: 0,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[3], index: 3)),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[4], index: 4)),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[5], index: 5)),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.black,
                        height: 0,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[6], index: 6)),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[7], index: 7)),
                            VerticalDivider(
                              color: AppColors.black,
                              width: 2,
                            ),
                            Expanded(
                                child: TabWidget(
                                    onTap: onTap, title: board[8], index: 8)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void onTap(String title, int index) {
    if (board[index].isEmpty) {
      counter++;
      board[index] = playerX ? "x" : "o";
      playerX = !playerX;
      checkWinner();
      if (winner.isNotEmpty) {
        showWinner();
      } else if (winner.isEmpty && counter == 9) {
        resetGame();
      }
      setState(() {});
    }
  }

  void checkWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == "x" && board[i + 1] == "x" && board[i + 2] == "x") {
        winner = "X";
        return;
      }
      if (board[i] == "o" && board[i + 1] == "o" && board[i + 2] == "o") {
        winner = "O";
        return;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == "x" && board[i + 3] == "x" && board[i + 6] == "x") {
        winner = "X";
        return;
      }
      if (board[i] == "o" && board[i + 3] == "o" && board[i + 6] == "o") {
        winner = "O";
        return;
      }
    }
    if (board[0] == "x" && board[4] == "x" && board[8] == "x") {
      winner = "X";
      return;
    }
    if (board[2] == "x" && board[4] == "x" && board[6] == "x") {
      winner = "X";
      return;
    }
    if (board[0] == "o" && board[4] == "o" && board[8] == "o") {
      winner = "O";
      return;
    }
    if (board[2] == "o" && board[4] == "o" && board[6] == "o") {
      winner = "O";
      return;
    }
  }

  void resetGame() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    winner = "";
    counter = 0;
    seconds = 0;
    minutes = 0;
    setState(() {});
  }

  void showWinner() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                    colors: [AppColors.blue, AppColors.cyan],
                    begin: Alignment.bottomCenter)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.diamond_sharp,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Player $winner wins",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Icon(
                  Icons.diamond_sharp,
                  color: Colors.red,
                  size: 30,
                )
              ],
            ));
      },
    ).then(
          (value) {
        resetGame();
      },
    );
  }
}
