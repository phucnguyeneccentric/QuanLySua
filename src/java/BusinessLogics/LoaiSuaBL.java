/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * 
 */
package BusinessLogics;

import JavaBeans.LoaiSua;
import Services.Database;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hv
 * Các nghiệp vụ (business logic) của bảng LoaiSua
 */
public class LoaiSuaBL {
    public static List<LoaiSua> DocTatCa(){
        List<LoaiSua> dsls = null;
        try {
            dsls = new ArrayList<>();
            Connection con = Database.LayKetNoi();
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from loai_sua");
            while(rs.next()){
                LoaiSua ls = new LoaiSua();
                ls.setMaLoai(rs.getString("ma_loai_sua"));
                ls.setTenLoai(rs.getString("ten_loai"));
                dsls.add(ls);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dsls;
    }
    public static void Them(LoaiSua loaiSua){
        try(Connection con = Database.LayKetNoi()){
            PreparedStatement pst = con.prepareStatement("insert into loai_sua(ma_loai_sua,ten_loai) values (?,?)");
            pst.setString(1,loaiSua.getMaLoai());
            pst.setString(2,loaiSua.getTenLoai());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static LoaiSua Tim(String maLoai){
        LoaiSua loaiSua = null;
        try(Connection con = Database.LayKetNoi()){
            PreparedStatement pst = con.prepareStatement("select * from loai_sua where ma_loai_sua=?");
            pst.setString(1,maLoai);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                loaiSua = new LoaiSua();
                loaiSua.setMaLoai(rs.getString("ma_loai_sua"));
                loaiSua.setTenLoai(rs.getString("ten_loai"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return loaiSua;
    }
    public static void Xoa(String maLoai){
        try(Connection con = Database.LayKetNoi()){
            PreparedStatement pst = con.prepareStatement("delete from loai_sua where ma_loai_sua=?");
            pst.setString(1,maLoai);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void Sua(LoaiSua loaiSua){
         try(Connection con = Database.LayKetNoi()){
            PreparedStatement pst = con.prepareStatement("update loai_sua set ten_loai=? where ma_loai_sua=?");
            pst.setString(1,loaiSua.getTenLoai());
            pst.setString(2, loaiSua.getMaLoai());
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}