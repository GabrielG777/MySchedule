import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  void _submit() {
    if (_formKey.currentState!.validate() &&
        _selectedDate != null &&
        _selectedTime != null) {
      final dateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
      final newTask = Task(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dateTime: dateTime,
      );
      Navigator.pop(context, newTask);
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel =
        _selectedDate == null
            ? 'Selecionar data'
            : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    final timeLabel =
        _selectedTime == null
            ? 'Selecionar hora'
            : _selectedTime!.format(
              context,
            ); // já exibe hora:minuto no formato local

    return Scaffold(
      appBar: AppBar(title: const Text('Nova Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Nome da Tarefa'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Informe o nome da tarefa' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _pickDate,
                      child: Text(dateLabel),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _pickTime,
                      child: Text(timeLabel),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(onPressed: _submit, child: const Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
