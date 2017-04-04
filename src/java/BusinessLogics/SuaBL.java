package BusinessLogics;

import JavaBeans.Sua;
import Services.Database;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Lớp xử lý nghiệp vụ Sữa
 */
public class SuaBL {
    public static List<Sua> DocSuaTheoTen(String tenSua){
        List<Sua> dsSua = new ArrayList<Sua>();
        Connection ketNoi = Database.LayKetNoi();
        try {
            Statement stm = ketNoi.createStatement();
            ResultSet rs = stm.executeQuery("select * from sua where ten_sua like '%"+tenSua+"%'");
            while(rs.next()){
                Sua sua = new Sua();
                sua.setMaSua(rs.getString("ma_sua"));
                sua.setTenSua(rs.getString("ten_sua"));
                sua.setMaHangSua(rs.getString("ma_hang_sua"));
                sua.setMaLoaiSua(rs.getString("ma_loai_sua"));
                sua.setTrongLuong(rs.getInt("trong_luong"));
                sua.setDonGia(rs.getInt("don_gia"));
                sua.setTpDinhDuong(rs.getString("tp_dinh_duong"));
                sua.setLoiIch(rs.getString("loi_ich"));
                sua.setHinh(rs.getString("hinh"));
                dsSua.add(sua);
            }
            ketNoi.close();
        } catch (SQLException ex) {
            Logger.getLogger(SuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dsSua;
    }
    public static List<Sua> DocSuaTheoTenHangLoai(String tenSua,String maLoai,String maHang){
        List<Sua> dsSua = new ArrayList<Sua>();
        Connection ketNoi = Database.LayKetNoi();
        try {
            Statement stm = ketNoi.createStatement();
            ResultSet rs = stm.executeQuery("select * from sua where ten_sua like '%"+tenSua+"%' and Ma_loai_sua='"+maLoai+
                                            "' and Ma_hang_sua = '"+maHang+"'");
            while(rs.next()){
                Sua sua = new Sua();
                sua.setMaSua(rs.getString("ma_sua"));
                sua.setTenSua(rs.getString("ten_sua"));
                sua.setMaHangSua(rs.getString("ma_hang_sua"));
                sua.setMaLoaiSua(rs.getString("ma_loai_sua"));
                sua.setTrongLuong(rs.getInt("trong_luong"));
                sua.setDonGia(rs.getInt("don_gia"));
                sua.setTpDinhDuong(rs.getString("tp_dinh_duong"));
                sua.setLoiIch(rs.getString("loi_ich"));
                sua.setHinh(rs.getString("hinh"));
                dsSua.add(sua);
            }
            ketNoi.close();
        } catch (SQLException ex) {
            Logger.getLogger(SuaBL.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dsSua;
    }    
}
