// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';


import 'package:listview/WIDGET/PRODUCT%20WIDGET.dart';


import '../data/product.dart';


// ignore: must_be_immutable
class Homepage extends StatelessWidget {
   const Homepage({super.key});



 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.transparent,
        elevation: 0,

            title: Text("HOME PAGE",
            
            style:TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Urbanist',
             color: Colors.black

            ) ,
            ),


      ),
     
          body: 
          SafeArea(
          child: GridView.builder(
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) {
              return Txt(product: product[index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              
            ),
          ),
        ),

       
         
    );
  }
}


// ignore: must_be_immutable
// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {



//     return Scaffold(
//       backgroundColor: Colors.white54,
//       body: BlocConsumer<NewAppCubit, NewAppState>(
//         listener: (context, state) {
//           if (state is ErrorState) {
//             showDialog(
//               context: context,
//               builder: (context) {
//                 return const AlertDialog(
//                   content: Text('try agin'),
//                 );
//               },
//             );
//             print('try agin');
//           }
//         },
//         builder: (context, state) {
//           if (state is LoadingState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is DoneState ||
//               context.read<NewAppCubit>().products.isNotEmpty) {
//             return SafeArea(
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 15,
//                   ),
//                   child: GridView.builder(
//                     itemCount: context.read<NewAppCubit>().products.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Txt(
//                         product: context.read<NewAppCubit>().products[index],
//                       );
//                     },
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                     ),
//                   )),
//             );
            
//           }else {
//             return const Center(
//               child: Text('error'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }





