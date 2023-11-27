Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5D7F9FD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 13:42:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gt3M4qJ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf4xD45hVz3cWd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 23:42:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gt3M4qJ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf4wK1qXBz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 23:41:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701088914; x=1732624914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v3n/pRVGJN+BSoahXNcOeH95ditBSNEnKGtGNzh0jZc=;
  b=gt3M4qJ71i8gcWl39fZ2wnf390Y2cpolxF5B/hlCVilwbCOHPuoST6Gg
   KIKUQfjipSSk6rb1djJZnMM7arzyX0iabfZNUFfDAzJGBQKI8mTE85zo2
   QmTMJPht/20ykRPAMGfmJORp26ggmnJKTMKELxihzTxgraDVRIhf1Wean
   fhJL68FxvTjvfuiIxXYSa1dPmU/19Is6ciIF+xrlPipK/xms8xzB6e0xv
   mFs0+oX+NHELmz2NbjKynpQ29SZYpHlD+KPYM2lDYGEcJioHF5hthcojd
   JvJd5FII4sjueYt56IsCsptFUp1Gob8qJVjizkRWeYmjKT1y09WjswE8l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5883170"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5883170"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="802625987"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="802625987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 04:41:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r7avg-0000000HTOL-0Mob;
	Mon, 27 Nov 2023 14:41:36 +0200
Date: Mon, 27 Nov 2023 14:41:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Message-ID: <ZWSOfya16XoCfy5H@smile.fi.intel.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
 <ZWDBOfpsC5AVT8bX@smile.fi.intel.com>
 <13cd5524-0d40-4f07-b542-002b79b37533@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13cd5524-0d40-4f07-b542-002b79b37533@salutedevices.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "jic23@kernel.org" <jic23@kernel.org>, kernel@salutedevices.com, vadimp@nvidia.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 25, 2023 at 03:47:41AM +0300, George Stark wrote:
> On 11/24/23 18:28, Andy Shevchenko wrote:
> > On Wed, Oct 25, 2023 at 04:07:29PM +0300, George Stark wrote:
> > > Lots of drivers use devm_led_classdev_register() to register their led objects
> > > and let the kernel free those leds at the driver's remove stage.
> > > It can lead to a problem due to led_classdev_unregister()
> > > implementation calls led_set_brightness() to turn off the led.
> > > led_set_brightness() may call one of the module's brightness_set callbacks.
> > > If that callback uses module's resources allocated without using devm funcs()
> > > then those resources will be already freed at module's remove() callback and
> > > we may have use-after-free situation.
> > > 
> > > Here is an example:
> > > 
> > > module_probe()
> > > {
> > >      devm_led_classdev_register(module_brightness_set_cb);
> > >      mutex_init(&mutex);
> > > }
> > > 
> > > module_brightness_set_cb()
> > > {
> > >      mutex_lock(&mutex);
> > >      do_set_brightness();
> > >      mutex_unlock(&mutex);
> > > }
> > > 
> > > module_remove()
> > > {
> > >      mutex_destroy(&mutex);
> > > }
> > > 
> > > at rmmod:
> > > module_remove()
> > >      ->mutex_destroy(&mutex);
> > > devres_release_all()
> > >      ->led_classdev_unregister();
> > >          ->led_set_brightness();
> > >              ->module_brightness_set_cb();
> > >                   ->mutex_lock(&mutex);  /* use-after-free */
> > > 
> > > I think it's an architectural issue and should be discussed thoroughly.
> > > Some thoughts about fixing it as a start:
> > > 1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
> > > dependend resources are freed. devm_led_classdev_register() remains being useful
> > > to simplify probe implementation.
> > > As a proof of concept I examined all drivers from drivers/leds and prepared
> > > patches where it's needed. Sometimes it was not as clean as just calling
> > > devm_led_classdev_unregister() because several drivers do not track
> > > their leds object at all - they can call devm_led_classdev_register() and drop the
> > > returned pointer. In that case I used devres group API.
> > > 
> > > Drivers outside drivers/leds should be checked too after discussion.
> > > 
> > > 2) remove led_set_brightness from led_classdev_unregister() and force the drivers
> > > to turn leds off at shutdown. May be add check that led's brightness is 0
> > > at led_classdev_unregister() and put a warning to dmesg if it's not.
> > > Actually in many cases it doesn't really need to turn off the leds manually one-by-one
> > > if driver shutdowns whole led controller. For the last case to disable the warning
> > > new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).
> > 
> > NAK.
> > 
> > Just fix the drivers by wrapping mutex_destroy() into devm, There are many
> > doing so. You may be brave enough to introduce devm_mutex_init() somewhere
> > in include/linux/device*
> 
> Just one thing about mutex_destroy(). It seems like there's no single
> opinion on should it be called in 100% cases e.g. in remove() paths.
> For example in iio subsystem Jonathan suggests it can be dropped in simple
> cases: https://www.spinics.net/lists/linux-iio/msg73423.html
> 
> So the question is can we just drop mutex_destroy() in module's remove()
> callback here if that mutex is needed for devm subsequent callbacks?

mutex_destroy() makes sense when debugging mutexes. It's harmless to drop,
but will make life harder to one who is trying to debug something there...

-- 
With Best Regards,
Andy Shevchenko


