import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDF extends StatefulWidget {
  const PDF({Key? key}) : super(key: key);

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  Future<Uint8List> pdfGenerator() async {
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        build: (pw.Context context) => pw.Center(
          child: pw.Stack(
            children: [
              pw.Column(
                children: [
                  pw.Text("hello"),
                  pw.Divider(),
                  pw.Container(height: 10, width: 10, color: PdfColors.blue),
                ],
              )
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
