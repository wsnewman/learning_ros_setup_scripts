#!/bin/bash
# Learning ROS
# ROS + Dependencies Installation
# v 0.40
# Wyatt Newman and Luc Bettaieb
# Updated by Frank (Chude Qian)

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Melodic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update && sudo apt-get --yes --allow upgrade

echo -e "\e[34m >>> Beginning ros-kinetic-desktop-full installation...\e[39m"

  sudo apt-get --yes --allow install ros-melodic-desktop-full

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

  sudo apt-get --yes --force-yes install ros-melodic-joy ros-melodic-costmap-2d ros-melodic-nav-core ros-melodic-sound-play ros-melodic-amcl ros-melodic-slam-gmapping ros-melodic-move-base ros-melodic-controller-interface ros-melodic-gazebo-ros-control ros-melodic-joint-state-controller ros-melodic-effort-controllers ros-melodic-moveit-msgs ros-melodic-teleop-twist-keyboard ros-melodic-slam-gmapping ros-melodic-map-server ros-melodic-qt-gui ros-melodic-kdl-parser ros-melodic-combined-robot-hw ros-melodic-combined-robot-hw-tests ros-melodic-controller-manager-tests ros-melodic-diff-drive-controller ros-melodic-force-torque-sensor-controller ros-melodic-gripper-action-controller ros-melodic-imu-sensor-controller ros-melodic-position-controllers ros-melodic-ros-control ros-melodic-ros-controllers ros-melodic-rqt-joint-trajectory-controller ros-melodic-velocity-controllers
  sudo apt-get --yes --force-yes install ros-melodic-cv-bridge ros-melodic-polled-camera ros-melodic-camera-info-manager ros-melodic-tf-conversions
  sudo apt-get --yes --force-yes install ros-melodic-opencv-apps libopencv-dev

## Obsolete Packages:
## ros-kinetic-ur-description ros-kinetic-ur-gazebo ros-kinetic-stdr-simulator

echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"

  sudo apt-get --yes --force-yes install git
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer 
  
  ## Addition for 2019: Added VS code, OBS capture software
  sudo apt install software-properties-common apt-transport-https wget
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
  sudo apt update
  sudo apt install code

  sudo add-apt-repository ppa:obsproject/obs-studio
  sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next
  sudo apt-get update
  sudo apt-get install obs-studio


  sudo apt-get --yes --echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall install netbeans
  sudo apt-get --yes --force-yes install gitk git-gui
  sudo apt-get --yes --force-yes install kazam vlc
  
  
echo -e "\e[1m \e[34m >>> Installing rqt \e[21m \e[39m"
  sudo apt-get --yes install ros-kinetic-rqt
  sudo apt-get --yes install ros-kinetic-rqt-common-plugins

  source ~/.bashrc

source ~/ros_ws/devel/setup.bash




