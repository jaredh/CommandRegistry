//
//  CommandRegistry.swift
//  CommandRegistry
//
//  Created by Geoffrey Foster on 2018-11-07.
//

import Foundation
import Utility
import Basic

public struct Registry {
	private let parser: ArgumentParser
	private var commands: [Command] = []
	
	private let versionOption: OptionArgument<Bool>?
	private let version: Version?
	
	public init(usage: String, overview: String, version: Version? = nil) {
		self.parser = ArgumentParser(usage: usage, overview: overview)
		self.version = version
		if version != nil {
			self.versionOption = parser.add(option: "--version", shortName: "-v", kind: Bool.self, usage: "Version", completion: nil)
		} else {
			self.versionOption = nil
		}
	}
	
	public mutating func register(command: Command.Type) {
		commands.append(command.init(parser: parser))
	}
	
	public func run(arguments: [String] = ProcessInfo.processInfo.arguments) {
		do {
			let parsedArguments = try parse(arguments: arguments)
			try process(arguments: parsedArguments)
			exit(EXIT_SUCCESS)
		}
		catch let error as ArgumentParserError {
			print(error.description)
			exit(EXIT_FAILURE)
		}
		catch let error {
			print(error.localizedDescription)
			exit(EXIT_FAILURE)
		}
	}
	
	private func parse(arguments: [String]) throws -> ArgumentParser.Result {
		return try parser.parse(Array(arguments.dropFirst()))
	}
	
	private func process(arguments: ArgumentParser.Result) throws {
		if let versionOption = versionOption, arguments.get(versionOption) == true, let version = version {
			stdoutStream.write("\(version)\n")
			stdoutStream.flush()
			return
		}
		guard let subparser = arguments.subparser(parser),
			let command = commands.first(where: { $0.command == subparser }) else {
				parser.printUsage(on: stdoutStream)
				return
		}
		try command.run(with: arguments)
	}
}
