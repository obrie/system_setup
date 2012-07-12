# RHTML Language spec
sudo sh -c "cat > /usr/share/gtksourceview-3.0/language-specs/rhtml.lang <<EOF
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<language id=\"rhtml\" _name=\"RHTML\" version=\"2.0\" _section=\"Markup\">
    <metadata>
      <property name=\"mimetypes\">text/rhtml</property>
      <property name=\"globs\">*.rhtml;*.html.erb</property>
    </metadata>
    <definitions>
      <context id=\"erb-block\">
        <start>&lt;%</start>
        <end>%&gt;</end>
        <include>
          <context ref=\"ruby:ruby:*\"/>
        </include>
      </context>
      <context id=\"rhtml\">
        <include>
          <context ref=\"html:html\"/>
          <context ref=\"erb-block\"/>
        </include>
      </context>
    </definitions>
</language>
EOF
"

# YAML Language spec
sudo sh -c "cat > /usr/share/gtksourceview-3.0/language-specs/yaml.lang <<EOF
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<language id=\"yaml\" _name=\"YAML\" version=\"2.0\" _section=\"Others\">
  <metadata>
    <property name=\"mimetypes\">text/x-yaml</property>
    <property name=\"globs\">*.yml</property>
    <property name=\"line-comment-start\">#</property>
  </metadata>

  <styles>
    <style id=\"escape-char\"     _name=\"Escaped Character\" map-to=\"def:special-char\"/>
    <style id=\"comment\"         _name=\"Comment\"           map-to=\"def:comment\"/>
    <style id=\"string\"          _name=\"String\"            map-to=\"def:string\"/>
    <style id=\"constant-string\" _name=\"Constant String\"   map-to=\"def:string\"/>
    <style id=\"key\"             _name=\"Key\"               map-to=\"def:type\"/>
    <style id=\"inner-key\"       _name=\"Inner Key\"         map-to=\"def:type\"/>
    <style id=\"scalar-value\"    _name=\"Scalar Value\"      map-to=\"def:identifier\"/>
  </styles>

  <definitions>

    <context id=\"erb-block\">
      <start>&lt;%</start>
      <end>%&gt;</end>
      <include>
        <context ref=\"ruby:ruby:*\"/>
      </include>
    </context>

    <context id=\"escape-char\" style-ref=\"escape-char\">
      <match>\\</match>
    </context>

    <context id=\"string\" style-ref=\"string\">
      <start>\"</start>
      <end>\"</end>
      <include>
        <context ref=\"def:line-continue\"/>
      </include>
    </context>

    <context id=\"constant-string\" style-ref=\"string\">
      <start>'</start>
      <end>'</end>
      <include>
        <context ref=\"def:line-continue\"/>
      </include>
    </context>

    <context id=\"key\" style-ref=\"key\">
      <match>^\w+[\t ]*:</match>
    </context>

    <context id=\"inner-key\" style-ref=\"inner-key\">
      <match>^[\t ]+\w+[\t ]*:</match>
    </context>

    <context id=\"scalar-value\" style-ref=\"scalar-value\">
      <match>\w*</match>
    </context>

    <context id=\"yaml\">
      <include>
        <context ref=\"erb-block\"/>
        <context ref=\"escape-char\"/>
        <context ref=\"string\"/>
        <context ref=\"constant-string\"/>
        <context ref=\"key\"/>
        <context ref=\"inner-key\"/>
        <context ref=\"scalar-value\"/>
      </include>
    </context>
  </definitions>

</language>
EOF
"

# Rails mime types
sudo sh -c "cat > /usr/share/mime/packages/rails.xml <<EOF
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<mime-info xmlns=\"http://www.freedesktop.org/standards/shared-mime-info\">
	<mime-type type=\"text/rjs\">
		<sub-class-of type=\"text/javascript\"/>
		<comment>Ruby JavaScript</comment>
		<glob pattern=\"*.rjs\"/>
		<glob pattern=\"*.js.erb\"/>
	</mime-type>
	<mime-type type=\"text/rhtml\">
		<sub-class-of type=\"text/html\"/>
		<comment>RHTML Template</comment>
		<glob pattern=\"*.rhtml\"/>
		<glob pattern=\"*.erb\"/>
	</mime-type>
	<mime-type type=\"application/x-ruby\">
		<comment>Ruby Rakefile</comment>
		<glob pattern=\"Rakefile\"/>
	</mime-type>
	<mime-type type=\"application/x-ruby\">
		<comment>Ruby Rake Task</comment>
		<glob pattern=\"*.rake\"/>
	</mime-type>
	<mime-type type=\"application/x-ruby\">
		<comment>Ruby XML Template</comment>
		<glob pattern=\"*.rxml\"/>
		<glob pattern=\"*.builder\"/>
	</mime-type>
	<mime-type type=\"text/x-yaml\">
		<comment>YAML Ain't Markup Language</comment>
		<glob pattern=\"*.yml\"/>
	</mime-type>
</mime-info>
EOF
"
sudo update-mime-database /usr/share/mime
