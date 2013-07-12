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
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Hidden" color="15" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="yes" active="yes"/>
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
<library name="robotter_ic">
<packages>
<package name="TQFP144">
<description>&lt;b&gt;TQFP144&lt;/b&gt;&lt;p&gt;
Auto generated by &lt;i&gt;make-symbol-device-package-bsdl.ulp Rev. 19&lt;/i&gt;&lt;br&gt;</description>
<wire x1="-9.8984" y1="9.4" x2="-9.4" y2="9.8984" width="0.2032" layer="21"/>
<wire x1="-9.8984" y1="-9.8984" x2="9.8984" y2="-9.8984" width="0.2032" layer="21"/>
<wire x1="9.8984" y1="-9.8984" x2="9.8984" y2="9.8984" width="0.2032" layer="21"/>
<wire x1="9.8984" y1="9.8984" x2="-9.8984" y2="9.8984" width="0.2032" layer="21"/>
<wire x1="-9.8984" y1="9.8984" x2="-9.8984" y2="-9.8984" width="0.2032" layer="21"/>
<smd name="1" x="-10.75" y="8.75" dx="1" dy="0.3" layer="1"/>
<smd name="2" x="-10.75" y="8.25" dx="1" dy="0.3" layer="1"/>
<smd name="3" x="-10.75" y="7.75" dx="1" dy="0.3" layer="1"/>
<smd name="4" x="-10.75" y="7.25" dx="1" dy="0.3" layer="1"/>
<smd name="5" x="-10.75" y="6.75" dx="1" dy="0.3" layer="1"/>
<smd name="6" x="-10.75" y="6.25" dx="1" dy="0.3" layer="1"/>
<smd name="7" x="-10.75" y="5.75" dx="1" dy="0.3" layer="1"/>
<smd name="8" x="-10.75" y="5.25" dx="1" dy="0.3" layer="1"/>
<smd name="9" x="-10.75" y="4.75" dx="1" dy="0.3" layer="1"/>
<smd name="10" x="-10.75" y="4.25" dx="1" dy="0.3" layer="1"/>
<smd name="11" x="-10.75" y="3.75" dx="1" dy="0.3" layer="1"/>
<smd name="12" x="-10.75" y="3.25" dx="1" dy="0.3" layer="1"/>
<smd name="13" x="-10.75" y="2.75" dx="1" dy="0.3" layer="1"/>
<smd name="14" x="-10.75" y="2.25" dx="1" dy="0.3" layer="1"/>
<smd name="15" x="-10.75" y="1.75" dx="1" dy="0.3" layer="1"/>
<smd name="16" x="-10.75" y="1.25" dx="1" dy="0.3" layer="1"/>
<smd name="17" x="-10.75" y="0.75" dx="1" dy="0.3" layer="1"/>
<smd name="18" x="-10.75" y="0.25" dx="1" dy="0.3" layer="1"/>
<smd name="19" x="-10.75" y="-0.25" dx="1" dy="0.3" layer="1"/>
<smd name="20" x="-10.75" y="-0.75" dx="1" dy="0.3" layer="1"/>
<smd name="21" x="-10.75" y="-1.25" dx="1" dy="0.3" layer="1"/>
<smd name="22" x="-10.75" y="-1.75" dx="1" dy="0.3" layer="1"/>
<smd name="23" x="-10.75" y="-2.25" dx="1" dy="0.3" layer="1"/>
<smd name="24" x="-10.75" y="-2.75" dx="1" dy="0.3" layer="1"/>
<smd name="25" x="-10.75" y="-3.25" dx="1" dy="0.3" layer="1"/>
<smd name="26" x="-10.75" y="-3.75" dx="1" dy="0.3" layer="1"/>
<smd name="27" x="-10.75" y="-4.25" dx="1" dy="0.3" layer="1"/>
<smd name="28" x="-10.75" y="-4.75" dx="1" dy="0.3" layer="1"/>
<smd name="29" x="-10.75" y="-5.25" dx="1" dy="0.3" layer="1"/>
<smd name="30" x="-10.75" y="-5.75" dx="1" dy="0.3" layer="1"/>
<smd name="31" x="-10.75" y="-6.25" dx="1" dy="0.3" layer="1"/>
<smd name="32" x="-10.75" y="-6.75" dx="1" dy="0.3" layer="1"/>
<smd name="33" x="-10.75" y="-7.25" dx="1" dy="0.3" layer="1"/>
<smd name="34" x="-10.75" y="-7.75" dx="1" dy="0.3" layer="1"/>
<smd name="35" x="-10.75" y="-8.25" dx="1" dy="0.3" layer="1"/>
<smd name="36" x="-10.75" y="-8.75" dx="1" dy="0.3" layer="1"/>
<smd name="37" x="-8.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="38" x="-8.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="39" x="-7.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="40" x="-7.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="41" x="-6.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="42" x="-6.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="43" x="-5.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="44" x="-5.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="45" x="-4.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="46" x="-4.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="47" x="-3.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="48" x="-3.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="49" x="-2.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="50" x="-2.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="51" x="-1.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="52" x="-1.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="53" x="-0.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="54" x="-0.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="55" x="0.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="56" x="0.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="57" x="1.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="58" x="1.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="59" x="2.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="60" x="2.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="61" x="3.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="62" x="3.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="63" x="4.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="64" x="4.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="65" x="5.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="66" x="5.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="67" x="6.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="68" x="6.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="69" x="7.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="70" x="7.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="71" x="8.25" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="72" x="8.75" y="-10.75" dx="0.3" dy="1" layer="1"/>
<smd name="73" x="10.75" y="-8.75" dx="1" dy="0.3" layer="1"/>
<smd name="74" x="10.75" y="-8.25" dx="1" dy="0.3" layer="1"/>
<smd name="75" x="10.75" y="-7.75" dx="1" dy="0.3" layer="1"/>
<smd name="76" x="10.75" y="-7.25" dx="1" dy="0.3" layer="1"/>
<smd name="77" x="10.75" y="-6.75" dx="1" dy="0.3" layer="1"/>
<smd name="78" x="10.75" y="-6.25" dx="1" dy="0.3" layer="1"/>
<smd name="79" x="10.75" y="-5.75" dx="1" dy="0.3" layer="1"/>
<smd name="80" x="10.75" y="-5.25" dx="1" dy="0.3" layer="1"/>
<smd name="81" x="10.75" y="-4.75" dx="1" dy="0.3" layer="1"/>
<smd name="82" x="10.75" y="-4.25" dx="1" dy="0.3" layer="1"/>
<smd name="83" x="10.75" y="-3.75" dx="1" dy="0.3" layer="1"/>
<smd name="84" x="10.75" y="-3.25" dx="1" dy="0.3" layer="1"/>
<smd name="85" x="10.75" y="-2.75" dx="1" dy="0.3" layer="1"/>
<smd name="86" x="10.75" y="-2.25" dx="1" dy="0.3" layer="1"/>
<smd name="87" x="10.75" y="-1.75" dx="1" dy="0.3" layer="1"/>
<smd name="88" x="10.75" y="-1.25" dx="1" dy="0.3" layer="1"/>
<smd name="89" x="10.75" y="-0.75" dx="1" dy="0.3" layer="1"/>
<smd name="90" x="10.75" y="-0.25" dx="1" dy="0.3" layer="1"/>
<smd name="91" x="10.75" y="0.25" dx="1" dy="0.3" layer="1"/>
<smd name="92" x="10.75" y="0.75" dx="1" dy="0.3" layer="1"/>
<smd name="93" x="10.75" y="1.25" dx="1" dy="0.3" layer="1"/>
<smd name="94" x="10.75" y="1.75" dx="1" dy="0.3" layer="1"/>
<smd name="95" x="10.75" y="2.25" dx="1" dy="0.3" layer="1"/>
<smd name="96" x="10.75" y="2.75" dx="1" dy="0.3" layer="1"/>
<smd name="97" x="10.75" y="3.25" dx="1" dy="0.3" layer="1"/>
<smd name="98" x="10.75" y="3.75" dx="1" dy="0.3" layer="1"/>
<smd name="99" x="10.75" y="4.25" dx="1" dy="0.3" layer="1"/>
<smd name="100" x="10.75" y="4.75" dx="1" dy="0.3" layer="1"/>
<smd name="101" x="10.75" y="5.25" dx="1" dy="0.3" layer="1"/>
<smd name="102" x="10.75" y="5.75" dx="1" dy="0.3" layer="1"/>
<smd name="103" x="10.75" y="6.25" dx="1" dy="0.3" layer="1"/>
<smd name="104" x="10.75" y="6.75" dx="1" dy="0.3" layer="1"/>
<smd name="105" x="10.75" y="7.25" dx="1" dy="0.3" layer="1"/>
<smd name="106" x="10.75" y="7.75" dx="1" dy="0.3" layer="1"/>
<smd name="107" x="10.75" y="8.25" dx="1" dy="0.3" layer="1"/>
<smd name="108" x="10.75" y="8.75" dx="1" dy="0.3" layer="1"/>
<smd name="109" x="8.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="110" x="8.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="111" x="7.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="112" x="7.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="113" x="6.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="114" x="6.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="115" x="5.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="116" x="5.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="117" x="4.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="118" x="4.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="119" x="3.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="120" x="3.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="121" x="2.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="122" x="2.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="123" x="1.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="124" x="1.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="125" x="0.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="126" x="0.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="127" x="-0.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="128" x="-0.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="129" x="-1.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="130" x="-1.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="131" x="-2.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="132" x="-2.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="133" x="-3.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="134" x="-3.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="135" x="-4.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="136" x="-4.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="137" x="-5.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="138" x="-5.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="139" x="-6.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="140" x="-6.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="141" x="-7.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="142" x="-7.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="143" x="-8.25" y="10.75" dx="0.3" dy="1" layer="1"/>
<smd name="144" x="-8.75" y="10.75" dx="0.3" dy="1" layer="1"/>
<text x="-11" y="11.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-11" y="-12.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-11" y1="8.615" x2="-10" y2="8.885" layer="51"/>
<rectangle x1="-11" y1="8.115" x2="-10" y2="8.385" layer="51"/>
<rectangle x1="-11" y1="7.615" x2="-10" y2="7.885" layer="51"/>
<rectangle x1="-11" y1="7.115" x2="-10" y2="7.385" layer="51"/>
<rectangle x1="-11" y1="6.615" x2="-10" y2="6.885" layer="51"/>
<rectangle x1="-11" y1="6.115" x2="-10" y2="6.385" layer="51"/>
<rectangle x1="-11" y1="5.615" x2="-10" y2="5.885" layer="51"/>
<rectangle x1="-11" y1="5.115" x2="-10" y2="5.385" layer="51"/>
<rectangle x1="-11" y1="4.615" x2="-10" y2="4.885" layer="51"/>
<rectangle x1="-11" y1="4.115" x2="-10" y2="4.385" layer="51"/>
<rectangle x1="-11" y1="3.615" x2="-10" y2="3.885" layer="51"/>
<rectangle x1="-11" y1="3.115" x2="-10" y2="3.385" layer="51"/>
<rectangle x1="-11" y1="2.615" x2="-10" y2="2.885" layer="51"/>
<rectangle x1="-11" y1="2.115" x2="-10" y2="2.385" layer="51"/>
<rectangle x1="-11" y1="1.615" x2="-10" y2="1.885" layer="51"/>
<rectangle x1="-11" y1="1.115" x2="-10" y2="1.385" layer="51"/>
<rectangle x1="-11" y1="0.615" x2="-10" y2="0.885" layer="51"/>
<rectangle x1="-11" y1="0.115" x2="-10" y2="0.385" layer="51"/>
<rectangle x1="-11" y1="-0.385" x2="-10" y2="-0.115" layer="51"/>
<rectangle x1="-11" y1="-0.885" x2="-10" y2="-0.615" layer="51"/>
<rectangle x1="-11" y1="-1.385" x2="-10" y2="-1.115" layer="51"/>
<rectangle x1="-11" y1="-1.885" x2="-10" y2="-1.615" layer="51"/>
<rectangle x1="-11" y1="-2.385" x2="-10" y2="-2.115" layer="51"/>
<rectangle x1="-11" y1="-2.885" x2="-10" y2="-2.615" layer="51"/>
<rectangle x1="-11" y1="-3.385" x2="-10" y2="-3.115" layer="51"/>
<rectangle x1="-11" y1="-3.885" x2="-10" y2="-3.615" layer="51"/>
<rectangle x1="-11" y1="-4.385" x2="-10" y2="-4.115" layer="51"/>
<rectangle x1="-11" y1="-4.885" x2="-10" y2="-4.615" layer="51"/>
<rectangle x1="-11" y1="-5.385" x2="-10" y2="-5.115" layer="51"/>
<rectangle x1="-11" y1="-5.885" x2="-10" y2="-5.615" layer="51"/>
<rectangle x1="-11" y1="-6.385" x2="-10" y2="-6.115" layer="51"/>
<rectangle x1="-11" y1="-6.885" x2="-10" y2="-6.615" layer="51"/>
<rectangle x1="-11" y1="-7.385" x2="-10" y2="-7.115" layer="51"/>
<rectangle x1="-11" y1="-7.885" x2="-10" y2="-7.615" layer="51"/>
<rectangle x1="-11" y1="-8.385" x2="-10" y2="-8.115" layer="51"/>
<rectangle x1="-11" y1="-8.885" x2="-10" y2="-8.615" layer="51"/>
<rectangle x1="-8.885" y1="-11" x2="-8.615" y2="-10" layer="51"/>
<rectangle x1="-8.385" y1="-11" x2="-8.115" y2="-10" layer="51"/>
<rectangle x1="-7.885" y1="-11" x2="-7.615" y2="-10" layer="51"/>
<rectangle x1="-7.385" y1="-11" x2="-7.115" y2="-10" layer="51"/>
<rectangle x1="-6.885" y1="-11" x2="-6.615" y2="-10" layer="51"/>
<rectangle x1="-6.385" y1="-11" x2="-6.115" y2="-10" layer="51"/>
<rectangle x1="-5.885" y1="-11" x2="-5.615" y2="-10" layer="51"/>
<rectangle x1="-5.385" y1="-11" x2="-5.115" y2="-10" layer="51"/>
<rectangle x1="-4.885" y1="-11" x2="-4.615" y2="-10" layer="51"/>
<rectangle x1="-4.385" y1="-11" x2="-4.115" y2="-10" layer="51"/>
<rectangle x1="-3.885" y1="-11" x2="-3.615" y2="-10" layer="51"/>
<rectangle x1="-3.385" y1="-11" x2="-3.115" y2="-10" layer="51"/>
<rectangle x1="-2.885" y1="-11" x2="-2.615" y2="-10" layer="51"/>
<rectangle x1="-2.385" y1="-11" x2="-2.115" y2="-10" layer="51"/>
<rectangle x1="-1.885" y1="-11" x2="-1.615" y2="-10" layer="51"/>
<rectangle x1="-1.385" y1="-11" x2="-1.115" y2="-10" layer="51"/>
<rectangle x1="-0.885" y1="-11" x2="-0.615" y2="-10" layer="51"/>
<rectangle x1="-0.385" y1="-11" x2="-0.115" y2="-10" layer="51"/>
<rectangle x1="0.115" y1="-11" x2="0.385" y2="-10" layer="51"/>
<rectangle x1="0.615" y1="-11" x2="0.885" y2="-10" layer="51"/>
<rectangle x1="1.115" y1="-11" x2="1.385" y2="-10" layer="51"/>
<rectangle x1="1.615" y1="-11" x2="1.885" y2="-10" layer="51"/>
<rectangle x1="2.115" y1="-11" x2="2.385" y2="-10" layer="51"/>
<rectangle x1="2.615" y1="-11" x2="2.885" y2="-10" layer="51"/>
<rectangle x1="3.115" y1="-11" x2="3.385" y2="-10" layer="51"/>
<rectangle x1="3.615" y1="-11" x2="3.885" y2="-10" layer="51"/>
<rectangle x1="4.115" y1="-11" x2="4.385" y2="-10" layer="51"/>
<rectangle x1="4.615" y1="-11" x2="4.885" y2="-10" layer="51"/>
<rectangle x1="5.115" y1="-11" x2="5.385" y2="-10" layer="51"/>
<rectangle x1="5.615" y1="-11" x2="5.885" y2="-10" layer="51"/>
<rectangle x1="6.115" y1="-11" x2="6.385" y2="-10" layer="51"/>
<rectangle x1="6.615" y1="-11" x2="6.885" y2="-10" layer="51"/>
<rectangle x1="7.115" y1="-11" x2="7.385" y2="-10" layer="51"/>
<rectangle x1="7.615" y1="-11" x2="7.885" y2="-10" layer="51"/>
<rectangle x1="8.115" y1="-11" x2="8.385" y2="-10" layer="51"/>
<rectangle x1="8.615" y1="-11" x2="8.885" y2="-10" layer="51"/>
<rectangle x1="10" y1="-8.885" x2="11" y2="-8.615" layer="51"/>
<rectangle x1="10" y1="-8.385" x2="11" y2="-8.115" layer="51"/>
<rectangle x1="10" y1="-7.885" x2="11" y2="-7.615" layer="51"/>
<rectangle x1="10" y1="-7.385" x2="11" y2="-7.115" layer="51"/>
<rectangle x1="10" y1="-6.885" x2="11" y2="-6.615" layer="51"/>
<rectangle x1="10" y1="-6.385" x2="11" y2="-6.115" layer="51"/>
<rectangle x1="10" y1="-5.885" x2="11" y2="-5.615" layer="51"/>
<rectangle x1="10" y1="-5.385" x2="11" y2="-5.115" layer="51"/>
<rectangle x1="10" y1="-4.885" x2="11" y2="-4.615" layer="51"/>
<rectangle x1="10" y1="-4.385" x2="11" y2="-4.115" layer="51"/>
<rectangle x1="10" y1="-3.885" x2="11" y2="-3.615" layer="51"/>
<rectangle x1="10" y1="-3.385" x2="11" y2="-3.115" layer="51"/>
<rectangle x1="10" y1="-2.885" x2="11" y2="-2.615" layer="51"/>
<rectangle x1="10" y1="-2.385" x2="11" y2="-2.115" layer="51"/>
<rectangle x1="10" y1="-1.885" x2="11" y2="-1.615" layer="51"/>
<rectangle x1="10" y1="-1.385" x2="11" y2="-1.115" layer="51"/>
<rectangle x1="10" y1="-0.885" x2="11" y2="-0.615" layer="51"/>
<rectangle x1="10" y1="-0.385" x2="11" y2="-0.115" layer="51"/>
<rectangle x1="10" y1="0.115" x2="11" y2="0.385" layer="51"/>
<rectangle x1="10" y1="0.615" x2="11" y2="0.885" layer="51"/>
<rectangle x1="10" y1="1.115" x2="11" y2="1.385" layer="51"/>
<rectangle x1="10" y1="1.615" x2="11" y2="1.885" layer="51"/>
<rectangle x1="10" y1="2.115" x2="11" y2="2.385" layer="51"/>
<rectangle x1="10" y1="2.615" x2="11" y2="2.885" layer="51"/>
<rectangle x1="10" y1="3.115" x2="11" y2="3.385" layer="51"/>
<rectangle x1="10" y1="3.615" x2="11" y2="3.885" layer="51"/>
<rectangle x1="10" y1="4.115" x2="11" y2="4.385" layer="51"/>
<rectangle x1="10" y1="4.615" x2="11" y2="4.885" layer="51"/>
<rectangle x1="10" y1="5.115" x2="11" y2="5.385" layer="51"/>
<rectangle x1="10" y1="5.615" x2="11" y2="5.885" layer="51"/>
<rectangle x1="10" y1="6.115" x2="11" y2="6.385" layer="51"/>
<rectangle x1="10" y1="6.615" x2="11" y2="6.885" layer="51"/>
<rectangle x1="10" y1="7.115" x2="11" y2="7.385" layer="51"/>
<rectangle x1="10" y1="7.615" x2="11" y2="7.885" layer="51"/>
<rectangle x1="10" y1="8.115" x2="11" y2="8.385" layer="51"/>
<rectangle x1="10" y1="8.615" x2="11" y2="8.885" layer="51"/>
<rectangle x1="8.615" y1="10" x2="8.885" y2="11" layer="51"/>
<rectangle x1="8.115" y1="10" x2="8.385" y2="11" layer="51"/>
<rectangle x1="7.615" y1="10" x2="7.885" y2="11" layer="51"/>
<rectangle x1="7.115" y1="10" x2="7.385" y2="11" layer="51"/>
<rectangle x1="6.615" y1="10" x2="6.885" y2="11" layer="51"/>
<rectangle x1="6.115" y1="10" x2="6.385" y2="11" layer="51"/>
<rectangle x1="5.615" y1="10" x2="5.885" y2="11" layer="51"/>
<rectangle x1="5.115" y1="10" x2="5.385" y2="11" layer="51"/>
<rectangle x1="4.615" y1="10" x2="4.885" y2="11" layer="51"/>
<rectangle x1="4.115" y1="10" x2="4.385" y2="11" layer="51"/>
<rectangle x1="3.615" y1="10" x2="3.885" y2="11" layer="51"/>
<rectangle x1="3.115" y1="10" x2="3.385" y2="11" layer="51"/>
<rectangle x1="2.615" y1="10" x2="2.885" y2="11" layer="51"/>
<rectangle x1="2.115" y1="10" x2="2.385" y2="11" layer="51"/>
<rectangle x1="1.615" y1="10" x2="1.885" y2="11" layer="51"/>
<rectangle x1="1.115" y1="10" x2="1.385" y2="11" layer="51"/>
<rectangle x1="0.615" y1="10" x2="0.885" y2="11" layer="51"/>
<rectangle x1="0.115" y1="10" x2="0.385" y2="11" layer="51"/>
<rectangle x1="-0.385" y1="10" x2="-0.115" y2="11" layer="51"/>
<rectangle x1="-0.885" y1="10" x2="-0.615" y2="11" layer="51"/>
<rectangle x1="-1.385" y1="10" x2="-1.115" y2="11" layer="51"/>
<rectangle x1="-1.885" y1="10" x2="-1.615" y2="11" layer="51"/>
<rectangle x1="-2.385" y1="10" x2="-2.115" y2="11" layer="51"/>
<rectangle x1="-2.885" y1="10" x2="-2.615" y2="11" layer="51"/>
<rectangle x1="-3.385" y1="10" x2="-3.115" y2="11" layer="51"/>
<rectangle x1="-3.885" y1="10" x2="-3.615" y2="11" layer="51"/>
<rectangle x1="-4.385" y1="10" x2="-4.115" y2="11" layer="51"/>
<rectangle x1="-4.885" y1="10" x2="-4.615" y2="11" layer="51"/>
<rectangle x1="-5.385" y1="10" x2="-5.115" y2="11" layer="51"/>
<rectangle x1="-5.885" y1="10" x2="-5.615" y2="11" layer="51"/>
<rectangle x1="-6.385" y1="10" x2="-6.115" y2="11" layer="51"/>
<rectangle x1="-6.885" y1="10" x2="-6.615" y2="11" layer="51"/>
<rectangle x1="-7.385" y1="10" x2="-7.115" y2="11" layer="51"/>
<rectangle x1="-7.885" y1="10" x2="-7.615" y2="11" layer="51"/>
<rectangle x1="-8.385" y1="10" x2="-8.115" y2="11" layer="51"/>
<rectangle x1="-8.885" y1="10" x2="-8.615" y2="11" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="EP2C8T144">
<wire x1="-63.5" y1="-63.5" x2="60.96" y2="-63.5" width="0.254" layer="94"/>
<wire x1="60.96" y1="-63.5" x2="60.96" y2="60.96" width="0.254" layer="94"/>
<wire x1="60.96" y1="60.96" x2="-63.5" y2="60.96" width="0.254" layer="94"/>
<wire x1="-63.5" y1="60.96" x2="-63.5" y2="-63.5" width="0.254" layer="94"/>
<text x="-5.08" y="1.27" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="IO1/ASDO" x="-68.58" y="43.18" length="middle" direction="out"/>
<pin name="IO2/NCSO" x="-68.58" y="40.64" length="middle" direction="out"/>
<pin name="IO3/CRC_ERROR" x="-68.58" y="38.1" length="middle"/>
<pin name="IO4/CLKUSR" x="-68.58" y="35.56" length="middle"/>
<pin name="IO7" x="-68.58" y="33.02" length="middle"/>
<pin name="IO8" x="-68.58" y="30.48" length="middle"/>
<pin name="IO9" x="-68.58" y="27.94" length="middle"/>
<pin name="IO24" x="-68.58" y="25.4" length="middle"/>
<pin name="IO25" x="-68.58" y="22.86" length="middle"/>
<pin name="IO28" x="-68.58" y="20.32" length="middle"/>
<pin name="IO30" x="-68.58" y="17.78" length="middle"/>
<pin name="IO31" x="-68.58" y="15.24" length="middle"/>
<pin name="IO32" x="-68.58" y="12.7" length="middle"/>
<pin name="IO40/DEV_OE" x="-68.58" y="10.16" length="middle"/>
<pin name="IO41" x="-68.58" y="7.62" length="middle"/>
<pin name="IO42" x="-68.58" y="5.08" length="middle"/>
<pin name="IO43" x="-68.58" y="2.54" length="middle"/>
<pin name="IO44" x="-68.58" y="0" length="middle"/>
<pin name="IO45" x="-68.58" y="-2.54" length="middle"/>
<pin name="IO47" x="-68.58" y="-5.08" length="middle"/>
<pin name="IO48" x="-68.58" y="-7.62" length="middle"/>
<pin name="IO51" x="-68.58" y="-10.16" length="middle"/>
<pin name="IO52" x="-68.58" y="-12.7" length="middle"/>
<pin name="IO53" x="-68.58" y="-15.24" length="middle"/>
<pin name="IO55" x="-68.58" y="-17.78" length="middle"/>
<pin name="IO57" x="-68.58" y="-20.32" length="middle"/>
<pin name="IO58" x="-68.58" y="-22.86" length="middle"/>
<pin name="IO59" x="-68.58" y="-25.4" length="middle"/>
<pin name="IO60" x="-68.58" y="-27.94" length="middle"/>
<pin name="IO63" x="-68.58" y="-30.48" length="middle"/>
<pin name="IO64" x="-68.58" y="-33.02" length="middle"/>
<pin name="IO65" x="-68.58" y="-35.56" length="middle"/>
<pin name="IO67" x="-68.58" y="-38.1" length="middle"/>
<pin name="IO69" x="-68.58" y="-40.64" length="middle"/>
<pin name="IO70" x="-68.58" y="-43.18" length="middle"/>
<pin name="IO71" x="-68.58" y="-45.72" length="middle"/>
<pin name="IO72" x="-45.72" y="-68.58" length="middle" rot="R90"/>
<pin name="IO73" x="-43.18" y="-68.58" length="middle" rot="R90"/>
<pin name="IO74" x="-40.64" y="-68.58" length="middle" rot="R90"/>
<pin name="IO75/INIT_DONE" x="-38.1" y="-68.58" length="middle" rot="R90"/>
<pin name="IO76/NCEO" x="-35.56" y="-68.58" length="middle" rot="R90"/>
<pin name="IO79" x="-33.02" y="-68.58" length="middle" rot="R90"/>
<pin name="IO86" x="-30.48" y="-68.58" length="middle" rot="R90"/>
<pin name="IO87" x="-27.94" y="-68.58" length="middle" rot="R90"/>
<pin name="IO92" x="-25.4" y="-68.58" length="middle" rot="R90"/>
<pin name="IO93" x="-22.86" y="-68.58" length="middle" rot="R90"/>
<pin name="IO94" x="-20.32" y="-68.58" length="middle" rot="R90"/>
<pin name="IO96" x="-17.78" y="-68.58" length="middle" rot="R90"/>
<pin name="IO97" x="-15.24" y="-68.58" length="middle" rot="R90"/>
<pin name="IO99" x="-12.7" y="-68.58" length="middle" rot="R90"/>
<pin name="IO100" x="-10.16" y="-68.58" length="middle" rot="R90"/>
<pin name="IO101" x="-7.62" y="-68.58" length="middle" rot="R90"/>
<pin name="IO103" x="-5.08" y="-68.58" length="middle" rot="R90"/>
<pin name="IO104" x="-2.54" y="-68.58" length="middle" rot="R90"/>
<pin name="IO112" x="0" y="-68.58" length="middle" rot="R90"/>
<pin name="IO113" x="2.54" y="-68.58" length="middle" rot="R90"/>
<pin name="IO114" x="5.08" y="-68.58" length="middle" rot="R90"/>
<pin name="IO115" x="7.62" y="-68.58" length="middle" rot="R90"/>
<pin name="IO118" x="10.16" y="-68.58" length="middle" rot="R90"/>
<pin name="IO119" x="12.7" y="-68.58" length="middle" rot="R90"/>
<pin name="IO120" x="15.24" y="-68.58" length="middle" rot="R90"/>
<pin name="IO121" x="17.78" y="-68.58" length="middle" rot="R90"/>
<pin name="IO122" x="20.32" y="-68.58" length="middle" rot="R90"/>
<pin name="IO125" x="22.86" y="-68.58" length="middle" rot="R90"/>
<pin name="IO126" x="25.4" y="-68.58" length="middle" rot="R90"/>
<pin name="IO129" x="27.94" y="-68.58" length="middle" rot="R90"/>
<pin name="IO132" x="30.48" y="-68.58" length="middle" rot="R90"/>
<pin name="IO133" x="33.02" y="-68.58" length="middle" rot="R90"/>
<pin name="IO134" x="35.56" y="-68.58" length="middle" rot="R90"/>
<pin name="IO135" x="38.1" y="-68.58" length="middle" rot="R90"/>
<pin name="IO136" x="40.64" y="-68.58" length="middle" rot="R90"/>
<pin name="IO137" x="43.18" y="-68.58" length="middle" rot="R90"/>
<pin name="IO139" x="66.04" y="-45.72" length="middle" rot="R180"/>
<pin name="IO141" x="66.04" y="-43.18" length="middle" rot="R180"/>
<pin name="IO142/DEV_CLRN" x="66.04" y="-40.64" length="middle" rot="R180"/>
<pin name="IO143" x="66.04" y="-38.1" length="middle" rot="R180"/>
<pin name="IO144" x="66.04" y="-35.56" length="middle" rot="R180"/>
<pin name="CLK0@17" x="66.04" y="-33.02" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK1@18" x="66.04" y="-30.48" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK2@21" x="66.04" y="-27.94" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK3@22" x="66.04" y="-25.4" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK4@91" x="66.04" y="-22.86" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK5@90" x="66.04" y="-20.32" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK6@89" x="66.04" y="-17.78" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="CLK7@88" x="66.04" y="-15.24" length="middle" direction="in" swaplevel="2" rot="R180"/>
<pin name="DATA0@14" x="66.04" y="-12.7" length="middle" rot="R180"/>
<pin name="DCLK@15" x="66.04" y="-10.16" length="middle" rot="R180"/>
<pin name="MSEL0@85" x="66.04" y="-7.62" length="middle" direction="in" rot="R180"/>
<pin name="MSEL1@84" x="66.04" y="-5.08" length="middle" direction="in" rot="R180"/>
<pin name="CONF_DONE@83" x="66.04" y="-2.54" length="middle" direction="in" rot="R180"/>
<pin name="NCE@16" x="66.04" y="0" length="middle" direction="in" rot="R180"/>
<pin name="NCONFIG@20" x="66.04" y="2.54" length="middle" direction="in" rot="R180"/>
<pin name="NSTATUS@82" x="66.04" y="5.08" length="middle" direction="in" rot="R180"/>
<pin name="TCK@12" x="66.04" y="7.62" length="middle" direction="in" rot="R180"/>
<pin name="TMS@11" x="66.04" y="10.16" length="middle" direction="in" rot="R180"/>
<pin name="TDI@13" x="66.04" y="12.7" length="middle" direction="in" rot="R180"/>
<pin name="TDO@10" x="66.04" y="15.24" length="middle" direction="out" rot="R180"/>
<pin name="VCCINT@26" x="66.04" y="17.78" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCINT@50" x="66.04" y="20.32" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCINT@62" x="66.04" y="22.86" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCINT@81" x="66.04" y="25.4" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCINT@124" x="66.04" y="27.94" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCINT@131" x="66.04" y="30.48" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCD_PLL1@35" x="66.04" y="33.02" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCA_PLL1@37" x="66.04" y="35.56" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCA_PLL2@109" x="66.04" y="40.64" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCD_PLL2@107" x="66.04" y="38.1" length="middle" direction="pwr" rot="R180"/>
<pin name="VCCIO@138" x="45.72" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@127" x="43.18" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@116" x="40.64" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@102" x="38.1" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@95" x="35.56" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@77" x="33.02" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@66" x="30.48" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@54" x="27.94" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@46" x="25.4" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@29" x="22.86" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@23" x="20.32" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="VCCIO@5" x="17.78" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@140" x="-45.72" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GNDA_PLL2@110" x="-30.48" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND_PLL1@34" x="5.08" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND_PLL1@36" x="2.54" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GNDA_PLL1@38" x="0" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@6" x="15.24" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@33" x="7.62" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@39" x="-2.54" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@49" x="-5.08" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@56" x="-7.62" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@61" x="-10.16" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@68" x="-12.7" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@78" x="-15.24" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@80" x="-17.78" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@98" x="-20.32" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@105" x="-22.86" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND_PLL2@106" x="-25.4" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND_PLL2@108" x="-27.94" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@19" x="12.7" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@111" x="-33.02" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@117" x="-35.56" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@123" x="-38.1" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@128" x="-40.64" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@130" x="-43.18" y="66.04" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@27" x="10.16" y="66.04" length="middle" direction="pwr" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="EP2C8T144" prefix="IC">
<description>&lt;b&gt;EP2C8T144&lt;/b&gt;&lt;p&gt;
manualy modified from altera library&lt;br&gt;</description>
<gates>
<gate name="G$1" symbol="EP2C8T144" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TQFP144">
<connects>
<connect gate="G$1" pin="CLK0@17" pad="17"/>
<connect gate="G$1" pin="CLK1@18" pad="18"/>
<connect gate="G$1" pin="CLK2@21" pad="21"/>
<connect gate="G$1" pin="CLK3@22" pad="22"/>
<connect gate="G$1" pin="CLK4@91" pad="91"/>
<connect gate="G$1" pin="CLK5@90" pad="90"/>
<connect gate="G$1" pin="CLK6@89" pad="89"/>
<connect gate="G$1" pin="CLK7@88" pad="88"/>
<connect gate="G$1" pin="CONF_DONE@83" pad="83"/>
<connect gate="G$1" pin="DATA0@14" pad="14"/>
<connect gate="G$1" pin="DCLK@15" pad="15"/>
<connect gate="G$1" pin="GND@105" pad="105"/>
<connect gate="G$1" pin="GND@111" pad="111"/>
<connect gate="G$1" pin="GND@117" pad="117"/>
<connect gate="G$1" pin="GND@123" pad="123"/>
<connect gate="G$1" pin="GND@128" pad="128"/>
<connect gate="G$1" pin="GND@130" pad="130"/>
<connect gate="G$1" pin="GND@140" pad="140"/>
<connect gate="G$1" pin="GND@19" pad="19"/>
<connect gate="G$1" pin="GND@27" pad="27"/>
<connect gate="G$1" pin="GND@33" pad="33"/>
<connect gate="G$1" pin="GND@39" pad="39"/>
<connect gate="G$1" pin="GND@49" pad="49"/>
<connect gate="G$1" pin="GND@56" pad="56"/>
<connect gate="G$1" pin="GND@6" pad="6"/>
<connect gate="G$1" pin="GND@61" pad="61"/>
<connect gate="G$1" pin="GND@68" pad="68"/>
<connect gate="G$1" pin="GND@78" pad="78"/>
<connect gate="G$1" pin="GND@80" pad="80"/>
<connect gate="G$1" pin="GND@98" pad="98"/>
<connect gate="G$1" pin="GNDA_PLL1@38" pad="38"/>
<connect gate="G$1" pin="GNDA_PLL2@110" pad="110"/>
<connect gate="G$1" pin="GND_PLL1@34" pad="34"/>
<connect gate="G$1" pin="GND_PLL1@36" pad="36"/>
<connect gate="G$1" pin="GND_PLL2@106" pad="106"/>
<connect gate="G$1" pin="GND_PLL2@108" pad="108"/>
<connect gate="G$1" pin="IO1/ASDO" pad="1"/>
<connect gate="G$1" pin="IO100" pad="100"/>
<connect gate="G$1" pin="IO101" pad="101"/>
<connect gate="G$1" pin="IO103" pad="103"/>
<connect gate="G$1" pin="IO104" pad="104"/>
<connect gate="G$1" pin="IO112" pad="112"/>
<connect gate="G$1" pin="IO113" pad="113"/>
<connect gate="G$1" pin="IO114" pad="114"/>
<connect gate="G$1" pin="IO115" pad="115"/>
<connect gate="G$1" pin="IO118" pad="118"/>
<connect gate="G$1" pin="IO119" pad="119"/>
<connect gate="G$1" pin="IO120" pad="120"/>
<connect gate="G$1" pin="IO121" pad="121"/>
<connect gate="G$1" pin="IO122" pad="122"/>
<connect gate="G$1" pin="IO125" pad="125"/>
<connect gate="G$1" pin="IO126" pad="126"/>
<connect gate="G$1" pin="IO129" pad="129"/>
<connect gate="G$1" pin="IO132" pad="132"/>
<connect gate="G$1" pin="IO133" pad="133"/>
<connect gate="G$1" pin="IO134" pad="134"/>
<connect gate="G$1" pin="IO135" pad="135"/>
<connect gate="G$1" pin="IO136" pad="136"/>
<connect gate="G$1" pin="IO137" pad="137"/>
<connect gate="G$1" pin="IO139" pad="139"/>
<connect gate="G$1" pin="IO141" pad="141"/>
<connect gate="G$1" pin="IO142/DEV_CLRN" pad="142"/>
<connect gate="G$1" pin="IO143" pad="143"/>
<connect gate="G$1" pin="IO144" pad="144"/>
<connect gate="G$1" pin="IO2/NCSO" pad="2"/>
<connect gate="G$1" pin="IO24" pad="24"/>
<connect gate="G$1" pin="IO25" pad="25"/>
<connect gate="G$1" pin="IO28" pad="28"/>
<connect gate="G$1" pin="IO3/CRC_ERROR" pad="3"/>
<connect gate="G$1" pin="IO30" pad="30"/>
<connect gate="G$1" pin="IO31" pad="31"/>
<connect gate="G$1" pin="IO32" pad="32"/>
<connect gate="G$1" pin="IO4/CLKUSR" pad="4"/>
<connect gate="G$1" pin="IO40/DEV_OE" pad="40"/>
<connect gate="G$1" pin="IO41" pad="41"/>
<connect gate="G$1" pin="IO42" pad="42"/>
<connect gate="G$1" pin="IO43" pad="43"/>
<connect gate="G$1" pin="IO44" pad="44"/>
<connect gate="G$1" pin="IO45" pad="45"/>
<connect gate="G$1" pin="IO47" pad="47"/>
<connect gate="G$1" pin="IO48" pad="48"/>
<connect gate="G$1" pin="IO51" pad="51"/>
<connect gate="G$1" pin="IO52" pad="52"/>
<connect gate="G$1" pin="IO53" pad="53"/>
<connect gate="G$1" pin="IO55" pad="55"/>
<connect gate="G$1" pin="IO57" pad="57"/>
<connect gate="G$1" pin="IO58" pad="58"/>
<connect gate="G$1" pin="IO59" pad="59"/>
<connect gate="G$1" pin="IO60" pad="60"/>
<connect gate="G$1" pin="IO63" pad="63"/>
<connect gate="G$1" pin="IO64" pad="64"/>
<connect gate="G$1" pin="IO65" pad="65"/>
<connect gate="G$1" pin="IO67" pad="67"/>
<connect gate="G$1" pin="IO69" pad="69"/>
<connect gate="G$1" pin="IO7" pad="7"/>
<connect gate="G$1" pin="IO70" pad="70"/>
<connect gate="G$1" pin="IO71" pad="71"/>
<connect gate="G$1" pin="IO72" pad="72"/>
<connect gate="G$1" pin="IO73" pad="73"/>
<connect gate="G$1" pin="IO74" pad="74"/>
<connect gate="G$1" pin="IO75/INIT_DONE" pad="75"/>
<connect gate="G$1" pin="IO76/NCEO" pad="76"/>
<connect gate="G$1" pin="IO79" pad="79"/>
<connect gate="G$1" pin="IO8" pad="8"/>
<connect gate="G$1" pin="IO86" pad="86"/>
<connect gate="G$1" pin="IO87" pad="87"/>
<connect gate="G$1" pin="IO9" pad="9"/>
<connect gate="G$1" pin="IO92" pad="92"/>
<connect gate="G$1" pin="IO93" pad="93"/>
<connect gate="G$1" pin="IO94" pad="94"/>
<connect gate="G$1" pin="IO96" pad="96"/>
<connect gate="G$1" pin="IO97" pad="97"/>
<connect gate="G$1" pin="IO99" pad="99"/>
<connect gate="G$1" pin="MSEL0@85" pad="85"/>
<connect gate="G$1" pin="MSEL1@84" pad="84"/>
<connect gate="G$1" pin="NCE@16" pad="16"/>
<connect gate="G$1" pin="NCONFIG@20" pad="20"/>
<connect gate="G$1" pin="NSTATUS@82" pad="82"/>
<connect gate="G$1" pin="TCK@12" pad="12"/>
<connect gate="G$1" pin="TDI@13" pad="13"/>
<connect gate="G$1" pin="TDO@10" pad="10"/>
<connect gate="G$1" pin="TMS@11" pad="11"/>
<connect gate="G$1" pin="VCCA_PLL1@37" pad="37"/>
<connect gate="G$1" pin="VCCA_PLL2@109" pad="109"/>
<connect gate="G$1" pin="VCCD_PLL1@35" pad="35"/>
<connect gate="G$1" pin="VCCD_PLL2@107" pad="107"/>
<connect gate="G$1" pin="VCCINT@124" pad="124"/>
<connect gate="G$1" pin="VCCINT@131" pad="131"/>
<connect gate="G$1" pin="VCCINT@26" pad="26"/>
<connect gate="G$1" pin="VCCINT@50" pad="50"/>
<connect gate="G$1" pin="VCCINT@62" pad="62"/>
<connect gate="G$1" pin="VCCINT@81" pad="81"/>
<connect gate="G$1" pin="VCCIO@102" pad="102"/>
<connect gate="G$1" pin="VCCIO@116" pad="116"/>
<connect gate="G$1" pin="VCCIO@127" pad="127"/>
<connect gate="G$1" pin="VCCIO@138" pad="138"/>
<connect gate="G$1" pin="VCCIO@23" pad="23"/>
<connect gate="G$1" pin="VCCIO@29" pad="29"/>
<connect gate="G$1" pin="VCCIO@46" pad="46"/>
<connect gate="G$1" pin="VCCIO@5" pad="5"/>
<connect gate="G$1" pin="VCCIO@54" pad="54"/>
<connect gate="G$1" pin="VCCIO@66" pad="66"/>
<connect gate="G$1" pin="VCCIO@77" pad="77"/>
<connect gate="G$1" pin="VCCIO@95" pad="95"/>
</connects>
<technologies>
<technology name=""/>
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
<part name="IC2" library="robotter_ic" deviceset="EP2C8T144" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="-40.64" y="25.4"/>
<instance part="IC2" gate="G$1" x="147.32" y="25.4"/>
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
