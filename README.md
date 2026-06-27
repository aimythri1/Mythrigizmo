# 🚀 Mythrigizmo Installation Guide for Nuke

This repository contains custom **Nuke gizmos** and an automatic installer that adds them to the user’s `.nuke` folder.

📌 Repository:

```bash
https://github.com/aimythri1/Mythrigizmo
```

---

## ✅ Before You Install

Make sure you have:

👉 **Foundry Nuke installed**
👉 **Git installed**
👉 **Internet connection**

⚠️ Important:
After installing Nuke, open Nuke at least once and then close it.
This helps Nuke create the user `.nuke` folder automatically.

The `.nuke` folder is usually created here:

```bat
C:\Users\YOUR_USERNAME\.nuke
```

Example:

```bat
C:\Users\jishithareddy\.nuke
```

If the `.nuke` folder does not already exist, the installer will create it automatically.

---

## 🛠️ Installation Steps

### 1️⃣ Open Command Prompt

Open **Windows Command Prompt**.

---

### 2️⃣ Clone the Repository

Run this command:

```bat
git clone https://github.com/aimythri1/Mythrigizmo.git
```

This will download the repository to your current Command Prompt location.

---

### 3️⃣ Go Inside the Repository Folder

Run:

```bat
cd Mythrigizmo
```

---

### 4️⃣ Run the Installer

Run:

```bat
install.bat
```

The installer will automatically:

✅ Create the `.nuke` folder if it does not exist
✅ Install/update Mythrigizmo inside the user’s `.nuke` folder
✅ Add the Mythrigizmo loader into `.nuke/menu.py`
✅ Connect the `gizmos` folder to Nuke
✅ Make the tools available inside Nuke

The final install location will be:

```bat
C:\Users\YOUR_USERNAME\.nuke\Mythrigizmo
```

---

### 5️⃣ Restart Nuke

Close Nuke completely if it is already open.

Then open Nuke again.

After restart, the tools should appear here:

```text
Nodes → Mythri Gizmos
```

You can also press **Tab** inside the Node Graph and search for tools like:

```text
NST_ColorSmear
Qc_Pro
BurnIn
VolumeRays
```

---

## 🔄 Updating Mythrigizmo

If Mythrigizmo is already installed and you want the latest version, run:

```bat
cd /d %USERPROFILE%\.nuke\Mythrigizmo
git pull origin main
```

Then restart Nuke.

---

## 📁 Final Folder Structure

After installation, the user’s `.nuke` folder should look like this:

```text
C:\Users\YOUR_USERNAME\.nuke
│
├─ menu.py
│
└─ Mythrigizmo
   │
   ├─ install.bat
   ├─ menu.py
   ├─ LICENSE
   │
   └─ gizmos
      ├─ NST_ColorSmear.gizmo
      ├─ Qc_Pro.gizmo
      ├─ BurnIn.gizmo
      ├─ VolumeRays.gizmo
      └─ ...
```

---

## 🧩 Troubleshooting

### ❌ Git is not recognized

If you see this error:

```text
git is not recognized as an internal or external command
```

Install Git first:

```text
https://git-scm.com/downloads
```

Then close and reopen Command Prompt.

---

### ❌ Tools are not visible in Nuke

Try these checks:

👉 Close Nuke completely and reopen it
👉 Click inside the Node Graph
👉 Press **Tab** and search for a gizmo name
👉 Check that this folder exists:

```bat
C:\Users\YOUR_USERNAME\.nuke\Mythrigizmo\gizmos
```

👉 Check that this file exists:

```bat
C:\Users\YOUR_USERNAME\.nuke\menu.py
```

---

## 🧰 Manual Installation Alternative

If the installer does not work, manually copy or clone the repository into:

```bat
C:\Users\YOUR_USERNAME\.nuke\Mythrigizmo
```

Then add this loader code inside:

```bat
C:\Users\YOUR_USERNAME\.nuke\menu.py
```

```python
import os
import nuke

mythri_path = os.path.join(os.path.dirname(__file__), "Mythrigizmo")
mythri_menu_py = os.path.join(mythri_path, "menu.py")

if os.path.exists(mythri_path):
    nuke.pluginAddPath(mythri_path)

if os.path.exists(mythri_menu_py):
    exec(compile(open(mythri_menu_py, "rb").read(), mythri_menu_py, "exec"), {
        "__file__": mythri_menu_py,
        "__name__": "__mythrigizmo_menu__"
    })
```

Then restart Nuke.

---

## ✅ Done

After installation, Mythrigizmo should be available in Nuke under:

```text
Nodes → Mythri Gizmos
```

🎉 Installation complete!
