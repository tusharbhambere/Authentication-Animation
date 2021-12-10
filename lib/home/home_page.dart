import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showIsSignUp = useState<bool>(true);
    final checkBox = useState<bool>(false);
    return Scaffold(
      body: LayoutBuilder(builder: (context, contrains) {
        final height = contrains.maxHeight / 2;
        final width = contrains.maxWidth / 2;
        return Stack(alignment: Alignment.center, children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bag.jpg'), fit: BoxFit.cover)),
          ),
          Center(
            child: Container(
              width: width * 1.3,
              height: height * 1,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
                // boxShadow: const [
                //   BoxShadow(color: Colors.black, blurRadius: 10)
                // ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  SignUp(
                    onPress: () {
                      showIsSignUp.value = false;
                    },
                  ),
                  const Spacer(),
                  Signin(
                    onPress: () {
                      showIsSignUp.value = true;
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInBack,
            duration: const Duration(milliseconds: 500),
            top: 220,
            right: showIsSignUp.value ? 390 : 870,
            child: Container(
              height: height * 1.05,
              width: width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 10)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: AnimatedSwitcher(
                  switchOutCurve: Curves.easeInBack,
                  switchInCurve: Curves.easeInBack,
                  reverseDuration: const Duration(microseconds: 400),
                  duration: const Duration(milliseconds: 400),
                  child: showIsSignUp.value
                      ? SignInForm(checkBox: checkBox)
                      : const SignUpForm(),
                ),
              ),
            ),
          ),
        ]);
      }),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    Key? key,
    required this.checkBox,
  }) : super(key: key);

  final ValueNotifier<bool> checkBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'SIGN IN',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.black, letterSpacing: 2),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text('Email')),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text('Password')),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Checkbox(
              value: checkBox.value,
              onChanged: (value) {
                checkBox.value = value!;
              },
            ),
            Text(
              'Remember me',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.black, fontSize: 15),
            ),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text('ForgetPassowrd?'))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'SIGN IN',
              )),
        )
      ],
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          'SIGN UP',
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(color: Colors.black, letterSpacing: 2),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text('Full name')),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text('Email')),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text('Password')),
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'SIGN UP',
              )),
        )
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key, required this.onPress}) : super(key: key);
  final VoidCallback onPress;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Don't have an Account?",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          '''fill acount details and signup the acoutn
add fill some fakke not data''',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: onPress, child: const Text('SignUp'))
      ],
    );
  }
}

class Signin extends StatelessWidget {
  const Signin({Key? key, required this.onPress}) : super(key: key);
  final VoidCallback onPress;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'have an Account?',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          '''fill acount details and signup the acoutn
add fill some fakke not data''',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: onPress, child: const Text('SignIn'))
      ],
    );
  }
}
