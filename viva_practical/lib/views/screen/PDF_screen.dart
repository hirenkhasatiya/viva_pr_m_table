import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:viva_practical/Global/globals.dart';

class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  Future<Uint8List> pdfGenerator() async {
    pw.Document pdf = pw.Document();

    var image = await networkImage(
        "https://i.pinimg.com/564x/b2/30/d1/b230d19d4d73f6c68cc728f132ed5ebe.jpg");

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Center(
          child: pw.Stack(
            children: [
              pw.Image(
                image,
                fit: pw.BoxFit.cover,
              ),
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(top: 150),
                    ),
                    pw.Column(
                      children: List.generate(
                          Globals.allNumber.length,
                          (index) => pw.Center(
                                child: pw.Container(
                                  padding: pw.EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: pw.Text(
                                    "Value ${index + 1} is : ${Globals.allNumber[index]["number"]}",
                                    style: pw.TextStyle(
                                        fontSize: 20,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ),
                              )).toList(),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("PDF Page"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: PdfPreview(
          build: (format) => pdfGenerator(),
        ),
      ),
    );
  }
}
