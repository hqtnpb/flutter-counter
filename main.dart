import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyObject {
  int _value;

  MyObject(this._value);

  int get value => _value;

  set value(newValue) => _value = newValue;

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  void square() {
    _value = _value * _value;
  }

  int power(int exponent) {
    int result = 1;
    int base = _value;

    for (int i = 0; i < exponent; i++) {
      result *= base;
    }

    return result;
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  MyObject myObject = MyObject(0);
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Giá trị hiện tại: ${myObject.value}'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Nhập số nguyên n"),
                onChanged: (value) {
                  setState(() {
                    n = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      myObject.decrease();
                    });
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Giảm'),
                ),
                const SizedBox(width: 5),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      myObject.increase();
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Tăng'),
                ),
                const SizedBox(width: 5),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      myObject.square();
                    });
                  },
                  icon: const Icon(Icons.square_foot),
                  label: const Text('Bình phương'),
                ),
                const SizedBox(width: 5),
                OutlinedButton.icon(
                  onPressed: () {
                    int result = myObject.power(n);
                    setState(() {
                      myObject.value = result;
                    });
                  },
                  icon: const Icon(Icons.exposure_plus_1),
                  label: const Text('Lũy thừa n'),
                ),
                const SizedBox(width: 5),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      myObject.value = 0;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}