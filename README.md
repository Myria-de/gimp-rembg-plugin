# AI Remove Background GIMP Plugin

This GIMP plugin allows users to remove image backgrounds using AI-powered tools like [rembg](https://github.com/danielgatis/rembg). The plugin integrates with GIMP to offer a simple way to remove backgrounds, optionally apply the result as a mask, flatten the image, and resize the canvas to make the image square. It can process a single image or all open images in GIMP.

## Deutsche Übersetzung (teilweise)
Dieses GIMP-Plugin ermöglicht es Benutzern, Bildhintergründe mit KI-gestützten Tools wie [rembg](https://github.com/danielgatis/rembg) zu entfernen. Das Plugin lässt sich in GIMP integrieren und bietet eine einfache Möglichkeit, Hintergründe zu entfernen, das Ergebnis optional als Maske anzuwenden, das Bild zu glätten und die Leinwandgröße anzupassen, um das Bild quadratisch zu machen. Es kann ein einzelnes Bild ~~oder alle in GIMP geöffneten Bilder~~ verarbeiten.

## Installation

1a. **Das Rembg-KI-Tool installieren:** Klonen oder Download dieses Repository.
   ```bash
   git clone https://github.com/Myria-de/gimp-rembg-plugin.git
   ```
Verwenden Sie dann unser Script *install_rembg_cpu.sh*.
Das Script *install_rembg_gpu.sh* installiert rembg mit GPU-Beschleunigung. Das ist nicht wirklich notwendig, weil rembg auch ohne schnell genug arbeitet.

**ODER**

1b.  **Installieren Sie `rembg`** selbst in einer Python-3-Umgebung in Ihrem Home-Verzeichnis.

     ```bash
    sudo apt install python3-venv
    python3 -m venv ~/rembg
    source ~/rembg/bin/activate
    pip install rembg[cpu,cli]
    deactivate
    #Test:
    ~/rembg/bin/rembg --help

**Installation unter Windows:** Verwenden Sie das Setup-Programm [rembg-cli-cpu-installer.exe](https://github.com/Myria-de/gimp-rembg-plugin/releases/download/v1.0/rembg-cli-cpu-installer.exe) unter "Releases".

2.  **Kopieren Sie das Plugin in die Gimp-Konfiguration**:

    - Über das ZIP-Archiv installieren:
        - Laden Sie [RemoveBG.zip](https://github.com/Myria-de/gimp-rembg-plugin/releases/download/v1.0/RemoveBG.zip) herunter.
        - Entpacken Sie den enthaltenen Ordner RemoveBG in dsa Plugin-Verzeichnis von Gimp
        - **Windows:** `C:\Users\YourUserName\AppData\Roaming\GIMP\3.0\plug-ins\RemoveBG\`
        - **Linux mit System-Paket:** `/home/YourUserName/.config/GIMP/3.0/plug-ins/RemoveBG/`
        - **Linux mit SNAP-Paket:** `/home/YourUserName/snap/gimp/current/.config/GIMP/3.0/plug-ins/RemoveBG/`
     
**ODER**      

    - Erstellen Sie das Unterverzeichnis RemoveBG` in Ihrem GIMP-Plugins-Ordner:
        - **Windows:** `C:\Users\YourUserName\AppData\Roaming\GIMP\3.0\plug-ins\RemoveBG\`
        - **Linux mit System-Paket:** `/home/YourUserName/.config/GIMP/3.0/plug-ins/RemoveBG/`
        - **Linux mit SNAP-Paket:** `/home/YourUserName/snap/gimp/current/.config/GIMP/3.0/plug-ins/RemoveBG/`
    -   Laden Sie `RemoveBG.py` und `config.ini` herunter und verschieben Sie beide Dateien in dieses Unterverzeichnis.
    -   Bearbeiten Sie die Datei `config.ini` wenn Sie einen anderen Pfad als `~/rembg/bin/rembg` verwenden. Windows-Nutzer verwenden den Pfad `AppData\Local\rembg\rembg.exe` (relativer Pfad unter `C:\Users\[Benutzername]`), den das Setup-Programm vorgibt. Das Home-Verzeichnis wird vom Python-Script ergänzt.
    
4.  **Starten Sie GIMP neu**, um das Plugin zu laden.

**Weitere Möglichkeiten:** Sie können rembg auch unabhängig von GIMP verwenden. Anleitungen finden Sie auf [rembg](https://github.com/danielgatis/rembg).

## Features

- **AI-Powered Background Removal:** Removes the background using the `rembg` tool, an AI-powered background removal library.
- **Mask Option:** Choose to apply the background removal as a non-destructive layer mask.
- **Make Square Option:** Optionally resize the canvas to make the image square by extending the shorter side to match the longest side.
- **Flatten Image:** Automatically flatten the image after processing, merging visible layers and removing any non-visible ones.
- ~~**Batch Process:** Process all open images in GIMP with a single click.~~
- **External Configuration:** Customize settings via `config.ini` file.

## Requirements

- **GIMP 3.0+** (Upgraded from GIMP 2.10+)
- **Python 3.x** (For `rembg` to work)
- **rembg**: You need to have the `rembg` package installed in Python 3.x.

## Installation

1. **Clone or Download** this repository.
   ```bash
   git clone https://github.com/Myria-de/gimp-rembg-plugin.git
Install rembg in your Python 3 environment.

1.  **Install `rembg`** in a Python 3 environment in your home directory.

     ```bash
    sudo apt install python3-venv
    python3 -m venv ~/rembg
    source ~/rembg/bin/activate
    pip install rembg[cpu,cli]
    deactivate
    #Test:
    ~/rembg/bin/rembg --help
Or use our Script *install_rembg_cpu.sh*.

The script *install_rembg_gpu.sh* installs rembg with GPU support. That's not really necessary because rembg works fast enough anyway.

**Windows installation:** Use the setup tool *rembg-cli-cpu-installer.exe* ("Releases").

2.  **Copy the Plugin to GIMP**:

    -   Create a subdirectory called `RemoveBG` in your GIMP plugins folder:
        -   **Windows:** `C:\Users\YourUserName\AppData\Roaming\GIMP\3.0\plug-ins\RemoveBG\`
        -   **Linux with system package:** `/home/YourUserName/.config/GIMP/3.0/plug-ins/RemoveBG/`
        -   **Linux with SNAP package:** `/home/YourUserName/snap/gimp/current/.config/GIMP/3.0/plug-ins/RemoveBG/`
    -   Move both `RemoveBG.py` and `config.ini` files to this subdirectory
    -   Edit the `config.ini` file if you are using a path other than `~/rembg/bin/rembg`. Windows users should use the path `AppData\Local\rembg\rembg.exe` (relative path under `C:\Users\[username]`), which is specified by the setup programme. The home directory is added by the Python script.
3.  **Restart GIMP** to load the plugin.

**Other options:** You can also use rembg independently of GIMP. Instructions can be found at [rembg](https://github.com/danielgatis/rembg).

Usage
-----

1.  **Open GIMP** and load an image.
2.  Go to **Python-Fu > AI Remove Background...**.
3.  Configure the options as per your needs:
    -   **Use as Mask:** Apply the background removal as a non-destructive mask.
    -   **Model:** Choose which AI model to use for background removal.
    -   **Alpha Matting:** Enable alpha matting for smoother edges.
    -   **Make Square:** Optionally make the canvas square.
    -   ~~**Process all Open Images:** Process all open images in GIMP in batch mode. **Currently disabled due to stability issues.**~~
4.  Click **OK** to run the plugin.

Plugin Options
--------------

| Option | Description |
| --- | --- |
| **Use as Mask** | Apply the background removal as a non-destructive mask on the current layer. |
| **Model** | Select from different AI models (e.g., `u2net`, `sam`, `isnet-anime`). |
| **Alpha Matting** | Refine the edges of the background removal using alpha matting. |
| **Alpha Matting Erode Size** | Set the size for edge refinement when using alpha matting. |
| **Make Square** | Resize the canvas to make the image square by adjusting the shortest side. |
| **~~Process all Open Images~~** | ~~Apply the plugin to all open images in GIMP. Currently disabled due to stability issues.~~|

## Configuration

The plugin now supports external configuration via `config.ini`:

```ini
[Paths]
# Windows
# aiexe = AppData\Local\rembg\rembg.exe
# Linux
aiexe = ~/rembg/bin/rembg

[Settings]
default_alpha_matting_value = 15
default_fg_treshold = 240
default_bg_treshold = 10
default_model = 0
default_as_mask = False
default_alpha_matting = False
default_make_square = False
default_process_all_images = False

[Debug]
debug_enabled = False
```

## Example Workflow
----------------

1.  Open an image in GIMP that you want to remove the background from.
2.  Select **AI Remove Background** from the Python-Fu menu.
3.  Choose to apply the removal as a mask or flatten the image, and whether to resize the image to be square.
4.  Run the plugin and watch as the background is removed and the image is processed.

## What's New in This Version

- **GIMP 3.0 Support:** Fully upgraded from GIMP 2.x to GIMP 3.0 compatibility
- **External Configuration:** Settings moved to `config.ini` for better portability
- ~~**Modern rembg Integration:** Updated to use `rembg.cli` instead of direct executable~~
- **rembg Integration** Moved back to cli usage because of better compatibility
- **Improved Code Structure:** Refactored into smaller, focused methods
- **Enhanced Error Handling:** Better debugging and error reporting
- **SNAP/Flatpack support**
- **Enhanced Configuration** Added configuration for Alpha Matting Foreground treshold and Alpha Matting Background threshold
- ~~**Fixed Batch Processing:** Proper handling of multiple images~~

## Contributing
------------

Feel free to open issues or submit pull requests to improve this plugin! Contributions are always welcome.

License
-------

This project is licensed under the **GPLv3** License - see the <LICENSE> file for details.

Acknowledgments
---------------
-   **Original/Updated gimp-rembg-plugin**: https://github.com/gvardi/gimp-rembg-plugin
-   **rembg**: This plugin integrates with [rembg](https://github.com/danielgatis/rembg) to handle AI-powered background removal.
-   **GIMP**: The GNU Image Manipulation Program, a free and open-source image editor.
