int[] loadInts(String bestandsNaam) {
  String[] StringArray = loadStrings(bestandsNaam);
  int[] intArray   = new int[StringArray.length];
  
  for (int i = 0; i < StringArray.length; i++) {
    intArray[i] = int(StringArray[i]);
  }
    
  return intArray;
}
