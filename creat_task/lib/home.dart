import 'package:creat_task/colors.dart';
import 'package:creat_task/creat.dart';
import 'package:creat_task/task_item.dart';
import 'package:creat_task/text_style.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,Habiba",
                      style: titles(fontSizeT: 24, colort: ColorP.primary),
                    ),
                    Text(
                      "Have, A Nice Day",
                      style: subtitles(colort: ColorP.black),
                    )
                  ],
                ),
                const Spacer(), //بيبعد الي جوا الرو يخلي واحد شمال وواحد يمين
                CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorP.primary,
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.MMMMEEEEd().format(DateTime
                          .now()), //intl استخدمت الديت فورمات علشان اعدل على الشكل الي هيظهر بيه التاريخ و دي بنزلها سيتديبارتي اسمها
                      style: titles(fontSizeT: 20, colort: ColorP.black),
                    ),
                    Text(
                      "Today",
                      style: titles(fontSizeT: 20),
                    )
                  ],
                ),
                //بيبعد الي جوا الرو يخلي واحد شمال وواحد يمين
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreatT(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorP.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fixedSize: const Size(110, 50)),
                  child: const Text("+ Add task"),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: ColorP.primary,
              selectedTextColor: Colors.white,
              height: 100,
              width: 85,
              //locale: "ar_eg",لو عايزه احول الكلام الي جوا عربي
              onDateChange: (date) {
                // New date selected
                setState(() {
                  // _selectedValue = date;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return const task_item();
                },
                itemCount: 10),
          )
        ],
      ),
    ));
  }
}
