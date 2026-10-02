package com.littlestar.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Food implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private String imageUrl;
    private String category;
    private boolean available;

    public Food() {}

    public Food(int id, String name, String description, BigDecimal price, String imageUrl, String category, boolean available) {
        this.id = id; this.name = name; this.description = description; this.price = price;
        this.imageUrl = imageUrl; this.category = category; this.available = available;
    }

    public int getId(){return id;} public void setId(int id){this.id=id;}
    public String getName(){return name;} public void setName(String v){name=v;}
    public String getDescription(){return description;} public void setDescription(String v){description=v;}
    public BigDecimal getPrice(){return price;} public void setPrice(BigDecimal v){price=v;}
    public String getImageUrl(){return imageUrl;} public void setImageUrl(String v){imageUrl=v;}
    public String getCategory(){return category;} public void setCategory(String v){category=v;}
    public boolean isAvailable(){return available;} public void setAvailable(boolean v){available=v;}
}
