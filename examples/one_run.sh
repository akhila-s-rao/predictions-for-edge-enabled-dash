if [ $# -ne 2 ]; then
       echo "Please enter start run number and start core index"
       exit 0
fi

log_loc='/home/akhilarao/data_from_ns3_dash_simulation/scenario3'
mkdir "$log_loc"
cd ../../../
pwd

# 8 second segments with 20 ms between frames within the segment 
framesperseg=400 # 8 second segments
sed -i '36s/.*/#define MPEG_FRAMES_PER_SEGMENT '${framesperseg}'/' src/dash/model/mpeg-header.h

# use macroUeDensity=0.000260 for over 250 UEs
# macroUeDensity=0.000150 = 144 UEs
# macroUeDensity= = 47 UEs

len=1
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

   if [ $i -lt 5 ]; then
      macroEnbDlEarfcn=100
   elif [ $i -ge 5 ] && [ $i -lt 10 ]; then
      macroEnbDlEarfcn=600
   else 
      macroEnbDlEarfcn=1200
   fi

   cmd_args="src/dash/examples/lena-dash-ran-metrics \
--simTime=100 \
--randSeed=$(($i + 11)) \
--numVideos=10 \
--epc=true --useUdp=false --algorithms='ns3::FdashClient' \
--bufferSpace=10000000 \
--homeEnbDeploymentRatio=0.0 \
--macroUeDensity=0.000005 \
--macroEnbBandwidth=100 \
--outdoorUeMinSpeed=1.4 --outdoorUeMaxSpeed=5.0 \
--maxStartTimeDelay=5 \
"
#--macroEnbDlEarfcn=$macroEnbDlEarfcn \
#"

mkdir "${log_loc}/run$(($i + $1))"
#taskset -c $(($i + $2)) ./waf "$run_type" "$cmd_args" --cwd="${log_loc}/run$(($i + $1))" \
#> "${log_loc}/run$(($i + $1))/dash_client_log.txt" 2> "${log_loc}/run$(($i + $1))/mpeg_player_log.txt" &

./waf "$run_type" "$cmd_args" --cwd="${log_loc}/run$(($i + $1))"
#--command-template="gdb"
#2> "${log_loc}/run$(($i + $1))/mpeg_player_log.txt" \
#1> "${log_loc}/run$(($i + $1))/dash_client_log.txt"

cp src/dash/examples/one_run.sh "${log_loc}/run$(($i + $1))/."
sleep $sleep_time
done
