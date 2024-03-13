import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilebgs/home_screen.dart';
import 'package:mobilebgs/styles.dart';

class EvenOddPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Even or Odd'),
          centerTitle: true,
        ),
        body: Center(
          child: InputAngkaWidget(),
        ),
      ),
    );
  }
}

class InputAngkaWidget extends StatefulWidget {
  @override
  _InputAngkaWidgetState createState() => _InputAngkaWidgetState();
}

class _InputAngkaWidgetState extends State<InputAngkaWidget> {
  TextEditingController _controller = TextEditingController();
  bool isOdd = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Input Numbers',
            style: TextStyles.title.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                isOdd = false;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Mendapatkan angka yang dimasukkan oleh pengguna
              String inputText = _controller.text;
              // Cek apakah input kosong
              if (inputText.isEmpty) {
                return;
              }
              // Cek apakah input dapat diubah menjadi angka
              try {
                int number = int.parse(inputText);
                setState(() {
                  // Set nilai isOdd berdasarkan apakah angka tersebut ganjil atau genap
                  isOdd = number.isOdd;
                });
                // Menampilkan dialog dengan hasil
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Result'),
                      content: Text(
                          'The entered number is ${isOdd ? 'Odd' : 'Even'}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } catch (e) {
                // Menampilkan pesan error jika input tidak valid
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Can only input numbers'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text('Result'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mobilebgs/styles.dart';
//
// class EvenOddPage extends StatelessWidget {
//   const EvenOddPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Even or Odd'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 45.0),
//               Text(
//                 'Input Numbers',
//                 style: TextStyles.title.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16.0),
//               TextField(
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       width: 1.0,
//                       color: Colors.black,
//                     ),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 14.0,),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.darkBlue,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0)
//                     )
//                 ),
//                 onPressed: () {
//                   String text = "";
//                   if(TextField % 2 == 0){
//                     text = "Genap";
//                   }
//                   else{
//                     text = "Ganjil";
//                   }
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                   child: Text(
//                     'Result',
//                     style: TextStyles.title.copyWith(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
