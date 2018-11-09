require 'asciidoctor/include_ext/include_processor'

module Asciidoctor
  module IndirExt
    ##
    # An alternative implementation based on asciidoctor-include-ext
    class IndirIncludeProcessor2 < Asciidoctor::IncludeExt::IncludeProcessor
      def initialize(*args, &block)
        # temporary storage helper that won't be frozen by Asciidoctor
        @tmp = { }
        super
      end

      def process(document, reader, target, attributes)
        @tmp[:document] = document
        @tmp[:reader] = reader
        @tmp[:target] = target
        super
      end

      def read_lines(filename, selector)
        # read content using functionality from super
        content = super(filename, selector)

        # split content into a list of lines if it has been provided as string
        if content.is_a? String then content = content.lines end

        # Set variables at the beginning of the included content
        included_docfile = @tmp[:target]
        included_docdir = ::File.dirname @tmp[:target]
        content.unshift ''
        content.unshift %(:indir: #{included_docdir})

        # Reset the variables at the end of the included content
        parent_docfile = @tmp[:reader].include_stack&.dig(-1, 1) || (@tmp[:document].attr 'docfile')
        parent_docdir = ::File.dirname parent_docfile
        content << ''
        content << %(:indir: #{parent_docdir})
        return content
      end
    end
  end
end