TPROBSFILE=translator/translate.probs

# the previous translation grammar "Parse" now replaced by Translate:

# Dummy targets, just for convenience
Translate: TranslateEng TranslateBul TranslateEus TranslateChi TranslateGer TranslateSwe TranslateHin TranslateFin TranslateFre Translate8
TranslateEng: TranslateEng.pgf
TranslateBul: TranslateBul.pgf
TranslateChi: TranslateChi.pgf
TranslateGer: TranslateGer.pgf
TranslateDut: TranslateDut.pgf
TranslateSwe: TranslateSwe.pgf
TranslateHin: TranslateHin.pgf
TranslateFin: TranslateFin.pgf
TranslateFre: TranslateFre.pgf
TranslateIta: TranslateIta.pgf
TranslateSpa: TranslateSpa.pgf
TranslateEus: TranslateEus.pgf

S=-s
GFMKT=mkdir -p ../translator && gf $S -make -literal=PN,Symb -probs=$(TPROBSFILE) -gfo-dir ../translator

TRANSLATE8=TranslateEng.pgf TranslateBul.pgf TranslateChi.pgf TranslateGer.pgf TranslateSwe.pgf TranslateHin.pgf TranslateFin.pgf TranslateFre.pgf
TRANSLATE10=TranslateEng.pgf TranslateBul.pgf TranslateChi.pgf TranslateGer.pgf TranslateSwe.pgf TranslateHin.pgf TranslateFin.pgf TranslateFre.pgf TranslateIta.pgf TranslateSpa.pgf

TRANSLATE11=$(TRANSLATE10) TranslateDut.pgf

TRANSLATE15=$(TRANSLATE10) TranslateDut.pgf TranslateCat.pgf TranslateEst.pgf TranslateTha.pgf TranslateJpn.pgf

# Without dependencies:
Translate10:
	$(GFMKT) -name=Translate10 $(TRANSLATE10) +RTS -K32M

# With dependencies:
Translate10.pgf: $(TRANSLATE10)
	$(GFMKT) -name=Translate10 $(TRANSLATE10) +RTS -K32M

# Without dependencies:
Translate11:
	$(GFMKT) -name=Translate11 $(TRANSLATE11) +RTS -K32M

# With dependencies:
Translate11.pgf: $(TRANSLATE11)
	$(GFMKT) -name=Translate11 $(TRANSLATE11) +RTS -K32M

# Without dependencies:
Translate8:
	$(GFMKT) -name=Translate8 $(TRANSLATE8) +RTS -K32M

# With dependencies:
Translate8.pgf: $(TRANSLATE8)
	$(GFMKT) -name=Translate8 $(TRANSLATE8) +RTS -K32M

Translate15.pgf: $(TRANSLATE15)
	$(GFMKT) -name=Translate15 $(TRANSLATE15) +RTS -K32M

# Translate grammars for individual languages
TranslateEng.pgf:: ; $(GFMKT) -name=TranslateEng translator/TranslateEng.gf
TranslateBul.pgf:: ; $(GFMKT) -name=TranslateBul translator/TranslateBul.gf
TranslateChi.pgf:: ; $(GFMKT) -name=TranslateChi translator/TranslateChi.gf +RTS -K200M
TranslateEus.pgf:: ; $(GFMKT) -name=TranslateEus translator/TranslateEus.gf
TranslateFin.pgf:: ; $(GFMKT) -name=TranslateFin translator/TranslateFin.gf +RTS -K64M
TranslateGer.pgf:: ; $(GFMKT) -name=TranslateGer translator/TranslateGer.gf
TranslateDut.pgf:: ; $(GFMKT) -name=TranslateDut translator/TranslateDut.gf
TranslateHin.pgf:: ; $(GFMKT) -name=TranslateHin translator/TranslateHin.gf
TranslateFre.pgf:: ; $(GFMKT) -name=TranslateFre translator/TranslateFre.gf +RTS -K64M
TranslateSwe.pgf:: ; $(GFMKT) -name=TranslateSwe translator/TranslateSwe.gf
TranslateIta.pgf:: ; $(GFMKT) -name=TranslateIta translator/TranslateIta.gf +RTS -K64M
TranslateSpa.pgf:: ; $(GFMKT) -name=TranslateSpa translator/TranslateSpa.gf +RTS -K64M
TranslateCat.pgf:: ; $(GFMKT) -name=TranslateCat translator/TranslateCat.gf +RTS -K64M
TranslateEst.pgf:: ; $(GFMKT) -name=TranslateEst translator/TranslateEst.gf +RTS -K64M
TranslateTha.pgf:: ; $(GFMKT) -name=TranslateTha translator/TranslateTha.gf +RTS -K64M
TranslateJpn.pgf:: ; $(GFMKT) -name=TranslateJpn translator/TranslateJpn.gf +RTS -K64M

# Selected language pairs:
TranslateEngFin: ; $(GFMKT) -name=TranslateEngFin TranslateEng.pgf TranslateFin.pgf
TranslateEngGer: ; $(GFMKT) -name=TranslateEngGer TranslateEng.pgf TranslateGer.pgf
TranslateEngHin: ; $(GFMKT) -name=TranslateEngHin TranslateEng.pgf TranslateHin.pgf
TranslateEngBul: ; $(GFMKT) -name=TranslateEngBul TranslateEng.pgf TranslateBul.pgf
TranslateEngSpa: ; $(GFMKT) -name=TranslateEngSpa TranslateEng.pgf TranslateSpa.pgf
TranslateEngFre: ; $(GFMKT) -name=TranslateEngFre TranslateEng.pgf TranslateFre.pgf
TranslateEngSwe: ; $(GFMKT) -name=TranslateEngSwe TranslateEng.pgf TranslateSwe.pgf
TranslateEngChi: ; $(GFMKT) -name=TranslateEngChi TranslateEng.pgf TranslateChi.pgf
