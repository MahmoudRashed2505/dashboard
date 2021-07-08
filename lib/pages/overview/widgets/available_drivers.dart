import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Example without datasource
class AvaialabelDrivers extends StatelessWidget {
  const AvaialabelDrivers();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 6),
              color: lightGrey.withOpacity(0.5),
              blurRadius: 0),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Availabel Drivers",
                color: lightGrey,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text('Name'),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('Location'),
              ),
              DataColumn(
                label: Text('Rating'),
              ),
              DataColumn(
                label: Text('Action'),
              ),
            ],
            rows: List<DataRow>.generate(
              7,
              (index) => DataRow(
                cells: [
                  DataCell(CustomText(
                    text: "Mahmoud Rashed",
                  )),
                  DataCell(CustomText(
                    text: "Cairo City",
                  )),
                  DataCell(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: '4.$index',
                      ),
                    ],
                  )),
                  DataCell(
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: active, width: .5),
                        color: light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: CustomText(
                        text: "Availabel Delivery",
                        color: active.withOpacity(.7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
