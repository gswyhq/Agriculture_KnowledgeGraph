FROM python:3.5.6-stretch

RUN apt-get update && apt-get install -y cython

ENV MYDIR /Agriculture_KnowledgeGraph
ENV NEO4J_HOST "localhost"
ENV NEO4J_HTTP_PORT "7474"
ENV NEO4J_BOLT_PORT "7687"

WORKDIR $MYDIR

COPY . $MYDIR/

RUN cd /Agriculture_KnowledgeGraph  && pip3 install Cython  && pip3 install -r requirement.txt -i http://pypi.douban.com/simple --trusted-host=pypi.douban.com

EXPOSE 8000

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/bash"]

# docker build -t gswyhq/agriculture_knowledge_graph -f Dockerfile .

