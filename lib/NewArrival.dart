import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:infinite_pagination/NewArrivalController.dart';
import 'package:infinite_pagination/NewCollectionProductModel.dart';
import 'package:infinite_pagination/NewCollectionProductService.dart';
import 'package:infinite_pagination/Products.dart';

//------------------------------------------------------------
//        this widget is for Upcoming categories
//------------------------------------------------------------

class NewArrival extends StatefulWidget {
  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  // NewArrivalController newArrivalController = Get.put(NewArrivalController());
  late Future<NewCollectionProductModel?> getData;
  ScrollController scrollController = ScrollController();
  var pageNumber = 0;
  List<Datum> productArray = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    addMore();
    scrollController.addListener(() {
      // print(scrollController.position.pixels);
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          isLoading == false) {
        pageNumber++;
        addMore();
        // collectionOfData();

        print(pageNumber);
      }
    });
  }

  addMore() {
    isLoading = true;
    NewCollectionProductService.getNewCollectionProductService(
            pageNumber: pageNumber)
        .then((value) {
      setState(() {
        productArray.addAll(value?.data ?? []);
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("New Collection Product")),
          body: collectionOfData()),
    );
  }

  collectionOfData() {
    return ListView.builder(
        controller: scrollController,
        itemCount: productArray.length,
        itemBuilder: (context, int index) {
          var product = productArray[index];

          String image =
              product.productImage[0].prefixUrl.toString() + product.thumnail;

          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 300,
              width: 200,
              child: products(
                image,
                product.name,
                product.price,
                product.discount,
                product.salePrice,
                product.id,
                context,
              ),
            ),
          );
        });
  }
}
