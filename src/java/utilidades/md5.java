/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package utilidades;

import java.security.MessageDigest;

/**
 *
 * @author jorge
 */
public class md5 {
 
    //funcion para encriptar md5
    public String ConvertirMD5(String cadena) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] b = md.digest(cadena.getBytes());
        int size = b.length;
        StringBuffer h = new StringBuffer(size);
        //algoritmo y arreglo md5
            for (int i = 0; i < size; i++) {
                int u = b[i] & 255;
                    if (u < 16) {
                        h.append("0" + Integer.toHexString(u));
                    }
                   else {
                        h.append(Integer.toHexString(u));
                   }
               }
          //clave encriptada
          return h.toString();
        }
    
}
