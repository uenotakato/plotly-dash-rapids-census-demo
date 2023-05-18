ARG CUDA_VERSION=11.0
ARG LINUX_VERSION=ubuntu18.04
ARG PYTHON_VERSION=3.8
FROM nvcr.io/nvidia/rapidsai/rapidsai-core:${RAPIDS_VERSION}cuda${CUDA_VERSION}-base-${LINUX_VERSION}-py${PYTHON_VERSION}

WORKDIR /rapids/
RUN mkdir plotly_census_demo

WORKDIR /rapids/plotly_census_demo
RUN mkdir data
WORKDIR /rapids/plotly_census_demo/data

WORKDIR /rapids/plotly_census_demo

COPY . .

RUN source activate rapids && conda remove --force cuxfilter && mamba env update --file environment_for_docker.yml

ENTRYPOINT ["bash","./entrypoint.sh"]
