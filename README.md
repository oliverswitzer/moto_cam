# MotoCam

A service that will alert you when movement is detected on your motorcycle! (May eventually also include a camera)

# Demo

https://moto-cam.gigalixirapp.com/

# Development

This app is meant to handle incoming Webhook requests from IFTTT. However, the full flow is as follows:

```
1. Arduino IMU Sensor Detects Movement
2. Data sent over cellular network to Arduino IoT Cloud service via Arduino SIM/GSM module
3. Arduino IoT Cloud Service pushes data to IFTTT Webhook 
4. IFTTT recieves webhook call and makes subsequent webhook request to *this phoenix app* (running in Gigalixir at https://moto-cam.gigalixirapp.com/)  
5. *This app* receives the webhook request from IFTTT. It parses the motion detection event information and updates the live view at the app root "/" via PubSub
```