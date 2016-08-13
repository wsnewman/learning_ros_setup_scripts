### mobile_robotics

Refer to [cwru_wiki/Mobile-Robotics:-Workstation-Setup-Scripts](https://github.com/cwru-robotics/cwru_wiki/wiki/Mobile-Robotics:-Workstation-Setup-Scripts) for detailed information

---

### Getting the scripts and making them executable
To run these scripts, clone cwru_scripts anywhere on your computer by typing the following in any directory:
`git clone https://github.com/cwru-robotics/cwru_scripts.git`

Once you have the files, change the directory to `mobile_robotics` by typing:
`cd cwru_scripts/mobile_robotics`

After this, make the scripts executable by typing:
`chmod +x *.sh`

### ROS Setup
If you would like to set up a ROS installation on your own computer or Ubuntu install with all of the dependencies and programs we'll be using in the class, you can run the script `install_ros_w_dep_397.sh` by typing:
`./install_ros_w_dep_397.sh`

### Workstation Setup
To setup your ROS workspace (which you will have to do every time you log in to a new Jennings computer) use the `setup_workspace_376.sh` script.  You will need to pass your github username and email as arguments to the script:
`./setup_workspace_376.sh github_username github@email.com`
