#!/bin/bash
# Learning ROS
# ROS + Dependencies Installation
# v 0.50
# Wyatt Newman and Luc Bettaieb
# Updated by Frank (Chude Qian)

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS noetic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update && sudo apt-get upgrade -y

echo -e "\e[34m >>> Beginning ros-noetic-desktop-full installation...\e[39m"

  sudo apt-get install -y ros-noetic-desktop-full

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt install -y \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

sudo apt-get update && apt-get install -y ros-noetic-joy ros-noetic-costmap-2d ros-noetic-nav-core ros-noetic-sound-play ros-noetic-amcl \
  ros-noetic-slam-gmapping ros-noetic-move-base ros-noetic-controller-interface ros-noetic-gazebo-ros-control ros-noetic-joint-state-controller \
  ros-noetic-effort-controllers ros-noetic-moveit-msgs ros-noetic-teleop-twist-keyboard ros-noetic-slam-gmapping ros-noetic-map-server ros-noetic-qt-gui \
  ros-noetic-kdl-parser ros-noetic-combined-robot-hw ros-noetic-combined-robot-hw-tests ros-noetic-controller-manager ros-noetic-diff-drive-controller \
  ros-noetic-force-torque-sensor-controller ros-noetic-gripper-action-controller ros-noetic-imu-sensor-controller ros-noetic-position-controllers \
  ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-rqt-joint-trajectory-controller ros-noetic-velocity-controllers ros-noetic-cv-bridge \
  ros-noetic-polled-camera ros-noetic-camera-info-manager ros-noetic-tf-conversions ros-noetic-opencv-apps libopencv-dev ros-noetic-rqt \
  ros-noetic-rqt-common-plugins ros-noetic-ur-client-library
  
## Obsolete Packages:
##  ros-melodic-controller-manager-tests ros-kinetic-ur-description ros-kinetic-ur-gazebo ros-kinetic-stdr-simulator

echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"

  sudo apt-get install -y git vlc obs-studio vim gitk git-gui
  sudo snap install code
source ~/.bashrc
