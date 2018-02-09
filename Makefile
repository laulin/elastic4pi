build:
	docker build -t elasticsearch_test .

run:
	docker run --ulimit memlock=819200000:819200000 --ulimit nofile=65536:65536 --hostname `hostname` -p 9200:9200 -p 9300:9300 -it --rm --name elasticsearch_test_instance elasticsearch_test /bin/bash

start:
	docker run --ulimit memlock=819200000:819200000 --ulimit nofile=65536:65536 --hostname `hostname` -p 9200:9200 -p 9300:9300 -it --rm --name elasticsearch_test_instance elasticsearch_test /bin/bash /start.sh

super:
	docker run --ulimit memlock=819200000:819200000 --ulimit nofile=65536:65536 --hostname `hostname` -p 9200:9200 -p 9300:9300 -it --rm --name elasticsearch_test_instance elasticsearch_test supervisord -n -c /etc/supervisor/supervisord.conf