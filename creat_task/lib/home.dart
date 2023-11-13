import 'dart:io';

import 'package:creat_task/adapter.dart';
import 'package:creat_task/colors.dart';
import 'package:creat_task/creat.dart';
import 'package:creat_task/profial.dart';
import 'package:creat_task/storage.dart';
import 'package:creat_task/task_item.dart';
import 'package:creat_task/text_style.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedValue = DateTime.now();
  // late Box<bool> modebox;
  @override
  // void initState() {
  //   super.initState();
  //   modebox = Hive.box('mode');
  // }

  @override
  Widget build(BuildContext context) {
    // bool isdark = modebox.get('darkmode')!;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     Switch(
      //         value: isdark,
      //         onChanged: (val) {
      //           setState(() {
      //             modebox.put('darkmode', !isdark);
      //           });
      //         })
      //   ],
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: AppLocal.getData(AppLocal.Name_Key),
                      builder: (context, snapshot) {
                        return Text(
                          "Hello,${snapshot.data?.split(' ').first}",
                          style: titles(fontSizeT: 24, colort: ColorP.primary),
                        );
                      },
                    ),
                    Text(
                      "Have, A Nice Day",
                      style: subtitles(),
                    )
                  ],
                ),
                const Spacer(), //بيبعد الي جوا الرو يخلي واحد شمال وواحد يمين
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileView(),
                      ));
                    },
                    child: FutureBuilder(
                        future: AppLocal.getData(AppLocal.Image_Key),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                              radius: 26,
                              backgroundColor: ColorP.primary,
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage:
                                    FileImage(File(snapshot.data!)),
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorP.primary,
                              child: const CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          }
                        }))
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
                      style: titles(
                          colort: Theme.of(context).primaryColor,
                          fontSizeT:
                              20), //titles(fontSizeT: 20, colort: ColorP.black),
                    ),
                    Text(
                      "Today",
                      style: titles(
                          colort: Theme.of(context).primaryColor,
                          fontSizeT: 20), //(fontSizeT: 20),
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
              initialSelectedDate: _selectedValue,
              selectionColor: ColorP.primary,
              selectedTextColor: Colors.white,
              dateTextStyle: const TextStyle()
                  .copyWith(color: Theme.of(context).primaryColor),
              monthTextStyle: const TextStyle()
                  .copyWith(color: Theme.of(context).primaryColor),
              dayTextStyle: const TextStyle()
                  .copyWith(color: Theme.of(context).primaryColor),
              height: 100,
              width: 85,
              //locale: "ar_eg",لو عايزه احول الكلام الي جوا عربي
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
          ),
          ValueListenableBuilder(
              valueListenable: Hive.box<Task>("task").listenable(),
              builder: (context, Box<Task> value, child) {
                if (value.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/empty.png",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You do not have any task yet!",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Add new tasks to make your days productive",
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                  );
                } else {
                  List<Task> tasks = value.values.where((element) {
                    return element.date.split("T").first ==
                        _selectedValue.toIso8601String().split("T").first;
                  }).toList();
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          Task item = tasks[index]; //value.getAt(index)!;
                          return Dismissible(
                            key: UniqueKey(),
                            secondaryBackground: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Delet",
                                      style: subtitles(colort: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            background: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Complete",
                                      style: subtitles(colort: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            child: task_item(
                              task: item,
                            ),
                            onDismissed: (direction) {
                              if (direction == DismissDirection.startToEnd) {
                                value.put(
                                    "${item.title}  ${item.date}",
                                    Task(
                                        id: "${item.title}  ${item.date}",
                                        title: item.title,
                                        note: item.note,
                                        date: item.date,
                                        starttime: item.starttime,
                                        endtime: item.endtime,
                                        color: 3,
                                        iscomplete: true));
                              } else {
                                value.delete("${item.title}  ${item.date}");
                              }
                            },
                          );
                        },
                        itemCount: tasks.length),
                  );
                }
              })
        ],
      ),
    ));
  }
}
