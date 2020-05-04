# -*- coding: utf-8 -*-
# @function:
# @Time    : 01/11/18 06:29
# @Author  : ofen
# @Email   : 52083628@qq.com
# @File    : Rot_Trans_noCorrect.py
# @Software: PyCharm

# Alignment by rotation an Translation without distortion correction 旋转平移定标并储存定标矩阵与图片
# 因为本次使用6*6相机矩阵，所以path就直接用path[-7:]提取文件名，如果日后文件名不是7位，记得修改

import cv2
import numpy as np
import glob
import math
import os
import datetime


def findChessPoint(img_chg, cornersize):

    __doc__ = '''transport the chessboard to center,and rot it level
    M, imgOut = RotAndTrans(mat imgInput, tuple cornerSize) 
    '''

    img_chg2 = cv2.cvtColor(img_chg, cv2.COLOR_RGB2GRAY)
    #img_chg2 = img_chg
    # longth, width = img_chg.shape[:2]
    size = img_chg2.shape[::-1]

    criteria = (cv2.TermCriteria_MAX_ITER | cv2.TERM_CRITERIA_EPS, 30, 0.001)

    # cv2.imshow('1-6', img_chg2)
    # cv2.waitKey()
    # cv2.destroyAllWindows()

    ret_chg, corners_chg = cv2.findChessboardCorners(img_chg2, cornersize, None, flags=cv2.CALIB_CB_FILTER_QUADS)

    corners_chg2 = cv2.cornerSubPix(img_chg2, corners_chg, (5, 5), (-1, -1), criteria)

    return corners_chg2

if __name__ == '__main__':
    cornersSize = (5, 7)  # 定标板角点数目6*8
    folder = './CalibrationPic'
    fname = glob.glob(folder + '/*.bmp')
    fname.sort()
    img_ref = cv2.imread(fname[len(fname)//2])  # 以中间相机作为映射参考

    # folder_save = 'result' + datetime.datetime.now().strftime('%M')
    folder_save = 'calibration'
    # os.system('mkdir ' + i1mg_folder + folder_save)
    if not os.path.exists(folder_save):
        os.makedirs(folder_save)
    if not os.path.exists(folder_save + '/pic'):
        os.makedirs(folder_save + '/pic')
    for path in fname:
        # img = cv2.imread(path, cv2.IMREAD_REDUCED_COLOR_2)
        img_change = cv2.imread(path)
        if img_change is not None:

            pts_ref = findChessPoint(img_ref, cornersSize)
            pts_change = findChessPoint(img_change, cornersSize)

            h, status = cv2.findHomography(pts_change, pts_ref)

            im_result = cv2.warpPerspective(img_change, h, (img_change.shape[1], img_change.shape[0]))

            result_path = path.split('\\')[-1]
            cv2.imwrite(folder_save + '/pic/' + result_path, im_result)
            np.save(folder_save + '/' + result_path.replace('.bmp', ''), h)
            img_change = None
        else:
            print(path + 'is not read')


    print('ok')


#####    test    #####
# fname = glob.glob('./chessboard/6-*.jpg')
# fname.sort()
# img_ref = cv2.imread('./0-4.bmp')
# img_change = cv2.imread('./0-4.bmp')
#
# cornersSize = (5, 7)
#
# pts_ref = findChessPoint(img_ref, cornersSize)
# pts_change = findChessPoint(img_change, cornersSize)
#
# h, status = cv2.findHomography(pts_change, pts_ref)
#
# im_result = cv2.warpPerspective(img_change, h, (img_change.shape[1], img_change.shape[0]))
# # cv2.imshow('result', im_result)
# # cv2.waitKey()
# # cv2.destroyAllWindows()
# cv2.imwrite('Trans.bmp', im_result)
# #######################

# cv2.imshow('原图', imgChg)
# cv2.waitKey()
# cv2.destroyAllWindows()
# Trans, M, imgOut = rot_and_trans(imgChg, cornersSize)

##cv2.imwrite('test.png', imgOut)

# allImg = np.concatenate((imgChg, imgOut), axis=1)
# cv2.imshow('result', allImg)
# cv2.waitKey()
# cv2.destroyAllWindows()
#cv2.imwrite('Trans.png', imgOut)
###### test  ############



