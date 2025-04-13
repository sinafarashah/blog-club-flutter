import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.primary.withOpacity(0.5))
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like button is clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                '2.1k',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themeData.colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('Article'),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      'Four Things Every Woman Needs To Know',
                      style: themeData.textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story9.image(
                                width: 48, height: 48, fit: BoxFit.cover)),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text('2m ago'),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, 'bookmark button is clicked');
                            },
                            icon: Icon(
                              CupertinoIcons.share,
                              color: themeData.colorScheme.primary,
                            )),
                        IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, 'bookmark button is clicked');
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary,
                            ))
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.img.background.singlePost.image()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      'A man`s sexuality is never your mind responsibility',
                      style: themeData.textTheme.headlineSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                      'Once you have a clear goal, the next question is: what do you need to learn to reach it?Knowing what you wish to create is a problem you need to solve. And aprogramming language offers you the tools to solve that problem.Many beginners find this choice quite difficult to make - and I was one of them! Youmight feel like youre choosing something youll be stuck with for the rest of your life.However, try not to let this one decision take up too much of your time and energy. Allthat matters is that you simply start learning! You can always switch to anotherprogramming language if the one you started with doesn’t feel right.If you.Once you have a clear goal, the next question is: what do you need to learn to reach it?Knowing what you wish to create is a problem you need to solve. And aprogramming language offers you the tools to solve that problem.Many beginners find this choice quite difficult to make - and I was one of them! Youmight feel like youre choosing something youll be stuck with for the rest of your life.However, try not to let this one decision take up too much of your time and energy. Allthat matters is that you simply start learning! You can always switch to anotherprogramming language if the one you started with doesn’t feel right.If you.Once you have a clear goal, the next question is: what do you need to learn to reach it?Knowing what you wish to create is a problem you need to solve. And aprogramming language offers you the tools to solve that problem.Many beginners find this choice quite difficult to make - and I was one of them! Youmight feel like youre choosing something youll be stuck with for the rest of your life.However, try not to let this one decision take up too much of your time and energy. Allthat matters is that you simply start learning! You can always switch to anotherprogramming language if the one you started with doesn’t feel right.If you.',
                      style: themeData.textTheme.bodyMedium,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0)
                  ])),
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
