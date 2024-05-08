#!/bin/bash


module load comp/gcc/13.1.0

python3 setup_g2l_v4.py build_ext --inplace
python3 setup_gcd_v4.py build_ext --inplace
python3 setup_rhumb_line_nav_v4.py build_ext --inplace

mv g2l_v4.cpython*so g2l_v4.so
mv gcd_v4.cpython*so gcd_v4.so
mv rhumb_line_nav_v4.cpython*so rhumb_line_nav_v4.so
