Class Sample.MyClass Extends %Persistent
{

Property Prop1 As %String;

Property Prop2 As %Numeric;

ClassMethod Test()
{
    set obj = ..%New()
    set obj.Prop1 = "Foo!"
    set obj.Prop2 = 1234
    write obj.%Save()
}

Storage Default
{
<Data name="MyClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Prop1</Value>
</Value>
<Value name="3">
<Value>Prop2</Value>
</Value>
</Data>
<DataLocation>^Sample.MyClassD</DataLocation>
<DefaultData>MyClassDefaultData</DefaultData>
<IdLocation>^Sample.MyClassD</IdLocation>
<IndexLocation>^Sample.MyClassI</IndexLocation>
<StreamLocation>^Sample.MyClassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
