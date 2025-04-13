import 'dart:ui';

import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor:
                    themeData.colorScheme.background.withOpacity(0),
                title: const Text('Profile'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Assets.img.stories.story8
                                      .image(width: 84, height: 84)),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('@joviedan'),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Jovi Daniel',
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'UX Designer',
                                      style: themeData.textTheme.bodyLarge!
                                          .apply(
                                              color: themeData
                                                  .colorScheme.primary),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.titleLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            'fake text: the next question is: what do you need to learn to reach it?Knowing the next question is',
                            style: themeData.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 32,
                      left: 96,
                      right: 96,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 30,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.8),
                          )
                        ]),
                      )),
                  Positioned(
                      bottom: 32,
                      right: 64,
                      left: 64,
                      child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff2151CD),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '52',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.w200,
                                              color: themeData
                                                  .colorScheme.onPrimary),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '250',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Folloing',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5k',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color: themeData
                                                .colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'My Post',
                              style: themeData.textTheme.titleLarge,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.grid.svg()),
                          IconButton(
                              onPressed: () {},
                              icon: Assets.img.icons.table.svg()),
                        ],
                      ),
                    ),
                    for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
