#!/bin/zsh

source ~/.zshrc

conda update conda -y
conda clean --all -y
conda install ipython -y

# conda create --name py35 python=3.5 numpy scipy matplotlib
conda install libgcc -y
conda create --name py27 python=2.7 numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py -y
conda create --name py35 python=3.5 numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py -y
pip install numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py sympy
sed -i.bak "/anaconda3/d" ~/.zshrc
echo "export PATH=/opt/anaconda3/envs/py27/bin:\$PATH" >> ~/.zshrc
echo "export PATH=/opt/anaconda3/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc

echo "Installing nbconvert"
sudo apt-get install pandoc
cd ~
git clone https://github.com/jupyter/nbconvert.git
cd nbconvert
pip install -e .

pip install autopep8 scdl org-e youtube-dl
echo "alias ydl=\"youtube-dl -f 140 --add-metadata --metadata-from-title \\\"%(artist)s - %(title)s\\\" -o \\\"%(title)s.%(ext)s\\\"\"" >> ~/.bash_aliases

jupyter notebook --generate-config
{
    echo ""
    echo "c.NotebookApp.browser = u'firefox'"
} >> ~/.jupyter/jupyter_notebook_config.py

conda info --envs

echo "*************************** NOTICE ***************************"
echo "If you ever mess up your anaconda installation somehow, do"
echo "\$ conda remove anaconda matplotlib mkl mkl-service nomkl openblas"
echo "\$ conda clean --all"
echo "Do this for each environment as well as your root. Then reinstall all except nomkl. Nvidia will now be installed"

echo ""
echo ""
echo "*************************** NOTICE ***************************"
echo "Python2.7 and 3.5 environments have been created. To activate them hit "
echo "$ source activate py27"
echo "or"
echo "$ source activate py35"

## If you want to install the bleeding edge Nvidia drivers, uncomment the next set of lines
# echo "Now choose gdm3 as your default display manager. Hit Enter"
# read temp

# sudo add-apt-repository ppa:graphics-drivers/ppa -y
# sudo apt-get update
# sudo ubuntu-drivers autoinstall
# echo "The PC will restart now. Check if your display is working, as your display driver would have been updated. Hit [Enter]"
# echo "Also, when installing CUDA next, ********don't******* install display drivers."
# echo "In case your drivers don't work, purge gdm3 and use lightdm (sudo apt-get purge lightdm && sudo dpkg-reconfigure gdm3)"
# read temp
# sudo reboot

echo "The script has finished"
