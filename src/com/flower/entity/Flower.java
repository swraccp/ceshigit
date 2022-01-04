package com.flower.entity;


public class Flower {

  private long id;
  private String name;
  private String anothername;
  private String property;
  private double price;
  private String production;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getAnothername() {
    return anothername;
  }

  public void setAnothername(String anothername) {
    this.anothername = anothername;
  }


  public String getProperty() {
    return property;
  }

  public void setProperty(String property) {
    this.property = property;
  }


  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }


  public String getProduction(String production) {
    return this.production;
  }

  public void setProduction(String production) {
    this.production = production;
  }

}
