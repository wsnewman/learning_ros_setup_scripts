### Learning ROS setup scripts
The scripts here assume that you have an account on github (which is free at github.com).  

You will need "git" installed on your machine to use these scripts.  If "git" is not already
installed on your machine, it can be installed with:
`sudo apt-get --yes --force-yes install git`

---

### Getting the scripts and making them executable
To run these scripts, clone learning_ros_setup_scripts anywhere on your computer by typing the following in any directory:
`git clone https://github.com/wsnewman/learning_ros_setup_scripts.git`

Once you have the files, change the directory to `learning_ros_setup_scripts` by typing:
`cd learning_ros_setup_scripts`

After this, make the scripts executable by typing:
`chmod +x *.sh`

### ROS Setup
For ROS Melodic use this line: (System needs to be 18.04)
`./install_ros_and_tools_melodic.sh`
(or `bash install_ros_and_tools_melodic.sh`)

For other versions of install script, please refer to the respective folders for the install scripts.

### Workstation Setup
To setup your ROS workspace for ROS Melodic, use the `setup_workspace_learning_ros_melodic.sh` script.  You will need to pass your 
github username and email as arguments to the script:
`./setup_workspace_learning_ros_melodic.sh github_username github@email.com`
(or `bash setup_workspace_learning_ros_melodic.sh github_username github@email.com`)
where github_username is your username on github, and github@email.com is your e-mail address associated with your
github account.

### Setting up STDR simulation for ROS Noetic

First install qt4 and make it default
```
sudo add-apt-repository ppa:rock-core/qt4
sudo apt-get update
sudo apt-get install libqtcore4 qt4-qmake libqt4-dev
export QT_SELECT=4
```
make sure it is the active environment by running
```qtchooser -print-env```
then install the map_server
```sudo apt install ros-noetic-map-server```
Then clone and compile the stdr_simulator package
```
cd ~/ros_ws/src
git clone https://github.com/stdr-simulator-ros-pkg/stdr_simulator.git
cd ..
rosdep install --from-paths src --ignore-src --rosdistro noetic
catkin_make -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
```
