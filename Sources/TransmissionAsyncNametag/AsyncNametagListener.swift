//
//  AsyncNametagListener.swift
//
//
//  Created by Dr. Brandon Wiley on 6/19/24.
//

import Foundation
import Logging

import TransmissionAsync

public class AsyncNametagListener
{
    let listener: AsyncListener
    let logger: Logger

    public init(_ listener: AsyncListener, _ logger: Logger)
    {
        self.listener = listener
        self.logger = logger
    }

    public func accept() async throws -> AsyncNametagServerConnection
    {
        let connection = try await listener.accept()
        return try await AsyncNametagServerConnection(connection, self.logger)
    }
    
    public func close() async throws
    {
        try await self.listener.close()
    }
}
