#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Type.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/CodeGen/ISDOpcodes.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/IPO.h"
#include <list>

#include "llvm/Transforms/ExtractCodeFlows/ExtractCodeFlows.h"

using namespace llvm;
namespace {
  struct ExtractCodeFlows : public ModulePass {
    static char ID; // Pass identification
    bool flag;
    ExtractCodeFlows() : ModulePass(ID) {}

    virtual bool runOnModule(Module &M){
      errs() << "Current module name: [" << M.getName() << "]\n";
      for (auto F = M.begin(), FE = M.end(); F != FE; ++F) {
        if (F->getName().compare("func") == 0) {
          Instruction &I = F->front().front();
          Instruction *newI = I.clone();
          newI->insertAfter(&I);
        }
        errs() << "Function: " << F->getName() << "\n";
        F->dump();
      }
      return true;
    }
  };
}



char ExtractCodeFlows::ID = 0;
static RegisterPass<ExtractCodeFlows> X("codeplag", "run codeplag module on LTO");

Pass *llvm::createExtractCodeFlows() {
  return new ExtractCodeFlows();
}
