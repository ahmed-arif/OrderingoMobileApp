import 'package:com_unrealprogrammer_orderingo/models/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersTable extends StatelessWidget {
  final List<Orders> orders;
  final double mainRowChildrenVerticalPadding = 5.0;
  final List<TableRow> allRows = [];
  var isready = false.obs;
  OrdersTable(this.orders, {Key? key}) : super(key: key) {
    TextStyle mainRowHeadingStyle = const TextStyle(
      fontWeight: FontWeight.bold,
    );
    TableRow firstRow = TableRow(
      decoration: BoxDecoration(color: Colors.grey[300]),
      children: [
        Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mainRowChildrenVerticalPadding),
            child: Text(
              "Dish",
              style: mainRowHeadingStyle,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mainRowChildrenVerticalPadding),
            child: Text(
              "Size",
              style: mainRowHeadingStyle,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mainRowChildrenVerticalPadding),
            child: Text(
              "Quantity",
              style: mainRowHeadingStyle,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mainRowChildrenVerticalPadding),
            child: Text(
              "Price",
              style: mainRowHeadingStyle,
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding:
        //         EdgeInsets.symmetric(vertical: mainRowChildrenVerticalPadding),
        //     child: Text(
        //       "Done",
        //       style: mainRowHeadingStyle,
        //     ),
        //   ),
        // ),
      ],
    );
    allRows.add(firstRow);
  }

  @override
  Widget build(BuildContext context) {
    allRows.addAll(orders.map((Orders _orders) {
      //    isready.value = _orders.isDone == "true" ? true : false;
      return _servicesTableRow(_orders);
    }));

    return Table(
      border: TableBorder.all(
        color: Colors.grey,
      ),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        //  4: FlexColumnWidth(1)
      },
      children: allRows,
    );
  }

  TableRow _servicesTableRow(Orders orders) {
    const double verticalPadding = 5.0;
    const double horizontalPadding = 5.0;

    return TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Text(
              orders.name,
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Text(
              "Large",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Text(
              '2',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            child: Text(
              orders.totalAmount.toString(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        // Obx(() {
        //   return Center(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(
        //         // vertical: verticalPadding,
        //         horizontal: horizontalPadding,
        //       ),
        //       child: Checkbox(
        //         value: isready.value,
        //         checkColor: const Color.fromARGB(255, 198, 83, 37),
        //         activeColor: Colors.white,
        //         onChanged: (value) {
        //           isready.value = value!;
        //           s.isDone = isready.value.toString();
        //         },
        //       ),
        //     ),
        //   );
        // })
      ],
    );
  }
}
