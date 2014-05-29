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
  ExtensionsDut [CompoundN,AdAdV,UttAdV,ApposNP,MkVPI, MkVPS, PredVPS, PassVPSlash, PassAgentVPSlash, CompoundAP],

  DictionaryDut ** 
open MorphoDut, ResDut, ParadigmsDut, SyntaxDut, (E = ExtraDut), Prelude in {

flags
  literal=Symb ;

}
