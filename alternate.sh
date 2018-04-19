echo "Running script"
sudo apt-get install git -y

pip install numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py sympy

echo "Installing nbconvert"
sudo apt-get install pandoc
cd ~
git clone https://github.com/jupyter/nbconvert.git
cd nbconvert
pip install -e .

set -e

sudo apt-get install libboost-all-dev -y

sudo apt-get install clang-format -y

sudo apt-get install lyx -y

sudo add-apt-repository ppa:webupd8team/atom
sudo apt update; sudo apt install atom
