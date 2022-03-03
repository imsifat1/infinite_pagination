import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_pagination/NewArrival.dart';
import 'package:infinite_pagination/NewArrivalController.dart';
import 'package:infinite_pagination/NewCollectionProductModel.dart';
import 'package:infinite_pagination/Products.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lazy Load Demo',
      home: NewArrival(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<int> verticalData = [];

//   final int increment = 10;

//   bool isLoadingVertical = false;

//   @override
//   void initState() {
//     _loadMoreVertical();

//     super.initState();
//   }

//   Future _loadMoreVertical() async {
//     setState(() {
//       isLoadingVertical = true;
//     });

//     // Add in an artificial delay
//     await new Future.delayed(const Duration(seconds: 2));

//     verticalData.addAll(
//         List.generate(increment, (index) => verticalData.length + index));

//     setState(() {
//       isLoadingVertical = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: LazyLoadScrollView(
//         isLoading: isLoadingVertical,
//         onEndOfPage: () => _loadMoreVertical(),
//         child: Scrollbar(
//           child: ListView.builder(
//             shrinkWrap: true,
//             // physics: const NeverScrollableScrollPhysics(),
//             itemCount: verticalData.length,
//             itemBuilder: (context, position) {
//               return DemoItem(position);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DemoItem extends StatelessWidget {
//   final int position;

//   const DemoItem(
//     this.position, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     NewArrivalController newArrivalController = Get.put(NewArrivalController());
//     return FutureBuilder<NewCollectionProductModel?>(
//         future: newArrivalController.newCollectionProduct,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 // controller: scrollController,
//                 physics: NeverScrollableScrollPhysics(),
//                 // scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.data.length,
//                 // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 //     crossAxisCount: 2),
//                 itemBuilder: (context, int index) {
//                   var product = snapshot.data!.data[index];
//                   //slug = product.slug;
//                   String image = product.productImage[0].prefixUrl.toString() +
//                       product.productImage[0].productImage.toString();

//                   return GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       height: 300,
//                       width: 200,
//                       child: Products(
//                         image,
//                         product.name,
//                         product.price,
//                         product.discount,
//                         product.salePrice,
//                         product.id,
//                         context,
//                       ),
//                     ),
//                   );
//                 });
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         });
//   }
// }
