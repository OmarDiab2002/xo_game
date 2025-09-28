import 'package:flutter/material.dart';
import 'package:xo_game/core/app_colors.dart';
import 'package:xo_game/screens/home_screen.dart';
import 'package:xo_game/widgets/background_widget.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "StartScreen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/start_background.png"),
              Spacer(
                flex: 3,
              ),
              Center(
                child: Text(
                  "Pick who goes first?",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 26),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName,arguments:true);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32)),
                        child: Image.asset(
                          "assets/images/x_image.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName,arguments:false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(32)),
                        child: Image.asset(
                          "assets/images/o_image.png",
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
