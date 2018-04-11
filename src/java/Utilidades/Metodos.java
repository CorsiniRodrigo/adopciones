/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author usuario
 */
public class Metodos {

    public static String convertirSNMF(String letra) {

        switch (letra) {
            case "s":
                return "Si";
            case "S":
                return "Si";
            case "N":
                return "No";

            case "n":
                return "No";
            case "m":
                return "Macho";

            case "f":
                return "Hembra";
            case "M":
                return "Macho";

            case "F":
                return "Hembra";

        }

        return "Error";
    }

    public static String convertiNullStringVacio(String cadena) {

        if (cadena == null) {
            cadena = "";
        }

        return cadena;

    }

    /**
     * Método que valida si un string contiene un dato de tipo int válido
     *
     * @param s String a validar si contiene un dato de tipo int válido
     * @return true si el string contiene un dato de tipo int válido o false en
     * caso contrario
     */
    public static boolean esEntero(String s) {
        try {
            Integer.parseInt(s);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

}
