#!/bin/bash

echo "Criando grupos de usuários"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários"

function createUser () {
  useradd $1 -m -s /bin/bash -G $2  -p $(openssl passwd Senha123)
}

createUser carlos GRP_ADM
createUser maria GRP_ADM
createUser joao GRP_ADM

createUser debora GRP_VEN
createUser sebastiana GRP_VEN
createUser roberto GRP_VEN

createUser josefina GRP_SEC
createUser amanda GRP_SEC
createUser rogerio GRP_SEC

echo "Criando os diretórios"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
