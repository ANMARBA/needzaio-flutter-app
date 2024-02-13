import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:flutter_needzaio_app/core/core.dart';
import 'package:flutter_needzaio_app/features/home/home.dart';

class BoardingPassFormPage extends ConsumerStatefulWidget {
  const BoardingPassFormPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BoardingPassFormPage> createState() =>
      _BoardingPassFormPageState();
}

class _BoardingPassFormPageState extends ConsumerState<BoardingPassFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _airportController = TextEditingController();
  final _emailController = TextEditingController();
  final _flightController = TextEditingController();

  DateTime _selectedDepartureDate = DateTime.now();
  DateTime _selectedArrivalDate = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _airportController.dispose();
    _emailController.dispose();
    _flightController.dispose();
    super.dispose();
  }

  void _clearData() {
    setState(() {
      _nameController.clear();
      _lastNameController.clear();
      _ageController.clear();
      _airportController.clear();
      _emailController.clear();
      _flightController.clear();
      _selectedDepartureDate = DateTime.now();
      _selectedArrivalDate = DateTime.now();
    });
    FocusScope.of(context).unfocus();
  }

  void _showDatePicker(bool isDeparture) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          if (isDeparture) {
            _selectedDepartureDate = pickedDate;
          } else {
            _selectedArrivalDate = pickedDate;
          }
        });
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(addBoardingPassNotifierProvider.notifier).execute(
            AddBoardingPassParams(
              arrivalTime: TimeConvert()
                  .fromDartDateTimeToGraphQLTimestamptz(_selectedArrivalDate),
              airport: _airportController.text,
              age: double.parse(_ageController.text),
              departureTime: TimeConvert()
                  .fromDartDateTimeToGraphQLTimestamptz(_selectedDepartureDate),
              email: _emailController.text,
              flight: _flightController.text,
              lastName: _lastNameController.text,
              name: _nameController.text,
            ),
          );
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      addBoardingPassNotifierProvider,
      (_, next) {
        next.whenOrNull(data: (_) {
          _clearData();
          _showSnackBar(context, 'Pasade de Abordaje agregado correctamente.');
        }, error: (_) {
          _showSnackBar(
            context,
            'Ocurrió un error. Por favor, inténtelo de nuevo.',
          );
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Pase de Abordaje'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un nombre.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un apellido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa una edad.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _airportController,
                  decoration: const InputDecoration(labelText: 'Aeropuerto'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un aeropuerto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration:
                      const InputDecoration(labelText: 'Correo Electrónico'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un correo electrónico.';
                    }
                    // Puedes agregar validaciones de formato de correo electrónico aquí si lo deseas.
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _flightController,
                  decoration:
                      const InputDecoration(labelText: 'Número de Vuelo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un número de vuelo.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text('Fecha de Salida:'),
                    const SizedBox(width: 8.0),
                    Text(DateFormat('dd/MM/yyyy')
                        .format(_selectedDepartureDate)),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () => _showDatePicker(true),
                      child: const Text('Seleccionar Fecha'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text('Fecha de Llegada:'),
                    const SizedBox(width: 8.0),
                    Text(DateFormat('dd/MM/yyyy').format(_selectedArrivalDate)),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () => _showDatePicker(false),
                      child: const Text('Seleccionar Fecha'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Agregar Pase de Abordaje'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
