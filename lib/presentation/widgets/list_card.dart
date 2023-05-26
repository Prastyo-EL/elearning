import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String iconUrl;
  final String courseName;
  final int jumlahDone;
  final String jumlahMateri;
  const ListCard({Key? key,
    required this.iconUrl,
    required this.courseName,
    required this.jumlahDone,
    required this.jumlahMateri,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              iconUrl,
              height: 30,width: 30,fit: BoxFit.cover,
              errorBuilder: (context,error,stackTrace){
                return Container(
                  height: 30,
                  width: 30,
                  color: Colors.cyan,);
              },),
          ),
          // const SizedBox(width:6),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('$jumlahDone/$jumlahMateri Soal'),
                  // const SizedBox(height:8),
                  // LinearProgressIndicator(
                  //   value: ((jumlahDone)/(jumlahMateri.length)) ,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
