FROM imagedata/jupyter-docker:0.8.0
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# Clone the source git repo into notebooks
COPY --chown=1000:100 . notebooks
