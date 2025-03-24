import 'package:flutter/material.dart';

class BaiTap1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bài Tập 1 của Như Quỳnh"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Open AlertDialog"),
          onPressed: () {
            openMyAlertDialog(context);
          },
        ),
      ),
    );
  }
}

void openMyAlertDialog(BuildContext context) {
  // Create an AlertDialog
  AlertDialog dialog = AlertDialog(
    title: Text("Confirm"),
    content: Text("Are you sure to remove this item?"),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.green, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    actions: [
      ElevatedButton(
        child: Text("Yes Delete"),
        onPressed: () {
          Navigator.of(context).pop(true); // Return true
        },
      ),
      ElevatedButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.of(context).pop(false); // Return false
        },
      ),
    ],
  );

  // Call showDialog function and handle the future value
  Future<bool?> futureValue = showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );

  futureValue.then((value) {
    if (value != null) {
      // Handle the value (true/false)
      print("Return value: ${value.toString()}");
      if (value) {
        // Logic when confirmed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Item deleted.")),
        );
      } else {
        // Logic when cancelled
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Deletion cancelled.")),
        );
      }
    } else {
      print("Dialog dismissed without a selection.");
    }
  }).catchError((error) {
    print("An error occurred: $error");
  });
}
