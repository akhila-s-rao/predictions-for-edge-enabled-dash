log_loc='/home/akhilarao/data_from_ns3_dash_simulation/scenario1'
mkdir "$log_loc"
cd ../../../
pwd

framesperseg=400
sed -i '36s/.*/#define MPEG_FRAMES_PER_SEGMENT '${framesperseg}'/' src/dash/model/mpeg-header.h

cmd_args="src/dash/examples/lena-dash-ran-metrics \
--simTime=1000 \
--randSeed=13 \
--numVideos=10 \
--epc=true --useUdp=false --algorithms='ns3::AaashClient' \
--bufferSpace=10000000 \
--homeEnbDeploymentRatio=0.2 --macroUeDensity=0.000270 \
--outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0 \
--maxStartTimeDelay=5 \
"

./waf --run "$cmd_args" --cwd=${log_loc} \
> ${log_loc}/dash_client_log.txt 2>&1



#./waf --run 'src/dash/examples/lena-dash-ran-metrics --simTime=20 --randSeed=13 --epc=true --useUdp=false --algorithms="ns3::AaashClient" --bufferSpace=10000000 --homeEnbDeploymentRatio=0.1 --macroUeDensity=0.000270 --outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0' --cwd=${log_loc} > ${log_loc}'/dash_client_log.txt' 2>&1

#./waf --run 'src/dash/examples/lena-dash-ran-metrics --simTime=20 --randSeed=13 --epc=true --useUdp=false --algorithms="ns3::AaashClient" --bufferSpace=10000000 --homeEnbDeploymentRatio=0.1 --macroUeDensity=0.000050 --outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0' --cwd=${log_loc}
