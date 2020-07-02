if [ $# -ne 2 ]; then
       echo "Please enter start run number and start core index"
       exit 0
fi

log_loc='/home/akhilarao/data_from_ns3_dash_simulation/scenario4_varyNumUes_smallerRsrpFile'
#log_loc='/home/akhilarao/data_from_ns3_dash_simulation/test_runs'
mkdir "$log_loc"
cd ../../../
pwd

# 8 second segments with 20 ms between frames within the segment 
framesperseg=400 # 2 second segments
sed -i '36s/.*/#define MPEG_FRAMES_PER_SEGMENT '${framesperseg}'/' src/dash/model/mpeg-header.h

# use macroUeDensity=0.000260 for over 250 UEs
# macroUeDensity=0.000150 = 144 UEs
# macroUeDensity= = 47 UEs
# 0.00001875 = 17 UEs
# 0.000010417 = 10 UEs
# 0.000005417 = 5 UEs
# 0.000001417 = 1 UEs

len=18
#len=1
for (( i=0; i<$len; i++ ))
do
   if [ $i -eq 0 ]; then
      run_type='--run'
      sleep_time=10
   else
      run_type='--run-no-build'
      sleep_time=3
   fi

   if [ $i -lt 6 ]; then
      macroUeDensity=0.00002875 #  Ues
      #macroUeDensity=0.000001417 # 1 or 2 UEs
   elif [ $i -ge 6 ] && [ $i -lt 12 ]; then
      macroUeDensity=0.00003875 #  Ues
   else 
      macroUeDensity=0.00004875 # Ues
   fi

#   cmd_args="src/dash/examples/lena-dash \
#--simTime=500 \
#--epc=true --useUdp=false --algorithms='ns3::FdashClient' \
#--bufferSpace=10000000 \
#--homeEnbDeploymentRatio=0.0 \
#--macroUeDensity=0.000001417 \
#--macroEnbBandwidth=100 \
#--outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0 \
#--macroEnbDlEarfcn=$macroEnbDlEarfcn \
#"

   cmd_args="src/dash/examples/lena-dash-ran-metrics \
--simTime=1000 \
--randSeed=$(($i + 13)) \
--numVideos=10 \
--epc=true \
--useUdp=false \
--algorithms='ns3::FdashClient' \
--bufferSpace=10000000 \
--homeEnbDeploymentRatio=0.0 \
--macroUeDensity=$macroUeDensity \
--macroEnbBandwidth=100 \
--outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0 \
--maxStartTimeDelay=10 \
--macroEnbDlEarfcn=100 \
--epcDl=true \
--epcUl=true \
--nMacroEnbSites=4 \
"

mkdir "${log_loc}/run$(($i + $1))"
taskset -c $(($i + $2)) ./waf "$run_type" "$cmd_args" --cwd="${log_loc}/run$(($i + $1))" \
> "${log_loc}/run$(($i + $1))/dash_client_log.txt" 2> "${log_loc}/run$(($i + $1))/mpeg_player_log.txt" &

#./waf "$run_type" "$cmd_args" --cwd="${log_loc}/run$(($i + $1))"
#--command-template="gdb"
#2> "${log_loc}/run$(($i + $1))/mpeg_player_log.txt" \
#1> "${log_loc}/run$(($i + $1))/dash_client_log.txt"

cp src/dash/examples/one_run.sh "${log_loc}/run$(($i + $1))/."
sleep $sleep_time
done
