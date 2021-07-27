part of '../mpcore.dart';

MPElement _encodeOffstage(Element element) {
  final widget = element.widget as Offstage;
  return MPElement(
    hashCode: element.hashCode,
    flutterElement: element,
    name: 'offstage',
    children: MPElement.childrenFromFlutterElement(element),
    // ignore: invalid_use_of_protected_member
    constraints: element.findRenderObject()?.constraints,
    attributes: {
      'offstage': widget.offstage,
    },
  );
}

MPElement _encodeSliverOffstage(Element element) {
  final widget = element.widget as SliverOffstage;
  return MPElement(
    hashCode: element.hashCode,
    flutterElement: element,
    name: 'offstage',
    children: MPElement.childrenFromFlutterElement(element),
    // ignore: invalid_use_of_protected_member
    constraints: element.findRenderObject()?.constraints,
    attributes: {
      'offstage': widget.offstage,
    },
  );
}
