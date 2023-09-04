import 'package:flutter/material.dart';

class RDFutureWidget extends StatefulWidget {
  const RDFutureWidget(this.future, {Key? key, this.loader}) : super(key: key);

  final Future<Widget?> future;

  final Widget? loader;
  @override
  State<RDFutureWidget> createState() => _RDFutureWidgetState();
}

class _RDFutureWidgetState extends State<RDFutureWidget> {
  Widget? _widget;

  @override
  void initState() {
    widget.future.then((widget) {
      setState(() {
        _widget = widget;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _widget ??
        widget.loader ??
        const Center(
          child: CircularProgressIndicator(),
        );
  }
}
