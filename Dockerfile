FROM node:12-buster-slim
# WORKDIR  指定了*之后*所有Docker命令的工作路径。如果没有这个路径会创建一个路径
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# 第一个点代表本地路径，第二个点代表 image里面的路径
COPY . .
RUN npm install  
# 注意！RUN是创建镜像/image 时使用的，CMD是运行容器/container *后*使用的！！
CMD ["npm", "start"]

# 下一步就是先build image
# . 是告诉Docker在当前目录下寻找Docker file
# docker build -t <image_name> .

# image build好之后就要setup container: docker run -p 3000:5000 test_image (中文教程里的，行不通好像)
# 老外教程：https://mherman.org/blog/dockerizing-a-react-app/ 可以  TODO: 总结研究
# docker run \
#     -it \
#     --rm \
#     -v ${PWD}:/app \
#     -v /app/node_modules \
#     -p 3001:3000 \
#     -e CHOKIDAR_USEPOLLING=true \
#     sample:dev

# http://localhost:3001 访问就行