import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:house/features/account/logic/account_cubit.dart';
import 'package:house/features/widget/textfield_widget.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:house/model/account_model.dart';
import 'package:house/model/user_model.dart';
import 'package:ionicons/ionicons.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
class _AccountPageState extends State<AccountPage> {
  List<dynamic> _accountList = [];
  

  // List<dynamic> _postListLimit = [];
  // List<dynamic> _entityList = [];
    final myController = TextEditingController();

  
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<AccountCubit>().getAccounts();

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
       
    var mediaWidth = MediaQuery.of(context).size.width / 2.0;
    return WidgetAppBar(
      // isAppBar:true,
      actions: Container(),
      leading: Container(),
      bg: Colors.white,
      title: 'liste des utilisateurs ',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Ionicons.close)),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                'Recherche'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
               rr(myController: myController),
            ListTile(
              title: Text(
                'Liste des contacts',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                'voir plus',
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            BlocBuilder<AccountCubit, AccountState>(
              builder: (context, state) {
                log(state.toString());

                if (state is AccountStateLoaded) {
                  if (state.account.error == null) {
                    _accountList = state.account.data as List<dynamic>;
                    log('zzze' + _accountList.toString());
                    // _loading = _loading ? !_loading : _loading;

                  }
                }

                return SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.1 *
                        _accountList.length,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _accountList.length,
                        itemBuilder: (BuildContext context, int index) {
                          AccountModel account = _accountList[index];

                          return Column(children: [
                     
                         
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20),
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 5,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    color: Colors.white),
                                child: ListTile(
                                  leading: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: account.fileUrl!.length >= 1
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'http://192.168.1.49:8000/storage/' +
                                                        account.fileUrl![0]
                                                            .image!)),
                                            color: Colors.blue,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(50.0)),
                                          )
                                        : const BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)),
                                          ),
                                  ),
                                  title: Text(account.name!),
                                  subtitle: Text(account.number!),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        FlutterPhoneDirectCaller.callNumber(
                                            account.number!);
                                      },
                                      icon:
                                          const Icon(Ionicons.call_outline)),
                                ),
                              ),
                            ),
                          ]);
                        }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class rr extends StatelessWidget {
  const rr({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.all(20.0),
     child:
     
      Form(
       key:_formKey,
        child: TextField(
       autofocus: true,
       
         controller:myController ,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Karla',
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Experimez-vous...',
                        hintStyle: TextStyle(
         color: Color(0xff2e3039),
                        ),
                      ),),
      )
             
             );
  }
}
