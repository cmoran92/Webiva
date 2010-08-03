
class WizardModel < HashModel

  def self.wizard_url
    { :controller => '/structure', :action => 'wizard', :path => self.name.underscore.split('/') }
  end

  def strict?; true; end # :nodoc:

  # override to setup default values
  def set_defaults; end

  def wizard_partial; '/structure/wizard_form'; end

  def root_node
    @root_node ||= SiteVersion.current.root_node
  end

  def destroy_basic_paragraph(rv)
    para = rv.page_paragraphs.first
    para.destroy if para.display_module == nil && para.display_type == 'html' && para.display_body.blank?
  end

  def find_page(title)
    SiteVersion.current.site_nodes.with_type('P').find_by_title title
  end

  # Must define a run_wizard method
  # def run_wizard; end
end