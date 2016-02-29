//import libraries
import processing.sound.*;

import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;

import java.util.*;
 
// the text to speech class
import java.io.IOException;


//GLOBAL VARIABLES//

//twitter variables
Twitter twitter;
List<Status> flintTweet1;
List<Status> flintTweet2;
List<Status> flintTweet3;
List<Status> flintTweet4;
List<Status> flintTweet5;
List<Status> flintTweet6;
List<Status> flintTweet7;
List<Status> flintTweet8;
List<Status> flintTweet9;
List<Status> flintTweet10;
List<Status> flintTweet11;
List<Status> flintTweet12;
List<Status> flintJournalTweet;

//strings to hold the tweets
String searchString;
String tweetString1;
String tweetString2;
String tweetString3;
String tweetString4;
String tweetString5;
String tweetString6;
String tweetString7;
String tweetString8;
String tweetString9;
String tweetString10;
String tweetString11;
String tweetString12;
String flintJournalString;

//what speech to text will say
String script;
int voiceIndex;
int voiceSpeed;

//profile images
PImage profile1;
PImage profile2;
PImage profile3;
PImage profile4;
PImage profile5;
PImage profile6;
PImage profile7;
PImage profile8;
PImage profile9;
PImage profile10;
PImage profile11;
PImage profile12;
PImage flintJournalProfile;

//users
User user1;
User user2;
User user3;
User user4;
User user5;
User user6;
User user7;
User user8;
User user9;
User user10;
User user11;
User user12;
User flintJournal;

//Strings to hold the link URL for profile images
String url1;
String url2;
String url3;
String url4;
String url5;
String url6;
String url7;
String url8;
String url9;
String url10;
String url11;
String url12;
String flintJournalURL;

//Array for the templates

String[] templates = { };
String[] nouns = { };
String[] adjectives = { };
String[] prepositions = { };
String[] emotions = { };
String[] verbs = { };
String[] properNouns = { };
String[] pronouns = { };

//PShapes for the AI shape 

PShape num1;
PShape num2;
PShape num3;
PShape num4;
PShape num5;
PShape num6;
PShape num7;
PShape num8;
PShape num9;
PShape num10;
PShape num11;
PShape num12;


AISection grid1;
AISection grid2;
AISection grid3;
AISection grid4;
AISection grid5;
AISection grid6;
AISection grid7;
AISection grid8;
AISection grid9;
AISection grid10;
AISection grid11;
AISection grid12;

//variables for laying down the svg files
int startX;
int startY;
int svgWidth;
int svgHeight;

//colors for filling in the sections
color color1;
color color2;
color color3;
color color4;
color color5;
color color6;
color color7;
color color8;
color color9;
color color10;
color color11;
color color12;

//selector string 
String chosenTemplate;

//---Twitter connection methods.----
//Albith's setupTwitterConnection Code
void setupTwitterConnection()
{
    
    ConfigurationBuilder cb = new ConfigurationBuilder();
    
    //Include your codes inside these 4 functions.
    cb.setOAuthConsumerKey("M7i7SULtoGUicfHcLyYqoweFW");     
    cb.setOAuthConsumerSecret("hVIRy2fcuM18LVKwDfugAMgtvrg2aXrfHE4ao3AHN5tiVVK6gd");
    cb.setOAuthAccessToken("112547011-fbWQaIYzgGlNpoNjlXk8e7tQVMsk4VXTglOGtqXz");
    cb.setOAuthAccessTokenSecret("b4aMZsgNbzooMRG7o7FberRg5ML1ZVSwr78UiR4wQzzPJ");

    TwitterFactory tf = new TwitterFactory(cb.build());
    //TwitterStreamFactory tsf = new TwitterStreamFactory(cb.build());
    twitter = tf.getInstance();
    //twitterStream = tsf.getInstance();

    println("setupTwitterConnection(): Done setting up.");
}

//Albith's getTweets Function
List<Status> getTweets(String mySearch)
{ 
    List<Status> resultTweets= new ArrayList<Status>(); 
    try 
    {
        Query query = new Query(mySearch);
        QueryResult result = twitter.search(query);
               
        resultTweets= result.getTweets();
    }    
    catch (TwitterException te) 
    {
        System.out.println("Failed to search tweets: " + te.getMessage());
        System.exit(-1);
    }    
    return resultTweets;
}

void setup(){
    //twitter stuff
    setupTwitterConnection();
    
    //need to get the first 12 tweets, and store them in the variables
    //are they already being stored in an array and we can just index the array?
    //not sure how this works exactly
    flintTweet1 = getTweets("#flint");
    flintTweet2 = getTweets("#flint");
    flintTweet3 = getTweets("#flint");
    flintTweet4 = getTweets("#flint");
    flintTweet5 = getTweets("#flint");
    flintTweet6 = getTweets("#flint");
    flintTweet7 = getTweets("#flint");
    flintTweet8 = getTweets("#flint");
    flintTweet9 = getTweets("#flint");
    flintTweet10 = getTweets("#flint");
    flintTweet11 = getTweets("#flint");
    flintTweet12 = getTweets("#flint");
    flintJournalTweet = getTweets("from:@flintjournal");
    
    url1 = returnImage(flintTweet1, tweetString1, "User 1");
    url2 = returnImage(flintTweet2, tweetString2, "User 2");
    url3 = returnImage(flintTweet3, tweetString3, "User 3");
    url4 = returnImage(flintTweet4, tweetString4, "User 4");
    url5 = returnImage(flintTweet5, tweetString5, "User 5");
    url6 = returnImage(flintTweet6, tweetString6, "User 6");
    url7 = returnImage(flintTweet7, tweetString7, "User 7");
    url8 = returnImage(flintTweet8, tweetString8, "User 8");
    url9 = returnImage(flintTweet9, tweetString9, "User 9");
    url10 = returnImage(flintTweet10, tweetString10, "User 10");
    url11 = returnImage(flintTweet11, tweetString11, "User 11");
    url12 = returnImage(flintTweet12, tweetString12, "User 12");
    flintJournalURL = returnImage(flintJournalTweet, flintJournalString, "Flint Journal");
    
    profile1 = loadImage(url1);
    profile2 = loadImage(url2);
    profile3 = loadImage(url3);
    profile4 = loadImage(url4);
    profile5 = loadImage(url5);
    profile6 = loadImage(url6);
    profile7 = loadImage(url7);
    profile8 = loadImage(url8);
    profile9 = loadImage(url9);
    profile10 = loadImage(url10);
    profile11 = loadImage(url11);
    profile12 = loadImage(url12);
    flintJournalProfile = loadImage(flintJournalURL);
    
   
    
   
    nouns = new String[] {"river", "water", "people", "child", "children", "idea", "pain", "anguish", "hurt", "thirst", "illness", "lead", "pollution", "poverty", "distrust", "wrongs", "failure", "race", "wealth"};
    adjectives = new String[] {"disdainful", "heartless", "unkind", "rude", "careless", "thoughtless", "beautiful", "depressed"};
    prepositions = new String[] {"before", "after", "over", "under", "around", "beside"};
    emotions = new String[]  {"anger", "hurt", "sadness", "happiness", "relief", "bewilderment", "disbelief"};
    verbs = new String[]  {"fought", "shouted", "hated", "rioted", "revolted", "spoke", "cried", "sang"};
    properNouns = new String[]  {"Mary", "Susan", "Kate", "Michael", "Janet", "Robert", "Stan"};
    pronouns = new String[]  {"he", "she", "they", "him", "her", "our", "their", "its", "them"};
    
    
        //templates
    String template1 = "In the 21st Century, things like" + " " + getRandom(nouns) + " " + "and" + " " + getRandom(nouns) + " " + "were still commonplace in Flint.";
    String template2 = "Members of society who were" + " " + getRandom(adjectives) + " or " + getRandom(adjectives) + "were often treated with" + " " + getRandom(nouns) + " and " + getRandom(nouns) + ".";
    String template3 = "Those who did not possess" + " " + getRandom(nouns) + " and " + getRandom(nouns) + "were more likely to be" + " " + getRandom(adjectives) +  getRandom(adjectives) + ".";
    String template4 = "Things began to change when citizens and activists brought to life the state of " + getRandom(nouns) + "in Flint.";
    String template5 = "I remember the " + getRandom(properNouns) + "of Flint" + " " + getRandom(verbs) + " " + getRandom(prepositions) + "the eastern seaboard fell."; 
    String template6 = "The people were " + getRandom(emotions) + " and " + getRandom(verbs) + " about " + getRandom(nouns) + ".";
    String template7 = "Did you know " + getRandom(properNouns) + "?" + "They are no longer with us. They fell to " + getRandom(nouns);
    String template8 = "Mobs of " + getRandom(nouns) + " were lost in a fit of " + getRandom(emotions) + ".";
    String template9 = "When we saw " + getRandom(nouns) + " we " + getRandom(verbs) + " for the people.";
    
    
        templates = new String[] {
      template1, template2, template3, template4, template5, template6, template7, template8, template9};
    startX = 100;
    startY = 100;
    svgWidth = 1000;
    svgHeight = 750;
    size(1100,800);
    background(#F5F5F5);
    
    
    fill(#000000);
    textSize(16);
    
    script = getRandom(templates);
    
    text(script, 100,100,500,100);
    
    //load the shapes for the svg files
    
    //num1 = loadShape("filename.svg");
    
    //QUESTION: Is there a way to force an image to 
    //conform to a different size and shape than it originally was in?
    //this could be really helpful and we can set the image inside each svg file to be
    //a blank variable and reset this variable with the profile picture each time
    
}

void draw(){
  
  //draw the AI shape
  
  //grid1 = new AISection(num1, image, leftX, leftY, rightX, rightY);
  //grid1.makeSection();
  
  //need to call the templates here somehow. Maybe since we are changing up what they are based 
  //on what is in those arrays, that stuff will need to be called here.
  
}

      //generates a random quote from a given array
String getRandom(String [] stringArray) {
  String newLine = (stringArray[new Random().nextInt(stringArray.length)]);
  return newLine;
}

//generates the profile image
String returnImage(List<Status> tweetList, String tweetList1, String character){
    if(tweetList.size() > 0) {
    println(character);
    tweetList1 = tweetList.get(0).getText();
    User handle = tweetList.get(0).getUser();
    String imgURL = handle.getProfileImageURL();
    println("URL" + " " + imgURL);
    return imgURL;
    
    }
    else{
      tweetList1 = flintJournalTweet.get(0).getText();
      println("No Tweets Here");
      User handle = flintJournalTweet.get(0).getUser();
      String imgURL = handle.getProfileImageURL();
      println("URL" + " " + imgURL);
      return imgURL;
    }
}

//class for each section of the helmet. 
//includes color and coordinates (so that the bounds of the button/clickspace can be set)

class AISection{
  //define class
  PShape section;
  color sectionColor;
  int leftX;
  int topY;
  int rightX;
  int bottomY;
  
  //how to create an instance of the class
  AISection(PShape sec, color col, int lx, int rx, int ty, int by){
  section = sec;
  sectionColor = col;
  leftX = lx;
  topY = ty;
  rightX = rx;
  bottomY = by;  
  }
  
  //draw the section
  void makeSection(){
  section.disableStyle();
  stroke(#0C0C0D);
  fill(sectionColor);
  shape(section,startX,startY,svgWidth,svgHeight);
  }

  int leftX() {
    return leftX;
  }
  
  int rightX() {
    return rightX;
  }
  
  int topY() {
    return topY;
  }
  
  int bottomY() {
    return bottomY;
  }
  
  color sectionColor() {
    return sectionColor;
  }
}

//CODE BELOW HERE MAY NOT WORK: Code from:
// Processing Text to Speech
// Eric Mika, Winter 2010
// Tested on Max OS 10.6 only, possibly compatible with 10.5 (with modification)
// Adapted from code by Denis Meyer (CallToPower)
 
static class TextToSpeech extends Object {
 
  // Store the voices, makes for nice auto-complete in Eclipse
 
  // male voices
  static final String ALEX = "Alex";
  static final String BRUCE = "Bruce";
  static final String FRED = "Fred";
  static final String JUNIOR = "Junior";
  static final String RALPH = "Ralph";
 
  // female voices
  static final String AGNES = "Agnes";
  static final String KATHY = "Kathy";
  static final String PRINCESS = "Princess";
  static final String VICKI = "Vicki";
  static final String VICTORIA = "Victoria";
 
  // novelty voices
  static final String ALBERT = "Albert";
  static final String BAD_NEWS = "Bad News";
  static final String BAHH = "Bahh";
  static final String BELLS = "Bells";
  static final String BOING = "Boing";
  static final String BUBBLES = "Bubbles";
  static final String CELLOS = "Cellos";
  static final String DERANGED = "Deranged";
  static final String GOOD_NEWS = "Good News";
  static final String HYSTERICAL = "Hysterical";
  static final String PIPE_ORGAN = "Pipe Organ";
  static final String TRINOIDS = "Trinoids";
  static final String WHISPER = "Whisper";
  static final String ZARVOX = "Zarvox";
 
  // throw them in an array so we can iterate over them / pick at random
  static String[] voices = {
    ALEX, BRUCE, FRED, JUNIOR, RALPH, AGNES, KATHY,
    PRINCESS, VICKI, VICTORIA, ALBERT, BAD_NEWS, BAHH,
    BELLS, BOING, BUBBLES, CELLOS, DERANGED, GOOD_NEWS,
    HYSTERICAL, PIPE_ORGAN, TRINOIDS, WHISPER, ZARVOX
  };
 
  // this sends the "say" command to the terminal with the appropriate args
  static void say(String script, String voice, int speed) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }
 
  // Overload the say method so we can call it with fewer arguments and basic defaults
  static void say(String script) {
    // 200 seems like a resonable default speed
    say(script, ALEX, 200);
  }
 
}
void mousePressed() {
  // say something
  voiceSpeed = 200;
  voiceIndex = 15;
   TextToSpeech.say(script, TextToSpeech.voices[voiceIndex], voiceSpeed);
}
    