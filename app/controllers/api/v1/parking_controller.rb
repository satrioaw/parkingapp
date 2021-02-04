require 'time' 

module Api
  module V1
    class ParkingController < ApplicationController

      def register
        lot  = "#{rand(0..9)}#{('A'..'Z').to_a.sample}"
        data = params.permit([:plat_nomor, :warna, :tipe])
        data['parking_lot'] = lot
        parked = Parking.new(data)
        if parked.save
        render json: {status: 'SUCCESS', message:'A Car Parked', data:data},status: :ok
        else
          render json: {status: 'ERROR', message:'A Car Can\'t Parked', data:article.errors},status: :unprocessable_entity
        end
      end

      def checkout
        car = Parking.where(:plat_nomor => params[:plat_nomor]).first
        
        a = Time.parse(car.created_at.to_s)
        b = Time.now
        duration = ((b - a) / 3600).round

        if duration ==  1 or duration <  1
              car.tipe == 'suv' ? price = 25000 : price = 35000
        else
              car.tipe == 'suv' ? price = 25000 + ( 4000 * duration) : price = 35000 + ( 7000 * duration)
        end

        # puts car.tipe
        car.update(parking_bill: price)
        car.touch
        data = { "plat_nomor" => car.plat_nomor, 
                "tanggal_masuk" => car.created_at.to_s, 
                "tanggal_keluar" => car.updated_at.to_s,
                "jumlah_bayar" => price}
        
        render json: {status: 'SUCCESS', message:'Car checkout', data:data},status: :ok
      end

      def sumbytype
        jumlah_kendaraan = Parking.where( :tipe => params[:tipe]).count
        render json: {status: 'SUCCESS', message:'Sum By Type of Car', jumlah_kendaraan:jumlah_kendaraan},status: :ok
      end    

      def sumbycolour
        car = Parking.where( :warna => params[:warna]).pluck(:plat_nomor)
        render json: {status: 'SUCCESS', message:'Sum By Colour', jumlah_kendaraan:car},status: :ok
      end     
    end
  end
end
