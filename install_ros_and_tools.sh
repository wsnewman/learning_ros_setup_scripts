#!/usr/bin/env bash

# Figure out what Ubuntu this is to get the correct ROS
source /etc/os-release

if [[ $ID != "ubuntu" ]]; then
    echo "This script only works for Ubuntu."
    exit
elif [[ -z $UBUNTU_CODENAME ]]; then
    echo "It appears that there is an problem identifying which Ubuntu this is."
    exit
elif [[ $UBUNTU_CODENAME == "focal" ]]; then
    ROS_VERS="noetic"
elif [[ $UBUNTU_CODENAME == "bionic" ]]; then
    ROS_VERS="melodic"
elif [[ $UBUNTU_CODENAME == "xenial" ]]; then
    ROS_VERS="kinetic"
elif [[ $UBUNTU_CODENAME == "trusty" ]]; then
    ROS_VERS="indigo"
else
    echo "$PRETTY_NAME is currently unsupported"
    exit
fi

scripts/install_ros_and_tools_$ROS_VERS.sh $@

source /opt/ros/$ver/setup.bash
echo "source /opt/ros/$ver/setup.bash" >> ~/.bashrc
rosdep update

mkdir -p $CONFIG_WS/src
cd $CONFIG_WS/src

# Get Baxter and STDR repositories
if [[ $ROS_VERS == "noetic" ]]; then
    git clone -b noetic_devel https://github.com/cwru-eecs-275/stdr_simulator.git
    git clone -b noetic_devel https://github.com/cwru-eecs-275/baxter_simulator.git
    git clone -b noetic_devel https://github.com/cwru-eecs-275/baxter_interface.git
    git clone -b noetic_devel https://github.com/cwru-eecs-275/baxter_tools.git
elif [[$ROS_VERS == 'melodic' ]]; then
    git clone -b melodic_devel https://github.com/cwru-eecs-275/stdr_simulator.git
    git clone https://github.com/EmaroLab/baxter_simulator.git
    git clone https://github.com/cwru-eecs-275/baxter_interface.git
    git clone https://github.com/cwru-eecs-275/baxter_tools.git
else
    sudo apt-get install -y ros-$ver-stdr-simulator
    git clone https://github.com/RethinkRobotics/baxter_simulator.git
    git clone https://github.com/RethinkRobotics/baxter_interface.git
    git clone https://github.com/RethinkRobotics/baxter_tools.git
fi
git clone https://github.com/RethinkRobotics/baxter_common.git


# Ensure that all dependencies are installed (at least the declared ones).
rosdep install --from-paths src  --ignore-src -r -y

cd $CONFIG_WS
catkin_make
sudo -- /bin/bash -c "source /opt/ros/$ver/setup.bash; catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/$ver install"  >/dev/null
