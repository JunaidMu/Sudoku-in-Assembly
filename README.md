# Sudoku Game – NASM x iAPX88 Assembly

A classic **Sudoku game** implemented entirely in **Assembly Language** using **NASM** on **DOSBox**, built for the COAL (Computer Organization and Assembly Language) course at FAST during the 3rd semester.

## 🎮 Gameplay Features

- Interactive keyboard-based Sudoku gameplay
- Real-time feedback with **sound** for keystrokes and errors
- Mistake counter for added challenge
- **Notes mode** to jot down possible values in any cell
- **Undo** feature to revert moves
- **Timer** to track play duration
- Scoring system based on performance
- **Smooth scrolling interface** in Assembly
- Immediate exit via ESC key
- Start and end screens with credits

---

## 🕹️ How to Play

> All inputs are through the keyboard.

### 🎯 Starting the Game
- Press **`A`** to start the game from the main menu.

### 🔢 Entering a Value
1. Press **`Space`** to begin input.
2. Enter:
   - Row number (1–9)
   - Column number (1–9)
   - The value (1–9)

### 📝 Taking Notes
- Press **`N`** to activate note mode.
- Then enter:
  - Row number
  - Column number
  - The value you want to note

> Notes are treated separately from main entries.

### 🔁 Undo a Step
- Press **`.`** to undo the last move or note.

### ❌ Exit the Game
- Press **`ESC`** anytime to exit immediately.

---

## 🖥️ Tech Stack

- **NASM Assembly**
- **DOSBox Emulator**
- iAPX88 Architecture

---

## 📸 Screenshots
![Start Screen](Start%20Screen.png)
![Main Screen](Main%20Screen.png)
![End Screen](End%20Screen.png)
