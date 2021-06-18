import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/constants.dart';
import 'package:liluapp/app/modules/home/components/home_list_header_widget.dart';
import 'package:liluapp/app/modules/home/components/home_list_widget.dart';
import 'package:liluapp/app/modules/home/home_store.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  final store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: kMainColor,
              width: double.maxFinite,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/lilu.jpg'),
                  TextButton(
                      onPressed: () => store.logout(),
                      child: Text('Sair',
                          style: TextStyle(
                            color: Colors.white,
                          )))
                ],
              ),
            ),
            Text(
              'Contatos',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Adicione ou Edite contatos',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RawMaterialButton(
                  onPressed: () async {
                    Modular.to.navigate('/home/edit');
                  },
                  elevation: 2.0,
                  fillColor: kMainColor,
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (store.contacts.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Expanded(
                  child: HomeListWidget(
                    columnsNames: [
                      "Nome",
                      "Email",
                      "Telefone",
                      "Ações",
                    ],
                    values: store.contacts,
                    onEdit: (id, index) {
                      Modular.to.navigate('/home/edit',
                          arguments: store.contacts[index]);
                    },
                    onDelete: (id) {
                      showModal<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return _ExampleAlertDialog(
                            onDelete: () async {
                              bool deleted = await store.deleteContact(id);

                              if (deleted) {
                                Navigator.of(context).pop();
                                store.loadContacts();
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
            // Container(
            //   height: 45,
            //   width: double.maxFinite,
            //   color: Colors.white,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Previous',
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'Previous',
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _ExampleAlertDialog extends StatelessWidget {
  final Function() onDelete;

  const _ExampleAlertDialog({Key? key, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Apagar contato?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: onDelete,
          child: const Text(
            'Apagar',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
