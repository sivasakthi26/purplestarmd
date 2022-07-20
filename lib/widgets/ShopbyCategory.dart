import 'package:flutter/material.dart';
import 'package:purplestarmd/screens/profile/category/Concentrates.dart';

class ShopModel {
  final String title;
  final String image;

  ShopModel({
    required this.title,
    required this.image,
  });
}

List<ShopModel> categories = <ShopModel>[
  ShopModel(title: 'Concentrates', image: 'assets/images/concentrates.png'),
  ShopModel(title: 'Edibles', image: 'assets/images/edibles.png'),
  ShopModel(title: 'Flowers', image: 'assets/images/flowers.png'),
  ShopModel(title: 'Prerolls', image: 'assets/images/prerolls.png'),
  ShopModel(title: 'Tinctures', image: 'assets/images/tinctures.png'),
  ShopModel(title: 'Topicals', image: 'assets/images/topicals.png'),
  ShopModel(title: 'Vape Pens', image: 'assets/images/vape_pens.png'),
  ShopModel(title: 'Accessories', image: 'assets/images/accessories.png'),
  ShopModel(title: 'Sales', image: 'assets/images/sales.png'),
];


class ShopbyCategory extends StatelessWidget {
  const ShopbyCategory({Key? key, required this.shopModel}) : super(key: key);
  final ShopModel shopModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.black54, offset: Offset(0.0, 0.75))
                ]),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(shopModel.image),
              child: InkWell(
                onTap: () {
                    if (shopModel.title == 'Concentrates') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Concentrates(
                                  pageTitle: shopModel.title)));
                      print('succesed');
                    } else if (shopModel.title == 'Edibles') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Concentrates(
                                  pageTitle: shopModel.title)));
                      print('succesed');
                    }
                },
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(shopModel.title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
