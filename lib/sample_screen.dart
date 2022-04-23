import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SampleScreen extends HookConsumerWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Sample'),
        actions: [
          IconButton(
            onPressed: () {
              showLicensePage(context: context);
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '自動再生',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Center(
              child: Lottie.network(
                'https://assets6.lottiefiles.com/private_files/lf30_zucxicad.json',
                width: 200,
              ),
            ),
            Text(
              'Fabで再生',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Center(
              child: Lottie.network(
                'https://assets1.lottiefiles.com/private_files/lf30_4waq1xr6.json',
                width: 200,
                controller: animationController,
                onLoaded: (composition) {
                  // 再生時間の設定
                  animationController.duration = composition.duration;
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => animationController.forward(from: 0),
      ),
    );
  }
}
