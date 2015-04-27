#!/bin/bash
#****************************************************
#	> OS     : Linux 3.13.0-24-generic (Mint-17)
#	> Author : yaolong
#	> Mail   : dengyaolong@yeah.net 
#	> Time   : 2014年09月12日 星期五 14时06分22秒
#****************************************************
install_handle=""
if which apt-get >/dev/null; then
    install_handle="apt-get"
elif which yum >/dev/null; then
    install_handle="yum"
else
    echo -n "Enter your installer:" 
    read  install_name
    install_handle=$install_name
fi 
sudo $install_handle install -y gcc g++ vim  ctags xclip astyle \
python-setuptools python-dev git  python-pip python-twisted  xsel ,CMake
sudo pip install --upgrade autopep8   echopy缩进 

echo "------------把老vim备份移除--------------------------"
[ -d .vim   ] && mv -v .vim   .vim.$(stat -c%Y   .vim)
[ -f .vimrc ] && mv -v .vimrc .vimrc.$(stat -c%Y .vimrc)
echo "clone dyl的vimrc"
git clone https://github.com/dengyaolong/vimrc.git ~/vimrc
cp ~/vimrc/.vimrc .vimrc
echo "安装pathogen，管理工具"
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle  && \ 
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle 
echo "安装vundle"
 git clone https://github.com/gmarik/vundle.git 

 echo "安装auto-pair"
 git clone https://github.com/jiangmiao/auto-pairs.git
echo "安装solarize颜色"
mkdir -p ~/.vim/colors
git clone git://github.com/altercation/vim-colors-solarized.git  
mv vim-colors-solarized/colors/solarized.vim ~/.vim/colors/

echo "安装airline"
git clone https://github.com/bling/vim-airline  

echo "安装git hunter"
git clone git://github.com/airblade/vim-gitgutter.git 
#安装显示branch插件
git clone git://github.com/tpope/vim-fugitive.git

echo "安装目录树插件，完成后使用时按F2即可"
git clone https://github.com/scrooloose/nerdtree   

echo "安装错误提示插件"
git clone https://github.com/scrooloose/syntastic  

echo "安装MarkDown"
git clone https://github.com/tpope/vim-markdown  

echo "安装supertab"
git clone https://github.com/ervandew/supertab 

echo "安装tabular"
git clone https://github.com/godlygeek/tabular

echo "安装tcomment"
git clone https://github.com/tomtom/tcomment_vim

echo "安装surround"
git clone https://github.com/tpope/vim-surround

#node
echo "安装node vim"
git clone https://github.com/moll/vim-node.git

echo "安装javascirpt indent"
git clone https://github.com/vim-scripts/JavaScript-Indent
# echo "安装you complete me"
# git clone https://github.com/Valloric/YouCompleteMe.git
# cd ~/.vim/bundle/YouCompleteMe
# git submodule update --init --recursive
# ./install.sh --clang-completer
# cd ~/.vim/bundle

# echo "安装tern_for_vim"
# git clone https://github.com/marijnh/tern_for_vim.git 
# cd tern_for_vim
# npm install 
# cd ~/.vim/bundle
#echo "换npm源"
#npm config set registry https://registry.npm.taobao.org 
#npm info underscore

rm -Rf vimrc
