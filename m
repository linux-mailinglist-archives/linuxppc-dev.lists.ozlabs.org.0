Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 623447F77DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 16:32:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHoOVBik;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScJrL2L5Vz3vc5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 02:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHoOVBik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 74 seconds by postgrey-1.37 at boromir; Sat, 25 Nov 2023 02:30:51 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScJpg5bGMz3dRQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 02:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839854; x=1732375854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4wTXc2+Rb7ZmdlIioZQrrzZMpLjREbdeuncO3pZy9no=;
  b=NHoOVBikD7769qLgOLYf4e7bYeHjFodVWKA1y71rgGlX0uyokf9wbaFg
   EURwYRUlzZrsec1oLHZSW9C8ZcuUVEjeXhpew+VqJcwawfTLdiB87/z1S
   lMANqrxPWHCeVdvSNqDausJrwpYjZJG1tZqRet6PyTNPe3eewAiNhHtQN
   Pj+0yumy3HNRB1cj098RfkfBJw9PeMr+OfsYX/VOVGqtAWRDLaATPr59K
   v9feQQQqZLCBjLMBIDTBRGg6VAMcyOhu9NsnYyG/rAtUa59cdaH77xJ08
   oYijE2n3Tf3keanESq0ZPAzn24FJivA+2HcDfjn3U7dDYcDVMAAlVU1EW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5593276"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5593276"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:29:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="885299714"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="885299714"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:29:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r6Y6z-0000000Gkp5-1wGf;
	Fri, 24 Nov 2023 17:28:57 +0200
Date: Fri, 24 Nov 2023 17:28:57 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Message-ID: <ZWDBOfpsC5AVT8bX@smile.fi.intel.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025130737.2015468-1-gnstark@salutedevices.com>
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
Cc: vadimp@nvidia.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, kernel@sberdevices.ru, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 25, 2023 at 04:07:29PM +0300, George Stark wrote:
> Lots of drivers use devm_led_classdev_register() to register their led objects
> and let the kernel free those leds at the driver's remove stage.
> It can lead to a problem due to led_classdev_unregister()
> implementation calls led_set_brightness() to turn off the led.
> led_set_brightness() may call one of the module's brightness_set callbacks.
> If that callback uses module's resources allocated without using devm funcs()
> then those resources will be already freed at module's remove() callback and
> we may have use-after-free situation.
> 
> Here is an example:
> 
> module_probe()
> {
>     devm_led_classdev_register(module_brightness_set_cb);
>     mutex_init(&mutex);
> }
> 
> module_brightness_set_cb()
> {
>     mutex_lock(&mutex);
>     do_set_brightness();
>     mutex_unlock(&mutex);
> }
> 
> module_remove()
> {
>     mutex_destroy(&mutex);
> }
> 
> at rmmod:
> module_remove()
>     ->mutex_destroy(&mutex);
> devres_release_all()
>     ->led_classdev_unregister();
>         ->led_set_brightness();
>             ->module_brightness_set_cb();
>                  ->mutex_lock(&mutex);  /* use-after-free */
> 
> I think it's an architectural issue and should be discussed thoroughly.
> Some thoughts about fixing it as a start:
> 1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
> dependend resources are freed. devm_led_classdev_register() remains being useful
> to simplify probe implementation.
> As a proof of concept I examined all drivers from drivers/leds and prepared
> patches where it's needed. Sometimes it was not as clean as just calling
> devm_led_classdev_unregister() because several drivers do not track
> their leds object at all - they can call devm_led_classdev_register() and drop the
> returned pointer. In that case I used devres group API.
> 
> Drivers outside drivers/leds should be checked too after discussion.
> 
> 2) remove led_set_brightness from led_classdev_unregister() and force the drivers
> to turn leds off at shutdown. May be add check that led's brightness is 0
> at led_classdev_unregister() and put a warning to dmesg if it's not.
> Actually in many cases it doesn't really need to turn off the leds manually one-by-one
> if driver shutdowns whole led controller. For the last case to disable the warning
> new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).

NAK.

Just fix the drivers by wrapping mutex_destroy() into devm, There are many
doing so. You may be brave enough to introduce devm_mutex_init() somewhere
in include/linux/device*

-- 
With Best Regards,
Andy Shevchenko


