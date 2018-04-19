echo "Running all scripts"

bash 1-BasicSetUp.sh
bash 2-AnacondaCustomization.sh
bash 3-ProgTools.sh

echo "The script has finished. The System will now reboot so that certain shell changes can take place"
echo "sudo reboot"
read -p "Press [Enter] to continue..." temp

sudo reboot
