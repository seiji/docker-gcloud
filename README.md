docker-gcloud
====================

```
$ docker run --rm \
  -v $HOME/.docker:$HOME/.docker \
  -v $HOME/.config:/.config \
  seiji/gcloud \
  /bin/sh -c "eval '$(docker-machine env dev)' && gcloud docker -- pull asia.gcr.io/$PROJECT_ID/$IMAGE_NAME"
```
