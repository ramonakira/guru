export function search(nameKey, myArray){
  for (var i=0; i < myArray.length; i++) {
      if (myArray[i] && myArray[i].url === nameKey) {
        return myArray[i];
      }
  }
}