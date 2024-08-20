import 'package:flutter/material.dart';

import '../../../../providers/my_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheet();
}

class _ThemeBottomSheet extends State<ThemeBottomSheet> {

  late MyProvider myProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:  MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          selectedWidget('فاتح', context),
          const Spacer(),
          unSelectedWidget('غامق', context),
          const Spacer(),
        ],
      ),
    );
  }

  Widget selectedWidget(String text, BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        const Expanded(
            child: SizedBox(
              width: double.infinity,
            )),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.background,
        )
      ],
    );
  }

  Widget unSelectedWidget(String text, BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
