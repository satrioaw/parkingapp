# README

Saya adalah pemilik tempat parkir khusus Mobil yang dapat menampung hingga sebanyak ‘n’ mobil. Tempat parkir mobil ini memiliki kapasitas tampung(lot) sebanyak ‘n’. Setiap mobil yang masuk akan dicatat nomor plat kendaraan, warna, tipe mobil (SUV/MPV),Tanggal masuk (degenerate otomatis oleh system). Sistem akan mengeluarkan tiket dan pemilik kendaraan akan mendapatkan tiket yang berisi data Nomor Kendaraan, dan Nomor Parkir Lot (tempat tampung). 

## INSTALL DEPENDENCIES
```bash
$ bundle install
```

## IMPORT POSTMAN COLLECTION
```
parking.postman_collection.json
```


## RUN MIGRATION & SEED DUMMY DATA
```bash
$ rails db:migrate
$ rails db:seed
```

## RUN SERVER
```bash
$ rails s
```
## FILE RELATED TO APPS
```bash
"db\migrate\20210203123037_create_parkings.rb"
"db\seeds.rb"
"config\routes.rb"
"app\models\parking.rb"
"app\controllers\api\v1\parking_controller.rb"
```