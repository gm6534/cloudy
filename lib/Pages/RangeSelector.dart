import 'package:flutter/material.dart';

class RangeSelectorScreen extends StatefulWidget {
  const RangeSelectorScreen({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<RangeSelectorScreen> createState() => _RangeSelectorScreenState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _RangeSelectorScreenState extends State<RangeSelectorScreen>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTimeN _startDate = RestorableDateTimeN(DateTime.now());
  final RestorableDateTimeN _endDate = RestorableDateTimeN(DateTime(2030));
  late final RestorableRouteFuture<DateTimeRange?>
      _restorableDateRangePickerRouteFuture =
      RestorableRouteFuture<DateTimeRange?>(
    onComplete: _selectDateRange,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator
          .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
        'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
        'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
      });
    },
  );

  void _selectDateRange(DateTimeRange? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _startDate.value = newSelectedDate.start;
        _endDate.value = newSelectedDate.end;
      });
    }
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_startDate, 'start_date');
    registerForRestoration(_endDate, 'end_date');
    registerForRestoration(
        _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
  }

  static Route<DateTimeRange?> _dateRangePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTimeRange?>(
      context: context,
      builder: (BuildContext context) {
        return DateRangePickerDialog(
          restorationId: 'date_picker_dialog',
          initialDateRange:
              _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
          firstDate: DateTime.now(),
          currentDate: DateTime(2022, 1, 25),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
    if (arguments['initialStartDate'] != null &&
        arguments['initialEndDate'] != null) {
      return DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialStartDate'] as int),
        end: DateTime.fromMillisecondsSinceEpoch(
            arguments['initialEndDate'] as int),
      );
    }

    return null;
  }

  // Map<String, dynamic> map = {
  //  'val1' : false,
  //  'val2' : false,
  //  'val3' : false,
  //  'val4' : false,
  //  'val5' : false,
  //  'val6' : false,
  //  'val7' : false,
  //  'val8' : false,
  //  'val9' : false,
  //  'val10' : false,
  //  'val11' : false,
  //  'val12' : false,
  //  'val13' : false,
  //  'val14' : false,
  //  'val15' : false,
  //  'val16' : false,
  //  'val17' : false,
  //  'val18' : false,
  //  'val19' : false,
  //  'val20' : false,
  //  'val21' : false,
  //  'val22' : false,
  //  'val23' : false,
  //  'val24' : false,
  //  'val25' : false,
  //  'val26' : false,
  //  'val27' : false,
  //  'val28' : false,
  //  'val29' : false,
  //  'val30' : false,
  //  'val31' : false,
  //  'val32' : false,
  //  'val33' : false,
  //  'val34' : false,
  //  'val35' : false,
  //  'val36' : false,
  //  'val37' : false,
  //  'val38' : false,
  //  'val39' : false,
  //  'val40' : false,
  //  'val41' : false,
  //  'val42' : false,
  //  'val43' : false,
  //  'val44' : false,
  //  'val45' : false,
  // };

  bool val1 = false;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  bool val5 = false;
  bool val6 = false;
  bool val7 = false;
  bool val8 = false;
  bool val9 = false;
  bool val10 = false;
  bool val11 = false;
  bool val12 = false;
  bool val13 = false;
  bool val14 = false;
  bool val15 = false;
  bool val16 = false;
  bool val17 = false;
  bool val18 = false;
  bool val19 = false;
  bool val20 = false;
  bool val21 = false;
  bool val22 = false;
  bool val23 = false;
  bool val24 = false;
  bool val25 = false;
  bool val26 = false;
  bool val27 = false;
  bool val28 = false;
  bool val29 = false;
  bool val30 = false;
  bool val31 = false;
  bool val32 = false;
  bool val33 = false;
  bool val34 = false;
  bool val35 = false;
  bool val36 = false;
  bool val37 = false;
  bool val38 = false;
  bool val39 = false;
  bool val40 = false;
  bool val41 = false;
  bool val42 = false;
  bool val43 = false;
  bool val44 = false;
  bool val45 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule YourSelf", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Select Date Range", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade800, fontSize: 18),),
              OutlinedButton(
                onPressed: () {
                  _restorableDateRangePickerRouteFuture.present();
                },
                child: Text(_startDate.value!.toString().substring(0, 10) +
                    " - " +
                    _endDate.value!.toString().substring(0, 10)),
              ),
              Text("Select Time Slots", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade800, fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  defaultVerticalAlignment:
                  TableCellVerticalAlignment.middle,
                  // defaultColumnWidth: const FixedColumnWidth(50),
                  border: TableBorder.all(),
                  children: [
                    const TableRow(
                        decoration: BoxDecoration(color: Colors.grey),
                        children: [
                          Text("Start", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                          Text("End", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          Text("Mon", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          Text("Tue", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          Text("Wed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          Text("Thu", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          Text("Fri", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ]),
                    TableRow(children: [
                      const Text("9:00 AM",textAlign: TextAlign.center,),
                      const Text("10:00 AM",textAlign: TextAlign.center,),
                      Checkbox(value: val1,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val1 = value!;
                            });
                          }),
                      Checkbox(value: val2,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val2 = value!;
                            });
                          }),
                      Checkbox(value: val3,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val3 = value!;
                            });
                          }),
                      Checkbox(value: val4,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val4 = value!;
                            });
                          }),
                      Checkbox(value: val5,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val5 = value!;
                            });
                          }),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300),
                        children: [
                          const Text("10:00 AM",textAlign: TextAlign.center,),
                          const Text("11:00 AM",textAlign: TextAlign.center,),
                          Checkbox(value: val6,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val6 = value!;
                                });
                              }),
                          Checkbox(value: val7,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val7 = value!;
                                });
                              }),
                          Checkbox(value: val8,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val8 = value!;
                                });
                              }),
                          Checkbox(value: val9,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val9 = value!;
                                });
                              }),
                          Checkbox(value: val10,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val10 = value!;
                                });
                              }),
                        ]),
                    TableRow(children: [
                      const Text("11:00 AM",textAlign: TextAlign.center,),
                      const Text("12:00 PM",textAlign: TextAlign.center,),
                      Checkbox(value: val11,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val11 = value!;
                            });
                          }),
                      Checkbox(value: val12,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val12 = value!;
                            });
                          }),
                      Checkbox(value: val13,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val13 = value!;
                            });
                          }),
                      Checkbox(value: val14,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val14 = value!;
                            });
                          }),
                      Checkbox(value: val15,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val15 = value!;
                            });
                          }),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300),
                        children: [
                          const Text("12:00 PM",textAlign: TextAlign.center,),
                          const Text("1:00 PM",textAlign: TextAlign.center,),
                          Checkbox(value: val16,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val16 = value!;
                                });
                              }),
                          Checkbox(value: val17,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val17 = value!;
                                });
                              }),
                          Checkbox(value: val18,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val18 = value!;
                                });
                              }),
                          Checkbox(value: val19,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val19 = value!;
                                });
                              }),
                          Checkbox(value: val20,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val20 = value!;
                                });
                              }),
                        ]),
                    TableRow(children: [
                      const Text("1:00 PM",textAlign: TextAlign.center,),
                      const Text("2:00 PM",textAlign: TextAlign.center,),
                      Checkbox(value: val21,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val21 = value!;
                            });
                          }),
                      Checkbox(value: val22,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val22 = value!;
                            });
                          }),
                      Checkbox(value: val23,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val23 = value!;
                            });
                          }),
                      Checkbox(value: val24,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val24 = value!;
                            });
                          }),
                      Checkbox(value: val25,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val25 = value!;
                            });
                          }),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300),
                        children: [
                          const Text("2:00 PM",textAlign: TextAlign.center,),
                          const Text("3:00 PM",textAlign: TextAlign.center,),
                          Checkbox(value: val26,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val26 = value!;
                                });
                              }),
                          Checkbox(value: val27,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val27 = value!;
                                });
                              }),
                          Checkbox(value: val28,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val28 = value!;
                                });
                              }),
                          Checkbox(value: val29,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val29 = value!;
                                });
                              }),
                          Checkbox(value: val30,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val30 = value!;
                                });
                              }),
                        ]),
                    TableRow(children: [
                      const Text("3:00 PM",textAlign: TextAlign.center,),
                      const Text("4:00 PM",textAlign: TextAlign.center,),
                      Checkbox(value: val31,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val31 = value!;
                            });
                          }),
                      Checkbox(value: val32,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val32 = value!;
                            });
                          }),
                      Checkbox(value: val33,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val33 = value!;
                            });
                          }),
                      Checkbox(value: val34,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val34 = value!;
                            });
                          }),
                      Checkbox(value: val35,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val35 = value!;
                            });
                          }),
                    ]),
                    TableRow(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300),
                        children: [
                          const Text("4:00 PM",textAlign: TextAlign.center,),
                          const Text("5:00 PM",textAlign: TextAlign.center,),
                          Checkbox(value: val36,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val36 = value!;
                                });
                              }),
                          Checkbox(value: val37,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val37 = value!;
                                });
                              }),
                          Checkbox(value: val38,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val38 = value!;
                                });
                              }),
                          Checkbox(value: val39,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val39 = value!;
                                });
                              }),
                          Checkbox(value: val40,
                              onChanged: (value) {
                                setState(() {
                                  // print(isChecked);
                                  val40 = value!;
                                });
                              }),
                        ]),
                    TableRow(children: [
                      const Text("5:00 PM",textAlign: TextAlign.center,),
                      const Text("6:00 PM",textAlign: TextAlign.center,),
                      Checkbox(value: val41,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val41 = value!;
                            });
                          }),
                      Checkbox(value: val42,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val42 = value!;
                            });
                          }),
                      Checkbox(value: val43,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val43 = value!;
                            });
                          }),
                      Checkbox(value: val44,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val44 = value!;
                            });
                          }),
                      Checkbox(value: val45,
                          onChanged: (value) {
                            setState(() {
                              // print(isChecked);
                              val45 = value!;
                            });
                          }),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width*0.5, 40))),
                  onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(

                        content: CustomAlertDialogue(),
                      );
                    });
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 18),)),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
   CustomAlertDialogue(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Selected Date Range", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade800, fontSize: 18),),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.teal.shade800),
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(_startDate.value!.toString().substring(0, 10) +
                  " - " +
                  _endDate.value!.toString().substring(0, 10), style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(height: 10,),
          Text("Selected Time Slots", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal.shade800, fontSize: 18),),
          SizedBox(height: 10,),
          Table(
            defaultVerticalAlignment:
            TableCellVerticalAlignment.middle,
            // defaultColumnWidth: const FixedColumnWidth(50),
            border: TableBorder.all(),
            children: [
              const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Text("Start", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                    Text("End", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text("Mon", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text("Tue", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text("Wed", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text("Thu", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text("Fri", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ]),
              TableRow(children: [
                const Text("9:00 AM",textAlign: TextAlign.center,),
                const Text("10:00 AM",textAlign: TextAlign.center,),
                Checkbox(value: val1,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val1 != value!;
                      });
                    }),
                Checkbox(value: val2,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val2 != value!;
                      });
                    }),
                Checkbox(value: val3,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val3 != value!;
                      });
                    }),
                Checkbox(value: val4,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val4 != value!;
                      });
                    }),
                Checkbox(value: val5,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val5 != value!;
                      });
                    }),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300),
                  children: [
                    const Text("10:00 AM",textAlign: TextAlign.center,),
                    const Text("11:00 AM",textAlign: TextAlign.center,),
                    Checkbox(value: val6,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val6 != value!;
                          });
                        }),
                    Checkbox(value: val7,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val7 != value!;
                          });
                        }),
                    Checkbox(value: val8,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val8 != value!;
                          });
                        }),
                    Checkbox(value: val9,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val9 != value!;
                          });
                        }),
                    Checkbox(value: val10,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val10 != value!;
                          });
                        }),
                  ]),
              TableRow(children: [
                const Text("11:00 AM",textAlign: TextAlign.center,),
                const Text("12:00 PM",textAlign: TextAlign.center,),
                Checkbox(value: val11,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val11 != value!;
                      });
                    }),
                Checkbox(value: val12,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val12 != value!;
                      });
                    }),
                Checkbox(value: val13,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val13 != value!;
                      });
                    }),
                Checkbox(value: val14,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val14 != value!;
                      });
                    }),
                Checkbox(value: val15,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val15 != value!;
                      });
                    }),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300),
                  children: [
                    const Text("12:00 PM",textAlign: TextAlign.center,),
                    const Text("1:00 PM",textAlign: TextAlign.center,),
                    Checkbox(value: val16,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val16 != value!;
                          });
                        }),
                    Checkbox(value: val17,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val17 != value!;
                          });
                        }),
                    Checkbox(value: val18,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val18 != value!;
                          });
                        }),
                    Checkbox(value: val19,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val19 != value!;
                          });
                        }),
                    Checkbox(value: val20,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val20 != value!;
                          });
                        }),
                  ]),
              TableRow(children: [
                const Text("1:00 PM",textAlign: TextAlign.center,),
                const Text("2:00 PM",textAlign: TextAlign.center,),
                Checkbox(value: val21,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val21 != value!;
                      });
                    }),
                Checkbox(value: val22,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val22 != value!;
                      });
                    }),
                Checkbox(value: val23,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val23 != value!;
                      });
                    }),
                Checkbox(value: val24,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val24 != value!;
                      });
                    }),
                Checkbox(value: val25,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val25 != value!;
                      });
                    }),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300),
                  children: [
                    const Text("2:00 PM",textAlign: TextAlign.center,),
                    const Text("3:00 PM",textAlign: TextAlign.center,),
                    Checkbox(value: val26,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val26 != value!;
                          });
                        }),
                    Checkbox(value: val27,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val27 != value!;
                          });
                        }),
                    Checkbox(value: val28,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val28 != value!;
                          });
                        }),
                    Checkbox(value: val29,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val29 != value!;
                          });
                        }),
                    Checkbox(value: val30,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val30 != value!;
                          });
                        }),
                  ]),
              TableRow(children: [
                const Text("3:00 PM",textAlign: TextAlign.center,),
                const Text("4:00 PM",textAlign: TextAlign.center,),
                Checkbox(value: val31,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val31 != value!;
                      });
                    }),
                Checkbox(value: val32,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val32 != value!;
                      });
                    }),
                Checkbox(value: val33,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val33 != value!;
                      });
                    }),
                Checkbox(value: val34,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val34 != value!;
                      });
                    }),
                Checkbox(value: val35,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val35 != value!;
                      });
                    }),
              ]),
              TableRow(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300),
                  children: [
                    const Text("4:00 PM",textAlign: TextAlign.center,),
                    const Text("5:00 PM",textAlign: TextAlign.center,),
                    Checkbox(value: val36,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val36 != value!;
                          });
                        }),
                    Checkbox(value: val37,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val37 != value!;
                          });
                        }),
                    Checkbox(value: val38,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val38 != value!;
                          });
                        }),
                    Checkbox(value: val39,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val39 != value!;
                          });
                        }),
                    Checkbox(value: val40,
                        onChanged: (value) {
                          setState(() {
                            // print(isChecked);
                            val40 != value!;
                          });
                        }),
                  ]),
              TableRow(children: [
                const Text("5:00 PM",textAlign: TextAlign.center,),
                const Text("6:00 PM",textAlign: TextAlign.center,),
                Checkbox(value: val41,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val41 != value!;
                      });
                    }),
                Checkbox(value: val42,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val42 != value!;
                      });
                    }),
                Checkbox(value: val43,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val43 != value!;
                      });
                    }),
                Checkbox(value: val44,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val44 != value!;
                      });
                    }),
                Checkbox(value: val45,
                    onChanged: (value) {
                      setState(() {
                        // print(isChecked);
                        val45 != value!;
                      });
                    }),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
