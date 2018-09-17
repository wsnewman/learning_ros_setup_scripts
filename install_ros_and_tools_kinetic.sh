#!/bin/bash
# Learning ROS
# ROS + Dependencies Installation
# v 0.36

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Kinetic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-kinetic-desktop-full installation...\e[39m"

  sudo apt-get --yes --allow install ros-kinetic-desktop-full 

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[1m \e[34m >>> Installing dependencies for mobile robotics code \e[21m \e[39m"

sudo apt-get --yes --force-yes install ros-kinetic-joy ros-kinetic-costmap-2d ros-kinetic-nav-core ros-kinetic-sound-play ros-kinetic-amcl ros-kinetic-slam-gmapping ros-kinetic-move-base ros-kinetic-controller-interface ros-kinetic-gazebo-ros-control ros-kinetic-joint-state-controller ros-kinetic-effort-controllers ros-kinetic-moveit-msgs ros-kinetic-stdr-simulator ros-kinetic-teleop-twist-keyboard ros-kinetic-slam-gmapping ros-kinetic-map-server ros-kinetic-qt-build ros-kinetic-kdl-parser ros-kinetic-combined-robot-hw ros-kinetic-combined-robot-hw-tests ros-kinetic-controller-manager-tests ros-kinetic-diff-drive-controller ros-kinetic-force-torque-sensor-controller ros-kinetic-gripper-action-controller ros-kinetic-imu-sensor-controller ros-kinetic-position-controllers ros-kinetic-ros-control ros-kinetic-ros-controllers ros-kinetic-rqt-joint-trajectory-controller ros-kinetic-velocity-controllers
sudo apt-get --yes --force-yes install ros-kinetic-cv-bridge ros-kinetic-polled-camera ros-kinetic-camera-info-manager ros-kinetic-tf-conversions
sudo apt-get --yes --force-yes install ros-kinetic-opencv3 libopencv-dev

sudo apt-get --yes --force-yes install ros-kinetic-ur-description ros-kinetic-ur-gazebo
  
echo -e "\e[1m \e[34m >>> Installing support software \e[21m \e[39m"

  sudo apt-get --yes --force-yes install git
  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer 

  sudo apt-get --yes --echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall install netbeans
  sudo apt-get --yes --force-yes install gitk git-gui
  sudo apt-get --yes --force-yes install kazam vlc
  
  
echo -e "\e[1m \e[34m >>> Installing rqt \e[21m \e[39m"
  sudo apt-get --yes install ros-kinetic-rqt
  sudo apt-get --yes install ros-kinetic-rqt-common-plugins

  source ~/.bashrc

source ~/ros_ws/devel/setup.bash




