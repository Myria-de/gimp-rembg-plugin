sudo apt install python3-venv
python3 -m venv ~/rembg
source ~/rembg/bin/activate
pip install rembg[cpu,cli]
deactivate
# Test
~/rembg/bin/rembg --help
