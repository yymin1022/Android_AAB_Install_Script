# Android AAB Install Script

An simple script for installing aab to Android Device

### Info

Bundle tool `1.18.3` is included in project directory.

If you want another version, just download from [Android Official Page](https://developer.android.com/tools/bundletool) and replace it as `bundle-tool.jar`

### How to use

1. Clone it to your own space

```bash
yong@ubuntu-test: ~$ git clone https://github.com/yymin1022/Android_AAB_Install_Script
yong@ubuntu-test: ~$ cd Android_AAB_Install_Script
```

2. Copy your own aab file into directory, and execute script

```bash
yong@ubuntu-test: ~/Android_AAB_Install_Script$ cp ~/..somewhere../app-release.aab ./
yong@ubuntu-test: ~/Android_AAB_Install_Script$ ./install_aab.sh app-release.aab
```

3. Enjoy it !
