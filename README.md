# Big Data Spark - Single Node Cluster with Docker

## Versi Komponen
- **Hadoop**: 3.4.1
- **Hive**: 4.0.1
- **Flume**: 1.6.0 
- **HBase**: 2.5.11
- **ZooKeeper**: 3.8.4
- **MySQL**: 8.0 (untuk Hive Metastore)
- **SPARK**: 3.5.5

## Langkah Instalasi

5. **Clone Repo**
   ```bash
   git clone https://github.com/sains-data/bigdata-spark.git 
   ```

6. **Download Dependencies** - jika belum memiliki file yang diperlukan:
   - [Hadoop 3.4.1](https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz)
   - [Hive 4.0.1](https://downloads.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz)  
   - [Tez 0.10.4](https://dlcdn.apache.org/tez/0.10.4/apache-tez-0.10.4-bin.tar.gz)
   - [HBase 2.5.11](https://archive.apache.org/dist/hbase/2.5.11/hbase-2.5.11-bin.tar.gz)
   - [ZooKeeper 3.8.4](https://archive.apache.org/dist/zookeeper/zookeeper-3.8.4/apache-zookeeper-3.8.4-bin.tar.gz)
   - [SPARK 3.5.5](https://archive.apache.org/dist/spark/spark-3.5.5/spark-3.5.5-bin-hadoop3.tgz)

7. **Buka folder di VS Code**  
   Buka folder `bigdata-spark` di VS Code, lalu ubah semua baris dengan format `CRLF` ke `LF`.  
   - Di VS Code: Klik `CRLF` di kanan bawah, lalu pilih `LF`.

8. **Arahkan Terminal ke Folder Repo**
   ```bash
   cd /mnt/c/bigdata-spark
   ```

   Atau pada terminal Windows:
   ```bash
   cd C:\bigdata-spark
   ```

9. **Salin file `hadoop-3.4.1.tar.gz` ke folder ini**  
   File ini *tidak* diunduh otomatis oleh Dockerfile.  
   - Unduh dari: [https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz](https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz)  
   - Pindahkan ke folder `bigdata-hive-mysql`

   > 💡 **Catatan:** Jika ingin Docker otomatis mengunduh file, bisa tambahkan perintah `curl` ke dalam `Dockerfile` seperti:
   ```Dockerfile
   RUN curl -O https://downloads.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz
   ```

10. **Salin file `hive-4.0.1-bin.tar.gz` dan `tez-0.10.4-bin.tar.gz` ke folder ini**  
   File-file ini *tidak* diunduh otomatis oleh Dockerfile.  
   - Unduh dari:
     - [Apache Hive 4.0.1](https://downloads.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz)  
     - [Apache Tez 0.10.4](https://dlcdn.apache.org/tez/0.10.4/apache-tez-0.10.4-bin.tar.gz)

   - Pindahkan file-file tersebut ke folder `bigdata-hive-mysql`.

   > 💡 **Catatan:** Jika ingin Docker otomatis mengunduh file, bisa tambahkan perintah `wget` ke dalam `Dockerfile` seperti:
   ```Dockerfile
   RUN wget https://downloads.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz
   RUN wget https://downloads.apache.org/tez/tez-0.10.4/apache-tez-0.10.4-bin.tar.gz
   ```

   **Salin file hbase-2.5.11-bin.tar.gz dan file zookeeper-3.8.4-bin.tar.gz ke folder ini**

11. **Bangun Docker Image**
   ```bash
   bash build.sh
   ```

12. **Jalankan Container**
   ```bash
   bash start.sh
   ```

13. **Cek Apakah Container Jalan**
   ```bash
   docker ps -a
   ```

14. **Login ke Container**
   ```bash
   bash login.sh
   ```
setelah masuk ke kontainer tunggu beberapa menit untuk semua fungsi berjalan, untuk melihat history log nya bisa lihat di:
```bash
cat /tmp/bootstrap.log
```
lihat semua status apakah sudah dijalankan atau belum.

Berikut ini jika ingin memeriksa hive dan hbase, jika tidak bisa dilewatkan saja:

15. **Cek Aktivitas Hive dan Port yang Tersedia**
   Cek port apakah sudah aktif untuk `hivemetastore` di port 10000 dan `hiveserver2` di port 10001 dengan perintah:
   ```bash
   netstat -nlpt
   ```

   Atau cek satu-satu dengan perintah:
   ```bash
   netstat -nlpt | grep 10000
   netstat -nlpt | grep 10001
   ```

   Jika belum muncul, tunggu beberapa menit dan cek kembali. Jika sudah muncul, lanjutkan ke langkah berikutnya.

16. **Koneksi ke Hive dengan Beeline - jika ingin memeriksa Hive Metastore**
   Setelah port 10001 aktif, lanjutkan dengan membuka koneksi Hive menggunakan Beeline:
   ```bash
   beeline -u jdbc:hive2://localhost:10001/ -n hive -p hive
   ```

   Di sini:
   - `-n` adalah username Hive (misalnya `hive`).
   - `-p` adalah password Hive (misalnya `hive`).

   Jika berhasil terkoneksi, Anda siap untuk menggunakan Hive.

17. **Akses GUI Hiveserver**
   Cek juga antarmuka web GUI Hiveserver di:  
   [http://localhost:10002](http://localhost:10002).

   Detail Akses GUI Hive:

   | Komponen Hive      | Port  | URL Akses                   |
   |-----------------------|-------|-----------------------------|
   | **Hive Web UI**       | 10002 | http://localhost:10002       |

18. **Keluar dari Koneksi Hive**
   Setelah selesai, tekan `Ctrl + C` untuk keluar dari koneksi Beeline.

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


20. **Keluar dari hbase**
   Setelah keluar dari hbase shell, ketik:
   ```bash
   exit
   ```
   selanjutnya kita akan masuk ke root bash

21. **Masuk ke Spark Shell**
   ketik perintah berikut
   ```bash
   spark-shell
   ```
   tunggu sampai muncul logo spark 3.5.5

   Detail Akses GUI SPARK:

   | Komponen SPARK      | Port  | URL Akses                   |
   |-----------------------|-------|-----------------------------|
   | **SPARK UI**         | 4040  | http://localhost:4040       |

   untuk keluar dari spark-shell maka ketik `CTRL + C` di keyboard, lalu kita akan masuk ke root bash

kegiatan dilanjutkan ke latihan. 

Berikut ini cara untuk keluar dari root bash dan menghentikan container

22. **Keluar dari Root bash**
   ketik:
   ```bash
   exit
   ```

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

### Lainnya
| Port  | Service  |
|-------|----------|
| 3306  | MySQL    |
