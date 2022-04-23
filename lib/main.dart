import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie_sample/sample_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // Lottieアニメーションのライセンスを追記
  LicenseRegistry.addLicense(() {
    return Stream<LicenseEntry>.fromIterable(
      [
        const LicenseEntryWithLineBreaks(['Lottie用アニメーション'], '''
                    Lolo Walk cycle by Jordi Ayguasenosa
                    https://lottiefiles.com/102894-lolo-walk-cycle
                    '''),
        const LicenseEntryWithLineBreaks(['Lottie用アニメーション'], '''
                    Sleepy by Sawyer
                    https://lottiefiles.com/103483-sleepy
                    '''),
      ],
    );
  });
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lottie Sample',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const SampleScreen(),
    );
  }
}
