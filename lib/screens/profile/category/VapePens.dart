import 'package:flutter/material.dart';
import 'package:purplestarmd/screens/profile/CartPage.dart';
import 'package:purplestarmd/screens/profile/ProductHeading.dart';
import 'package:purplestarmd/widgets/CustomAppBar.dart';

class VapePens extends StatefulWidget {
  const VapePens({Key? key, required this.pageTitle}) : super(key: key);
  final String pageTitle;

  @override
  State<VapePens> createState() => _VapePensState();
}

class _VapePensState extends State<VapePens> {
  String? _title;

  @override
  void initState() {
    _title = widget.pageTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Center(
            child: Text('$_title'),
          ),
          // ProductHeading(title: widget.pageTitle),
          // CartPage(),
        ],
      ),
    );
  }
}