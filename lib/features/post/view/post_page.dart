import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:house/features/account/logic/account_cubit.dart';
import 'package:house/features/post/cubit/post_cubit.dart';
import 'package:house/features/post/view/post_detail_page.dart';
import 'package:house/features/theme/colors.dart';
import 'package:house/features/widget/post_image.dart';
import 'package:house/features/widget/textfield_widget.dart';
import 'package:house/features/widget/widget_body.dart';
import 'package:house/model/account_model.dart';
import 'package:house/model/post_model.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

  List<dynamic> _postList = [];

  // List<dynamic> _postListLimit = [];
  // List<dynamic> _entityList = [];
  List<dynamic> _accountList = [];

  // List<dynamic> _postListLimit = [];
  // List<dynamic> _entityList = [];

  @override
  void initState() {
    context.read<AccountCubit>().getAccounts();
    context.read<PostCubit>().postFetch();

    // context.read<PostCubit>().getPostLimit();
    // context.read<EntityCubit>().getEntity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetAppBar(
        bg: Colors.white,
        isAppBar: true,
        actions: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.person_circle_outline,
                color: Colors.black,
              ),
            )
          ],
        ),
        leading: Container(),
        title: ' ',
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: 200,
              //   child: VerticalSliderDemo()),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Text(
              //     'Top des profiles',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20,
              //         color: greyBlue),
              //   ),
              // ),
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
                    // width: MediaQuery.of(context).size.width *
                    //     0.2 *
                    //     _accountList.length,
                    // width: 120,
                    height: 150,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: _accountList.length,
                        itemBuilder: (BuildContext context, int index) {
                          AccountModel account = _accountList[index];
                       
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: account.fileUrl!.length >= 1
                                ? Container(
                                    height: 80,
                                    width: 80,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'http://192.168.1.49:8000/storage/' +
                                              account.fileUrl![0].image!),
                                      backgroundColor: Colors.greenAccent,
                                      radius: 90,
                                    ),
                                  )
                                : Container(),
                          );
                        }));
              }),
              // Container(
              //   color: Colors.grey.shade400,
              //   height: 5,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Annonces',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: greyBlue),
                ),
              ),
              BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                // log(state.toString());

                if (state is PostStateLoaded) {
                  if (state.post.error == null) {
                    _postList = state.post.data as List<dynamic>;
                    // log('zzze' + _postList.toString());
                    // _loading = _loading ? !_loading : _loading;

                  }
                }

                // log('http://192.168.1.23:8000/storage/'+_postList[0].image);
                return SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.25 *
                        _postList.length,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _postList.length,
                        itemBuilder: (BuildContext context, int index) {
                          PostModel post = _postList[index];
                          String i =
                              'http://192.168.1.49:8000/storage/' + post.image!;
                          return Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PostDetailPage(
                                                      post: post,
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 5.0, top: 10),
                                        child: Container(
                                          height: 190,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1),
                                              color: Colors.white),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Image.network(('http://192.168.1.49:8000/storage/'+post.image!)),
                                              // PostImageItem(post: post),
                                              CachedNetworkImage(
                                                imageUrl: i,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.4,
                                                  height: 190,
                                                  // padding: EdgeInsets.all(10),
                                                  // height: MediaQuery.of(context).size.height *
                                                  //     0.2,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 0),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10)),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 15.0,
                                                  right: 5,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ListTile(
                                                      title: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '' +
                                                                post.title
                                                                    .toString()
                                                                    .toLowerCase(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16),
                                                          ),
                                                          Container(
                                                            constraints:
                                                                BoxConstraints(
                                                                    maxHeight:
                                                                        60),
                                                            child: Text(
                                                              '' +
                                                                  post.description
                                                                      .toString()
                                                                      .toLowerCase(),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      subtitle:
                                                          _buildEntiTyFooter(
                                                              post),
                                                      contentPadding:
                                                          EdgeInsets.all(0),
                                                    ),
                                                    // _buildRowBtnLikeAndComment(post, context),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              //                       Container(
                              //   color: Colors.grey.shade400,
                              //   height: 5,
                              // ),
                            ],
                          );
                        }));
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEntiTyFooter(PostModel post) {
    // log(post.image!);
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                image: post.image != null
                    ? DecorationImage(
                        image: NetworkImage('${post.image}'), fit: BoxFit.cover)
                    : null,
                borderRadius: BorderRadius.circular(25),
                color: primary_one),
            child: Center(
              child: Text(
                post.name!.length > 1
                    ? post.name.toString().substring(0, 1)
                    : '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 100),
            child: Text(
              post.name.toString().toLowerCase(),
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.eye,
              color: Colors.black,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.map,
              color: Colors.black,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

class VerticalSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: true,
            ),
            items: [
          Container(
            color: primary_one,
          ),
        ]));
  }
}
