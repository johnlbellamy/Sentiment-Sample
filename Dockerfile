FROM python:3.8

USER root

ARG USERDIR=/home/hatteras-user 
ARG NOTEBOOK="Sample.ipynb "

RUN apt-get update && apt install -y nodejs npm \
    &&  useradd -s /sbin/nologin hatteras-user \
    && mkdir -p ${USERDIR}\
    && pip3 install --upgrade pip  \
    # XXX: Install enum34==1.1.8 because other versions lead to errors during
    #  KFP installation
    && pip3 install --upgrade "enum34==1.1.8" --no-cache-dir\
    && pip3 install --upgrade "jupyterlab>=2.0.0,<3.0.0"  --no-cache-dir\
    && pip3 install --upgrade kubeflow-kale  --no-cache-dir\
    && jupyter labextension install kubeflow-kale-labextension \
    && rm -rf /var/lib/apt/lists/*

COPY requirements ${USERDIR}
COPY Sample.ipynb /home/hatteras-user/    

ADD text_cleaner_2000 /home/hatteras-user
ADD data /home/hatteras-user

WORKDIR ${USERDIR}

RUN pip3 install --no-cache-dir -r requirements && \
    chown -R hatteras-user:hatteras-user ${USERDIR}

USER hatteras-user

CMD ["sh", "-c", \
     "jupyter lab --notebook-dir=${USERDIR}--ip=0.0.0.0 --no-browser \
      --allow-root --port=8888 --LabApp.token='' --LabApp.password='' \
      --LabApp.allow_origin='*' --LabApp.base_url=${NB_PREFIX}"]