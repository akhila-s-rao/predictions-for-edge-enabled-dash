log_loc='/home/akhilarao/data_from_ns3_dash_simulation/test4'
mkdir "$log_loc"
cd ../../../
pwd

# 8 second segments with 20 ms between frames within the segment
framesperseg=400
sed -i '36s/.*/#define MPEG_FRAMES_PER_SEGMENT '${framesperseg}'/' src/dash/model/mpeg-header.h

cmd_args="src/dash/examples/lena-dash-ran-metrics \
--simTime=100 \
--randSeed=13 \
--numVideos=10 \
--epc=true --useUdp=false --algorithms='ns3::AaashClient' \
--bufferSpace=10000000 \
--homeEnbDeploymentRatio=0.2 \
--macroUeDensity=0.000150 \
--macroEnbBandwidth=100 \
--outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0 \
--maxStartTimeDelay=5 \
"
# use macroUeDensity=0.000260 for over 250 UEs

./waf --run "$cmd_args" --cwd=${log_loc} \
> ${log_loc}/dash_client_log.txt 2>&1

cp src/dash/examples/single_run.sh "${log_loc}/."
