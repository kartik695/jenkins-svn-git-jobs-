# use LOCAL_PATH as local working work copy of your svn
# use REPO_PATH as repository path of your svn in my case i have set up in docker


get_latest_revision() { 
    svn info "$REPO_URL" --username "$USERNAME" --password "$PASSWORD" | grep 'Revision:' | awk '{print $2}' 
}

get_update(){
    svn update "$LOCAL_PATH" --username "$USERNAME" --password "$PASSWORD"
}

get_merge(){
    svn merge -c "$latest_revision" "$REPO_URL/Branch" "$LOCAL_PATH" --username "$USERNAME" --password "$PASSWORD"
}

if [ ! -d "$LOCAL_PATH" ]; then 
    svn checkout "$REPO_URL/trunk" "$LOCAL_PATH" --username "$USERNAME" --password "$PASSWORD" 
else 
    svn cleanup "$LOCAL_PATH"
    get_update
    latest_revision=$(get_latest_revision) 

    if [ -n "$latest_revision" ]; then

        path="/backups/hotfix1/$date"
       
        get_merge

      
        if [ $? -eq 0 ]; then
            backup=$(cp -r "$LOCAL_PATH" "$path")
        else
            echo "Merge failed"
        fi
    else 
        echo "Failed to get the latest revision number from the repository." 
        exit 1 
    fi 
fi 


svn commit -m "Commit" "$LOCAL_PATH" --username "$USERNAME" --password "$PASSWORD"















