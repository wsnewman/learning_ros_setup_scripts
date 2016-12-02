#!/bin/bash
# Learning ROS - Workspace setup script
# v 0.26
# Wyatt Newman and Luc Bettaieb

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/indigo/setup.bash
  echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
  rosdep update

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
  echo "alias baxter_master='export ROS_MASTER_URI='http://129.22.149.130:11311''" >> ~/.bashrc
  # echo "export ROS_IP=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`" >> ~/.bashrc

  source ~/.bashrc

else
  echo "USAGE: ./setup_workspace_learning_ros your_github_username your_email@email.com"

fi

echo "[!!!] NB: You must still manually add your ROS_IP to your ~/.bashrc.  Do this by checking your IP with hostname -I or ifconfig and then adding export ROS_IP='x.x.x.x` to your ~/.bashrc."
