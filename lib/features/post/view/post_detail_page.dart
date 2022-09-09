import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:house/model/post_model.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ionicons/ionicons.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  var _numberCtrl = '';
  void initState() {
    _numberCtrl = "0000000000";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var post = widget.post;
    var date = post.date.toString().substring(7, 10);
    var month = post.date.toString().substring(4, 5);
    var day = post.date.toString().substring(0, 1);

    var endDate = new DateTime.now();
    var days = endDate.difference(DateTime.parse(post.createdAt!)).inDays;
    log(post.date.toString());
    _numberCtrl = post.number!;

    return SafeArea(
      child: WidgetAppBar(
        actions: Container(),
        leading: Container(),
        title: 'Bienvenue ',
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: 'http://192.168.1.49:8000/storage/' + post.image!,
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  // padding: EdgeInsets.all(10),
                  // height: MediaQuery.of(context).size.height *
                  //     0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0),
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      post.title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: greyBlue),
                    ),
                    ListTile(
                      leading: Image.asset(
                        'images/certified.png',
                        width: 20,
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      title: Text(
                        post.name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      trailing: Text(
                        'il y a ${days} jour',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey.shade300),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Text(
                      post.description.toString(),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () async {
                          FlutterPhoneDirectCaller.callNumber(_numberCtrl);
                        },
                  child:Center(
                  
                        child: Container(
                  
                      decoration: const BoxDecoration(
                    color: primary_one,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    height: 60,

                    width: MediaQuery.of(context).size.width * 0.9,
                    child:  Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children:const[
                          Icon(Ionicons.call_outline,color: Colors.white,),
                           Text(
                            "Contatez moi !",
                            style: TextStyle(color: Colors.white),
                          ),]
                        ),
                      ),
                    ),
                ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
