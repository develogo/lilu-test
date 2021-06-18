import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liluapp/app/constants.dart';
import 'package:liluapp/app/modules/home/home_store.dart';
import 'package:liluapp/app/modules/home/models/contact_model.dart';
import 'package:liluapp/app/modules/home/pages/edit_contact/components/edit_button_widget.dart';
import 'package:liluapp/app/modules/home/pages/edit_contact/components/edit_input_widget.dart';
import 'package:liluapp/app/modules/home/pages/edit_contact/edit_contact_store.dart';
import 'package:liluapp/app/shared/http/exeptions/contact_repository_error.dart';
import 'package:flash/flash.dart';

class EditContactPage extends StatefulWidget {
  final String title;
  final ContactModel? contactModel;
  const EditContactPage({Key? key, this.title = 'Editar', this.contactModel})
      : super(key: key);
  @override
  EditContactPageState createState() => EditContactPageState();
}

class EditContactPageState extends State<EditContactPage> {
  final store = Modular.get<EditContactStore>();
  final homeStore = Modular.get<HomeStore>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    if (widget.contactModel != null) {
      store.setId(widget.contactModel!.id);
      store.setName(widget.contactModel!.name);
      store.setPhone(widget.contactModel!.phone);
      store.setEmail(widget.contactModel!.email);
    }
    _nameController =
        TextEditingController(text: widget.contactModel?.name ?? '');
    _phoneController =
        TextEditingController(text: widget.contactModel?.phone ?? '');
    _emailController =
        TextEditingController(text: widget.contactModel?.email ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: kMainColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100),
            EditInputWidget(
              title: 'Nome',
              controller: _nameController,
              onChanged: (value) => store.setName(value),
            ),
            EditInputWidget(
              title: 'Telefone',
              controller: _phoneController,
              onChanged: (value) => store.setPhone(value),
            ),
            EditInputWidget(
              title: 'Email',
              controller: _emailController,
              onChanged: (value) => store.setEmail(value),
            ),
            SizedBox(
              height: 100,
            ),
            EditButtonWidget(
              onPressed: () async {
                var data = await store.updateOrSave();

                if (data is bool) {
                  await homeStore.loadContacts();
                  Modular.to.navigate('/home');
                } else if (data is AddFailure) {
                  _showBottomFlash(message: data.message);
                } else if (data is UpdateFailure) {
                  _showBottomFlash(message: data.message);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _showBottomFlash({
    String message = '',
    bool persistent = true,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    showFlash(
      context: context,
      persistent: persistent,
      duration: Duration(milliseconds: 5000),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          margin: margin,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(8.0),
          boxShadows: kElevationToShadow[8],
          onTap: () => controller.dismiss(),
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          backgroundColor: Colors.red,
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text('Error'),
              content: Text(message),
              showProgressIndicator: true,
            ),
          ),
        );
      },
    ).then((_) {
      if (_ != null) {}
    });
  }
}
