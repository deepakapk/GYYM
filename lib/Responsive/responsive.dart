import 'package:flutter/material.dart';

class ResponsiveScreen extends StatefulWidget {
  final Widget webScreen;
  final Widget mobScreen;
  const ResponsiveScreen(
      {super.key, required this.webScreen, required this.mobScreen});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return widget.webScreen;
      } else {
        return widget.mobScreen;
      }
    });
  }
}
