/**
 * BanqueWS.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package service;

public interface BanqueWS extends java.rmi.Remote {
    public double conversionEuroToDA(double montant) throws java.rmi.RemoteException;
    public service.Compte getCompte(long code) throws java.rmi.RemoteException;
    public service.Compte[] getCompts() throws java.rmi.RemoteException;
}
