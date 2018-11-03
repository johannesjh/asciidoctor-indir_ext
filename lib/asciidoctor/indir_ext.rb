require_relative 'indir_ext/extension'

Asciidoctor::Extensions.register do
  include_processor Asciidoctor::IndirExt::IndirIncludeProcessor
end
