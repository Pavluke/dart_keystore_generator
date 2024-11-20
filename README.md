Create bash:

```bash
rm -f build/generate_keystore && mkdir -p build && dart compile exe bin/dart_android_keystore_generator.dart -o build/generate_keystore
```

Run key generator:

```bash
./build/generate_key
```

Output:

```bash
./build/output
```
