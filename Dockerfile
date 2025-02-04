# 使用官方 Ruby 2.6.6 镜像作为基础镜像
FROM ruby:2.6.6

# 更新 apt 并安装编译 sqlite3 gem 所需的依赖包
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev && apt-get install -y sqlite3 libsqlite3-dev
# 设置工作目录（容器内的目录）
WORKDIR /app

# 将 Gemfile 和 Gemfile.lock 复制到工作目录中
COPY Gemfile Gemfile.lock ./

# 安装项目依赖（这里会执行 bundle install）
RUN bundle install

# 将项目其余代码复制到容器中
COPY . .


# 默认启动命令，可以根据需要修改，比如启动 IRB 或运行特定脚本
CMD ["bash"]
