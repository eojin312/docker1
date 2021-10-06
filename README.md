# docker1
도커 연습용


# 도커

매우 가벼운 모듈식 가상 머신

## 도커와 관련된 단어 개념 설명

docker image 

- 컨테이너 실행에 필요한 파일과 설정값등을 포함하고 있는 것

container

- 개별 Software의 실행에 필요한 실행환경을 독립적으로 운용할 수 있도록 기반환경 또는 다른 실행환경과의 간섭을 막고 실행의 독립성을 확보해주는 운영체계 수준의 격리 기술

## docker GUI 다운



terminal 에 docker 다운

sudo wget -qO- https://get.docker.com/ | sh

정상적으로 다운됐다면 저 명령어를 통해 잘 실행되는 지 확인

docker --version

docker 회원가입 (필수)

GUI 에서도 로그인

이건 쉬움

terminal 에서도 로그인

 이건 밑에서 설명

docker login

로그인 되면, Login Success 라고 뜸

Docker image 생성

docker image 에 적용할 프로젝트에 Dockerfile 파일을 생성해야함

※ 꼭 파일명을 Dockerfile 로 해야함. (커멀케이스 주의)
```
FROM openjdk:11

ADD target /app

EXPOSE 8080

WORKDIR /app

ENTRYPOINT ["java", "-jar", "test.war"]
```

Dockerfile 이 하는 역할

build 시, 알아서 차례대로 명령해주는 파일 (위 script 는 예시)

Dockerfile 다 작성했으면 본격적으로 image 를 생성할 수 있음

terminal 에서

docker build [프로젝트 경로]/Dockerfile

해주면 됨

안된다 싶으면,

![1](https://user-images.githubusercontent.com/45488643/136144994-15febe8f-0174-465e-8792-3b744499e229.png)

꼼수지만, 이렇게 하면 알아서 intellij 가 image + container 까지 생성, build 해줌..

image 는 생성됨!

## 생성된 image 는 어떻게 확인하나요?

GUI 에 있으니 확인해봐도 좋고,

terminal 에서도 확인이 가능함

```
 docker images
```

![2](https://user-images.githubusercontent.com/45488643/136145016-b420aec3-db43-468a-b3cf-61486836b68b.png)

이제 백그라운드에서 실행 시켜봄

```
docker run [옵션] [docker image repository name]
```

**이건 예시**

8080:9999 는 docker 가 백그라운드에서 실행시킬 때 포트를 정해주는 것. [원하는 포트] : [docker 에서 띄운 포트] 

```
docker run -d -p 8080:9999 docker-test
```



**예시 결과**
![3](https://user-images.githubusercontent.com/45488643/136145035-79f6058c-0ee0-4d19-8e05-3003a51ee4b8.png)

## 실행된 백그라운드 접속하기

terminal 에서 해야함

```
docker exec -it [containerID] bash 
```

![4](https://user-images.githubusercontent.com/45488643/136145049-805dcbf0-ec7f-46f7-83ab-83bdae8e426a.png)

그럼 변경된 걸 확인할 수 있음


