## Nama Aggota Kelompok : 

- Happy Syahrul Ramadhan
- Tessa Kania Sagala
- Rian Bintang Wijaya
- Yunike Priskila Sitorus Pane

## Analisis Aktifitas Gempa Bumi di Sumatera
<img src="https://github.com/user-attachments/assets/6ccbf4af-83f0-49f2-ac77-cb0872a5834b" alt="Gambar" style="display: block; margin: 0 auto;">

## Arsitektur Big Data
<img src="https://github.com/user-attachments/assets/4b562c0f-316a-4973-af81-6e856c344dc5" alt="Gambar" style="display: block; margin: 0 auto;">

## Requirement Komponen
- **Hadoop**: 3.4.1
- **Hive**: 4.0.1
- **Flume**: 1.6.0 
- **HBase**: 2.5.11
- **ZooKeeper**: 3.8.4
- **MySQL**: 8.0 (untuk Hive Metastore)
- **SPARK**: 3.5.5

## Langkah Instalasi

1. **Clone Repo**
   ```bash
   git clone
   ```

2. **Download Dependencies** :
   - [Hadoop 3.4.1](https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz)
   - [Hive 4.0.1](https://downloads.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz)  
   - [HBase 2.5.11](https://archive.apache.org/dist/hbase/2.5.11/hbase-2.5.11-bin.tar.gz)
   - [ZooKeeper 3.8.4](https://archive.apache.org/dist/zookeeper/zookeeper-3.8.4/apache-zookeeper-3.8.4-bin.tar.gz)
   - [SPARK 3.5.5](https://archive.apache.org/dist/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz)

3. **Bangun Docker Image**
   ```bash
   bash build.sh
   ```

4. **Jalankan Container**
   ```bash
   bash start.sh
   ```

5. **Cek Apakah Container Berjalan**
   ```bash
   docker ps -a
   ```

14. **Login ke Container**
   ```bash
   bash login.sh
   ```
setelah masuk ke kontainer tunggu beberapa menit untuk semua fungsi berjalan
```bash
cat /tmp/bootstrap.log
```
lihat semua status apakah sudah dijalankan atau belum.

15. **Cek Aktivitas Hive dan Port yang Tersedia**
   Cek port apakah sudah aktif untuk `hivemetastore` di port 10000 dan `hiveserver2` di port 10001 dengan perintah:
   ```bash
   netstat -nlpt
   ```

17. **Akses GUI Hiveserver**
   Cek juga antarmuka web GUI Hiveserver di:  
   [http://localhost:10002](http://localhost:10002).

   Detail Akses GUI Hive:

   | Komponen Hive      | Port  | URL Akses                   |
   |-----------------------|-------|-----------------------------|
   | **Hive Web UI**       | 10002 | http://localhost:10002       |

19. **Akses HBase Shell**:
   ```bash
   hbase shell
  ```
   Untuk mengakses **HBase Web UI**, Anda bisa membuka browser dan akses alamat berikut:
   ```
   http://localhost:16010
   ```
   Detail Akses GUI HBase:

   | Komponen HBase       | Port  | URL Akses                   |
   |-----------------------|-------|-----------------------------|
   | **HBase Master UI**   | 16010 | http://localhost:16010      |
   | **HBase REST API**    | 16030 | http://localhost:16030      |

   
   
21. **Masuk ke Spark Shell**
   ketik perintah berikut tetapi harus sudah masuk ke root bash

   ```bash
   spark-shell
   ```
   tunggu sampai muncul logo spark

   Detail Akses GUI SPARK:

   | Komponen SPARK      | Port  | URL Akses                   |
   |-----------------------|-------|-----------------------------|
   | **SPARK UI**         | 4040  | http://localhost:4040       |

23. **Hentikan Container**
   Hentikan container dengan menjalankan:
   ```bash
   bash stop.sh
   ```

## Port yang Digunakan

### Hadoop Ecosystem
| Port  | Service                  | URL              |
|-------|--------------------------|-----------------------------|
| 9000  | HDFS NameNode            | -                           |
| 9866  | HDFS DataNode            | -                           |
| 9870  | HDFS Web UI              | http://localhost:9870       |


### Hive
| Port  | Service          | URL                     |
|-------|------------------|-------------------------|
| 10000 | Hive Metastore   | -                       |
| 10001 | HiveServer2      | jdbc:hive2://localhost:10001 |
| 10002 | Hive Web UI      | http://localhost:10002  |

### HBase
| Port  | Service              | URL                     |
|-------|----------------------|-------------------------|
| 16000 | HBase Master         | -                       |
| 16010 | HBase Master Web UI  | http://localhost:16010  |
| 16020 | HBase RegionServer   | -                       |
| 16030 | HBase REST Server    | http://localhost:16030  |

### ZooKeeper
| Port  | Purpose                  |
|-------|--------------------------|
| 2181  | Client connections       |
| 2888  | Peer communication       |
| 3888  | Leader election          |

### SPARK
| Port  | Service  | URL                |
|-------|----------|--------------------|
| 4040  | SPARK UI | http://localhost:4040 |

| Port  | Service  | URL                |
|-------|----------|--------------------|
| 9000  | SPARK Server | http://localhost:9000 |

