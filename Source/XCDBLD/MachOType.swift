import Result

/// Describes the type of Mach-O files.
/// See https://developer.apple.com/library/mac/documentation/DeveloperTools/Reference/XcodeBuildSettingRef/1-Build_Setting_Reference/build_setting_ref.html#//apple_ref/doc/uid/TP40003931-CH3-SW73.
public enum MachOType: String {
	/// Executable binary.
	case executable = "mh_executable"

	/// Bundle binary.
	case bundle = "mh_bundle"

	/// Relocatable object file.
	case object = "mh_object"

	/// Dynamic library binary.
	case dylib = "mh_dylib"

	/// Static library binary.
	case staticlib = "staticlib"

	/// Attempts to parse a Mach-O type from a string returned from `xcodebuild`.
	public static func from(string string: String) -> Result<MachOType, Error> {
		return Result(self.init(rawValue: string), failWith: .parseError(description: "unexpected Mach-O type \"\(string)\""))
	}
}
