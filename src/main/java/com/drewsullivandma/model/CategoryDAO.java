package com.drewsullivandma.model;

import java.util.List;

public interface CategoryDAO {

	public List<Category> getAllCategories();
	public String getCategoryNameByCategoryId(int categoryId);
}
