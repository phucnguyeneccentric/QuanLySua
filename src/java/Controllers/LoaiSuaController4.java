package Controllers;

import BusinessLogics.LoaiSuaBL;
import JavaBeans.LoaiSua;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hv
 */
@WebServlet(name = "LoaiSuaController4", urlPatterns = {"/LoaiSuaController4"})
public class LoaiSuaController4 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("UTF-8");

        List<LoaiSua> dsls = null;
        LoaiSua loaiSua = null;
        String maLoai, tenLoai, chon;

        chon = request.getParameter("btnChon");
        if(chon!=null){
            maLoai = request.getParameter("txtMaLoai");
            tenLoai = request.getParameter("txtTenLoai");

            loaiSua = new LoaiSua();
            loaiSua.setMaLoai(maLoai);
            loaiSua.setTenLoai(tenLoai);
            
            switch(chon){
                case "Thêm":
                    LoaiSuaBL.Them(loaiSua);
                    break;
                case "Tìm":
                    loaiSua = LoaiSuaBL.Tim(maLoai);
                    break;
                case "Sửa":
                    LoaiSuaBL.Sua(loaiSua);
                    break;
                case "Xóa":
                    LoaiSuaBL.Xoa(maLoai);
                    break;
            }
        }
        dsls = LoaiSuaBL.DocTatCa();
        
        request.setAttribute("loaiSua",loaiSua);
        request.setAttribute("dsls",dsls);

        request.getRequestDispatcher("loai-sua-4.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
