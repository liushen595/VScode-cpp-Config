# VScode-cpp-Config
VScode cpp 配置，更实用，更全面，可以支持不使用cmake的多文件编译

## 注意，目前仅支持GCC编译器和Windows平台
## 使用时请将文件中编译器的路径替换为自己的路径

static文件夹放入了使用静态链接库的编译时的配置文件，使用时将源文件和头文件在主程序全部"#include"

dynamic-one-dll文件夹放入了使用动态链接库编译时的配置文件，这个可以将所有源文件编译打包成一个.dll

dynamic-multi-dll文件夹放入了使用动态链接库编译时的配置文件，这个可以将每个源文件编译打包成每一个对应的.dll，需要配合使用文件夹根目录的build.bat，使用时将build.bat和主程序的cpp文件放入项目文件夹根目录，源文件放在项目的src文件夹，头文件放在项目文件夹的lib目录，build.bat会自动创建bin目录，将编译生成的.dll和.exe放入
