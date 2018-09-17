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
To set up a ROS installation of Indigo with all of the dependencies and programs with "learning ROS", run the script `install_ros_and_tools.sh` by typing:
`./install_ros_and_tools.sh`
(or `bash install_ros_and_tools.sh`)

For ROS Kinetic use this line:  (use with Ubuntu 16.04)
`./install_ros_and_tools_kinetic.sh`

### Workstation Setup
To setup your ROS workspace for ROS Indigo, use the `setup_workspace_learning_ros.sh` script.  You will need to pass your 
github username and email as arguments to the script:
`./setup_workspace_learning_ros.sh github_username github@email.com`
(or `bash setup_workspace_learning_ros.sh github_username github@email.com`)
where github_username is your username on github, and github@email.com is your e-mail address associated with your
github account.

For ROS Kinetic use the following line:
`./setup_workspace_learning_ros_kinetic.sh github_username github@email.com`

