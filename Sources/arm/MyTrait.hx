package arm;

import haxe.ui.Toolkit;
import haxe.ui.components.*;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.core.UIEvent;

class MyTrait extends iron.Trait {

	static var _main:Component;
	var ready = false;

	public function new() {
		super();

		notifyOnInit(function() {

			iron.data.Data.getFont('arial.ttf', function(font:kha.Font) {
				kha.Assets.fonts.arial = font;
				
				Toolkit.init();
				_main = ComponentMacros.buildComponent("../../ui/main.xml");
				Screen.instance.addComponent(_main);

				var button:Component = _main.findComponent("helloButton", null, true);
				button.onClick = function(e:UIEvent) {
					trace("World!");
				}

				ready = true;
			});
		});

		iron.App.notifyOnRender2D(function(g:kha.graphics2.Graphics) {
			if (!ready) return;
			Screen.instance.renderTo(g);
		});
	}
}
