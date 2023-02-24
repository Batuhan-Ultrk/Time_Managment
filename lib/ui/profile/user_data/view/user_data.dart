import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserData extends ConsumerWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.red,
      height: 250,
      width: 250,
    );
  }
}
