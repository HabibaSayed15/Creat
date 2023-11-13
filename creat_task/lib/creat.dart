import 'package:creat_task/adapter.dart';
import 'package:creat_task/colors.dart';
import 'package:creat_task/home.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class CreatT extends StatefulWidget {
  const CreatT({super.key});

  @override
  State<CreatT> createState() => _CreatTState();
}

class _CreatTState extends State<CreatT> {
  var titlecon = TextEditingController();
  var notecon = TextEditingController();
  late DateTime _date = DateTime.now();
  // ignore: non_constant_identifier_names
  String _StartDate = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endDate = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();

  int _selectcolor = 0;
  var formKey = GlobalKey<FormState>();

  late Box<Task> box;
  @override
  void initState() {
    super.initState();
    box = Hive.box("task");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ColorP.primary,
            )),
        title: Text(
          "Add Task",
          style: titles(colort: ColorP.primary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: titles(
                      colort: Theme.of(context).primaryColor, fontSizeT: 20),
                ),
                TextFormField(
                  cursorColor: Theme.of(context).primaryColor,
                  controller: titlecon,
                  style: subtitles(colort: Theme.of(context).primaryColor),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "the title is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter title ",
                    hintStyle:
                        smalltitles(colort: Theme.of(context).primaryColor),
                  ),
                ),
                Text(
                  "Note",
                  style: titles(
                      colort: Theme.of(context).primaryColor, fontSizeT: 20),
                ),
                TextFormField(
                  controller: notecon,
                  cursorColor: Theme.of(context).primaryColor,
                  style: smalltitles(colort: Theme.of(context).primaryColor),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "the note is empty";
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Enter note ",
                    hintStyle:
                        smalltitles(colort: Theme.of(context).primaryColor),
                  ),
                ),
                Text(
                  "Date",
                  style: titles(
                      colort: Theme.of(context).primaryColor, fontSizeT: 20),
                ),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: DateFormat.yMd().format(_date),
                      hintStyle: smalltitles(
                        colort: Theme.of(context).primaryColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            final datepic = await showDatePicker(
                              currentDate: DateTime.now(),
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData(
                                      dialogBackgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      datePickerTheme: DatePickerThemeData(
                                          headerForegroundColor: Colors.white,
                                          yearForegroundColor:
                                              MaterialStatePropertyAll(
                                                  Theme.of(context)
                                                      .primaryColor)),
                                      colorScheme: ColorScheme.light(
                                        primary: ColorP
                                            .primary, // header background color
                                        onPrimary: Theme.of(context)
                                            .primaryColor, // header text color
                                        onSurface: Theme.of(context)
                                            .primaryColor, // body text color
                                      ),
                                      // colorScheme: ColorScheme.light(
                                      //   primary: ColorP.primary,
                                      //   onPrimary:
                                      //       Theme.of(context).primaryColor,
                                      //   onSurface: ColorP.primary,
                                      // ),
                                      textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                              foregroundColor:
                                                  ColorP.primary))),
                                  child: child!,
                                );
                              },
                            );

                            if (datepic != null) {
                              setState(() {
                                _date =
                                    datepic; //علشان لما ادوس على اي تاريخ يغيره في الهنت تكست
                              });
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: ColorP.primary,
                          ))),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Start Time",
                        style: titles(
                            colort: Theme.of(context).primaryColor,
                            fontSizeT: 20),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "End Time",
                        style: titles(
                            colort: Theme.of(context).primaryColor,
                            fontSizeT: 20),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: smalltitles(
                            colort: Theme.of(context).primaryColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                final startpic = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData(
                                          timePickerTheme: TimePickerThemeData(
                                              helpTextStyle: TextStyle(
                                                  color: ColorP.primary),
                                              backgroundColor: Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                          colorScheme: ColorScheme.light(
                                            background: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            primary: ColorP
                                                .primary, // header background color
                                            secondary:
                                                Theme.of(context).primaryColor,
                                            onSecondary:
                                                Theme.of(context).primaryColor,
                                            onPrimary: Theme.of(context)
                                                .primaryColor, // header text color
                                            onSurface: Theme.of(context)
                                                .primaryColor, // body text color
                                            surface: Theme.of(context)
                                                .primaryColor, // body text color
                                          ),
                                          // colorScheme: ColorScheme.light(
                                          //   primary: ColorP.primary,
                                          //   onPrimary:
                                          //       Theme.of(context).primaryColor,
                                          //   onSurface: ColorP.primary,
                                          // ),
                                          textButtonTheme: TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      ColorP.primary))),
                                      child: child!,
                                    );
                                  },
                                );
                                if (startpic != null) {
                                  setState(() {
                                    _StartDate = startpic.format(context);
                                    int plusmin = startpic.minute + 15;
                                    _endDate = startpic
                                        .replacing(minute: plusmin)
                                        .format(context);
                                    //علشان لما ادوس على اي تاريخ يغيره في الهنت تكست
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: ColorP.primary,
                              )),
                          hintText: _StartDate,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: smalltitles(
                            colort: Theme.of(context).primaryColor,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                final endpic = await showTimePicker(
                                  initialTime: TimeOfDay.now(),
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData(
                                          timePickerTheme: TimePickerThemeData(
                                              helpTextStyle: TextStyle(
                                                  color: ColorP.primary),
                                              backgroundColor: Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                          colorScheme: ColorScheme.light(
                                            background: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            primary: ColorP
                                                .primary, // header background color
                                            secondary:
                                                Theme.of(context).primaryColor,
                                            onSecondary:
                                                Theme.of(context).primaryColor,
                                            onPrimary: Theme.of(context)
                                                .primaryColor, // header text color
                                            onSurface: Theme.of(context)
                                                .primaryColor, // body text color
                                            surface:
                                                Theme.of(context).primaryColor,
                                            // colorScheme: ColorScheme.light(
                                            //   primary: ColorP.primary,
                                            //   onPrimary:
                                            //       Theme.of(context).primaryColor,
                                            //   onSurface: ColorP.primary,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      ColorP.primary))),
                                      child: child!,
                                    );
                                  },
                                );
                                if (endpic != null) {
                                  setState(() {
                                    _endDate = endpic.format(
                                        context); //علشان لما ادوس على اي تاريخ يغيره في الهنت تكست
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: ColorP.primary,
                              )),
                          hintText: _endDate,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectcolor = 0;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorP.primary,
                        child: (_selectcolor == 0)
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectcolor = 1;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorP.orang,
                        child: (_selectcolor == 1)
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectcolor = 2;
                        });
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorP.pink,
                        child: (_selectcolor == 2)
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await box.put(
                              "${titlecon.text}  ${_date.toIso8601String()}",
                              Task(
                                  id: "${titlecon.text}  ${_date.toIso8601String()}",
                                  title: titlecon.text,
                                  note: notecon.text,
                                  date: _date.toIso8601String(),
                                  starttime: _StartDate,
                                  endtime: _endDate,
                                  color: _selectcolor,
                                  iscomplete: false));

                          // ignore: use_build_context_synchronously
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorP.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fixedSize: const Size(110, 50)),
                      child: const Text("Creat task"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
