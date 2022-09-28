DASH video streaming application + radio access network metrics generation  
========

This is an ns3 module for a DASH video streaming application forked from https://github.com/djvergad/dash
Our contribution is the creation of video streaming scenario scripts where users and the radio basestations report both application level metrics from the DASH module as well as the current state of the radio network from the PHY/MAC layers. This dataset allows us to study the benefits of cross-layer monitoring for video streaming applications with the objective of developing machine learning models for user QoS/QoE improvement.      

To install the module follow these instructions (taken from https://github.com/djvergad/dash)

To Generate the dataset
========

ns-3 dash module installation instructions
--------

  1. Install ns3 on you system, using the instructions like from here: https://www.nsnam.org/wiki/Installation#Downloading_ns-3_Using_Mercurial.
  2. Download the module into the `src` directory, with the following commands:
       ```
       cd ns-3-dev/
       cd src/
       git clone https://github.com/akhila-s-rao/predictions-for-edge-enabled-dash.git
       ```
     Rename this cloned directory `predictions-for-edge-enabled-dash` to `dash`   
    
  3. Re-configure ns3 and enable examples. From the `ns-3-dev` directory, type:
       ```
       ./waf configure --enable-examples
       ```

  4. Now the setup is complete.
       
       The ns3 script dash/examples/lena-dash-ran-metrics.cc contains the script to run 
       
     The run_dash.sh bash script provides a structured way to run the lena-dash-ran-metrics.cc script with the same set of initial parameters used for the generation of our dataset 
            

To download existing dataset 
========
Here is the link to the dataset generated from the scenario in the above script.  

https://drive.google.com/drive/folders/1NmbUdS0EM9ZlR5sNQt_kzJvCQgtoeiUZ?usp=sharing

To run the machine learning algorithms for prediction of bitrate 
========
This code is in a different git project that can be cloned from 
```
git clone https://github.com/akhila-s-rao/machine-learning-for-edge-enabled-dash.git
```
The dataset linked above contains both the raw dataset and the pre-processed data that we used for our machine learning.
If you would like to run the machine learning scripts place the folder "data" obtained from the google drive link into the cloned machine-learning-for-edge-enabled-dash directory for the machine learning scripts to be able to access them. 

Appendix with our model results
=======
You can find here an appendix with additional tables showing result from our evaluations that have not been included in our paper for brevity

https://github.com/akhila-s-rao/machine-learning-for-edge-enabled-dash/blob/master/documentation/Appendix_Predictive_prefetching_for_edge_assisted_video_streaming.pdf

Reference
=======
Here are our papers describing the dataset generation process and the machine learning approach to predict video segment bitrate with the objective of predictively prefetching to the mobile edge, segments of ongoing video streams

This CNSM short paper presents initial results with a solution towards this problem 
CNSM 2020 https://ieeexplore.ieee.org/document/9269054

The work was then extended with a reformulation of the solution approach with insight from our previous short paper and concluded in our journal paper 
TNSM 2022 https://ieeexplore.ieee.org/document/9841468

Please refer these papers when using the results, code or dataset provided here.  
