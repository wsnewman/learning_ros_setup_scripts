#!/usr/bin/env bash
# Learning ROS - Workspace setup script
# v 0.50
# Wyatt Newman and Luc Bettaieb
# Updated by Frank (Chude Qian)
# Updated by Greg Lee

function main(){
    ros_config

    echo "Setting up workspace."

    USERNAME=$1
    EMAIL=$2

    ROS_WS="~/ros_ws"

    if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
    then
        # Setup up GIT globally for the user
        git config --global user.name "$USERNAME"
        git config --global user.email "$EMAIL"

        source /opt/ros/$ver/setup.bash
        echo "source /opt/ros/$ver/setup.bash" >> ~/.bashrc
        rosdep update

        mkdir -p $ROS_WS/src
        cd $ROS_WS/src

        # Get Learning ROS repositories
        if [[ $ROS_VERS == "noetic" ]]; then
          git clone -b noetic_devel https://github.com/wsnewman/learning_ros.git
        elif [[$ROS_VERS == 'melodic' ]]; then
          git clone -b melodic_devel https://github.com/wsnewman/learning_ros.git
        else
          git clone -melodic_devel https://github.com/wsnewman/learning_ros.git
        fi

        git clone https://github.com/wsnewman/learning_ros_external_packages.git

        # Ensure that all dependencies are installed (at least the declared ones).
        rosdep install --from-paths src  --ignore-src -r -y

        cd $ROS_WS
        catkin_make

        # Make cs_create_pkg work always
        mkdir ~/bin
        cp $ROS_WS/src/learning_ros_external_packages/cs_create_pkg.py ~/bin
        echo "alias cs_create_pkg='~/bin/cs_create_pkg.py'" >> ~/.bashrc
        # This is only used in two places in the Learning ROS packages and that code can be updated to ros::getPath().
        echo "export ROS_WORKSPACE='$ROS_WS'" >> ~/.bashrc

    else
        echo "USAGE: ./setup_workspace_learning_ros your_github_username your_email@email.com"

    fi

    echo "[!!!] NB: You must still manually add your ROS_IP to your ~/.bashrc.  Do this by checking your IP with hostname -I or ifconfig and then adding export ROS_IP='x.x.x.x' to your ~/.bashrc."
}

function ros_config() {
  # Setup ROS
  if [ ${#ROS_PACKAGE_PATH} -lt 1 ]; then
      ROS_VERS=($(ls /opt/ros))
      if [ ${#ROS_VERS[@]} -gt 1 ]
      then
          # Should remove unsupported versions from the choice
          select ver in ${ROS_VERS[@]}; do break; done
          source /opt/ros/$ver/setup.bash
      elif [ ${#ROS_VERS[@]} -eq 0 ]
      then
          if [ -d /opt/ros ]
          then
              echo "The ROS installation is corrupted."
          else
              echo "ROS has not been installed."
          fi
          exit
      else
          ver=$ROS_VERS
          source /opt/ros/$ver/setup.bash
      fi

      if [ ${#ROS_PACKAGE_PATH} -lt 1 ]
      then
          echo "ROS $ver appears misconfigured.  It may not be installed or there may be another issue."
          exit
      fi
  else 
      ver=$ROS_DISTRO
  fi
}


main