import 'dart:ffi' as ffi;

typedef GiveMeANumberCType = ffi.Int64 Function();
typedef GiveMeANumber = int Function();

void main() {
  ffi.DynamicLibrary selfLibrary = ffi.DynamicLibrary.process();
  GiveMeANumber giveMeANumber = selfLibrary
      .lookup<ffi.NativeFunction<GiveMeANumberCType>>("GiveMeANumber")
      .asFunction();
  print("The number I got from native code was ${giveMeANumber()}");
}
