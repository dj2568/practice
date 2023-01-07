import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isEnable = false;
  final _duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Toggle Switch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isEnable = !isEnable;
                });
              },
              child: AnimatedContainer(
                duration: _duration,
                height: 50.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: isEnable ? const Color(0xff565671) : Colors.yellow,
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: AnimatedAlign(
                  duration: _duration,
                  alignment: isEnable ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: AnimatedContainer(
                      duration: _duration,
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isEnable ? Colors.grey.shade300 : Colors.white,
                      ),
                      child: Center(
                        child: isEnable
                            ? const Icon(
                                CupertinoIcons.moon_zzz,
                                color: Color(0xff565671),
                              )
                            : const Icon(CupertinoIcons.brightness),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              isEnable ? 'Switch : On' : 'Switch : Off',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
