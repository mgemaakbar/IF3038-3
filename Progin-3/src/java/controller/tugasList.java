/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import helper.MyDatabase;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.mKomentar;
import model.mTugas;

/**
 *
 * @author Toshiba L645
 */
public class tugasList {
    public static ArrayList<mTugas> aTugas = new ArrayList<mTugas>();
    
    public static void fill(String selectQuery) {
        aTugas = new ArrayList<mTugas>();
        ResultSet tSet = MyDatabase.getSingleton().selectDB(selectQuery);
        try {
            while(tSet.next()) {
                    aTugas.add(new mTugas(
                            tSet.getString(1), 
                            tSet.getString(2), 
                            tSet.getString(3), 
                            tSet.getString(4), 
                            tSet.getString(5),
                            tSet.getString(6)));
            }
            for (int i = 0; i < aTugas.size(); i++) {
                tSet = MyDatabase.getSingleton().selectDB("SELECT * FROM tag_tugas1 WHERE ID_tugas='"+aTugas.get(i).ID_tugas+"';");
                if(tSet.next()) aTugas.get(i).tags=tSet.getString("tag");
                while(tSet.next()) {
                    aTugas.get(i).tags+=","+tSet.getString("tag");
                }
            }
            for (int i = 0; i < aTugas.size(); i++) {
                tSet = MyDatabase.getSingleton().selectDB("SELECT * FROM komentar_tugas1 WHERE ID_tugas='"+aTugas.get(i).ID_tugas+"';");
                while(tSet.next()) {
                    aTugas.get(i).komen.add(new mKomentar(
                            tSet.getString("username"), 
                            tSet.getString("komentar"), 
                            tSet.getString("waktu_komentar")));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(tugasList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
