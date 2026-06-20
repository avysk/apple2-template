# apple2-template
Template for Apple][ assembly programs

## Getting Started

### Submodules
This project uses a git submodule for the `monitor` utility. When cloning this repository, make sure to initialize the submodules:

```sh
git clone --recurse-submodules <repository-url>
```

If you have already cloned the repository without submodules, you can fetch and initialize them by running:

```sh
git submodule update --init --recursive
```

### Renaming the Program
By default, the program is named `PROG`. To name your program differently:

1. Open `GNUmakefile` and change the `NAME` variable at the top from `PROG` to your desired name (e.g., `NAME := MYAPP`).
2. Rename the main source file `src/PROG.S` to match your new name (e.g., `src/MYAPP.S`).
3. Inside your renamed `.S` source file, update the `DSK` directive to point to the new build output name (e.g., `DSK ../build/MYAPP`).

## Usage (Make)

This template uses `make` (via `GNUmakefile`) to automate the build process, prepare the disk image, and launch the emulator. 

Here are the available `make` commands:

- `make compile`: (Default) Assembles the `.S` source files using `merlin32` and places the compiled binary in the `build/` directory.
- `make run`: Compiles the code, transfers it to the disk image, and automatically boots it in the AppleWin emulator.
- `make transfer`: Compiles the program and copies the resulting binary onto the Apple II disk image (`build/work.dsk`) using AppleCommander.
- `make disk`: Prepares the disk image and creates a basic `HELLO` script that automatically runs your program when the disk boots.
- `make clean`: Deletes the `build/` directory and all generated artifacts.

## Prerequisites
- **Merlin32**: Assembly compiler.
- **AppleCommander (`ac.jar`)**: Java utility to manipulate Apple II disk images.
- **AppleWin**: Apple II emulator.
- **Java**: Required to run AppleCommander.
- **CMake**: Used for cross-platform cleanup in the `make clean` step.
