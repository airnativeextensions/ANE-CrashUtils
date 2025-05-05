/**
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		29/04/2025
 */
package com.distriqt.test.crashutils
{
	import com.distriqt.extension.crashutils.ApplicationExitInfo;
	import com.distriqt.extension.crashutils.CrashUtils;
	import com.distriqt.extension.debug.Debug;

	import flash.display.Bitmap;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.setTimeout;
	
	import starling.core.Starling;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**	
	 */
	public class CrashUtilsTests extends Sprite
	{
		public static const TAG : String = "";
		
		private var _l : ILogger;
		
		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}
		
		
		
		
		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//
		
		public function CrashUtilsTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "CrashUtils Supported: " + CrashUtils.isSupported );
				if (CrashUtils.isSupported)
				{
					log( "CrashUtils Version:   " + CrashUtils.service.version );
				}
				
			}
			catch (e:Error)
			{
				trace( e );
			}
		}
		
		
		////////////////////////////////////////////////////////
		//  
		//

		public function forceCrash():void
		{
			log( "Force Crash" );
			Debug.service.forceCrash();
		}


		public function getHistoricalProcessExitReasons():void
		{
			var reasons:Array = CrashUtils.service.getHistoricalProcessExitReasons( 1 );
			log( "Historical Process Exit Reasons: " + reasons.length );
			for each (var reason:ApplicationExitInfo in reasons)
			{
				log( "Reason: " + reason.reason );
				log( "Description: " + reason.description );
				log( "Trace: " + reason.traceInputStream );
				log( "-------------------------" );
			}
		}



		public function appNotResponding():void
		{
			log( "App Not Responding" );
			CrashUtils.service.appNotResponding( "App is wedged" );
		}

		
	}
}
