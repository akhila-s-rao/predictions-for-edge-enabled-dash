DASH video streaming application + radio access network metrics generation  
========

This is an ns3 module for a DASH video streaming application forked from https://github.com/djvergad/dash
Our contribution is the creation of video streaming scenario scripts where users and the radio basestations report both application level metrics from the DASH module as well as the current state of the radio network from the PHY/MAC layers. This dataset allows us to study the benefits of cross-layer monitoring for video streaming applications with the objective of developing machine learning models for user QoS/QoE improvement.      

To install the module follow these instructions (taken from https://github.com/djvergad/dash)

Installation instructions
----

  1. Install ns3 on you system, using the instructions like from here: https://www.nsnam.org/wiki/Installation#Downloading_ns-3_Using_Mercurial.
  2. Download the module into the `src` directory, with the following commands:
       ```
       cd ns-3-dev/
       cd src/
       git clone https://github.com/akhila-s-rao/ns3_dash_over_ran.git
       ```
     Rename this cloned directory `ns3_dash_over_ran` to `dash`   
    
  3. Re-configure ns3 and enable examples. From the `ns-3-dev` directory, type:
       ```
       ./waf configure --enable-examples
       ```

  4. Now the setup is complete.

     The ns3 script dash/examples/lena-dash-ran-metrics.cc contains the script to run 
     The run_dash.sh bash script provides a structured way to run the lena-dash-ran-metrics.cc script with the same set of initial parameters used for the generation of our dataset 

Dataset
========
Here is a link to the dataset generated from the scenario in the above script.  

https://drive.google.com/file/d/1mghIo65ZgFurpeea2JVME2oRzO2RoX1s/view?usp=sharing
