# Description: 读取文件中的每一行，提取冒号前的内容，将提取的内容写入到另一个文件中
#              用于将头歌的输出替换为输入指令

import re

# 文件路径
input_file = '/home/ymr/bptree/script/input.txt'  # 输入文件路径
output_file = '/home/ymr/bptree/script/output.txt'  # 输出文件路径

# 打开输入文件并读取内容
with open(input_file, 'r') as f:
    text = f.read()

# 使用正则表达式替换
result = re.sub(r'^(.*?):.*', r'\1', text, flags=re.MULTILINE)

# 将结果写入输出文件
with open(output_file, 'w') as f:
    f.write(result)

print("处理完成，输出文件保存为:", output_file)
