import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String iconUrl;
  final String courseName;
  final int jumlahDone;
  final int jumlahMateri;
  const CourseCard({Key? key,
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              iconUrl,
              height: 30,width: 30,fit: BoxFit.cover,
              errorBuilder: (context,error,stackTrace){
                return Container(height: 30,width: 30,color: Colors.cyan,);
              },),
          ),
          const SizedBox(width:12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(courseName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('$jumlahDone/$jumlahMateri Paket Latihan Soal'),
                const SizedBox(height:8),
                LinearProgressIndicator(
                  value: ((jumlahDone)/(jumlahMateri)) ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
