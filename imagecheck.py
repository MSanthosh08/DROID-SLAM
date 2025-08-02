import os
import cv2

cam0 = sorted(os.listdir("data/mav0/cam0/data"))
cam1 = sorted(os.listdir("data/mav0/cam1/data"))

print(f"cam0 count: {len(cam0)}, cam1 count: {len(cam1)}")

img0 = cv2.imread(os.path.join("data/mav0/cam0/data", cam0[0]), cv2.IMREAD_UNCHANGED)
img1 = cv2.imread(os.path.join("data/mav0/cam1/data", cam1[0]), cv2.IMREAD_UNCHANGED)

print("cam0 shape:", img0.shape if img0 is not None else "Failed to load cam0")
print("cam1 shape:", img1.shape if img1 is not None else "Failed to load cam1")

