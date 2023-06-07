// import 'package:flutter/material.dart';
// import 'package:flutter_student_detiles/widgets/display_student_screen.dart';
// import 'package:provider/provider.dart';

// import 'package:sample_2/db/functions/db_function.dart';
// import 'package:sample_2/db/models/data_modal.dart';
// import 'package:sample_2/widgets/display_student_screen.dart';
// import 'package:sample_2/widgets/students_list.dart';

// class SearchWidget extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null); // for closing the search page and going back
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//      final studentListProvider = Provider.of<StudentProvider>(context);
//      final searchResults = studentListProvider.studentListNotifier
//         .where((student) =>
//             student.name.toLowerCase().contains(query.toLowerCase().trim()))
//         .toList();
//     // return Padding(
//     //   padding: const EdgeInsets.symmetric(horizontal: 20),
      
//       // child: ValueListenableBuilder(
//         // valueListenable: StudentProvider,
//         // builder: ((BuildContext context, List<StudentModel> studentList,
//             // Widget? child) {
//           return searchResults.isEmpty
//         ? const Center(
//             child: Text('No Data Found'),
//           )
//         :  ListView.builder(
//             itemBuilder: (ctx, index) {
//               final data = searchResults[index];
//               if (data.name.toLowerCase().contains(
//                     query.toLowerCase().trim(),
//                   )) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: ((context) {
//                               return const ListStudents();
//                             }),
//                           ),
//                         );
//                       },
//                       title: Text(data.name),
//                     ),
//                     const Divider()
//                   ],
//                 );
//               } else {
//                 return Container();
//               }
//             },
           
//           );
//         }
        
//           @override
//           Widget buildSuggestions(BuildContext context) {
//             // TODO: implement buildSuggestions
//             throw UnimplementedError();
//           }
      
  
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final studentListProvider = Provider.of<StudentProvider>(context);
//     final searchResults = studentListProvider.studentListNotifier
//         .where((student) =>
//             student.name.toLowerCase().contains(query.toLowerCase().trim()))
//         .toList();
//     return searchResults.isEmpty?
    
//       // padding: const EdgeInsets.symmetric(horizontal: 20),
//       // child: ValueListenableBuilder(
//       //   valueListenable: studentListNotifier,
//       //   builder: ((BuildContext context, List<StudentModel> studentList,
//       //       Widget? child) {
//       //     return 
//       ListView.builder(
//             itemBuilder: (ctx, index) {
//               final data = studentListProvider[index];
//               if (data.name
//                   .toLowerCase()
//                   .contains(query.toLowerCase().trim())) {
//                 return Column(
//                   children: [
//                     ListTile(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: ((context) {
//                               return DisplayStudent(
//                                 name: data.name,
//                                 age: data.age,
//                                 address: data.address,
//                                 number: data.phnNumber,
//                                 index: index,
//                               );
//                             }),
//                           ),
//                         );
//                       },
//                       title: Text(data.name),
//                     ),
//                     const Divider()
//                   ],
//                 );
//               } else {
//                 return Container();
//               }
//             },
//             itemCount: studentListProvider.length,
//           ),
//         }
        


