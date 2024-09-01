import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _waController = TextEditingController();
  final TextEditingController _phoneCodeController = TextEditingController();
  final TextEditingController _waCodeController = TextEditingController();
  final TextEditingController _mobileCodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _locationCoordinatesController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _cuisineIdController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _register() async {
    final email = _emailTextController.text.trim();
    final password = _passwordTextController.text.trim();
    final confirmPassword = _confirmPasswordTextController.text.trim();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final phoneNumber = _phoneNumberController.text.trim();
    final waNumber = _waController.text.trim();
    final phoneCode = _phoneCodeController.text.trim();
    final waCode = _waCodeController.text.trim();
    final mobileCode = _mobileCodeController.text.trim();
    final address = _addressController.text.trim();
    final locationCoordinates = _locationCoordinatesController.text.trim();
    final referralCode = _referralController.text.trim();
    final cuisineId = _cuisineIdController.text.trim();
    final mobileNumber = _mobileNumberController.text.trim();
    final country = _countryController.text.trim();
    final state = _stateController.text.trim();
    final city = _cityController.text.trim();

    // Basic validation
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required.')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      await authProvider.register(
        type: '1',
        userId: 'userId_value',
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        waNumber: waNumber,
        phoneCode: phoneCode,
        waCode: waCode,
        mobileCode: mobileCode,
        password: password,
        confirmPassword: confirmPassword,
        address: address,
        locationCoordinates: locationCoordinates,
        referralCode: referralCode,
        cuisineId: cuisineId,
        mobileNumber: mobileNumber,
        country: country,
        state: state,
        city: city,
      );

      Navigator.pushNamed(context, 'signIn');
    } catch (e) {
      print('Error during registration: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Signup', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTextField('First Name', _firstNameController),
            const SizedBox(height: 15),
            _buildTextField('Last Name', _lastNameController),
            const SizedBox(height: 15),
            _buildTextField('Email', _emailTextController),
            const SizedBox(height: 15),
            _buildPasswordField(),
            const SizedBox(height: 15),
            _buildTextField('Confirm Password', _confirmPasswordTextController),
            const SizedBox(height: 15),
            _buildTextField('Phone Number', _phoneNumberController),
            const SizedBox(height: 15),
            _buildTextField('WA Number', _waController),
            const SizedBox(height: 15),
            _buildTextField('Phone Code', _phoneCodeController),
            const SizedBox(height: 15),
            _buildTextField('WA Code', _waCodeController),
            const SizedBox(height: 15),
            _buildTextField('Mobile Code', _mobileCodeController),
            const SizedBox(height: 15),
            _buildTextField('Address', _addressController),
            const SizedBox(height: 15),
            _buildTextField('Location Coordinates', _locationCoordinatesController),
            const SizedBox(height: 15),
            _buildTextField('Referral Code', _referralController),
            const SizedBox(height: 15),
            _buildTextField('Cuisine ID', _cuisineIdController),
            const SizedBox(height: 15),
            _buildTextField('Mobile Number', _mobileNumberController),
            const SizedBox(height: 15),
            _buildTextField('Country', _countryController),
            const SizedBox(height: 15),
            _buildTextField('State', _stateController),
            const SizedBox(height: 15),
            _buildTextField('City', _cityController),
            const SizedBox(height: 20),
            _buildRegisterButton(),
            const SizedBox(height: 10),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: <TextSpan>[
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: 'Login Now',
                      style: const TextStyle(color: Color(0xFFD6B560)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, 'signIn');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordTextController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _register,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD6B560),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
