module HomepageHelper
  def most_popular_drinks
    Drink.all.sort_by{|drink| drink.users.count}.reverse[0..10]
  end
end
