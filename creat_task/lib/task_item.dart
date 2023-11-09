import 'package:creat_task/colors.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class task_item extends StatelessWidget {
  const task_item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: ColorP.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Task-1",
                    style: subtitles(colort: Colors.white, fontSizeT: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "02:25 AM-02:40 AM",
                        style: subtitles(
                          colort: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    " I Will Do This Task",
                    style: subtitles(colort: Colors.white, fontSizeT: 22),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 80,
              width: 1,
              color: Colors.white,
            ),
            RotatedBox(
              //علشان الف التيكست
              quarterTurns: 3,
              child: Text(
                "To Do",
                style: subtitles(colort: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
