import 'package:creat_task/adapter.dart';
import 'package:creat_task/colors.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class task_item extends StatelessWidget {
  const task_item({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: task.color == 0
              ? ColorP.primary
              : (task.color == 1)
                  ? ColorP.orang
                  : (task.color == 2)
                      ? ColorP.pink
                      : Colors.green,
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
                    task.title,
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
                        "${task.starttime}:${task.endtime}",
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
                    task.note,
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
                task.iscomplete ? "Completed" : "To Do",
                style: subtitles(colort: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
