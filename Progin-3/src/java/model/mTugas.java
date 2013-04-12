package model;

import com.sun.xml.ws.api.security.trust.STSAttributeProvider;
import java.util.ArrayList;

/**
 *
 * @author Toshiba L645
 */
public class mTugas {

    public String ID_tugas;
    public String nama_tugas;
    public String deadline;
    public String status;
    public String pembuat_tugas;
    public String kategori;
    public String tags;
    public ArrayList<mKomentar> komen;

    public mTugas(String ID_tugas, String nama_tugas, String deadline, String status, String pembuat_tugas, String kategori) {
        this.ID_tugas = ID_tugas;
        this.nama_tugas = nama_tugas;
        this.deadline = deadline;
        this.status = status;
        this.pembuat_tugas = pembuat_tugas;
        this.kategori = kategori;
        this.tags = "";
        this.komen = new ArrayList<mKomentar>();
    }

    public String show(int id) {
        StringBuilder sb = new StringBuilder();
        if(id<10)sb.append("<div id="+id+">");
        if(id>=10)sb.append("<div id="+id+"  style=\"display:none\">");
        sb.append("Kategori : " + kategori);
        sb.append("<br> Nama Tugas : <a href =\"rinciantugas.jsp?ID_tugas="+ID_tugas+"\">" + nama_tugas + "</a>");
        sb.append("<br> Deadline : " + deadline);
        sb.append("<br> Tags : "+tags);
        sb.append("<br> Status : " + status);
        sb.append("<form name=\"gantistatus\" action=\"doGantistatus.jsp?ID_tugas=" + ID_tugas + "&status=" + status + "\" method=\"POST\">");
        sb.append("<input type=\"submit\" value=\"Ganti Status\"<br>");
        sb.append("</form>");
        sb.append("Komentar : <br>");
        for (int i = 0; i < komen.size(); i++) {
            sb.append(komen.get(i).show());
        }
        sb.append("<br></div>");
        return sb.toString();
    }
    
    public boolean containKomen(String cKomen) {
        boolean isContain=false;
        for (int i = 0; i < komen.size(); i++) {
            if(komen.get(i).komentar.contains(cKomen)) {
                isContain=true;
                break;
            }
            String[] a = new String[1];
        }
        return isContain;
    }
}
