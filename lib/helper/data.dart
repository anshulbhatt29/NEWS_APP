import'package:news_app/models/category_model.dart';
List<CategoryModel> getCategories()
{
  List<CategoryModel> category=new List<CategoryModel>();
  CategoryModel categoryModel=new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageurl="https://images.unsplash.com/photo-1593642634367-d91a135587b5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80";
   //image url. 
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageurl="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=667&q=80";
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageurl="https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8dGVjaG5vbG9neXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageurl="https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=749&q=80";
  category.add(categoryModel);


  return category;



}