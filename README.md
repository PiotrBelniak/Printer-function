# Printer function
## Usage
This function serves the purpose of 'printing' any data type, e.g. timestamp, object, collection of scalars, collection of collection of objects.  

## Additional requirements
For this function to correctly work, two packages called PRINTANYTHING_PKG and CONVERT_TO_TEXT_PKG needs to be compiled in the same schema as our function.

## How to use function
We call the function by specifying variable, constant or column name converted to anydata type, e.g.
```bash
call print_anything(AnyData.ConvertBdouble(data of binary double type));
select print_anything(AnyData.ConvertObject(object column)) from table_clause
```

## Result
The function returns text with our data in format: format: data.  
This can be easily customized by manipulating our additional packages.

## Example of usage
![obraz](https://github.com/PiotrBelniak/Printer-function/assets/169681378/5c5a5590-3087-41e6-aa7d-9120518d0fe6)

## Restrictions
Only schema-level or package-level types are allowed.  
Object types must have print function specified for the function to give correct result.
