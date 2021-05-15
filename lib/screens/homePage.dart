import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_application/widgets/navDrawer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(widget.user),
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        elevation: 10.0,
        title: Text(
          'Documents',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.6, 0.6, 0.9],
                colors: [
                  Colors.red[900],
                  Colors.red[900],
                  Colors.red[800],
                  Colors.red[800]
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                height: 155,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                    color: Colors.white
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage('assets/images/example.jpg'),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(Icons.edit),
                                          SizedBox(width: 8),
                                          Icon(Icons.delete_rounded)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
                                      color: Colors.black87
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'Trabajo de Civica - Mathias Mendoza 2 Trabajo de Civica - Mathias Mendoza 2.pdf',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_file, color: Colors.white, size: 27),
        backgroundColor: Colors.red[900],
        onPressed: _createPDF,
      ),
    );
  }

  Future<void> _createPDF() async{
    final pdf = pw.Document();

    final File imageFile = await getImageGallery();

    var image = pw.MemoryImage(
      imageFile.readAsBytesSync(),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context){
          return pw.Center(
            child: pw.Image(image),
          );
        }
      )
    );

    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());

  }

  final picker = ImagePicker();
  Future<File> getImageCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    return File(pickedFile.path);
  }

  Future<File> getImageGallery() async{
    File _storedImage;
    final imageFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _storedImage = File(imageFile.path);
    });
    print(_storedImage.path);

    return _storedImage;

    // final appDir = await getApplicationDocumentsDirectory();
    // final fileName = basename(imageFile.path);
    // final savedImage = await _storedImage.copy('${appDir.path}/$fileName');
    // if(savedImage != null){
    //   print("Image saved!");
    //   return savedImage;
    // }else{
    //   print('Cannot save Image!');
    //   return null;
    // }
  }

  Future<Uint8List> _readImageData(img) async {
    final data = await rootBundle.load(img);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async{
    final path = (await getExternalStorageDirectory()).path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }
}



