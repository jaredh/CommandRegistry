//
//  Command.swift
//  stringray
//
//  Created by Geoffrey Foster on 2018-11-04.
//

import Foundation
import Utility

public protocol Command {
	var command: String { get }
	var overview: String { get }
	
	init(parser: ArgumentParser)
	func run(with arguments: ArgumentParser.Result) throws
}
