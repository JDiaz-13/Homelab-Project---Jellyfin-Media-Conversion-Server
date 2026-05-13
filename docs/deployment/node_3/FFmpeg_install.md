# Installation

## Download FFmpeg from .exe from website
- [Download](https://www.ffmpeg.org/)
- Extract the .7z files containing FFmpeg files
- Follow the installation process to complete windows setup


## CMD accessibility
To make things a lot easier for the encoding loops you need to add FFmpeg to PATH

- Hit Windows button
- Type "Enviroment Variables"
- Highlight "Path" then click the Edit button
- Click "New" and map out the location of the FFmpeg file you extracted earlier
- Click "OK" then "OK" again
- FFmpeg should now be accesible by simply opening a cmd window and typing the following

---
```bat
ffmpeg <options> -i sample.mkv sample.mp4
```
--- 
## FFmpeg commands Documentaion
This is a very powerful open source tool that is used everyday by millions of users and popular websites such as Youtube and Facebook

The commands can get complex but its worth learning so you can make an automation script later on

- Instructions can be found [here](https://www.ffmpeg.org/ffmpeg.html)
