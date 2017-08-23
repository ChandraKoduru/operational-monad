module StackMachine where

type Program instr = [instr]
type Stack = [Int]

type StackProgram = Program StackInstruction
data StackInstruction = Push Int | Pop

example :: StackProgram
example = Push 5 : Push 42 : Pop : []

exampleTwice :: StackProgram
exampleTwice = example ++ example

empty :: StackProgram
empty = []

--(++) :: StackProgram -> StackProgram -> StackProgram
-- program appender

push :: Int -> StackProgram 
push n = Push n : []

pop :: StackProgram
pop = Pop : []

replace :: Int -> StackProgram
replace a = Pop : Push a : []

interpret :: StackProgram -> Stack -> Stack
interpret (Push a : is) stack = interpret is (a : stack)
interpret (Pop : is) stack    = interpret is (tail stack)
interpret [] stack            = stack

