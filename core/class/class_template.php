<?php

class Template {

	private $values = array();
	private $tplname;
	private $content;

		function __construct($tplname) {

			
			$this->tplname = './templates/'.$tplname.'.tpl';
			
			if (file_exists($this->tplname)) {
				$this->content = file_get_contents($this->tplname);
			}
			else {
				//echo $tplname . "<br>";
				exit('Template not found :-[');
			}
		}

		public function assign($key, $value) {
			$this->values[$key] = $value;
		}

		public function show_contents() {

			foreach ($this->values as $key => $value) {
				$tags = '{' . $key . '}';
				$this->content = str_replace($tags, $value, $this->content);
			}
			echo $this->content;
		}	

		public function render(&$array) {
			require_once("$this->tplname");
		}
}

?>