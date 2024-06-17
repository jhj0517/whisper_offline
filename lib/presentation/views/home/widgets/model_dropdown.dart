import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisper_flutter_new/whisper_flutter_new.dart';

import 'package:whisper_offline/presentation/providers/home_provider.dart';

class ModelDropdown extends StatelessWidget {

  const ModelDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedModel = context.select<HomeProvider, WhisperModel>((provider) => provider.selectedModel);
    return Column(
      children: [
        const Text('Model DropDown'),
        DropdownButton<WhisperModel>(
          hint: const Text('Select Model'),
          value: selectedModel,
          onChanged: (WhisperModel? newValue) {
            final provider = context.read<HomeProvider>();
            provider.setModel(newValue!);
          },
          items: WhisperModel.values.map((WhisperModel model) {
            return DropdownMenuItem<WhisperModel>(
              value: model,
              child: Text(model.modelName),
            );
          }).toList(),
        )
      ],
    );
  }
}
