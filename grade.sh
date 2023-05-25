rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -e  ListExamples.java ]]; 
then
        echo "file exists"
else
        echo "check file path!!!"
        exit
fi

cd ..

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

cd grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestlistExamples Server GradeServer

