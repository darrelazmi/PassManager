<p align="center">
  <a href="https://github.com/darrelazmi/PassManager/">
    <img src="images/vaultwarden-image.png" alt="IHateToBudget logo" height="130">
  </a>
</p>

<p align="center">
  <img src="images/linux.webp" alt="GitHub Pipenv Linux Version" height="20">
  <img src="https://github.com/HijazP/i-hate-to-budget/blob/main/Image/logo%20docker.png" alt="GitHub Pipenv Docker Version" height="20">
  <img src="images/linux.webp" alt="GitHub Pipenv Linux version" height="20">
<!--   <img src="https://github.com/HijazP/i-hate-to-budget/blob/main/Image/django%20logo.png" alt="GitHub Pipenv locked Python version" height="20"> -->
  </p>

<p align="center">
  Aplikasi web sederhana untuk mengatur password  Anda.
  <br>
  Didesain untuk dihosting sendiri.
  <br>
  <em>Reference by [PasswordManager](https://github.com/dani-garcia/vaultwarden).</em>
</p>

[Sekilas Tentang](#sekilas-tentang) | [Instalasi](#instalasi) | [Otomatisasi](#otomatisasi) | [Cara Pemakaian](#cara-pemakaian) | [Pembahasan](#pembahasan) | [Referensi](#referensi)
:---:|:---:|:---:|:---:|:---:|:---:

    
# Sekilas Tentang
![alt text](images/homejga.png)

[!PasswordManager](https://github.com/dani-garcia/vaultwarden)<br>
Vaultwarden merupakan sebuah web app yang bertujuan untuk membantu anda dalam menyimpan password didalam cloud. Pada web app ini, kita dapat menyimpan password dengan menandai tipe password, nama dari passwordnya, username dan tentunya juga password yang ingin kita simpan di cloud. Kelebihan yang didapatkan dari web app ini adalah password yang disimpan di Vaultwarden memiliki keamanan extra dari server yang membuat password yang disimpan di web ini jauh lebih aman.

## Instalasi
[`^ kembali ke atas ^`](#)

### Kebutuhan Sistem :
- Sistem Operasi: Linux Ubuntu
- Docker: Docker versi terbaru
- RAM: 64Mb atau lebih tinggi

### Proses Instalasi :
#### Docker
Proses instalasi menggunakan Docker hanyalah salah satu cara, banyak cara lainnya yang bisa disesuaikan dengan preferensi masing-masing.

1. *Hapus* package yang konflik:
```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

2. *Add Docker's* official GPG key:
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

3. *Add the Repository* to Apt sources:
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```


4. *Install* the latest version of docker package:
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

#### INSTALL CONTAINER VAULTWARDEN

- Install Vaultwarden dari public docker repo.
```
docker run --name vaultwarden --hostname vaultwarden \
  --network proxy-net --volume ./vaultwarden:/data --detach \
  vaultwarden/server
```

#### INSTALL CONTAINER CADDY

- Install Caddy:
```
docker run --name caddy --network proxy-net \
  --publish 80:80 --publish 443:443 --detach \
  caddy caddy reverse-proxy --from vault.raikun.me --to vaultwarden:80
```
  
## Otomatisasi
[`^ kembali ke atas ^`](#page1)

Cara lain untuk mempersingkat proses instalasi adalah menggunakan *shell script*. *Shell script* adalah kumpulan kode yang dapat dijalankan di Unix shell. Berikut adalah kumpulan *shell script* untuk instalasi, menjalankan, serta menghentikan server aplikasi.

#### Cara menjalankannya dengan perintah `./(nama).sh`
- [setup.sh](https://github.com/HijazP/i-hate-to-budget/shell/setup.sh) berisi kode `git clone` dan `cp`.

*Shell script* `user.sh`, `start.sh`, dan `stop.sh` dan dijalankan kapanpun setelah `setup.sh` dan `change.sh` dijalankan.


## Cara Pemakaian
[`^ kembali ke atas ^`](#)
- Tampilan Aplikasi Web
    - Tampilan Halaman Log In
        ![alt text](images/login.png)
    - Tampilan Halaman Daftar
        ![alt text](images/signup.png)
    - Tampilan Utama Aplikasi
        ![alt text](images/homejga.png)
- Fungsi-fungsi utama
    - Menambah Password Baru
        ![alt text](images/home.png)
- Contoh Penggunaan
    - Contoh Penggunaan Vaultwarden Untuk Mengisi Password
        ![alt text](images/loginexample.png)

## Pembahasan
[`^ kembali ke atas ^`](#)

- Pendapat anda tentang aplikasi web ini
    - ### Kelebihan
      1. Dapat mengatur sendiri kategori pengeluaran
      ![image](https://user-images.githubusercontent.com/65883882/196928714-801e1f62-ce89-4863-92e0-9645c3cd447e.png)
      2. Dapat melihat history pengeluaran
      ![image](https://user-images.githubusercontent.com/65883882/196929056-3bd522a1-6c5d-4cc0-bf9a-fe95491399c1.png)
      3. Terdapat insight pengeluaran per bulannya
      ![image](https://user-images.githubusercontent.com/65883882/196929851-ac9666bf-a346-43f8-8fa5-9c339b3c7764.png)

    - ### Kekurangan
      1. Hanya mencatat jumlah pengeluaran, tidak mencatat saldo yang ada
      ![image](https://user-images.githubusercontent.com/65883882/196930621-c0826813-e429-4ff7-945e-88a5af0a5274.png)
      2. Tidak bisa lebih dari 1 akun dalam 1 server
      ![image](https://user-images.githubusercontent.com/65883882/196932444-0107dbcb-4eab-4e5c-af0c-7bc012767ef9.png)
      
- Bandingkan dengan aplikasi web lain yang sejenis
  ### Money Lover
  1. Terdapat pembagian untuk sumber uang
  ![image](https://user-images.githubusercontent.com/65883882/196955697-2b1ce911-b781-4be9-b2bc-e18977ed5d37.png)
  2. Kategori pengeluaran sudah tersedia, namun tidak dapat dikustomisasi
  ![image](https://user-images.githubusercontent.com/65883882/196955818-f19f4168-f6a5-4a50-bf8a-b3de68a05de0.png)
  
  ### SikapiUangmu - OJK
  1. Terdapat opsi untuk menghitung harta dan dikurangi dengan utang yang dimiliki
  ![image](https://user-images.githubusercontent.com/65883882/196956060-e12af8c7-20f1-4de7-b9d8-24b4ef3a1bbf.png)
  2. Terdapat kalkulator untuk menghitung kesehatan keuangan
  ![image](https://user-images.githubusercontent.com/65883882/196956147-34c8f6b2-b253-49ac-89e3-9a184abec20b.png)

## Referensi
- [Azure Cloud](https://azure.microsoft.com/id-id/)
- [Docker](https://www.docker.com/)
- [Money Lover](https://moneylover.me/)
- [SikapiUangmu - OJK](https://sikapiuangmu.ojk.go.id/FrontEnd/Kalkulator/Kalkulator%20Dompet)

[`^ kembali ke atas ^`](#)
