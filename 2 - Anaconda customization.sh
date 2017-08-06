#!/bin/zsh

chsh -s /bin/zsh
source ~/.zshrc

conda update conda -y
conda clean --all -y
conda install ipython -y


# Note: These set of lines are done as matplotlib finds older version of libpng at installation time but finds newer version at runtime, and this affects display ability at runtime
# conda uninstall matplotlib -y
# conda clean --all -y
# cd /usr/include/libpng
# sudo mv png.h _png.h
# sudo mv pngconf.h _pngconf.h
# conda install matplotlib scikit-image ipython -y
# sudo mv _png.h png.h
# sudo mv _pngconf.h pngconf.h


# conda create --name py35 python=3.5 numpy scipy matplotlib
conda install libgcc -y
conda create --name py27 python=2.7 numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py -y
conda create --name py35 python=3.5 numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py -y
pip install numpy scipy matplotlib scikit-learn scikit-image jupyter notebook pandas h5py
sed -i.bak "/anaconda3/d" ~/.zshrc
echo "export PATH=~/anaconda3/envs/py27/bin:\$PATH" >> ~/.zshrc
echo "export PATH=~/anaconda3/bin:\$PATH" >> ~/.zshrc
source ~/.zshrc

# Uncomment the next set of lines if you want to set up your normal Python too
#sudo -H pip install jupyter notebook
#sudo -H pip install cython
#sudo -H pip install pep8
#sudo -H pip install autopep8
#sudo -H pip3 install jupyter notebook
#sudo -H pip3 install cython
#sudo -H pip3 install pep8
#sudo -H pip3 install autopep8

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
