import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplest_demo_app/app/app.dart';
import 'package:simplest_demo_app/common_widgets/common_widgets.dart';

import '../bloc/registration_bloc.dart';

class SetEmailPage extends StatefulWidget {
  const SetEmailPage({Key? key}) : super(key: key);

  @override
  State<SetEmailPage> createState() => _SetEmailPageState();
}

class _SetEmailPageState extends State<SetEmailPage> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              child: Text('Registration'),
            ),
            Text(
              '1 / 2',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Enter email',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Enter email'),
                    onChanged: (value) {
                      email = value;
                      context.read<RegistrationBloc>().add(RegistrationEmailChanged(value));
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: SizedBox(
              width: double.maxFinite,
              child: BlocBuilder<RegistrationBloc, RegistrationState>(
                builder: (context, state) {
                  return PrimaryButton(
                    onPressed: state.email.validate() == null
                        ? () {
                            Navigator.of(context).pushNamed(Routes.setPassword, arguments: email);
                          }
                        : null,
                    child: const Text('Next'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
