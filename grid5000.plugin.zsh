gadm () {
  ssh g5kadmin@adminfront.$*.grid5000.fr
}

gfront () {
  ssh $USER@frontend.$*.grid5000.fr
}

# Needed for grid5000 theme
oar_job_id () {
  if [ ! -z $OAR_JOB_ID ]; then
    echo "($OAR_JOB_ID)"
  fi
}

# Compute and display Job remaning time
oar_remaining_time(){
  if [ -n "$OAR_JOB_WALLTIME_SECONDS" -a -n "$OAR_NODE_FILE" -a -r "$OAR_NODE_FILE" ]; then
    DATE_NOW=$(date +%s)
    DATE_JOB_START=$(stat -c %Y $OAR_NODE_FILE)
    DATE_TMP=$OAR_JOB_WALLTIME_SECONDS
    ((DATE_TMP = (DATE_TMP - DATE_NOW + DATE_JOB_START) / 60))
    echo -n "$DATE_TMP"
  fi
}
