import 'dart:async';
import 'dart:developer';

import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:enter_engineering_test/blocs/blocs.dart';
import 'package:enter_engineering_test/models/user.dart';
import 'package:enter_engineering_test/ui/screens/auth/login.dart';
import 'package:enter_engineering_test/ui/screens/screens.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatefulWidget {
  static const routeName = 'homeScreen';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  @override
  void initState() {
    final PostBloc postBloc = BlocProvider.of<PostBloc>(context);
    //Posts Bloc
    Future.delayed(const Duration(seconds: 3), () {
      postBloc.add(PostLoadEvent());
    });
    _enableRotation();
    super.initState();
  }

  //Data for Pie diagram
  Map<String, double> dataMap = {
    "2020-2021": 15,
    "2019": 10,
    "2018": 4,
    "2017": 6,
  };

  //Color for Pie diagram
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  //Enable orientation
  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Главная',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return CovidPage();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xffE32227),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: const Center(
                    child: Text(
                      'COVID-19',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  preferences.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return Login();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostLoadedState) {
          return SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Column(
                    children: [
                      //PieChart
                      orientation == Orientation.portrait
                          ? Expanded(
                              child: PieChart(
                                dataMap: dataMap,
                                animationDuration: const Duration(milliseconds: 800),
                                chartLegendSpacing: 32,
                                chartRadius: MediaQuery.of(context).size.height / 3.2,
                                initialAngleInDegree: 0,
                                ringStrokeWidth: 32,
                                centerText: 'Мы создаем будущее',
                                centerTextStyle: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  backgroundColor: Colors.white,
                                ),
                                legendOptions: const LegendOptions(
                                  showLegends: true,
                                  legendPosition: LegendPosition.right,
                                  legendTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      const Center(
                        child: Text(
                          'Данные по годам',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      orientation == Orientation.portrait ? const SizedBox(height: 40) : const SizedBox(height: 15),
                      Expanded(
                        child: DataTable2(
                            columnSpacing: 12,
                            horizontalMargin: 12,
                            minWidth: 600,
                            headingTextStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            dataTextStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            columns: const [
                              DataColumn(
                                label: Text('2017'),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('2018'),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('2019'),
                                numeric: false,
                              ),
                              DataColumn(
                                label: Text('2020-2021'),
                                numeric: false,
                              ),
                            ],
                            rows: const [
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Enter Engineering')),
                                  DataCell(Text('UzLitiy')),
                                  DataCell(Text('Jizzakh Petroleum')),
                                  DataCell(Text('Natural Gas Stream')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('UzLitiy')),
                                  DataCell(Text('Арктикгаз')),
                                  DataCell(Text('Ачимгаз')),
                                  DataCell(Text('Севернефтегазпром')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Лукойл')),
                                  DataCell(Text('Узбекнефтегаз')),
                                  DataCell(Text('Узтрансгаз')),
                                  DataCell(Text('Mitsubishi Heavy Industries')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('АК «Транснефть»')),
                                  DataCell(Text('Hyundai Engineering')),
                                  DataCell(Text('Oltin Yol GTL')),
                                  DataCell(Text('Samarkand Touristic Centre')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Лукойл')),
                                  DataCell(Text('Узбекнефтегаз')),
                                  DataCell(Text('Узтрансгаз')),
                                  DataCell(Text('Mitsubishi Heavy Industries')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('UzLitiy')),
                                  DataCell(Text('Арктикгаз')),
                                  DataCell(Text('Ачимгаз')),
                                  DataCell(Text('Севернефтегазпром')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('АК «Транснефть»')),
                                  DataCell(Text('Hyundai Engineering')),
                                  DataCell(Text('Oltin Yol GTL')),
                                  DataCell(Text('Samarkand Touristic Centre')),
                                ],
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          );
        }

        if (state is PostLoadingState) {
          return const Center(child: CircularProgressIndicator(),);
        }

        if(state is PostErrorState) {
          return const Center(child: Text('Произошал ошибка при загрузке'));
        }

        return const Center(
          child: Text('Ошибка с интернетом, проверьте подключение'),
        );
      }),
    );
  }
}
