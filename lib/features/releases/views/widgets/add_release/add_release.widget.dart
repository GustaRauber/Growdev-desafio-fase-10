import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/views/modals/error.modal.dart';
import '../../../../../shared/views/widgets/custom_password_input/custom_button.widget.dart';
import '../../../../../shared/views/widgets/custom_price_input.widget.dart';
import '../../../../../shared/views/widgets/custom_text_input.widget.dart';
import '../../../../../theme/app_colors.dart';
import '../custom_date_input.widget.dart';
import 'add_release.store.dart';

class AddRelease extends StatefulWidget {
  const AddRelease({super.key});

  @override
  State<AddRelease> createState() => _AddReleaseState();
}

class _AddReleaseState extends State<AddRelease> {
  final descriptionController = TextEditingController();
  final valueController = TextEditingController();
  final dateController = TextEditingController();
  final store = AddReleaseStore();
  final formKey = GlobalKey<FormState>();
  final formatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    decimalDigits: 2,
    enableNegative: false,
    symbol: 'R\$',
  );

  @override
  void dispose() {
    descriptionController.dispose();
    valueController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Adicionar lançamento',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CloseButton(
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomPriceInput(
                controller: valueController,
                label: 'Digite o valor',
                formatter: formatter,
              ),
              const SizedBox(height: 10),
              CustomTextInput(
                label: 'Digite a descrição',
                controller: descriptionController,
              ),
              const SizedBox(height: 10),
              CustomDateInput(
                label: 'Escolha a data',
                controller: dateController,
              ),
              const SizedBox(
                height: 10,
              ),
              Observer(
                builder: (context) {
                  return Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: store.isInflow,
                            onChanged: (_) => store.setisInflow(true),
                          ),
                          const Text('Entrada')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: !store.isInflow,
                            onChanged: (_) => store.setisInflow(false),
                          ),
                          const Text('Saída')
                        ],
                      ),
                    ],
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    label: 'Cancelar',
                    onPressed: () => Navigator.of(context).pop(),
                    color: appColors.secondaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    width: 100,
                    label: 'Adicionar',
                    onPressed: addRelease,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addRelease() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final value = formatter.getUnformattedValue().toDouble();
    final description = descriptionController.text;
    final date = DateFormat('dd-MM-yyyy')
        .parse(dateController.text.replaceAll('/', '-'));

    final release = await store.addRelease(
      description: description,
      date: date,
      value: value,
    );

    if (store.error != null) {
      ErrorModal.show(context: context, message: store.error!);
    }
    if (!mounted) return;

    Navigator.of(context).pop(release);
  }
}
