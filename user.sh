#!/usr/bin/bash
# shellcheck disable=SC2034

#    Copyright (c) 2022 @grm34 Neternels Team
#
#    Permission is hereby granted, free of charge, to any person
#    obtaining a copy of this software and associated documentation
#    files (the "Software"), to deal in the Software without restriction,
#    including without limitation the rights to use, copy, modify, merge,
#    publish, distribute, sublicense, and/or sell copies of the Software,
#    and to permit persons to whom the Software is furnished to do so,
#    subject to the following conditions:
#
#    The above copyright notice and this permission notice shall be
#    included in all copies or substantial portions of the Software.
#
#    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
#    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## GENERAL OPTIONS
## ===============

# TimeZone (used to set build date)
# ---------------------------------
TIMEZONE="Europe/Paris"

# Device codename (e.q. X00TD)
# ----------------------------
# Info: will be prompted when set to default
CODENAME=default

# Builder name (displayed in proc/version)
# ----------------------------------------
# Info: WHOAMI will be used when set to default
BUILDER=default

# Builder host (displayed in proc/version)
# ----------------------------------------
# Info: HOSTNAME will be used when set to default
HOST=default

# Default toolchain compiler
# --------------------------
# Toolchains: Proton-Clang | Eva-GCC | Proton-GCC
DEFAULT_COMPILER="Proton-Clang"

# Android kernel directory
# ------------------------
# Info: will be prompted when set to default
# Tip: use TAB key for autocompletion
KERNEL_DIR=default

# Target architecture
# -------------------
ARCH=arm64

# Android global version
# ----------------------
# Info: could be required by some kernels
PLATFORM_VERSION=11
ANDROID_MAJOR_VERSION=r

# Kernel variant
# --------------
KERNEL_VARIANT=Nethunter

# Kernel name
# -----------
TAG=Nethunter

# Telegram API configuration
# --------------------------
# Note: WTF, who wants RT build status in TG?
TELEGRAM_ID=""
TELEGRAM_BOT=""
TELEGRAM_TOKEN=""


## ADVANCED OPTIONS (do not edit when not sure)
## ============================================

# Some required dependencies
DEPENDENCIES=(wget git zip llvm lld clang)

# Link Time Optimization (LTO)
LTO=False
LTO_PATH="toolchains/proton/lib"

# AnyKernel config will be cloned in "AnyKernel/"
ANYKERNEL="https://github.com/grm34/AnyKernel3.git"
BRANCH=Neternels-Builder

# Proton-Clang will be cloned in "toolchains/proton/"
PROTON="https://github.com/kdrag0n/proton-clang.git"

# GCC ARM64 will be cloned in "toolchains/gcc64/"
GCC_64="https://github.com/mvaisakh/gcc-arm64.git"

# GCC ARM will be cloned in "toolchains/gcc32/"
GCC_32="https://github.com/mvaisakh/gcc-arm.git"

# Proton-Clang config
PROTON_CLANG_PATH="toolchains/proton/bin"
PROTON_CLANG_PARAMETERS=(
    ARCH=arm64
    SUBARCH=arm64
    CROSS_COMPILE=aarch64-linux-gnu-
    CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
    CC=clang
    AR=llvm-ar
    NM=llvm-nm
    OBJCOPY=llvm-objcopy
    OBJDUMP=llvm-objdump
    STRIP=llvm-strip
)

# Eva-GCC config
EVA_GCC_PATH="toolchains/gcc32/bin:toolchains/gcc64/bin"
EVA_GCC_PARAMETERS=(
    ARCH=arm64
    SUBARCH=arm64
    CROSS_COMPILE_ARM32=arm-eabi-
    CROSS_COMPILE=aarch64-elf-
    AR=aarch64-elf-ar
    OBJDUMP=aarch64-elf-objdump
    STRIP=aarch64-elf-strip
)

# Proton-GCC config
PROTON_GCC_PATH="toolchains/proton/bin:toolchains/gcc64/bin:toolchains/gcc32/bin"
PROTON_GCC_PARAMETERS=(
    ARCH=arm64
    SUBARCH=arm64
    CC=clang
    CROSS_COMPILE=aarch64-linux-gnu-
    CROSS_COMPILE_ARM32=arm-linux-gnueabi-
    AR=llvm-ar
    AS=llvm-as
    NM=llvm-nm
    STRIP=llvm-strip
    OBJCOPY=llvm-objcopy
    OBJDUMP=llvm-objdump
    OBJSIZE=llvm-size
    READELF=llvm-readelf
    HOSTCC=clang
    HOSTCXX=clang++
    HOSTAR=llvm-ar
    CLANG_TRIPLE=aarch64-linux-gnu-
)
