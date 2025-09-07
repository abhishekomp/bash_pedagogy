# Move PNG Files Script (move_png_files_v2.bash)

A **feature-rich Bash script** to safely move `.png` files from one folder to another on macOS/Linux. The script supports **dry-run mode**, **safe moves avoiding overwrites**, and optional **automatic creation of the destination folder**.

---

## Features

* **Dry run by default**: Preview how many files will be moved without actually moving them.
* **Move mode (`-m`)**: Actually move the files.
* **Safe moves**: Automatically renames files if a conflict exists (e.g., `file.png` → `file_1.png`).
* **Destination folder check**:

  * Prompts to create the destination folder if it doesn’t exist.
* **Conflict summary in dry run**: Shows how many files would need renaming.
* **Non-recursive**: Only moves files in the specified source folder (subfolders are ignored).

---

## Usage

```bash
./move_pngs.sh <source_folder> <destination_folder> [-m]
```

### Arguments

| Argument               | Description                                                                        |
| ---------------------- | ---------------------------------------------------------------------------------- |
| `<source_folder>`      | Folder containing `.png` files to move.                                            |
| `<destination_folder>` | Target folder where files should be moved.                                         |
| `-m`                   | Optional flag to actually move files. If omitted, the script runs in dry-run mode. |

---

### Examples

* **Dry run (default)**

  ```bash
  ./move_pngs.sh ~/Downloads/images ~/Pictures/png-backup
  ```

  Output:

  ```
  Found 12 .png file(s) in ~/Downloads/images.
  Dry run: 12 files would be moved from ~/Downloads/images to ~/Pictures/png-backup.
  WARNING: 2 file(s) would need renaming due to conflicts.
  ```

* **Actually move files**

  ```bash
  ./move_pngs.sh ~/Downloads/images ~/Pictures/png-backup -m
  ```

  Output:

  ```
  Moved 12 .png file(s) from ~/Downloads/images to ~/Pictures/png-backup safely.
  2 file(s) were renamed to avoid overwriting existing files.
  ```

* **Create destination folder if missing**

  ```bash
  ./move_pngs.sh ~/Downloads/images ~/Pictures/new-folder -m
  ```

  Prompt:

  ```
  Destination folder '~/Pictures/new-folder' does not exist.
  Do you want to create it? (y/n):
  ```

---

## Make the script executable and runnable from anywhere

1. **Make it executable**

   ```bash
   chmod +x move_pngs.sh
   ```

2. **Move it to a folder in your PATH** (e.g., `~/bin` or `/usr/local/bin`)

   ```bash
   mv move_pngs.sh ~/bin/
   ```

   > Make sure `~/bin` is in your PATH. You can check:
   >
   > ```bash
   > echo $PATH
   > ```

3. **Run it from any directory**

   ```bash
   move_pngs.sh ~/Downloads/images ~/Pictures/png-backup -m
   ```

Now you can easily use the script without specifying the full path every time.

---

This README makes the script **fully user-friendly** and ready for safe daily use.

---

If you want, I can **also create a small visual example in the README** showing a dry-run and move scenario side-by-side, which makes it even easier for a new user to understand.

Do you want me to add that?
