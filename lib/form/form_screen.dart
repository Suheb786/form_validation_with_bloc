import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_with_bloc/form/form_bloc.dart';
import 'package:form_validation_with_bloc/widgets/custom_textField.dart';

class FormScreeen extends StatelessWidget {
  FormScreeen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("flutter_bloc_demo"))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              BlocBuilder<FormBloc, SignInFormState>(
                builder: (context, state) {
                  if (state is FormError) {
                    return Center(
                      child: Container(
                        color: Colors.red,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          state.errorMsg,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextformField(
                controller: emailController,
                onChanged: (txt) {
                  BlocProvider.of<FormBloc>(context).add(TextChangedEent(
                      emailController.text, passwordController.text));
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                controller: passwordController,
                onChanged: (txt) {
                  BlocProvider.of<FormBloc>(context).add(TextChangedEent(
                      emailController.text, passwordController.text));
                },
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<FormBloc, SignInFormState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {},
                      child: (state is FormValid)
                          ? Text("Sign In")
                          : Text("Inactive Button"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
