require_relative "code-gen"

apts = RunSteps.flat_map {|s| s.apt }
other_packages = %w(cmake libpng12-dev libgd-dev groff tcc)

apts = [*apts.flatten.compact.uniq, *other_packages].sort

dockerfile = []
dockerfile << "FROM ubuntu:15.10"
dockerfile << "ENV PATH /usr/games:$PATH"
dockerfile << "ADD . /usr/local/share/quine-relay"
dockerfile << "WORKDIR /usr/local/share/quine-relay"
dockerfile << "RUN apt-get update && apt-get upgrade -y"
dockerfile << "RUN mount"

apts.each do |apt|
  dockerfile << "RUN apt-get install -y #{ apt }"
  dockerfile << "RUN apt-get clean"
  dockerfile << "RUN du /*"
end
dockerfile << "RUN make -C vendor"
dockerfile << "CMD make CC=tcc check"

File.write("../Dockerfile", dockerfile.join("\n") + "\n")
