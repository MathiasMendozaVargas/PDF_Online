import 'package:flutter/material.dart';


class PDFCard extends StatefulWidget {
  @override
  _PDFCardState createState() => _PDFCardState();
}

class _PDFCardState extends State<PDFCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
