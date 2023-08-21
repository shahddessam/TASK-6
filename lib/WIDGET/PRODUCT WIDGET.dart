// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:listview/PAGES/COUNTER.dart';


import '../data/product.dart';

class Txt extends StatefulWidget {
  final Product product;

  const Txt({
    super.key,
    required this.product,
  });

  @override
  State<Txt> createState() => _TxtState();
}

class _TxtState extends State<Txt> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 150,
          width: 180,
          decoration: const BoxDecoration(color: Colors.black),
        ),
        Positioned(
          top: 25,
          child: Container(
            padding: const EdgeInsets.all(2),
            height: 120,
            width: 180,
            child: Image.asset(
              widget.product.img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 10,
          child: Container(
            child: Text(
              widget.product.price.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Counter(
                 
                  ),
                ),
              );
            },
            child: const Text(
              "click to view",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black12),
            ),
          ),
        ),
      ],
    );
  }
}
