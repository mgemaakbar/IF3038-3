/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Toshiba L645
 */
public class mKomentar {

    String username;
    String komentar;
    String waktu_komentar;

    public mKomentar(String username, String komentar, String waktu_komentar) {
        this.username = username;
        this.komentar = komentar;
        this.waktu_komentar = waktu_komentar;
    }

    public String show() {
        StringBuilder sb = new StringBuilder();
        sb.append(username);
        sb.append(" | ");
        sb.append(waktu_komentar + "<br>");
        sb.append(komentar + "<br>");
        return sb.toString();
        
    }
}
