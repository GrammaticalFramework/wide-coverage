--# -path=.:../chunk

concrete TranslateEng of Translate = 
  TenseX - [Pol, PNeg, PPos],
  CatEng,
  NounEng - [
    PPartNP
    ,DetNP  -- Eng exception
    ,OrdNumeralSuperl  -- variants third largest | third-largest
    ],
  AdjectiveEng,
  NumeralEng,
  SymbolEng [
    PN, Symb, String, CN, Card, NP, MkSymb, SymbPN, CNNumNP,
    addGenitiveS
    ],
  ConjunctionEng,
  VerbEng - [
    UseCopula,                    -- just removed: not needed
    PassV2,                       -- generalized in Extensions
    AdvVP,                        -- more liberal placement of adv
    ComplVS, SlashV2S, ComplSlash -- Eng exceptions
    ],
  AdverbEng,
  PhraseEng,
  SentenceEng - [
    UseCl     -- replaced by UseCl | ContractedUseCl
    ],        
  QuestionEng - [
    QuestVP   -- replaced by QuestVP | contracted QuestVP
    ],       
  RelativeEng - [IdRP],
  IdiomEng,
  ConstructionEng,
  DocumentationEng,

  ChunkEng,
  ExtensionsEng [
    CompoundN,AdAdV,UttAdV,ApposNP,MkVPI, MkVPS, PredVPS, PassVPSlash, PassAgentVPSlash, CompoundAP
    , DirectComplVS, DirectComplVQ, FocusObjS
    , PastPartAP, PastPartAgentAP, PresPartAP, GerundNP, GerundAdv
    , WithoutVP, InOrderToVP, ByVP
    ],
  DictionaryEng ** 
open MorphoEng, ResEng, ParadigmsEng, (G = GrammarEng), (E = ExtraEng), Prelude in {

flags
  literal=Symb ;

-- exceptional linearizations
lin

  UseCl t p cl = 
     G.UseCl t p cl              -- I am here
   | E.ContractedUseCl t p cl    -- I'm here
   ;

  QuestVP qp vp = 
     G.QuestVP qp vp             -- who is there
   | 
      let cl = mkClause (qp.s ! npNom) (agrP3 qp.n) vp   -- who's there
      in {s = \\t,a,b,_ => cl.s ! t ! a ! b ! ODir True}
   ;

  ComplVS vs s = G.ComplVS vs s | E.ComplBareVS vs s ;
  SlashV2S vs s = G.SlashV2S vs s | E.SlashBareV2S vs s ;
  ComplSlash vps np = G.ComplSlash vps np | E.ComplSlashPartLast vps np ;

  AdvVP vp adv = G.AdvVP vp adv | insertObjPre (\\_ => adv.s) vp ; -- I bought a car today | I bought today a car

  PPos = {s = [] ; p = CPos} ;
  PNeg = {s = [] ; p = CNeg True} | {s = [] ; p = CNeg False} ;

  IdRP = ExtensionsEng.that_RP | G.IdRP | ExtensionsEng.who_RP |
     { s = table {
        RC _ (NCase Gen) | RC _ NPNomPoss => "whose" ; 
        RC _ NPAcc    => [] ;
        _     => "which"
        } ;
      a = RNoAg
      } ;

  DetNP d = G.DetNP d | G.DetCN d (UseN (mkN "one")) ; -- I like this / I like this one ; it / the one

  OrdNumeralSuperl n a = G.OrdNumeralSuperl n a | {s = \\c => n.s ! NOrd ! Nom ++ Predef.BIND ++ "-" ++ Predef.BIND ++ a.s ! AAdj Superl c} ;

}
