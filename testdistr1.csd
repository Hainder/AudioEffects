<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;RT audio out
;-iadc    ;;;uncomment -iadc if RT audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o distort1.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
gifn	ftgen	0,0, 257, 9, .5,1,270
instr 1
	ktest linseg 440, 2,550, 2,100, 1,50 ,1,1000, 1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50, .1,1000, .1,50
	atestsig oscil .5, ktest

	 if p4==1 then
			;tremolo
			ktrem oscil .5 ,5
			atremout = atestsig * (ktrem + 1) 
			outs atremout, atremout 
			
			;distortion
		elseif p4==2 then
			kline line 0, 3, 2
			adist distort atestsig, 100, gifn
			outs adist, adist
			
			;delay
		elseif p4==3 then
			adel delay atestsig, 4
			outs atestsig+adel, atestsig+adel 

			;vibrato
		elseif p4==4 then
			ktrem oscil .01 ,10
			atemp delayr .5
			avibr deltap ktrem+.5/2
								delayw atestsig ;+ avibr*.3
			outs avibr,avibr
			display atestsig, .1, 3
			
			;def
	 elseif p4==0 then
	 		outs atestsig, atestsig 
	 endif
		

endin 

</CsInstruments>
<CsScore>
f 1 0 16384 10 1
i1 0 100 4
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>963</x>
 <y>275</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
