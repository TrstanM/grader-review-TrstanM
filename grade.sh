CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

# incomplete grader -AV
cp ./student-submission/ListExamples.java ./GradeServer.java ./Server.java ./TestListExamples.java ./grading-area/
if [[ $0 -ne 0 ]]
then
    echo "There was an error compiling, please check compile-error.txt in student-submission directory"
else
    echo "Test was able to compile successfully"
fi

cd ./grading-area
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java 
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
