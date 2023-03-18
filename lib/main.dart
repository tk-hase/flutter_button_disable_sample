import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Disable Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Button Disable Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isEnabledButton = false;

  void setButtonStatus(bool isEnabled) {
    setState(() {
      _isEnabledButton = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isEnabledButton,
                  onChanged: (value) => setButtonStatus(value ?? false),
                ),
                const Text("ボタンを有効にする"),
              ],
            ),
            ElevatedButton(
              onPressed: _isEnabledButton
                  ? () {
                      // チェックされている場合の処理
                      // → ダイアログを表示する
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text("ボタンを押しました！"),
                            actions: [
                              TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text("閉じる")),
                            ],
                          );
                        },
                      );
                    }
                  : null, // チェックされていない場合はnullにしてボタンを無効化する
              child: const Text("ダイアログを表示"),
            )
          ],
        ),
      ),
    );
  }
}
