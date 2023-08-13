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
        "https://i.pinimg.com/736x/dc/5b/79/dc5b796615caeb36735ce8c197da3eed.jpg");

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
              pw.Column(children: [
                pw.Container(
                  margin: pw.EdgeInsets.only(top: 90),
                  height: 50,
                  child: pw.Text(
                    "Multiplication History",
                    style: pw.TextStyle(
                      fontSize: 40,
                      fontWeight: pw.FontWeight.bold,
                      // color: PdfColor.fromInt(0xff6A00AA),
                    ),
                  ),
                ),
                pw.Divider(
                    indent: 40,
                    endIndent: 42,
                    color: PdfColor.fromInt(0xff6A00AA)),
                pw.Column(
                  children: List.generate(
                    Globals.allNumber.length,
                    (index) => pw.Container(
                      padding: pw.EdgeInsets.only(left: 60, top: 5),
                      alignment: pw.Alignment.topLeft,
                      width: double.infinity,
                      child: pw.Text(
                        "Value ${index + 1} is : ${Globals.allNumber[index]}",
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                    ),
                  ).toList(),
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
