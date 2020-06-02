log_loc='/home/akhilarao/data_from_ns3_dash_simulation/test'
mkdir "$log_loc"
cd ../../../
pwd
#./waf --run 'src/dash/examples/lena-dash-ran-metrics --simTime=5 --randSeed=13 --epc=true --useUdp=false --algorithms="ns3::AaashClient" --bufferSpace=10000000 --homeEnbDeploymentRatio=0.1 --macroUeDensity=0.000270 --outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0' --cwd=${log_loc} > ${log_loc}'/dash_client_log.txt' 2>&1

./waf --run 'src/dash/examples/lena-dash-ran-metrics --simTime=20 --randSeed=13 --epc=true --useUdp=false --algorithms="ns3::AaashClient" --bufferSpace=10000000 --homeEnbDeploymentRatio=0.1 --macroUeDensity=0.000050 --outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0' --cwd=${log_loc}
