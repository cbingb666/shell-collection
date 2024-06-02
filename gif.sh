

# 指定包含图片序列的顶级目录
top_dir="./image_frame/"
# 输出目录
out_dir="./output_raw"

# 遍历顶级目录中的所有子目录
for dir in "$top_dir"/*; do
  if [ -d "$dir" ]; then  # 确保是一个目录
    # 获取目录名（不包含路径）
    dir_name=$(basename "$dir")

    # 构建输出文件名，假设目录名即为你想要输出的.gif文件名
    output_file="$out_dir/$dir_name.gif"

    # 执行ffmpeg命令 帧率24、加速2x、固定400高度进行居中裁剪
    ffmpeg -framerate 24 -i "$dir/frame_%03d.png" -vf "setpts=.5*PTS,scale=w=-1:h=400,crop=w=304:h=400" "$output_file"
  fi
done
