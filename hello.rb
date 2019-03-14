

# .rubocop.yml for RB101 Lessons 2-5 (26 Nov 2018)

AllCops:
  # Display cop names
  DisplayCopNames: true
  # Display Extra details
  ExtraDetails: true
  # Style guide URLs are not displayed in offense messages by default. Change
  # behavior by overriding DisplayStyleGuide, or by giving the
  # -S/--display-style-guide option.
  DisplayStyleGuide: true
  # When specifying style guide URLs, any paths and/or fragments will be
  # evaluated relative to the base URL.
  StyleGuideBaseURL: https://github.com/bbatsov/ruby-style-guide
  # What version of the Ruby interpreter is the inspected code intended to
  # run on? (If there is more than one, set this to the lowest version.)
  TargetRubyVersion: 2.4.1

Style/BlockComments:
  Description: 'Do not use block comments.'
  Enabled: false

Style/BracesAroundHashParameters:
  Description: Forces certain brace styles when the last argument is a hash.
  Enabled: false

Style/CommandLiteral:
  Description: 'Use `` or %x around command literals.'
  Enabled: true
  # backticks: Always use backticks.
  # percent_x: Always use %x.
  # mixed: Use backticks on single-line commands, and %x on multi-line commands.
  EnforcedStyle: mixed
  SupportedStyles:
    - backticks
    - percent_x
    - mixed
  # If false, the cop will always recommend using %x if one or more backticks
  # are found in the command string.
  AllowInnerBackticks: false

Style/CommentAnnotation:
  Description: >-
    Checks formatting of special comments (TODO, FIXME, OPTIMIZE, HACK, REVIEW).
  Enabled: false

Style/Documentation:
  Description: 'Document classes and non-namespace modules.'
  Enabled: false

Style/DoubleNegation:
  Description: 'Checks for uses of double negation (!!).'
  Enabled: false

Style/EmptyLineBetweenDefs:
  Enabled: true
  AllowAdjacentOneLineDefs: true

Style/EmptyLiteral:
  Description: Prefer literals to Array.new/Hash.new/String.new.
  Enabled: false

Style/FrozenStringLiteralComment:
  Enabled: false
  Description: Require the addition of the frozen string literal comment.

Style/GuardClause:
  Description: Check for conditionals that can be replaced with guard clauses.
  Enabled: false

Style/HashSyntax:
  Description: >-
                 Prefer Ruby 1.9 hash syntax { a: 1, b: 2 } over 1.8 syntax
                 { :a => 1, :b => 2 }.
  Enabled: true
  EnforcedStyle: ruby19_no_mixed_keys
  UseHashRocketsWithSymbolValues: false
  PreferHashRocketsForNonAlnumEndingSymbols: false

Style/IfUnlessModifier:
  Description: >-
                 Favor modifier if/unless usage when you have a
                 single-line body.
  Enabled: false

Style/InlineComment:
  Description: Avoid inline comments.
  Enabled: false

Style/MethodCallParentheses:
  Description: Do not use parentheses for method calls with no arguments.
  Enabled: false

Style/ModuleFunction:
  Description: Checks for usage of `extend self` in modules.
  Enabled: false

Style/MutableConstant:
  Description: Freeze mutable constants.
  Enabled: false

Style/NegatedIf:
  Description: >-
                 Favor unless over if for negative conditions
                 (or control flow or).
  Enabled: false

Style/NegatedWhile:
  Description: 'Favor until over while for negative conditions.'
  Enabled: false

Style/Next:
  Description: 'Use `next` to skip iteration instead of a condition at the end.'
  Enabled: false

Style/NumericLiterals:
  Description: Add underscores to large numeric literals to improve their readability.
  Enabled: false

Style/NumericPredicate:
  Description: >-
                 Checks for the use of predicate- or comparison methods for
                 numeric comparisons.
  Enabled: false

Style/OneLineConditional:
  Description: Favor the ternary operator(?:) over if/then/else/end constructs.
  Enabled: false

Style/OpMethod:
  Description: When defining binary operators, name the argument other.
  Enabled: false

Style/ParenthesesAroundCondition:
  Description: >-
                 Don't use parentheses around the condition of an
                 if/unless/while.
  Enabled: true
  AllowSafeAssignment: false

Style/PercentLiteralDelimiters:
  Description: 'Use `%`-literal delimiters consistently'
  Enabled: false

Style/PerlBackrefs:
  Description: Avoid Perl-style regex back references.
  Enabled: false

Style/Proc:
  Description: Use proc instead of Proc.new.
  Enabled: false

Style/RedundantReturn:
  Description: "Don't use return where it's not required."
  Enabled: true
  # When true allows code like `return x, y`.
  AllowMultipleReturnValues: true

Style/RegexpLiteral:
  Description: 'Use / or %r around regular expressions.'
  Enabled: true
  EnforcedStyle: mixed
  AllowInnerSlashes: false

Style/SafeNavigation:
  Description: >-
                  This cop transforms usages of a method call safeguarded by
                  a check for the existance of the object to
                  safe navigation (`&.`).
  Enabled: false

Style/SingleLineBlockParams:
  Description: Enforces the names of some block params.
  Enabled: false

Style/SingleLineMethods:
  Description: Avoid single-line methods.
  Enabled: false

Style/SpaceAroundEqualsInParameterDefault:
  Enabled: false

Style/StringLiterals:
  Description: Force use of single or double quotes when no interpolation
  Enabled: false

Style/SymbolArray:
  Description: 'Use %i or %I for arrays of symbols.'
  StyleGuide: '#percent-i'
  Enabled: false

Style/WhileUntilModifier:
  Description: Favor modifier while/until usage when you have a single-line body.
  Enabled: false

Style/WordArray:
  Description: 'Use %w or %W for arrays of words.'
  Enabled: false

Metrics/AbcSize:
  Description: >-
                 A calculated magnitude based on number of assignments,
                 branches, and conditions.
  Enabled: true
  Max: 18

Metrics/BlockLength:
  Description: Limit size of blocks.
  Enabled: false

Metrics/ClassLength:
  Description: 'Avoid classes longer than 100 lines of code.'
  Enabled: false

Metrics/LineLength:
  Description: Limit lines to 80 characters.
  Enabled: true
  Max: 80
  StyleGuide: https://github.com/bbatsov/ruby-style-guide#80-character-limits
  AllowURI: true
  URISchemes:
  - http
  - https

Metrics/MethodLength:
  Description: 'Avoid methods longer than 15 lines of code.'
  Enabled: true
  CountComments: false  # count full line comments?
  Max: 15

Lint/LiteralInInterpolation:
  Description: 'Avoid interpolating literals in strings'
  AutoCorrect: false
  Enabled: true

##################### Performance ##################################

Performance/Casecmp:
  Description: 'Use `casecmp` rather than `downcase ==`.'
  Reference: 'https://github.com/JuanitoFatas/fast-ruby#stringcasecmp-vs-stringdowncase---code'
  Enabled: false

Performance/RedundantMatch:
  Description: >-
                  Use `=~` instead of `String#match` or `Regexp#match` in a context where the
                  returned `MatchData` is not needed.
  Enabled: false