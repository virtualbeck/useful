#!/bin/bash
# Upload a new picture to Slack profile to indicate your presence
# put it in your crontab to send every 5 mins
### */5 8-17 * * 1-5 slackProfilePic.sh

#capture image from webcam (use /dev/video0 for default webcam)
streamer -f jpeg -o image.jpeg -c /dev/video1

#introduce blur
convert -blur 0x5 image.jpeg image.jpeg

#send to slack (get your slack token here: https://api.slack.com/custom-integrations/legacy-tokens)
curl https://slack.com/api/users.setPhoto -F "image=@/home/user/image.jpeg" -F "token=xxxx-0000"
