// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../utils/constants.dart';
// import '../widgets/textInputField.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

//   final TextEditingController _searchController = TextEditingController() ; 

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBackgroundColor,
//         title: TextFormField(
//           onChanged: (value) {},
//           cursorColor: Colors.white,
//           cursorHeight: 26,
//           decoration: const InputDecoration(
//             hintText: "Search For User",
//             fillColor: Colors.white,
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.white, width: 0.8),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.white, width: 0.4),
//             ),
//           ),
          
//         ),
//       ),
//       body: 
//           FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection("users")
//                   .where("Username",
//                       isGreaterThanOrEqualTo: _searchController.text)
//                   .get(),
//               builder: (context,
//                   AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: Text("No Users Fount"),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // ! Go To This User Screen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return ProfileScreen(
//                                 uid: snapshot.data!.docs[index]["User Id"],
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(
//                             snapshot.data!.docs[index]["Photo URL"],
//                           ),
//                         ),
//                         title: Text(
//                           snapshot.data!.docs[index]["Username"],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }) ; 
//   }
// }
