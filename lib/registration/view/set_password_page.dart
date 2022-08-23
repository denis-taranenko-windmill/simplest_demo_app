import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplest_demo_app/common_widgets/common_widgets.dart';
import 'package:simplest_demo_app/registration/bloc/registration_bloc.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  String password = '';

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
              '2 / 2',
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
                    'Enter password',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Input password'),
                    onChanged: (value) {
                      password = value;
                      context.read<RegistrationBloc>().add(RegistrationPasswordChanged(value));
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
                    onPressed: state.password.validate() == null
                        ? () {
                            context.read<RegistrationBloc>().add(const RegistrationSubmitted());
                          }
                        : null,
                    child: const Text('Register'),
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
