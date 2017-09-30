
module DeepCover
  class LineCoverageInterpreter
    def initialize(covered_code)
      @covered_code = covered_code
    end

    def generate_results
      line_hits = Array.new(@covered_code.nb_lines)
      return line_hits unless @covered_code.covered_ast
      apply_line_hits(@covered_code.covered_ast, line_hits)
      line_hits
    end

    def apply_line_hits(node, line_hits)
      if ex = node.loc_hash[:expression]
        lineno = ex.line - 1
        line_hits[lineno] = [line_hits[lineno] || 0, node.flow_entry_count].max
      end
      node.children_nodes.each{|c| apply_line_hits(c, line_hits) }
    end
  end
end
