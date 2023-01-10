import 'package:flutter/material.dart';
import 'package:practice/ShimmerEffect/dataFile.dart';
import 'package:practice/ShimmerEffect/skeleton.dart';

class ShimmerEffectScreen extends StatefulWidget {
  const ShimmerEffectScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerEffectScreen> createState() => _ShimmerEffectScreenState();
}

class _ShimmerEffectScreenState extends State<ShimmerEffectScreen> {
  var listData = [];

  bindData() {
    setState(() {
      listData = TempData.sampleData;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () => bindData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shimmer Effect'),
        centerTitle: true,
      ),
      body: listData.isEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (_, index) {
                return const NewCardSkeleton();
              },
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: listData.length,
              itemBuilder: (_, index) {
                return Container(
                  height: 90.0,
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Image.network(
                          listData[index]['photo_url'].toString(),
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '#P0000${listData[index]['id']}',
                            style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            listData[index]['name'].toString(),
                            style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Unit : ${listData[index]['quantity']}'),
                              const SizedBox(width: 10.0),
                              const Icon(Icons.ac_unit_outlined, size: 10.0),
                              const SizedBox(width: 10.0),
                              Text('₹${listData[index]['price']}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}


