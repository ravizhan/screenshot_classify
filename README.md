# 赛博拍屏鉴定师——帮您一眼丁真分辨截图与拍屏
## 说明

本项目模型基于 `yolov8s-cls` 模型(v8.20)训练，未来视情况将采用更大更新的模型。

由于训练集不足，当前准确率仍然抽象。

模型会将图片分为三类

- cameracap: 拍屏

- others: 啥也不是
- screenshot: 截图

## 使用

- 将测试图片放入 `test_img` 目录下

- 安装依赖

  ```bash
  pip install -r requirements.txt
  ```

- 运行 `main.py`

  ``` bash
  python ./main.py
  ```

## 贡献

如果您觉得模型效果不够好，不要犹豫，将您的抽象图片即刻通过 [Pull Request](https://github.com/ravizhan/screenshot_classify/pulls) 提交。我将尽快更新模型。

请将图片归类放入对应的文件夹内，文件名统一为 `MD5hash` ，以避免重名，文件格式接受 `JPG` 和 `PNG`。

**注意**：请确保您提交的图片**已脱敏**且**无版权问题**，您的图片将仅会用于训练目的。

## 鸣谢

感谢 [ultralytics](https://github.com/ultralytics/ultralytics) 提供yolov8预训练模型

感谢[所有贡献者](https://github.com/ravizhan/screenshot_classify/graphs/contributors)，无论您是提供了图片或是代码

## 协议

本项目遵循 [AGPL-3.0协议](https://github.com/ravizhan/screenshot_classify#AGPL-3.0-1-ov-file) 开源，请自觉遵守。
