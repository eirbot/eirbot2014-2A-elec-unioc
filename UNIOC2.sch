<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="9" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="atmel">
<description>&lt;b&gt;AVR Devices&lt;/b&gt;&lt;p&gt;
Configurable logic, microcontrollers, nonvolatile memories&lt;p&gt;
Based on the following sources:&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;www.atmel.com
&lt;li&gt;CD-ROM : Configurable Logic Microcontroller Nonvolatile Memory
&lt;li&gt;CadSoft download site, www.cadsoft.de or www.cadsoftusa.com , file at90smcu_v400.zip
&lt;li&gt;avr.lbr
&lt;/ul&gt;
&lt;author&gt;Revised by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TQFP100">
<description>&lt;b&gt;100-lead Thin Quad Flat Pack Package&lt;/b&gt;</description>
<wire x1="-7" y1="6.25" x2="-6.25" y2="7" width="0.254" layer="21"/>
<wire x1="-6.25" y1="7" x2="6.75" y2="7" width="0.254" layer="21"/>
<wire x1="6.75" y1="7" x2="7" y2="6.75" width="0.254" layer="21"/>
<wire x1="7" y1="6.75" x2="7" y2="-6.75" width="0.254" layer="21"/>
<wire x1="7" y1="-6.75" x2="6.75" y2="-7" width="0.254" layer="21"/>
<wire x1="6.75" y1="-7" x2="-6.75" y2="-7" width="0.254" layer="21"/>
<wire x1="-6.75" y1="-7" x2="-7" y2="-6.75" width="0.254" layer="21"/>
<wire x1="-7" y1="-6.75" x2="-7" y2="6.25" width="0.254" layer="21"/>
<wire x1="-0.0099" y1="1.3299" x2="0.39" y2="0.9299" width="0.1016" layer="51" curve="-89.985678"/>
<circle x="-6" y="6" radius="0.2499" width="0.254" layer="21"/>
<circle x="3.59" y="-0.7699" radius="0.4999" width="0.1016" layer="51"/>
<smd name="1" x="-8" y="6" dx="1.5" dy="0.35" layer="1"/>
<smd name="2" x="-8" y="5.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="3" x="-8" y="5" dx="1.5" dy="0.35" layer="1"/>
<smd name="4" x="-8" y="4.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="5" x="-8" y="4" dx="1.5" dy="0.35" layer="1"/>
<smd name="6" x="-8" y="3.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="7" x="-8" y="3" dx="1.5" dy="0.35" layer="1"/>
<smd name="8" x="-8" y="2.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="9" x="-8" y="2" dx="1.5" dy="0.35" layer="1"/>
<smd name="10" x="-8" y="1.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="11" x="-8" y="1" dx="1.5" dy="0.35" layer="1"/>
<smd name="12" x="-8" y="0.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="13" x="-8" y="0" dx="1.5" dy="0.35" layer="1"/>
<smd name="14" x="-8" y="-0.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="15" x="-8" y="-1" dx="1.5" dy="0.35" layer="1"/>
<smd name="16" x="-8" y="-1.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="17" x="-8" y="-2" dx="1.5" dy="0.35" layer="1"/>
<smd name="18" x="-8" y="-2.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="19" x="-8" y="-3" dx="1.5" dy="0.35" layer="1"/>
<smd name="20" x="-8" y="-3.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="21" x="-8" y="-4" dx="1.5" dy="0.35" layer="1"/>
<smd name="22" x="-8" y="-4.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="23" x="-8" y="-5" dx="1.5" dy="0.35" layer="1"/>
<smd name="24" x="-8" y="-5.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="25" x="-8" y="-6" dx="1.5" dy="0.35" layer="1"/>
<smd name="26" x="-6" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="27" x="-5.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="28" x="-5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="29" x="-4.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="30" x="-4" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="31" x="-3.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="32" x="-3" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="33" x="-2.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="34" x="-2" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="35" x="-1.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="36" x="-1" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="37" x="-0.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="38" x="0" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="39" x="0.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="40" x="1" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="41" x="1.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="42" x="2" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="43" x="2.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="44" x="3" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="45" x="3.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="46" x="4" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="47" x="4.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="48" x="5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="49" x="5.5" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="50" x="6" y="-8" dx="0.35" dy="1.5" layer="1"/>
<smd name="51" x="8" y="-6" dx="1.5" dy="0.35" layer="1"/>
<smd name="52" x="8" y="-5.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="53" x="8" y="-5" dx="1.5" dy="0.35" layer="1"/>
<smd name="54" x="8" y="-4.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="55" x="8" y="-4" dx="1.5" dy="0.35" layer="1"/>
<smd name="56" x="8" y="-3.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="57" x="8" y="-3" dx="1.5" dy="0.35" layer="1"/>
<smd name="58" x="8" y="-2.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="59" x="8" y="-2" dx="1.5" dy="0.35" layer="1"/>
<smd name="60" x="8" y="-1.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="61" x="8" y="-1" dx="1.5" dy="0.35" layer="1"/>
<smd name="62" x="8" y="-0.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="63" x="8" y="0" dx="1.5" dy="0.35" layer="1"/>
<smd name="64" x="8" y="0.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="65" x="8" y="1" dx="1.5" dy="0.35" layer="1"/>
<smd name="66" x="8" y="1.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="67" x="8" y="2" dx="1.5" dy="0.35" layer="1"/>
<smd name="68" x="8" y="2.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="69" x="8" y="3" dx="1.5" dy="0.35" layer="1"/>
<smd name="70" x="8" y="3.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="71" x="8" y="4" dx="1.5" dy="0.35" layer="1"/>
<smd name="72" x="8" y="4.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="73" x="8" y="5" dx="1.5" dy="0.35" layer="1"/>
<smd name="74" x="8" y="5.5" dx="1.5" dy="0.35" layer="1"/>
<smd name="75" x="8" y="6" dx="1.5" dy="0.35" layer="1"/>
<smd name="76" x="6" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="77" x="5.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="78" x="5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="79" x="4.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="80" x="4" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="81" x="3.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="82" x="3" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="83" x="2.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="84" x="2" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="85" x="1.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="86" x="1" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="87" x="0.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="88" x="0" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="89" x="-0.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="90" x="-1" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="91" x="-1.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="92" x="-2" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="93" x="-2.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="94" x="-3" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="95" x="-3.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="96" x="-4" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="97" x="-4.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="98" x="-5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="99" x="-5.5" y="8" dx="0.35" dy="1.5" layer="1"/>
<smd name="100" x="-6" y="8" dx="0.35" dy="1.5" layer="1"/>
<text x="-6" y="9.25" size="1.27" layer="25">&gt;NAME</text>
<text x="-6" y="3" size="1.27" layer="27">&gt;VALUE</text>
<text x="-2.75" y="-2.5" size="0.8128" layer="51">TQFP 100</text>
<text x="3.3899" y="-1.0701" size="0.6096" layer="51" ratio="15">R</text>
<rectangle x1="-8.1999" y1="5.8499" x2="-7.1501" y2="6.1501" layer="51"/>
<rectangle x1="-8.1999" y1="5.35" x2="-7.1501" y2="5.65" layer="51"/>
<rectangle x1="-8.1999" y1="4.8499" x2="-7.1501" y2="5.1501" layer="51"/>
<rectangle x1="-8.1999" y1="4.35" x2="-7.1501" y2="4.65" layer="51"/>
<rectangle x1="-8.1999" y1="3.8499" x2="-7.1501" y2="4.1501" layer="51"/>
<rectangle x1="-8.1999" y1="3.35" x2="-7.1501" y2="3.65" layer="51"/>
<rectangle x1="-8.1999" y1="2.8499" x2="-7.1501" y2="3.1501" layer="51"/>
<rectangle x1="-8.1999" y1="2.35" x2="-7.1501" y2="2.65" layer="51"/>
<rectangle x1="-8.1999" y1="1.8499" x2="-7.1501" y2="2.1501" layer="51"/>
<rectangle x1="-8.1999" y1="1.35" x2="-7.1501" y2="1.65" layer="51"/>
<rectangle x1="-8.1999" y1="0.8499" x2="-7.1501" y2="1.1501" layer="51"/>
<rectangle x1="-8.1999" y1="0.35" x2="-7.1501" y2="0.65" layer="51"/>
<rectangle x1="-8.1999" y1="-0.1501" x2="-7.1501" y2="0.1501" layer="51"/>
<rectangle x1="-8.1999" y1="-0.65" x2="-7.1501" y2="-0.35" layer="51"/>
<rectangle x1="-8.1999" y1="-1.1501" x2="-7.1501" y2="-0.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-1.65" x2="-7.1501" y2="-1.35" layer="51"/>
<rectangle x1="-8.1999" y1="-2.1501" x2="-7.1501" y2="-1.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-2.65" x2="-7.1501" y2="-2.35" layer="51"/>
<rectangle x1="-8.1999" y1="-3.1501" x2="-7.1501" y2="-2.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-3.65" x2="-7.1501" y2="-3.35" layer="51"/>
<rectangle x1="-8.1999" y1="-4.1501" x2="-7.1501" y2="-3.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-4.65" x2="-7.1501" y2="-4.35" layer="51"/>
<rectangle x1="-8.1999" y1="-5.1501" x2="-7.1501" y2="-4.8499" layer="51"/>
<rectangle x1="-8.1999" y1="-5.65" x2="-7.1501" y2="-5.35" layer="51"/>
<rectangle x1="-8.1999" y1="-6.1501" x2="-7.1501" y2="-5.8499" layer="51"/>
<rectangle x1="-6.1501" y1="-8.1999" x2="-5.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-5.65" y1="-8.1999" x2="-5.35" y2="-7.1501" layer="51"/>
<rectangle x1="-5.1501" y1="-8.1999" x2="-4.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-4.65" y1="-8.1999" x2="-4.35" y2="-7.1501" layer="51"/>
<rectangle x1="-4.1501" y1="-8.1999" x2="-3.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-3.65" y1="-8.1999" x2="-3.35" y2="-7.1501" layer="51"/>
<rectangle x1="-3.1501" y1="-8.1999" x2="-2.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-2.65" y1="-8.1999" x2="-2.35" y2="-7.1501" layer="51"/>
<rectangle x1="-2.1501" y1="-8.1999" x2="-1.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-1.65" y1="-8.1999" x2="-1.35" y2="-7.1501" layer="51"/>
<rectangle x1="-1.1501" y1="-8.1999" x2="-0.8499" y2="-7.1501" layer="51"/>
<rectangle x1="-0.65" y1="-8.1999" x2="-0.35" y2="-7.1501" layer="51"/>
<rectangle x1="-0.1501" y1="-8.1999" x2="0.1501" y2="-7.1501" layer="51"/>
<rectangle x1="0.35" y1="-8.1999" x2="0.65" y2="-7.1501" layer="51"/>
<rectangle x1="0.8499" y1="-8.1999" x2="1.1501" y2="-7.1501" layer="51"/>
<rectangle x1="1.35" y1="-8.1999" x2="1.65" y2="-7.1501" layer="51"/>
<rectangle x1="1.8499" y1="-8.1999" x2="2.1501" y2="-7.1501" layer="51"/>
<rectangle x1="2.35" y1="-8.1999" x2="2.65" y2="-7.1501" layer="51"/>
<rectangle x1="2.8499" y1="-8.1999" x2="3.1501" y2="-7.1501" layer="51"/>
<rectangle x1="3.35" y1="-8.1999" x2="3.65" y2="-7.1501" layer="51"/>
<rectangle x1="3.8499" y1="-8.1999" x2="4.1501" y2="-7.1501" layer="51"/>
<rectangle x1="4.35" y1="-8.1999" x2="4.65" y2="-7.1501" layer="51"/>
<rectangle x1="4.8499" y1="-8.1999" x2="5.1501" y2="-7.1501" layer="51"/>
<rectangle x1="5.35" y1="-8.1999" x2="5.65" y2="-7.1501" layer="51"/>
<rectangle x1="5.8499" y1="-8.1999" x2="6.1501" y2="-7.1501" layer="51"/>
<rectangle x1="7.1501" y1="-6.1501" x2="8.1999" y2="-5.8499" layer="51"/>
<rectangle x1="7.1501" y1="-5.65" x2="8.1999" y2="-5.35" layer="51"/>
<rectangle x1="7.1501" y1="-5.1501" x2="8.1999" y2="-4.8499" layer="51"/>
<rectangle x1="7.1501" y1="-4.65" x2="8.1999" y2="-4.35" layer="51"/>
<rectangle x1="7.1501" y1="-4.1501" x2="8.1999" y2="-3.8499" layer="51"/>
<rectangle x1="7.1501" y1="-3.65" x2="8.1999" y2="-3.35" layer="51"/>
<rectangle x1="7.1501" y1="-3.1501" x2="8.1999" y2="-2.8499" layer="51"/>
<rectangle x1="7.1501" y1="-2.65" x2="8.1999" y2="-2.35" layer="51"/>
<rectangle x1="7.1501" y1="-2.1501" x2="8.1999" y2="-1.8499" layer="51"/>
<rectangle x1="7.1501" y1="-1.65" x2="8.1999" y2="-1.35" layer="51"/>
<rectangle x1="7.1501" y1="-1.1501" x2="8.1999" y2="-0.8499" layer="51"/>
<rectangle x1="7.1501" y1="-0.65" x2="8.1999" y2="-0.35" layer="51"/>
<rectangle x1="7.1501" y1="-0.1501" x2="8.1999" y2="0.1501" layer="51"/>
<rectangle x1="7.1501" y1="0.35" x2="8.1999" y2="0.65" layer="51"/>
<rectangle x1="7.1501" y1="0.8499" x2="8.1999" y2="1.1501" layer="51"/>
<rectangle x1="7.1501" y1="1.35" x2="8.1999" y2="1.65" layer="51"/>
<rectangle x1="7.1501" y1="1.8499" x2="8.1999" y2="2.1501" layer="51"/>
<rectangle x1="7.1501" y1="2.35" x2="8.1999" y2="2.65" layer="51"/>
<rectangle x1="7.1501" y1="2.8499" x2="8.1999" y2="3.1501" layer="51"/>
<rectangle x1="7.1501" y1="3.35" x2="8.1999" y2="3.65" layer="51"/>
<rectangle x1="7.1501" y1="3.8499" x2="8.1999" y2="4.1501" layer="51"/>
<rectangle x1="7.1501" y1="4.35" x2="8.1999" y2="4.65" layer="51"/>
<rectangle x1="7.1501" y1="4.8499" x2="8.1999" y2="5.1501" layer="51"/>
<rectangle x1="7.1501" y1="5.35" x2="8.1999" y2="5.65" layer="51"/>
<rectangle x1="7.1501" y1="5.8499" x2="8.1999" y2="6.1501" layer="51"/>
<rectangle x1="5.8499" y1="7.1501" x2="6.1501" y2="8.1999" layer="51"/>
<rectangle x1="5.35" y1="7.1501" x2="5.65" y2="8.1999" layer="51"/>
<rectangle x1="4.8499" y1="7.1501" x2="5.1501" y2="8.1999" layer="51"/>
<rectangle x1="4.35" y1="7.1501" x2="4.65" y2="8.1999" layer="51"/>
<rectangle x1="3.8499" y1="7.1501" x2="4.1501" y2="8.1999" layer="51"/>
<rectangle x1="3.35" y1="7.1501" x2="3.65" y2="8.1999" layer="51"/>
<rectangle x1="2.8499" y1="7.1501" x2="3.1501" y2="8.1999" layer="51"/>
<rectangle x1="2.35" y1="7.1501" x2="2.65" y2="8.1999" layer="51"/>
<rectangle x1="1.8499" y1="7.1501" x2="2.1501" y2="8.1999" layer="51"/>
<rectangle x1="1.35" y1="7.1501" x2="1.65" y2="8.1999" layer="51"/>
<rectangle x1="0.8499" y1="7.1501" x2="1.1501" y2="8.1999" layer="51"/>
<rectangle x1="0.35" y1="7.1501" x2="0.65" y2="8.1999" layer="51"/>
<rectangle x1="-0.1501" y1="7.1501" x2="0.1501" y2="8.1999" layer="51"/>
<rectangle x1="-0.65" y1="7.1501" x2="-0.35" y2="8.1999" layer="51"/>
<rectangle x1="-1.1501" y1="7.1501" x2="-0.8499" y2="8.1999" layer="51"/>
<rectangle x1="-1.65" y1="7.1501" x2="-1.35" y2="8.1999" layer="51"/>
<rectangle x1="-2.1501" y1="7.1501" x2="-1.8499" y2="8.1999" layer="51"/>
<rectangle x1="-2.65" y1="7.1501" x2="-2.35" y2="8.1999" layer="51"/>
<rectangle x1="-3.1501" y1="7.1501" x2="-2.8499" y2="8.1999" layer="51"/>
<rectangle x1="-3.65" y1="7.1501" x2="-3.35" y2="8.1999" layer="51"/>
<rectangle x1="-4.1501" y1="7.1501" x2="-3.8499" y2="8.1999" layer="51"/>
<rectangle x1="-4.65" y1="7.1501" x2="-4.35" y2="8.1999" layer="51"/>
<rectangle x1="-5.1501" y1="7.1501" x2="-4.8499" y2="8.1999" layer="51"/>
<rectangle x1="-5.65" y1="7.1501" x2="-5.35" y2="8.1999" layer="51"/>
<rectangle x1="-6.1501" y1="7.1501" x2="-5.8499" y2="8.1999" layer="51"/>
<polygon width="0.1" layer="51">
<vertex x="-3.81" y="-0.6701"/>
<vertex x="-2.81" y="1.3299"/>
<vertex x="-2.2101" y="1.3299"/>
<vertex x="-2.2101" y="-0.6701"/>
<vertex x="-2.6101" y="-0.6701"/>
<vertex x="-2.6101" y="0.73"/>
<vertex x="-3.2101" y="-0.4699"/>
<vertex x="-3.0099" y="-0.4699"/>
<vertex x="-3.0099" y="-0.6701"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-2.7099" y="1.6299"/>
<vertex x="-2.51" y="2.03"/>
<vertex x="3.0899" y="2.03"/>
<vertex x="3.0899" y="1.6299"/>
<vertex x="-1.51" y="1.6299"/>
<vertex x="-1.51" y="-0.6701"/>
<vertex x="-1.9101" y="-0.6701"/>
<vertex x="-1.9101" y="1.6299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-1.2101" y="1.3299"/>
<vertex x="-1.2101" y="-0.6701"/>
<vertex x="-0.81" y="-0.6701"/>
<vertex x="-0.81" y="1.13"/>
<vertex x="-0.6101" y="1.13"/>
<vertex x="-0.6101" y="-0.6701"/>
<vertex x="-0.2101" y="-0.6701"/>
<vertex x="-0.2101" y="1.13"/>
<vertex x="-0.0099" y="1.13"/>
<vertex x="-0.0099" y="-0.6701"/>
<vertex x="0.3899" y="-0.6701"/>
<vertex x="0.3899" y="0.9299"/>
<vertex x="0.2901" y="1.13"/>
<vertex x="0.19" y="1.2301"/>
<vertex x="-0.0099" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="0.6901" y="1.3299"/>
<vertex x="0.6901" y="-0.6701"/>
<vertex x="1.89" y="-0.6701"/>
<vertex x="1.89" y="-0.0701"/>
<vertex x="0.89" y="-0.0701"/>
<vertex x="0.89" y="0.13"/>
<vertex x="1.89" y="0.13"/>
<vertex x="1.89" y="0.5301"/>
<vertex x="0.89" y="0.5301"/>
<vertex x="0.89" y="0.73"/>
<vertex x="1.89" y="0.73"/>
<vertex x="1.89" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="2.19" y="1.3299"/>
<vertex x="2.19" y="-0.6701"/>
<vertex x="2.7899" y="-0.6701"/>
<vertex x="2.9901" y="-0.27"/>
<vertex x="2.59" y="-0.27"/>
<vertex x="2.59" y="1.3299"/>
</polygon>
<polygon width="0.1" layer="51">
<vertex x="-3.81" y="-0.8699"/>
<vertex x="-3.81" y="-1.27"/>
<vertex x="2.49" y="-1.27"/>
<vertex x="2.6901" y="-0.8699"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="XMEGA128A1">
<wire x1="-20.32" y1="78.74" x2="22.86" y2="78.74" width="0.254" layer="94"/>
<wire x1="22.86" y1="78.74" x2="22.86" y2="-81.28" width="0.254" layer="94"/>
<wire x1="22.86" y1="-81.28" x2="-20.32" y2="-81.28" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-81.28" x2="-20.32" y2="78.74" width="0.254" layer="94"/>
<text x="-20.32" y="-83.82" size="1.778" layer="96">&gt;VALUE</text>
<text x="-20.32" y="80.01" size="1.778" layer="95">&gt;NAME</text>
<pin name="PF0" x="27.94" y="-55.88" length="middle" rot="R180"/>
<pin name="PF1" x="27.94" y="-53.34" length="middle" rot="R180"/>
<pin name="PF2" x="27.94" y="-50.8" length="middle" rot="R180"/>
<pin name="PF3" x="27.94" y="-48.26" length="middle" rot="R180"/>
<pin name="PF4" x="27.94" y="-45.72" length="middle" rot="R180"/>
<pin name="PF5" x="27.94" y="-43.18" length="middle" rot="R180"/>
<pin name="PF6" x="27.94" y="-40.64" length="middle" rot="R180"/>
<pin name="PF7" x="27.94" y="-38.1" length="middle" rot="R180"/>
<pin name="PE0" x="27.94" y="-33.02" length="middle" rot="R180"/>
<pin name="PE1" x="27.94" y="-30.48" length="middle" rot="R180"/>
<pin name="PE2" x="27.94" y="-27.94" length="middle" rot="R180"/>
<pin name="PE3" x="27.94" y="-25.4" length="middle" rot="R180"/>
<pin name="PE4" x="27.94" y="-22.86" length="middle" rot="R180"/>
<pin name="PE5" x="27.94" y="-20.32" length="middle" rot="R180"/>
<pin name="PE6" x="27.94" y="-17.78" length="middle" rot="R180"/>
<pin name="PE7" x="27.94" y="-15.24" length="middle" rot="R180"/>
<pin name="PD7" x="27.94" y="7.62" length="middle" rot="R180"/>
<pin name="PD6" x="27.94" y="5.08" length="middle" rot="R180"/>
<pin name="PD5" x="27.94" y="2.54" length="middle" rot="R180"/>
<pin name="PD4" x="27.94" y="0" length="middle" rot="R180"/>
<pin name="PD3" x="27.94" y="-2.54" length="middle" rot="R180"/>
<pin name="PD2" x="27.94" y="-5.08" length="middle" rot="R180"/>
<pin name="PD1" x="27.94" y="-7.62" length="middle" rot="R180"/>
<pin name="PD0" x="27.94" y="-10.16" length="middle" rot="R180"/>
<pin name="PC7" x="27.94" y="30.48" length="middle" rot="R180"/>
<pin name="PC6" x="27.94" y="27.94" length="middle" rot="R180"/>
<pin name="PC5" x="27.94" y="25.4" length="middle" rot="R180"/>
<pin name="PC4" x="27.94" y="22.86" length="middle" rot="R180"/>
<pin name="PC3" x="27.94" y="20.32" length="middle" rot="R180"/>
<pin name="PC2" x="27.94" y="17.78" length="middle" rot="R180"/>
<pin name="PC1" x="27.94" y="15.24" length="middle" rot="R180"/>
<pin name="PC0" x="27.94" y="12.7" length="middle" rot="R180"/>
<pin name="PB0" x="27.94" y="35.56" length="middle" rot="R180"/>
<pin name="PA6" x="27.94" y="73.66" length="middle" rot="R180"/>
<pin name="PA7" x="27.94" y="76.2" length="middle" rot="R180"/>
<pin name="PA5" x="27.94" y="71.12" length="middle" rot="R180"/>
<pin name="PA4" x="27.94" y="68.58" length="middle" rot="R180"/>
<pin name="PA3" x="27.94" y="66.04" length="middle" rot="R180"/>
<pin name="PA2" x="27.94" y="63.5" length="middle" rot="R180"/>
<pin name="PA1" x="27.94" y="60.96" length="middle" rot="R180"/>
<pin name="PA0" x="27.94" y="58.42" length="middle" rot="R180"/>
<pin name="AVCC1" x="-25.4" y="60.96" visible="pad" length="middle" direction="pwr"/>
<pin name="GND9" x="-25.4" y="30.48" visible="pad" length="middle" direction="pwr"/>
<pin name="PDI_DATA" x="-25.4" y="71.12" length="middle"/>
<pin name="VCC1" x="-25.4" y="38.1" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC" x="-25.4" y="35.56" length="middle" direction="pwr"/>
<pin name="GND1" x="-25.4" y="10.16" visible="pad" length="middle" direction="pwr"/>
<pin name="GND" x="-25.4" y="7.62" length="middle" direction="pwr"/>
<pin name="!RESET!/PDI_CLK" x="-25.4" y="76.2" length="middle" direction="in"/>
<pin name="GND2" x="-25.4" y="12.7" visible="pad" length="middle" direction="pwr"/>
<pin name="GND3" x="-25.4" y="15.24" visible="pad" length="middle" direction="pwr"/>
<pin name="GND4" x="-25.4" y="17.78" visible="pad" length="middle" direction="pwr"/>
<pin name="GND5" x="-25.4" y="20.32" visible="pad" length="middle" direction="pwr"/>
<pin name="GND6" x="-25.4" y="22.86" visible="pad" length="middle" direction="pwr"/>
<pin name="GND7" x="-25.4" y="25.4" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC2" x="-25.4" y="40.64" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC3" x="-25.4" y="43.18" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC4" x="-25.4" y="45.72" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC5" x="-25.4" y="48.26" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC6" x="-25.4" y="50.8" visible="pad" length="middle" direction="pwr"/>
<pin name="VCC7" x="-25.4" y="53.34" visible="pad" length="middle" direction="pwr"/>
<pin name="AVCC" x="-25.4" y="58.42" length="middle" direction="pwr"/>
<pin name="GND8" x="-25.4" y="27.94" visible="pad" length="middle" direction="pwr"/>
<pin name="PH0" x="27.94" y="-78.74" length="middle" rot="R180"/>
<pin name="PH1" x="27.94" y="-76.2" length="middle" rot="R180"/>
<pin name="PH2" x="27.94" y="-73.66" length="middle" rot="R180"/>
<pin name="PH3" x="27.94" y="-71.12" length="middle" rot="R180"/>
<pin name="PH4" x="27.94" y="-68.58" length="middle" rot="R180"/>
<pin name="PH5" x="27.94" y="-66.04" length="middle" rot="R180"/>
<pin name="PH6" x="27.94" y="-63.5" length="middle" rot="R180"/>
<pin name="PH7" x="27.94" y="-60.96" length="middle" rot="R180"/>
<pin name="PJ0" x="-25.4" y="-78.74" length="middle"/>
<pin name="PJ1" x="-25.4" y="-76.2" length="middle"/>
<pin name="PJ2" x="-25.4" y="-73.66" length="middle"/>
<pin name="PJ3" x="-25.4" y="-71.12" length="middle"/>
<pin name="PJ4" x="-25.4" y="-68.58" length="middle"/>
<pin name="PJ5" x="-25.4" y="-66.04" length="middle"/>
<pin name="PJ6" x="-25.4" y="-63.5" length="middle"/>
<pin name="PJ7" x="-25.4" y="-60.96" length="middle"/>
<pin name="PK0" x="-25.4" y="-55.88" length="middle"/>
<pin name="PK1" x="-25.4" y="-53.34" length="middle"/>
<pin name="PK2" x="-25.4" y="-50.8" length="middle"/>
<pin name="PK3" x="-25.4" y="-48.26" length="middle"/>
<pin name="PK4" x="-25.4" y="-45.72" length="middle"/>
<pin name="PK5" x="-25.4" y="-43.18" length="middle"/>
<pin name="PK6" x="-25.4" y="-40.64" length="middle"/>
<pin name="PK7" x="-25.4" y="-38.1" length="middle"/>
<pin name="PQ0" x="-25.4" y="-33.02" length="middle"/>
<pin name="PQ1" x="-25.4" y="-30.48" length="middle"/>
<pin name="PQ2" x="-25.4" y="-27.94" length="middle"/>
<pin name="PQ3" x="-25.4" y="-25.4" length="middle"/>
<pin name="PR0(XT2)" x="-25.4" y="-20.32" length="middle"/>
<pin name="PR1(XT1)" x="-25.4" y="-15.24" length="middle"/>
<pin name="PB1" x="27.94" y="38.1" length="middle" rot="R180"/>
<pin name="PB2" x="27.94" y="40.64" length="middle" rot="R180"/>
<pin name="PB3" x="27.94" y="43.18" length="middle" rot="R180"/>
<pin name="PB4" x="27.94" y="45.72" length="middle" rot="R180"/>
<pin name="PB5" x="27.94" y="48.26" length="middle" rot="R180"/>
<pin name="PB6" x="27.94" y="50.8" length="middle" rot="R180"/>
<pin name="PB7" x="27.94" y="53.34" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XMEGA128A1" prefix="IC">
<description>&lt;b&gt;MICROCONTROLLER&lt;/b&gt;
&lt;h2&gt;Features&lt;/h2&gt;
&lt;ul&gt;&lt;li&gt;High-performance, Low-power 8/16-bit AVR XMEGA Microcontroller&lt;/li&gt;
&lt;li&gt; Non-Volatile Program and Data Memories&lt;/li&gt;
- 64K - 384K Bytes of In-System Self-Programmable Flash&lt;br&gt;
- 4K - 8K Bytes Boot Section with Independent Lock Bits&lt;br&gt;
- 2 KB - 4 KB EEPROM&lt;br&gt;
- 4 KB - 32 KB Internal SRAM
&lt;ul&gt;External Bus Interface for up to 16M bytes SRAM&lt;/ul&gt;
&lt;ul&gt;External Bus Interface for up to 128M bit SDRAM&lt;/ul&gt;
&lt;li&gt; Peripheral Features&lt;/li&gt;
- Four-channel DMA Controller with support for external requests&lt;br&gt;
- Eight-channel Event System&lt;br&gt;
- Eight 16-bit Timer/Counters
&lt;ul&gt;Four Timer/Counters with 4 Output Compare or Input Capture channels&lt;/ul&gt;
&lt;ul&gt;Four Timer/Counters with 2 Output Compare or Input Capture channels&lt;/ul&gt;
&lt;ul&gt;High-Resolution Extension on all Timer/Counters&lt;/ul&gt;
&lt;ul&gt;Advanced Waveform Extension on two Timer/Counters&lt;/ul&gt;
- Eight USARTs
&lt;ul&gt;IrDA modulation/demodulation for one USART&lt;/ul&gt;
- Four Two-Wire Interfaces with dual address match (I2C and SMBus compatible)&lt;br&gt;
- Four SPI (Serial Peripheral Interface) peripherals&lt;br&gt;
- AES and DES Crypto Engine&lt;br&gt;
- 16-bit Real Time Counter with separate Oscillator&lt;br&gt;
- Two Eight-channel, 12-bit, 2 Msps Analog to Digital Converters&lt;br&gt;
- Two Two-channel, 12-bit, 1 Msps Digital to Analog Converters&lt;br&gt;
- Four Analog Comparators with Window compare function&lt;br&gt;
- External Interrupts on all General Purpose I/O pins&lt;br&gt;
- Programmable Watchdog Timer with Separate On-chip Ultra Low Power Oscillator
&lt;li&gt; Special Microcontroller Features&lt;/li&gt;
- Power-on Reset and Programmable Brown-out Detection&lt;br&gt;
- Internal and External Clock Options with PLL and Prescaler&lt;br&gt;
- Programmable Multi-level Interrupt Controller&lt;br&gt;
- Sleep Modes: Idle, Power-down, Standby, Power-save, Extended Standby&lt;br&gt;
- Advanced Programming, Test and Debugging Interfaces
&lt;ul&gt;JTAG (IEEE 1149.1 Compliant) Interface for programming, test and debugging&lt;/ul&gt;
&lt;ul&gt;PDI (Program and Debug Interface) for programming and debugging&lt;/ul&gt;
&lt;li&gt; I/O and Packages&lt;/li&gt;
- 78 Programmable I/O Lines&lt;br&gt;
- 100 - lead TQFP&lt;br&gt;
- 100 - ball CBGA&lt;br&gt;
- 100 - ball VFBGA
&lt;li&gt; Operating Voltage&lt;/li&gt;
- 1.6 - 3.6V
&lt;li&gt; Speed performance&lt;/li&gt;
- 0 - 12 MHz @ 1.6 - 3.6V&lt;br&gt;
- 0 - 32 MHz @ 2.7 - 3.6V&lt;br&gt;&lt;/ul&gt;
&lt;p&gt;&lt;author&gt;Drawn by Dipl.-Ing. (FH) Robert Siegler&lt;/author&gt;&lt;/p&gt;
Created: 27.05.09</description>
<gates>
<gate name="G$1" symbol="XMEGA128A1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TQFP100">
<connects>
<connect gate="G$1" pin="!RESET!/PDI_CLK" pad="90"/>
<connect gate="G$1" pin="AVCC" pad="4"/>
<connect gate="G$1" pin="AVCC1" pad="94"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GND1" pad="13"/>
<connect gate="G$1" pin="GND2" pad="23"/>
<connect gate="G$1" pin="GND3" pad="33"/>
<connect gate="G$1" pin="GND4" pad="43"/>
<connect gate="G$1" pin="GND5" pad="53"/>
<connect gate="G$1" pin="GND6" pad="63"/>
<connect gate="G$1" pin="GND7" pad="73"/>
<connect gate="G$1" pin="GND8" pad="84"/>
<connect gate="G$1" pin="GND9" pad="93"/>
<connect gate="G$1" pin="PA0" pad="95"/>
<connect gate="G$1" pin="PA1" pad="96"/>
<connect gate="G$1" pin="PA2" pad="97"/>
<connect gate="G$1" pin="PA3" pad="98"/>
<connect gate="G$1" pin="PA4" pad="99"/>
<connect gate="G$1" pin="PA5" pad="100"/>
<connect gate="G$1" pin="PA6" pad="1"/>
<connect gate="G$1" pin="PA7" pad="2"/>
<connect gate="G$1" pin="PB0" pad="5"/>
<connect gate="G$1" pin="PB1" pad="6"/>
<connect gate="G$1" pin="PB2" pad="7"/>
<connect gate="G$1" pin="PB3" pad="8"/>
<connect gate="G$1" pin="PB4" pad="9"/>
<connect gate="G$1" pin="PB5" pad="10"/>
<connect gate="G$1" pin="PB6" pad="11"/>
<connect gate="G$1" pin="PB7" pad="12"/>
<connect gate="G$1" pin="PC0" pad="15"/>
<connect gate="G$1" pin="PC1" pad="16"/>
<connect gate="G$1" pin="PC2" pad="17"/>
<connect gate="G$1" pin="PC3" pad="18"/>
<connect gate="G$1" pin="PC4" pad="19"/>
<connect gate="G$1" pin="PC5" pad="20"/>
<connect gate="G$1" pin="PC6" pad="21"/>
<connect gate="G$1" pin="PC7" pad="22"/>
<connect gate="G$1" pin="PD0" pad="25"/>
<connect gate="G$1" pin="PD1" pad="26"/>
<connect gate="G$1" pin="PD2" pad="27"/>
<connect gate="G$1" pin="PD3" pad="28"/>
<connect gate="G$1" pin="PD4" pad="29"/>
<connect gate="G$1" pin="PD5" pad="30"/>
<connect gate="G$1" pin="PD6" pad="31"/>
<connect gate="G$1" pin="PD7" pad="32"/>
<connect gate="G$1" pin="PDI_DATA" pad="89"/>
<connect gate="G$1" pin="PE0" pad="35"/>
<connect gate="G$1" pin="PE1" pad="36"/>
<connect gate="G$1" pin="PE2" pad="37"/>
<connect gate="G$1" pin="PE3" pad="38"/>
<connect gate="G$1" pin="PE4" pad="39"/>
<connect gate="G$1" pin="PE5" pad="40"/>
<connect gate="G$1" pin="PE6" pad="41"/>
<connect gate="G$1" pin="PE7" pad="42"/>
<connect gate="G$1" pin="PF0" pad="45"/>
<connect gate="G$1" pin="PF1" pad="46"/>
<connect gate="G$1" pin="PF2" pad="47"/>
<connect gate="G$1" pin="PF3" pad="48"/>
<connect gate="G$1" pin="PF4" pad="49"/>
<connect gate="G$1" pin="PF5" pad="50"/>
<connect gate="G$1" pin="PF6" pad="51"/>
<connect gate="G$1" pin="PF7" pad="52"/>
<connect gate="G$1" pin="PH0" pad="55"/>
<connect gate="G$1" pin="PH1" pad="56"/>
<connect gate="G$1" pin="PH2" pad="57"/>
<connect gate="G$1" pin="PH3" pad="58"/>
<connect gate="G$1" pin="PH4" pad="59"/>
<connect gate="G$1" pin="PH5" pad="60"/>
<connect gate="G$1" pin="PH6" pad="61"/>
<connect gate="G$1" pin="PH7" pad="62"/>
<connect gate="G$1" pin="PJ0" pad="65"/>
<connect gate="G$1" pin="PJ1" pad="66"/>
<connect gate="G$1" pin="PJ2" pad="67"/>
<connect gate="G$1" pin="PJ3" pad="68"/>
<connect gate="G$1" pin="PJ4" pad="69"/>
<connect gate="G$1" pin="PJ5" pad="70"/>
<connect gate="G$1" pin="PJ6" pad="71"/>
<connect gate="G$1" pin="PJ7" pad="72"/>
<connect gate="G$1" pin="PK0" pad="75"/>
<connect gate="G$1" pin="PK1" pad="76"/>
<connect gate="G$1" pin="PK2" pad="77"/>
<connect gate="G$1" pin="PK3" pad="78"/>
<connect gate="G$1" pin="PK4" pad="79"/>
<connect gate="G$1" pin="PK5" pad="80"/>
<connect gate="G$1" pin="PK6" pad="81"/>
<connect gate="G$1" pin="PK7" pad="82"/>
<connect gate="G$1" pin="PQ0" pad="85"/>
<connect gate="G$1" pin="PQ1" pad="86"/>
<connect gate="G$1" pin="PQ2" pad="87"/>
<connect gate="G$1" pin="PQ3" pad="88"/>
<connect gate="G$1" pin="PR0(XT2)" pad="91"/>
<connect gate="G$1" pin="PR1(XT1)" pad="92"/>
<connect gate="G$1" pin="VCC" pad="14"/>
<connect gate="G$1" pin="VCC1" pad="24"/>
<connect gate="G$1" pin="VCC2" pad="34"/>
<connect gate="G$1" pin="VCC3" pad="44"/>
<connect gate="G$1" pin="VCC4" pad="54"/>
<connect gate="G$1" pin="VCC5" pad="64"/>
<connect gate="G$1" pin="VCC6" pad="74"/>
<connect gate="G$1" pin="VCC7" pad="83"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="atmel" deviceset="XMEGA128A1" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="-40.64" y="25.4"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
