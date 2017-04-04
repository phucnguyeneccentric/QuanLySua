/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myTag;

import Services.Database;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author hv
 */
public class loaisua extends SimpleTagSupport {

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     * 
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            // TODO: insert code to write html before writing the body content.
            // e.g.:
            //
            // out.println("<strong>" + attribute_1 + "</strong>");
            // out.println("    <blockquote>");

            JspFragment f = getJspBody();
            if (f != null) {
                f.invoke(out);
            }
            Connection ketNoi =  Database.LayKetNoi();
            Statement stm = ketNoi.createStatement();
            ResultSet rs = stm.executeQuery("select * from loai_sua");
            out.print("<select name='slloaisua'>");
            while(rs.next()){
                out.print("<option value='"+rs.getString("Ma_loai_sua")+"'>"+rs.getString("Ten_loai"));
                out.print("</option>");
            }
            out.print("</select>");

            // TODO: insert code to write html after writing the body content.
            // e.g.:
            //
            // out.println("    </blockquote>");
        } catch (java.io.IOException ex) {
            throw new JspException("Error in loaisua tag", ex);
        } catch (SQLException ex) {
            Logger.getLogger(loaisua.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
