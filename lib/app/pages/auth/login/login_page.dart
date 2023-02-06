import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/delivery_app_bar.dart';
import '../../../core/ui/widgets/delivery_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login', style: context.textStyles.textTitle),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                      controller: _emailEC,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.required('Senha obrigatória'),
                      controller: _passwordEC,
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        width: double.infinity,
                        label: 'ENTRAR',
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;
                          if (valid) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não possui uma conta? ',
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/auth/register');
                      },
                      child: Text(
                        'Cadastre-se!',
                        style: context.textStyles.textBold.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
