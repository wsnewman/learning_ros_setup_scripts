#!/bin/bash
# Learning ROS - Workspace setup script
# v 0.40
# Wyatt Newman and Luc Bettaieb
# Updated by Frank (Chude Qian)

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/noetic/setup.bash
#  echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
  rosdep update

  ROS_BASE=~/ros/noetic/ros_ws
  mkdir -p $ROS_BASE/src
	
  cd $ROS_BASE/src  && catkin_init_workspace
  cd $ROS_BASE && catkin_make

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  # Cloning STDR is necessary for noetic and bug in the current ROS binary release
  # https://github.com/stdr-simulator-ros-pkg/stdr_simulator/issues/195

  cd $ROS_BASE/src
  git clone https://github.com/rojas70/stdr_simulator.git

  # Change to the noetic-devel branch
  git checkout noetic-devel

  echo "source ~/ros/noetic/ros_ws/devel/setup.bash" >> ~/.bashrc
  source ~/.bashrc

  cd ~/$ROS_BASE && catkin_make
  cd ~/$ROS_BASE && catkin_make install


  echo "alias cs_create_pkg='~/ros/noetic/ros_ws/src/learning_ros_external_pkgs_noetic/cs_create_pkg.py'" >> ~/.bashrc
  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  echo "export ROS_WORKSPACE='$HOME/ros_ws'" >> ~/.bashrc
  # echo "export ROS_IP=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`" >> ~/.bashrc

else
  echo "USAGE: ./setup_workspace_learning_ros your_github_username your_email@email.com"

fi

#echo "[!!!] NB: You must still manually add your ROS_IP to your ~/.bashrc.  Do this by checking your IP with hostname -I or ifconfig and then adding export ROS_IP='x.x.x.x' to your ~/.bashrc."
