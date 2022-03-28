// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final Stream<QuerySnapshot> historyStream =
      FirebaseFirestore.instance.collection('history').snapshots();

  // For Deleting User
  CollectionReference history =
      FirebaseFirestore.instance.collection('history');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment History"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: historyStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Something went Wrong');
            } else if (snapshot.hasData) {
              final List storedocs = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a = document.data() as Map<String, dynamic>;
                storedocs.add(a);
                a["id"] = document.id;
              }).toList();

              return Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      1: FixedColumnWidth(160),
                      2: FixedColumnWidth(130),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              color: Colors.blue,
                              child: const Center(
                                child: Text(
                                  'Payment Date',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: Colors.blue,
                              child: const Center(
                                child: Text(
                                  'Paid Amt',
                                  style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var i = 0; i < storedocs.length; i++) ...[
                        TableRow(
                          children: [
                            TableCell(
                              child: Center(
                                  child: Text(storedocs[i]['payment date'],
                                      style: const TextStyle(fontSize: 20.0))),
                            ),
                            TableCell(
                              child: Center(
                                  child: Text(
                                      storedocs[i]['payment history']
                                          .toString(),
                                      style: const TextStyle(fontSize: 20.0))),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
