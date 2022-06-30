import 'dart:ffi';
import 'package:flutter/material.dart';
import '../../models/SaleCategories.dart';
import '../../models/SaleServices.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<SaleCategories>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProduct();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<SaleCategories>>(
          future: futureProduct,
          builder: (context, snapshot){
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Text(
                      'showing' + snapshot.data!.length.toString() + 'results',
                      style: const TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        List<String> selectedItemValue = <String>[
                          ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type1}"),
                          ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type2}"),
                          ("\$${snapshot.data![index].price} ${snapshot.data![index].productType.type3}")
                        ];

                        final defaultValue = selectedItemValue[0];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(0.0),
                                        child: SizedBox(
                                          height: 100.0,
                                          width: 100.0,
                                          child: Image(
                                            image: NetworkImage(snapshot
                                                .data![index].productImageUrl),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].title,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins Bold',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '- ' + snapshot.data![index].made,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins Bold',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // CustomDropdownMenu(
                                          //     defaultValue: defaultValue,
                                          //     values: selectedItemValue,
                                          //     onItemSelected: (value) {
                                          //       print("Selected Item : $value");
                                          //     }),
                                          const SizedBox(height: 10),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: 125,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFF297903),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: const Center(
                                                  child: Text(
                                                'add to cart',
                                                style: TextStyle(
                                                    fontFamily: 'BebasNeue',
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                          ],
                        );
                      }),
                ],
              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
