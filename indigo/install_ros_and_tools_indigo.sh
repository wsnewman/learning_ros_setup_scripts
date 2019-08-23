#!/bin/bash
# Learning ROS
# ROS + Dependencies Installation
# v 0.36

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Indigo Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-indigo-desktop-full installation...\e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-desktop-full 

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

  sudo apt-get --yes --force-yes install ros-indigo-joy ros-indigo-costmap-2d ros-indigo-nav-core ros-indigo-sound-play ros-indigo-amcl ros-indigo-slam-gmapping ros-indigo-move-base ros-indigo-controller-interface ros-indigo-gazebo-ros-control ros-indigo-joint-state-controller ros-indigo-effort-controllers ros-indigo-moveit-msgs ros-indigo-stdr-simulator ros-indigo-teleop-twist-keyboard ros-indigo-slam-gmapping ros-indigo-map-server
  sudo apt-get --yes --force-yes install ros-indigo-baxter-core-msgs ros-indigo-baxter-examples ros-indigo-baxter-sim-controllers ros-indigo-baxter-sim-examples ros-indigo-baxter-tools ros-indigo-baxter-description ros-indigo-baxter-sim-hardware ros-indigo-baxter-interface ros-indigo-baxter-simulator ros-indigo-baxter-common ros-indigo-baxter-sdk ros-indigo-baxter-sim-io ros-indigo-baxter-gazebo ros-indigo-baxter-moveit-config
sudo apt-get --yes --force-yes install ros-indigo-ur-description ros-indigo-ur-gazebo
  
echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"

  sudo apt-get --yes --force-yes install git
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer 

  sudo apt-get --yes --force-yes install netbeans
  sudo apt-get --yes --force-yes install gitk git-gui
  sudo apt-get --yes --force-yes install kazam vlc
  
  source ~/.bashrc
