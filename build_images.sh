#!/bin/bash
docker build -t cgmarquez95/mybd mysql/.
docker build -t cgmarquez95/dp drupal/.
docker build -t cgmarquez95/nx nginx/.
