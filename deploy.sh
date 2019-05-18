docker build -t vicch/multi-client:latest -t vicch/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vicch/multi-server:latest -t vicch/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vicch/multi-worker:latest -t vicch/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vicch/multi-client:latest
docker push vicch/multi-client:$SHA
docker push vicch/multi-server:latest
docker push vicch/multi-server:$SHA
docker push vicch/multi-worker:latest
docker push vicch/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/client-deployment client=vicch/multi-client:$SHA
kubectl set image deployment/server-deployment server=vicch/multi-server:$SHA
kubectl set image deployment/worker-deployment worker=vicch/multi-worker:$SHA