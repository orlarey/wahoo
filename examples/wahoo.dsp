import("stdfaust.lib");
declare name "WAHOO";
oscFreq = vslider("h:WAAHOO/h:OSC/freq[style:knob][unit:Hz]",50,30,500,0.01);
oscGain = vslider("h:WAAHOO/h:OSC/gain[style:knob]",0.5,0,1,0.01);
lfoFreq = vslider("h:WAAHOO/h:LFO/freq[style:knob][unit:Hz]",0.5,0.01,50,0.01);
lfoRange = vslider("h:WAAHOO/h:LFO/range[style:knob]",300,10,5000,0.01);
LFO1 = os.lf_triangle(lfoFreq)*0.5 + 0.5;
LFO2 = os.lf_triangle(lfoFreq*1.01)*0.5 + 0.5;
process = os.sawtooth(oscFreq)*oscGain <: fi.resonlp(LFO1*lfoRange+50,5,1),fi.resonlp(LFO2*lfoRange+50,5,1);