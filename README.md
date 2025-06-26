# ps1-script-runner
Run any ps1 script in Windows Home Edition without restrictions

# 🛡️ PowerShell Safe Runner (Windows Home Friendly)

This project allows you to run `.ps1` scripts safely from a trusted folder.

## 🧩 What it does:
- ✅ Creates a trusted folder `ps1_runner` on your Desktop.
- ✅ Copies a secure script runner (`run-safe.ps1`) into that folder.
- ✅ Lets you bypass script signing errors by using a controlled method.

## 🚀 Setup Instructions

1. **Download or Clone this repo**
2. Go to the `ps1-script-runner` folder and **Run as Administrator** `setup-runner.bat`
3. It will:
   - Automatically create `ps1_runner` on your Desktop
   - Copy `run-safe.ps1` there
   - Show you usage instructions

## 📌 How to Use

- Move any PowerShell script you want to run into `ps1_runner`
- Open PowerShell and type:

```powershell
cd "$env:USERPROFILE\OneDrive\Desktop\ps1_runner"
.\run-safe.ps1 .\your-script.ps1
```
Happy Hacking >_<
