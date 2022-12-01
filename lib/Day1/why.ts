type Split<T, S> = T extends `${infer A}${S}${infer B}` ? [A, ...Split<B, S>] : [T]
type Length<T extends any[]> = T extends { length: infer L } ? L : never
type BuildTuple<L extends number, T extends any[] = []> = T extends { length: L } ? T : BuildTuple<L, [...T, any]>
type Add<A extends number, B extends number> = Length<[...BuildTuple<A>, ...BuildTuple<B>]>
type Sum<T extends any[]> = T extends [infer A, ...infer B] ? Add<ParseNumber<A>, Sum<B>> : 0
type ParseNumber<T> = T extends `${infer V extends number}` ? V : 0

type groups = Split<`10
20
30

40

50
60

70
80
90

10`, "\n\n">

type Merge<T extends any[]> = T extends [infer R, ...infer Rest]
  ? [Sum<Split<R, "\n">>, ...Merge<Rest>]
  : []

const answer: Merge<groups>
