import 'package:flutter/material.dart';
import 'package:shopping/global_variables.dart';
import 'package:shopping/product_card.dart';
import 'package:shopping/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All','Nike','Adidas','Bata'];
  late String selectedChip = filters[0];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedChip = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(
            color: Color.fromRGBO(225, 225, 225, 1)
        ),
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50)
        ));

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Shoes \nCollection",
                  style: Theme.of(context).textTheme.titleLarge ,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: border,
                      enabledBorder: border,
                      prefixIcon: Icon(Icons.search)
                  ),

                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedChip = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedChip == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        label: Text(filter),
                        labelStyle: TextStyle(
                          fontSize: 16,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return ProductDetailsPage(product: product);
                          }));
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven ? Color.fromRGBO(216, 240, 253, 1) : Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );

                }),
          ),

        ],
      ),
    );
  }
}
