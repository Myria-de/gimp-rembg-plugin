sudo apt install python3-venv
python3 -m venv ~/rembg
source ~/rembg/bin/activate
pip install rembg[gpu,cli]
pip install onnxruntime-gpu[cuda,cudnn]
mkdir ~/rembg/extra-libs
cd ~/rembg
# copy cuda libraries
find lib -name 'libcu*.so.*' | xargs cp -t ~/rembg/extra-libs
find lib -name 'libnv*.so.*' | xargs cp -t ~/rembg/extra-libs
deactivate
# Add cuda libs to path
echo 'export LD_LIBRARY_PATH=~/rembg/extra-libs:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
# Test
#export LD_LIBRARY_PATH=~/rembg/extra-libs
~/rembg/bin/rembg --help



