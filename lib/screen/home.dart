import 'package:easy_integration_api_products_type/model/ProductModel.dart';
import 'package:easy_integration_api_products_type/service/product_services.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('HomePage'),
        ),
        body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: FilledButton(
                            onPressed: () {}, child: const Text("snack")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: FilledButton(
                            onPressed: () {}, child: const Text("breakfast")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: FilledButton(
                            onPressed: () {}, child: const Text("lunch")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: FilledButton(
                            onPressed: () {}, child: const Text("dinner")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .020,
                ),
                Expanded(
                  child: FutureBuilder(future: ProductData().getallProducts(),
                      builder: (context, pd) {
                        if (pd.connectionState == ConnectionState.waiting) {
                          return const Center(child: Text('Wait'));
                        }
                        else if (pd.hasError) {
                          return const Center(child: Text('Error'),);
                        }
                        return ListView.builder(itemBuilder: (context, index) {
                          Products products=pd.data![index];
                          return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            isThreeLine: true,
                            title:Text(products.title),
                           subtitle: Text(products.brand),
                            leading: Image.network(products.images!.first),
                          );
                        }, itemCount: pd.data!.length,);
                      }),
                )
              ],
            )));
  }
}
