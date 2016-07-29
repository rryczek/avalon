BrowseEverythingController.before_filter do
  if params[:context]
    collection = AdminCollection.find(params[:context])
    browser.providers['file_system'].config[:home] = collection.dropbox_absolute_path
  end
end
