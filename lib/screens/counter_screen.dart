import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_app/bloc/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter Cubit Example')),
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $count', style: const TextStyle(fontSize: 24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () =>
                            context.read<CounterCubit>().decrement(),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () =>
                            context.read<CounterCubit>().increment(),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
