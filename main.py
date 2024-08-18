import time
import onnxruntime
import numpy as np
import cv2
import os

tag = {0: 'cameracap', 1: 'others', 2: 'screenshot'}

session = onnxruntime.InferenceSession("best-int8.onnx")
model_inputs = session.get_inputs()

filenames = os.listdir(r'./test_img')
for file in filenames:
    img = cv2.cvtColor(cv2.imread("./test_img/"+file), cv2.COLOR_BGR2RGB)
    img = cv2.resize(img, (1024, 1024))
    image_data = np.array(img) / 255.0
    image_data = np.transpose(image_data, (2, 0, 1))
    image_data = np.expand_dims(image_data, axis=0).astype(np.float32)
    input = {"images": image_data}
    t = time.time()
    output = session.run(None, input)
    tt = (time.time() - t)*1000
    predicted_class = np.argmax(output[0], axis=1)[0]
    confidence = np.max(output[0], axis=1)[0]
    print(file,tag[predicted_class], confidence * 100,tt,"ms")
