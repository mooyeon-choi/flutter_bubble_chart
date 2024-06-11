import 'bubble_node.dart';
import 'package:flutter/material.dart';

class BubbleLayer extends StatelessWidget {
  final BubbleNode? bubble;

  const BubbleLayer({this.bubble});

  onTap() {
    if (bubble?.options?.onTap != null) bubble?.options?.onTap!();
  }

  onLongPress() {
    if (bubble?.options?.onLongPress != null) bubble?.options?.onLongPress!();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(bubble!.radius! * 2),
        child: InkResponse(
          borderRadius: BorderRadius.circular(bubble!.radius! * 2),
          onTap: onTap,
          onLongPress: onLongPress,
          child: Container(
            width: bubble!.radius! * 2,
            height: bubble!.radius! * 2,
            decoration: BoxDecoration(
              border: bubble!.options?.border ?? Border(),
              color: bubble!.options?.color ?? Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: bubble!.options?.child ?? Container(),
            ),
          ),
        ));
  }
}
