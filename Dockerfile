FROM imagedata/jupyter-docker:0.8.0
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# Clone the source git repo into notebooks
# 20180418: COPY --chown doesn't work on Docker Hub
#COPY --chown=1000:100 . notebooks
COPY . notebooks
USER root
RUN chown -R 1000:100 notebooks
USER jovyan
