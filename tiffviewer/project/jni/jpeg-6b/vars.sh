export NDK=~/Library/Android/sdk/ndk/21.0.6113669
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/darwin-x86_64
# Only choose one of these, depending on your device...
export TARGET=aarch64-linux-android
# Set this to your minSdkVersion.
export API=21
# Configure and build.
export AR=$TOOLCHAIN/bin/$TARGET-ar
export AS=$TOOLCHAIN/bin/$TARGET-as
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
export ABI=arm64-v8a
