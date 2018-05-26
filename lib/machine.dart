library machine;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'machine.g.dart';

@BuiltValue(instantiable: false)
abstract class Machine<I extends Input, O extends Output> {
  String get message;

  I get input;

  O get output;

  Machine<I, O> rebuild(void updates(MachineBuilder<I, O> b));

  MachineBuilder<I, O> toBuilder();
}

@BuiltValue(instantiable: false)
abstract class Input {
  BuiltList<String> get inputValues;

  Input rebuild(void updates(InputBuilder b));

  InputBuilder toBuilder();
}

@BuiltValue(instantiable: false)
abstract class Output {
  BuiltList<String> get outputValues;

  Output rebuild(void updates(OutputBuilder b));

  OutputBuilder toBuilder();
}

abstract class MyMachine
    implements Machine<MyInput, MyOutput>, Built<MyMachine, MyMachineBuilder> {

  // Commenting out this fields also produces error
  @override
  MyInput get input;

  @override
  MyOutput get output;

  MyMachine._();

  factory MyMachine([updates(MyMachineBuilder b)]) = _$MyMachine;
}

abstract class MyInput implements Input, Built<MyInput, MyInputBuilder> {
  int get myInputValue;

  MyInput._();

  factory MyInput([updates(MyInputBuilder b)]) = _$MyInput;
}

abstract class MyOutput implements Output, Built<MyOutput, MyOutputBuilder> {
  bool get myOutputValue;

  MyOutput._();

  factory MyOutput([updates(MyOutputBuilder b)]) = _$MyOutput;
}
