# @Time    : 05/11/18 17:47
# @Author  : ofen
# @Email   : 52083628@qq.com
# @File    : do_change.py
# @Software: PyCharm

# 根据定标得到的矩阵处理对光场相片预处理,数组调用.npz格式，例如 a = np.load(./1-1.npz), Mat_trans = a['trans'],Mat_rot = a['m']

import cv2
import numpy as np
import glob
import math
import os
import datetime


# 读入中文命名图片
def cv_imread(file_path):  # 解决opencv imread 不能读取中文路径的问题
    cv_img = cv2.imdecode(np.fromfile(file_path, dtype=np.uint8), -1)  # -1表示cv2.IMREAD_UNCHANGED
    return cv_img

# 写入中文命名图片
def cv_imwrite(out_path, img_np):
    cv2.imencode('.bmp', img_np)[1].tofile(out_path)


if __name__ == '__main__':

    array_folder = './calibration/'
    array_name = glob.glob(array_folder + '*.npy')
    array_name.sort()

    folder = './pics/'
    save_folder = './result/'

    if not os.path.exists(save_folder):
        os.makedirs(save_folder)

    # rename  3x3相机
    a, b = (3, 3)

    for img_folder in os.listdir('pics'):
        temp_num = -1
        img_name = glob.glob('pics/' + img_folder + '/' + '*.bmp')
        img_name.sort()

        folder_save = 'result/' + img_folder
        # os.system('mkdir ' + img_folder + folder_save)
        if not os.path.exists(folder_save):
            os.makedirs(folder_save)

        for array_path, img_path in zip(array_name, img_name):
            temp_num += 1
            calibrate_array = np.load(array_path)
            temp_img = cv_imread(img_path)

            if (temp_img is not None) and (calibrate_array is not None):
                im_result = cv2.warpPerspective(temp_img, calibrate_array, temp_img.shape[1::-1])
                # [x, y] = im_result.shape[:2]
                # im_result = im_result[int(x * 0.2):int(x * 0.8), int(y * 0.15):int(y * 0.85), :]
                save_name = str(temp_num//a + 1) + '-' + str(temp_num % a + 1)
                cv_imwrite(folder_save + '/' + save_name + '.bmp', im_result)
            else:
                print(img_path + ' is fail;')

            img = None
            array = None

