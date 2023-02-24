import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomContainerWidget extends ConsumerWidget {
  const BottomContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 40, 41, 69),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            blurStyle: BlurStyle.normal,
            color: Colors.black87,
          )
        ],
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(80),
          right: Radius.circular(80),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    blurStyle: BlurStyle.normal,
                    color: Colors.white,
                  )
                ],
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/images/time_management_logo.png",
                  height: 80),
            ),
            label: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Seda Irmak"),
                Text("Bugün 6 görev tamamlandı"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
