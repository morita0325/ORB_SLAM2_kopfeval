
git submodule update init
#EIGEN
git clone https://gitlab.com/libeigen/eigen.git
pushd eigen
mkdir -p build
pushd build
cmake  ../ -DCMAKE_INSTALL_PREFIX=../../eigen3
make install
popd
popd

#OPENCV
git clone -b 3.4 https://github.com/opencv/opencv.git
git clone -b 3.4 https://github.com/opencv/opencv_contrib.git
pushd opencv
mkdir -p build
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ../
make -j4
popd


#ORB_SLAM2
git clone https://github.com/raulmur/ORB_SLAM2.git ORB_SLAM2
pushd ORB_SLAM2
chmod +x build.sh
./build.sh
popd

#dataset
mkdir dataset
pushd dataset
wget -nc https://vision.in.tum.de/rgbd/dataset/freiburg1/rgbd_dataset_freiburg1_rpy.tgz
tar xvf rgbd_dataset_freiburg1_rpy.tgz
popd
