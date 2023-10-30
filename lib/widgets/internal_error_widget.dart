import 'package:flutter/material.dart';

class InternalExceptionWidget extends StatefulWidget {
  const InternalExceptionWidget({super.key});

  @override
  State<InternalExceptionWidget> createState() =>
      _InternalExceptionWidgetState();
}

class _InternalExceptionWidgetState extends State<InternalExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Text("Error"),
    );
  }
}
