import 'dart:io';

import 'package:adaptive_date_picker/src/extensions/context.extension.dart';
import 'package:adaptive_date_picker/src/extensions/widget.extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final ValueSetter<DateTime?>? onChanged;
  final DatePickerType _type;
  final DateTime? initial;
  final DateTime? minimum;
  final DateTime? maximum;

  const DatePicker({
    super.key,
    this.onChanged,
    required DatePickerType type,
    this.initial,
    this.minimum,
    this.maximum,
  }) : _type = type;

  DatePicker.adaptive({
    super.key,
    this.onChanged,
    this.initial,
    this.minimum,
    this.maximum,
  }) : _type = Platform.isIOS ? DatePickerType.iOS : DatePickerType.android;

  const DatePicker.iOS({
    super.key,
    this.onChanged,
    this.initial,
    this.minimum,
    this.maximum,
  }) : _type = DatePickerType.iOS;

  const DatePicker.android({
    super.key,
    this.onChanged,
    this.initial,
    this.minimum,
    this.maximum,
  }) : _type = DatePickerType.android;

  @override
  Widget build(BuildContext context) {
    return const Text('Press').textButton(() => showPicker(context));
  }

  void showPicker(BuildContext context) async {
    if (_type == DatePickerType.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoDatePicker(
            initialDateTime: initial,
            minimumDate: minimum,
            maximumDate: maximum,
            onDateTimeChanged: (dateTime) => onChanged?.call(dateTime),
          ).container(
            constraints: BoxConstraints(maxHeight: context.deviceHeight * 0.3),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground.resolveFrom(context),
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      );

      return;
    }

    final dateTime = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: minimum ?? DateTime.now(),
      lastDate: maximum ?? DateTime.now().add(const Duration(days: 365)),
    );

    return onChanged?.call(dateTime);
  }
}

enum DatePickerType { iOS, android, adaptive }
