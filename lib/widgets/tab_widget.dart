import 'package:flutter/material.dart';
import 'package:xo_game/widgets/o_widget.dart';
import 'package:xo_game/widgets/x_widget.dart';

class TabWidget extends StatelessWidget {
  final String title;
  final int index;
  void Function(String title, int index) onTap;
  TabWidget(
      {super.key,
      required this.title,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(title, index);
      },
      child: title == "o"
          ? OWidget()
          : title == "x"
              ? XWidget()
              : SizedBox(
                  width: 200,
                  height: 200,
                ),
    );
  }
}
