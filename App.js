import * as nlp from 'nlp.js';
import AsyncStorage from '@react-native-community/async-storage';
import Logger from 'react-native-logger';

// Configure logger
Logger.config({
  level: 'info', // Adjust log level as needed
  formatter: (log) => `${log.level} - ${log.message}`,
});

// Initialize NLP instance
const myNlp = nlp.build();




const loadFoodData = async () => {
  try {
    const data = await AsyncStorage.getItem('foodData');
    if (data) {
      myNlp.addDocument(data);
      Logger.info('Food data loaded from storage');
    } else {
      // Load data from your file here (e.g., require('./foods.txt'))
      // Parse the file and assign the content to the `data` variable
      myNlp.addDocument(data);
      Logger.info('Food data loaded from file');
      await AsyncStorage.setItem('foodData', data);
    }
  } catch (error) {
    Logger.error('Error loading food data:', error);
  }
};

loadFoodData();



const analyzeFoodText = async (text) => {
  try {
    await myNlp.process(text);

    const entities = myNlp.find('food');
    if (entities.length === 0) {
      Logger.info('No food entities found in text');
      return 'No food information found.';
    }

    const calories = entities[0].details.calories;
    if (calories !== undefined) {
      Logger.info(`Found calorie information for ${entities[0].text}`);
      return `This food contains approximately ${calories} calories.`;
    } else {
      Logger.info('No calorie information found for food entity');
      return 'Calorie information for this food is unavailable.';
    }
  } catch (error) {
    Logger.error('Error analyzing food text:', error);
    return 'There was an error analyzing the food information.';
  }
};



const analyzeFood = async (text) => {
  const result = await analyzeFoodText(text);
  console.log(result); // This will be displayed to the user
};

// Example usage
const userText = 'What are the calories in a banana?';
analyzeFood(userText);
export default App;