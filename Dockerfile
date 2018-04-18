FROM imagedata/jupyter-docker:0.8.0
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN mkdir notebooks
COPY .git notebooks/
COPY * notebooks/
