import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTap = 1;
  int selectedTapIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tapTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 18);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTapIndex = loginTab;
                              });
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tapTextStyle.apply(
                                  color: selectedTapIndex == loginTab
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTapIndex = signUpTap;
                              });
                            },
                            child: Text(
                              'sign up'.toUpperCase(),
                              style: tapTextStyle.apply(
                                  color: selectedTapIndex == signUpTap
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                          child: SingleChildScrollView(
                            child: selectedTapIndex==loginTab? _Login(themeData: themeData):_SignUp(themeData: themeData),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in your account',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const _PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainScreen()
                ));
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            child: Text('login'.toUpperCase())),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Forgot your password?'),
          const SizedBox(
            width: 8,
          ),
          TextButton(onPressed: () {}, child: const Text('Reset here')),
        ]),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign in with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Assets.img.icons.google.image(width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Assets.img.icons.facebook.image(width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Assets.img.icons.twitter.image(width: 36, height: 36),
        ])
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back to blog club',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'please enter your information',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Fullname')),
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const _PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            child: Text('sign up'.toUpperCase())),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            'or sign up with'.toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Assets.img.icons.google.image(width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Assets.img.icons.facebook.image(width: 36, height: 36),
          const SizedBox(
            width: 24,
          ),
          Assets.img.icons.twitter.image(width: 36, height: 36),
        ])
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    super.key,
  });

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'show' : 'hide',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
