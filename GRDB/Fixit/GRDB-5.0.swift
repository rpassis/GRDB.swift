// Fixits for changes introduced by GRDB 5.0.0

#if os(iOS)
import UIKit
#endif

extension AnyFetchRequest {
    @available(*, unavailable, message: "Define your own FetchRequest type instead.")
    public init(_ prepare: @escaping (Database, _ singleResult: Bool) throws -> (SelectStatement, RowAdapter?))
    { preconditionFailure() }
}

extension AssociationAggregate {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> AssociationAggregate<RowDecoder>
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> AssociationAggregate<RowDecoder>
    { preconditionFailure() }
}

extension DatabaseFunction {
    @available(*, unavailable, renamed: "callAsFunction(_:)")
    public func apply(_ arguments: SQLExpressible...) -> SQLExpression
    { preconditionFailure() }
}

extension DatabaseMigrator {
    @available(*, unavailable, renamed: "registerMigration(_:migrate:)")
    public mutating func registerMigrationWithDeferredForeignKeyCheck(
        _ identifier: String,
        migrate: @escaping (Database) throws -> Void)
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Wrap this method: reader.read(migrator.appliedMigrations) }")
    public func appliedMigrations(in reader: DatabaseReader) throws -> Set<String>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Wrap this method: reader.read(migrator.hasCompletedMigrations) }")
    public func hasCompletedMigrations(in reader: DatabaseReader) throws -> Bool
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Prefer reader.read(migrator.completedMigrations).contains(targetIdentifier)")
    public func hasCompletedMigrations(in reader: DatabaseReader, through targetIdentifier: String) throws -> Bool
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Prefer reader.read(migrator.completedMigrations).last")
    public func lastCompletedMigration(in reader: DatabaseReader) throws -> String?
    { preconditionFailure() }
}

extension DatabasePool {
    #if os(iOS)
    @available(*, unavailable, message: "Memory management is now enabled by default. This method does nothing.")
    public func setupMemoryManagement(in application: UIApplication) { preconditionFailure() }
    #endif
}

extension DatabaseQueue {
    #if os(iOS)
    @available(*, unavailable, message: "Memory management is now enabled by default. This method does nothing.")
    public func setupMemoryManagement(in application: UIApplication) { preconditionFailure() }
    #endif
}

extension FetchRequest {
    @available(*, unavailable, message: "Use makePreparedRequest(_:forSingleResult:) instead.")
    func prepare(_ db: Database, forSingleResult singleResult: Bool) throws -> (SelectStatement, RowAdapter?)
    { preconditionFailure() }
}

extension SQLExpression {
    @available(*, unavailable, message: "Use SQLLiteral initializer instead")
    public var sqlLiteral: SQLLiteral
    { preconditionFailure() }
}

@available(*, unavailable, message: "Build literal expressions with SQLLiteral.sqlExpression instead.")
public struct SQLExpressionLiteral: SQLExpression {
    public var sql: String { preconditionFailure() }
    public var arguments: StatementArguments { preconditionFailure() }
    
    public init(sql: String, arguments: StatementArguments = StatementArguments())
    { preconditionFailure() }
    
    public init(literal sqlLiteral: SQLLiteral)
    { preconditionFailure() }
    
    public func expressionSQL(_ context: inout SQLGenerationContext, wrappedInParenthesis: Bool) -> String
    { preconditionFailure() }
    
    public func qualifiedExpression(with alias: TableAlias) -> SQLExpression
    { preconditionFailure() }
}

extension SQLLiteral {
    @available(*, unavailable, message: "Use SQL interpolation instead.")
    public func mapSQL(_ transform: @escaping (String) -> String) -> SQLLiteral
    { preconditionFailure() }
}

@available(*, unavailable, renamed: "SQLAssociativeBinaryOperator")
typealias SQLLogicalBinaryOperator = SQLAssociativeBinaryOperator

extension SQLSpecificExpressible {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> SQLSelectable
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> SQLSelectable
    { preconditionFailure() }
}

extension Statement {
    @available(*, unavailable, renamed: "setUncheckedArguments(_:)")
    public func unsafeSetArguments(_ arguments: StatementArguments)
    { preconditionFailure() }
    
    @available(*, unavailable, renamed: "validateArguments(_:)")
    public func validate(arguments: StatementArguments) throws
    { preconditionFailure() }
}

extension ValueObservation where Reducer == Void {
    @available(*, unavailable, message: "Use request.observationForCount() instead")
    public static func trackingCount<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.RemoveDuplicates<ValueReducers.Fetch<Int>>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use request.observationForAll() instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllValues<Request.RowDecoder>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }

    @available(*, unavailable, message: "Use request.observationForFirst() instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllValues<Request.RowDecoder>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use request.observationForAll() instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllOptionalValues<Request.RowDecoder._Wrapped>>
        where Request.RowDecoder: _OptionalProtocol,
        Request.RowDecoder._Wrapped: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use request.observationForAll() instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllRecords<Request.RowDecoder>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use request.observationForFirst() instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request) ->
        ValueObservation<ValueReducers.OneRecord<Request.RowDecoder>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }

    @available(*, unavailable, message: "Use request.observationForAll() instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllRows>
        where Request.RowDecoder == Row
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use request.observationForFirst() instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.OneRow>
        where Request.RowDecoder == Row
    { preconditionFailure() }
}

extension ValueObservation where Reducer: ValueReducer {
    @available(*, unavailable, message: "Use start(in:onError:onChange:) instead.")
    public func start(
        in reader: DatabaseReader,
        onChange: @escaping (Reducer.Value) -> Void) throws -> TransactionObserver
    { preconditionFailure() }
}

extension ValueObservation where Reducer: ValueReducer, Reducer.Value: Equatable {
    @available(*, unavailable, renamed: "removeDuplicates")
    public func distinctUntilChanged() -> ValueObservation<ValueReducers.RemoveDuplicates<Reducer>>
    { preconditionFailure() }
}

extension ValueReducer where Value: Equatable {
    @available(*, unavailable, renamed: "removeDuplicates")
    public func distinctUntilChanged() -> ValueReducers.RemoveDuplicates<Self>
    { preconditionFailure() }
}

@available(*, unavailable, renamed: "ValueObservationScheduling")
typealias ValueScheduling = ValueObservationScheduling

#if SQLITE_HAS_CODEC
extension Configuration {
    @available(*, unavailable, message: "Use Database.usePassphrase(_:) in Configuration.prepareDatabase instead.")
    public var passphrase: String? {
        get { preconditionFailure() }
        set { preconditionFailure() }
    }
}

extension DatabasePool {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}

extension DatabaseQueue {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}
#endif
