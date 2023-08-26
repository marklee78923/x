# move to test-environment folder 
cd test-environment
# create folders
mkdir -p docs models data/input data/output src/notebooks src/scripts temp
# remove files contains words of old or DELETE
rm -rf *old*
rm -rf *DELETE*
# find out and count total numbers of files in the folders
# Here I just only count the total files number without the temp-numfiles.txt itself
find . -type f ! -name 'temp-numfiles.txt' | wc -l > temp-numfiles.txt
# move files into correct folders
find . -maxdepth 1 -type f -name "*temp*" -exec mv {} temp/ \;
# Move csv files containing 'in' to data/input
mv *in*.csv data/input/
# Move csv files containing 'out' to data/output
mv *out*.csv data/output/
mv *.onyx models/
mv *.md docs/
mv *.ipynb src/notebooks/
mv *.py src/scripts/
# list all the files under test-environment (only the basename of the file without any directories in it)
find . -type f | xargs -I {} basename {}
# get the history of bash commands
history > bash-history.txt

# Below should be run only when you clean up the bash-history.txt

#mv bash-history.txt 'bash setup_commands.bash' 
git add .
git commit -m "half-submission"
git push