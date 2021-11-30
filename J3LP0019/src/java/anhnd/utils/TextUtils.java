/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhnd.utils;

import java.util.UUID;
import javax.servlet.http.Part;

/**
 *
 * @author anhnd
 */
public class TextUtils {

    public static String getUUID() {
        return UUID.randomUUID().toString();
    }
    
    public static String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        String name = "";
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                name = s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return name;
    }
}
