--# -path=.:../chunk:alltenses

concrete TranslateDut of Translate = 
  TenseX,
  NounDut - [PPartNP],
  AdjectiveDut,
  NumeralDut,
  SymbolDut [
    PN, Symb, String, CN, Card, NP, MkSymb, SymbPN, CNNumNP
    ],
  ConjunctionDut,
  VerbDut -  [
    UseCopula,  
    PassV2
    ],
  AdverbDut,
  PhraseDut,
  SentenceDut,
  QuestionDut,
  RelativeDut,
  IdiomDut,
----  ConstructionDut,
----  DocumentationDut,

  ChunkDut,
  ExtensionsDut [CompoundCN,AdAdV,UttAdV,ApposNP,MkVPI, MkVPS, PredVPS, PassVPSlash, PassAgentVPSlash],

  DictionaryDut ** 
open MorphoDut, ResDut, ParadigmsDut, SyntaxDut, (E = ExtraDut), Prelude in {

flags
  literal=Symb ;

}
