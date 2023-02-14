import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/delivery_app_bar.dart';
import '../../../core/ui/widgets/delivery_button.dart';
import 'register_controller.dart';
import 'register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final _obscureText1 = ValueNotifier<bool>(true);
  final _obscureText2 = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar o usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro',
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    controller: _nameEC,
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _obscureText1,
                    builder: (_, obscureText, child) {
                      return TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: IconButton(
                            onPressed: () => _obscureText1.value = !_obscureText1.value,
                            icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                          ),
                        ),
                        controller: _passwordEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Senha obrigatória'),
                          Validatorless.min(6, 'Mínimo de 6 caracteres'),
                        ]),
                        obscureText: obscureText,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  ValueListenableBuilder(
                    valueListenable: _obscureText2,
                    builder: (_, obscureText, child) {
                      return TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirmar senha',
                          suffixIcon: IconButton(
                            onPressed: () => _obscureText2.value = !_obscureText2.value,
                            icon: obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                          ),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required('Confirmação de senha obrigatória'),
                          Validatorless.compare(_passwordEC, 'Senhas não conferem'),
                        ]),
                        obscureText: obscureText,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: DeliveryButton(
                      label: 'CADASTRAR',
                      onPressed: () {
                        final valid = _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                            _nameEC.text,
                            _emailEC.text,
                            _passwordEC.text,
                          );
                        }
                      },
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
