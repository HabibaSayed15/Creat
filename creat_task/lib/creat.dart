import 'package:creat_task/colors.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatT extends StatefulWidget {
  const CreatT({super.key});

  @override
  State<CreatT> createState() => _CreatTState();
}

class _CreatTState extends State<CreatT> {
  var titlecon = TextEditingController();
  var notecon = TextEditingController();
  late DateTime _date;
  // ignore: non_constant_identifier_names
  String? _StartDate;
  String? _endDate;
  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: titles(fontSizeT: 20),
            ),
            TextFormField(
              controller: titlecon,
              validator: (value) {
                if (value!.isEmpty) {
                  return "the title is empty";
                }
                return null;
              },
              decoration: const InputDecoration(hintText: "Enter title "),
            ),
            Text(
              "Note",
              style: titles(fontSizeT: 20),
            ),
            TextFormField(
              controller: notecon,
              validator: (value) {
                if (value!.isEmpty) {
                  return "the note is empty";
                }
                return null;
              },
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Enter note "),
            ),
            Text(
              "Date",
              style: titles(fontSizeT: 20),
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: DateFormat.yMd().format(_date),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        final datepic = await showDatePicker(
                            currentDate: DateTime.now(),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2050));
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
                    style: titles(fontSizeT: 20),
                  ),
                ),
                Expanded(
                  child: Text(
                    "End Time",
                    style: titles(fontSizeT: 20),
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
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final startpic = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );
                              if (startpic != null) {
                                setState(() {
                                  _StartDate = startpic.format(
                                      context); //علشان لما ادوس على اي تاريخ يغيره في الهنت تكست
                                });
                              }
                            },
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: ColorP.primary,
                            )),
                        hintText: _StartDate,
                        hintStyle: smalltitles()),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            final endpic = await showTimePicker(
                                initialTime: TimeOfDay.now(), context: context);
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
            )
          ],
        ),
      ),
    ));
  }
}
