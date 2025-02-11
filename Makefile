CC=g++
CFLAGS=-std=c++11 -Wall
TARGET=vpl_exec

TARGET_DIR = .
BUILD_DIR = ./build
SRC_DIR = ./src
INCLUDE_DIR = ./include

all: ${TARGET_DIR}/${TARGET}

run: all
	./${TARGET_DIR}/${TARGET}

clean:
	rm -f ${BUILD_DIR}/*
	rm -f ${TARGET_DIR}/${TARGET}

${TARGET_DIR}/${TARGET}: ${BUILD_DIR}/Banco.o ${BUILD_DIR}/ContaBancaria.o ${BUILD_DIR}/ContaCorrente.o ${BUILD_DIR}/ContaPoupanca.o ${BUILD_DIR}/main.o
	${CC} ${CFLAGS} ${BUILD_DIR}/*.o -o ${TARGET_DIR}/${TARGET}

${BUILD_DIR}/Banco.o: ${INCLUDE_DIR}/ContaBancaria.hpp ${INCLUDE_DIR}/ContaCorrente.hpp ${INCLUDE_DIR}/ContaPoupanca.hpp ${INCLUDE_DIR}/Banco.hpp ${SRC_DIR}/Banco.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/Banco.cpp -o ${BUILD_DIR}/Banco.o
    
${BUILD_DIR}/ContaBancaria.o: ${INCLUDE_DIR}/ContaBancaria.hpp ${SRC_DIR}/ContaBancaria.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/ContaBancaria.cpp -o ${BUILD_DIR}/ContaBancaria.o
    
${BUILD_DIR}/ContaCorrente.o: ${INCLUDE_DIR}/ContaBancaria.hpp ${INCLUDE_DIR}/ContaCorrente.hpp ${SRC_DIR}/ContaCorrente.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/ContaCorrente.cpp -o ${BUILD_DIR}/ContaCorrente.o

${BUILD_DIR}/ContaPoupanca.o: ${INCLUDE_DIR}/ContaBancaria.hpp ${INCLUDE_DIR}/ContaPoupanca.hpp ${SRC_DIR}/ContaPoupanca.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/ContaPoupanca.cpp -o ${BUILD_DIR}/ContaPoupanca.o

${BUILD_DIR}/main.o: ${INCLUDE_DIR}/ContaCorrente.hpp ${INCLUDE_DIR}/ContaPoupanca.hpp ${INCLUDE_DIR}/Banco.hpp ${SRC_DIR}/main.cpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/main.cpp -o ${BUILD_DIR}/main.o