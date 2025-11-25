import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _emailTextField(),
                const SizedBox(height: 20),
                _passwordTextField(),
                const SizedBox(height: 20),
                _buttonLogin(),
                const SizedBox(height: 30),
                _menuRegistrasi(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextField Email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email harus diisi';
        }
        return null;
      },
    );
  }

  // TextField Password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

  // Tombol Login
  Widget _buttonLogin() {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () {
        bool validate = _formKey.currentState!.validate();
        if (validate) {
          setState(() => _isLoading = true);

          // TODO: proses login API di sini

          // simulasi selesai loading
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() => _isLoading = false);
            }
          });
        }
      },
      child: _isLoading
          ? const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      )
          : const Text("Login"),
    );
  }

  // Menu ke halaman Registrasi
  Widget _menuRegistrasi() {
    return InkWell(
      child: const Text(
        "Registrasi",
        style: TextStyle(color: Colors.blue),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegistrasiPage(),
          ),
        );
      },
    );
  }
}
