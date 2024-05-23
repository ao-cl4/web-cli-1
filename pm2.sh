#!/bin/bash

# Update package list
#sudo apt update

# Install Node.js and npm
#curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#sudo apt install -y nodejs

# Install PM2 globally
#sudo npm install -g pm2

# Create a directory for global npm packages
mkdir ~/.npm-global

# Configure npm to use the new directory
npm config set prefix '~/.npm-global'

# Add npm global packages path to the PATH variable
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.profile

# Apply the changes
source ~/.profile

# Ensure PM2 is correctly set up
pm2 unstartup
pm2 startup

# Follow the instructions output by `pm2 startup`
# The command might look something like this:
# sudo env PATH=$PATH:/home/your-username/.npm-global/bin pm2 startup ubuntu -u your-username

# Replace your-username with your actual username in the following line
sudo env PATH=$PATH:/home/$USER/.npm-global/bin pm2 startup ubuntu -u $USER

# Save the PM2 process list
pm2 save

# Start your application with PM2 (assuming your app's entry point is `npm start`)
# Replace 'my-app' with your application's name
pm2 start npm --name "cli-1" -- start

# Save the PM2 process list again to ensure the application restarts on reboot
pm2 save

# Done
echo "Setup complete. Your application is now managed by PM2 and will restart on system reboots."
