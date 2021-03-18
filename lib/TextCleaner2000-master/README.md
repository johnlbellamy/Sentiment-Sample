# TextCleaner2000
A light-weight stop-word/custom stop-word removal tool, text cleaner and streaming tokenizer/cleaner.

# System-wide install
1) Download or clone File
2) Unzip file.
3) Change to TextCleaner2000
4) Install from setup.py:
```python
python setup.py install
```
WORKING ON PIP INSTALLER
  
# Add to imports:
```python
from  text_cleaner_2000.text_cleaner import TextCleaner
```
# Usage
Instantiate Cleaner Object:
```python
cleaner = TextCleaner()
```
# For Help and detailed usage:
```python
help(cleaner)
```
# To remove numbers and punctuation/symbols:
text is pd.DataFrame['Column'] or list (array-like) object.

```python
text_without_numbers_or_symbols = cleaner.alpha_iterator(text)
```
## By default, alpha_iterator removes numbers as well. To change this and keep numbers:
```python
text_with_numbers = cleaner.alpha_iterator(text, remove_numeric=False)
```
## By default, alpha_iterator removes all punctuation, obviously including emoticons. To keep emoticons for sentiment analysis to change the remove_emoticon flag to False:
```python
text_with_emoticons = cleaner.alpha_iterator(text, remove_emoticon=False)
```
## You can remove emoticons and numbers, keep both, or keep one and not the other by passing both flags:
```python
text_with_emoticons_and_numbers = cleaner.alpha_iterator(text, 
                                                         remove_numeric=False, 
                                                         remove_emoticon=False)
```
# To remove common stop words like "and","or", "the", etc.:
```python
text_with_common_stops_removed = cleaner.stop_word_iterator(text)
```
# Perhaps the best feature is the ability to pass a list to remove custom stop words.
```python
custom_stop_words = ["custom_stopword1", "custom_stopword2", "custom_stopwordn"]

text_with_custom_stops_removed = cleaner.custom_stop_word_iterator(text, custom_stop_words)
```
