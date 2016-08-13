#!/bin/bash
# Learning ROS
# Workspace setup
# v 0.25

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/indigo/setup.bash
  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
	
  mkdir -p ~/ros_ws/src
	
  cd ~/ros_ws/src  && catkin_init_workspace
  cd ~/ros_ws && catkin_make

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  cd ~/ros_ws/src && git clone https://github.com/wsnewman/learning_ros_external_packages.git
  cd ~/ros_ws/src && git clone https://github.com/wsnewman/learning_ros.git

  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install
  
  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  echo "alias cs_create_pkg='~/ros_ws/src/learning_ros_external_packages/cs_create_pkg.py'" >> ~/.bashrc
  echo "export ROS_WORKSPACE=$HOME'/ros_ws'" >> ~/.bashrc
  echo "ROS_IP=127.0.0.1" >> ~/.bashrc
  echo "export ROS_IP=$ROS_IP" >> ~/.bashrc
  
  source ~/.bashrc
  
  rosdep update
  
else
	echo "USAGE: ./setup_workspace_learning_ros your_github_username your_email@email.com"

fi
