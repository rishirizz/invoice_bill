import 'package:flutter/material.dart';

class ProgressHUD extends StatelessWidget {
  final Widget? child;
  final bool? inAsyncCall;
  final double? opacity;
  final Color? color;
  final Animation<Color>? valueColor;

  const ProgressHUD({
    Key? key,
    @required this.child,
    @required this.inAsyncCall,
    this.opacity = 0.8,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child!);
    if (inAsyncCall!) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity!,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(
            child: CircularProgressIndicator(
                backgroundColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.black54)),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
