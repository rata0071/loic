var loic = function() {
	Components.utils.import("resource://gre/modules/Services.jsm");
	Components.utils.import('resource://gre/modules/ctypes.jsm');
	var prefsService = Services.prefs;
	var loicRandom = Components.utils.import('chrome://loic/content/generateRandomBytes.jsm');
	return {
		init: function() {
			var firstRun = prefsService.getBoolPref('extensions.loic.firstRun');
			if (firstRun) {
				Application.prefs.setValue('extensions.loic.firstRun', false);
				var navBar = document.getElementById('nav-bar');
				var newSet = navBar.currentSet + ',loicToolbarButton';
				navBar.currentSet = newSet;
				navBar.setAttribute('currentset', newSet);
				document.persist('nav-bar', 'currentset'); 
			}
		},
		run: function() {
			gBrowser.selectedTab = gBrowser.addTab('chrome://loic/content/data/index.html');
			window.addEventListener('loicGenerateRandomBytes', function(evt) {
				loic.generateRandomBytes(evt)
			}, false, true);
		},
		generateRandomBytes: function(evt) {
			try {
				loicRandom.WeaveCrypto.initNSS(ctypes.libraryName('nss3'));
			}
			catch(err) {
				loicRandom.WeaveCrypto.path = Services.dirsvc.get('GreD', Ci.nsIFile);
				loicRandom.WeaveCrypto.path.append(ctypes.libraryName('nss3'));
				loicRandom.WeaveCrypto.initNSS(WeaveCrypto.path.path);
			}
			evt.target.setAttribute('randomValues', loicRandom.WeaveCrypto.generateRandomBytes(40));
		}
	};
}();
window.addEventListener('load', loic.init(), false);
