Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC567F8A0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 12:05:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXFUqihI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Scpt40J9wz3c3H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 22:05:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PXFUqihI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Scps96q8Rz3c56
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 22:04:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7155A60B45;
	Sat, 25 Nov 2023 11:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0394C433C8;
	Sat, 25 Nov 2023 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700910280;
	bh=iHtkiWIlP9Suyz7+kfNszP0CzobcR8FxFyBaHHZgiYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PXFUqihIY59L6NIWcHYWEn6ohGfZtRjl66YkDrSyhNaET4i2wW274KWckT+KBH2h0
	 n0DN3281ENFy+tGUECdGgBjvD2PJ6rg1jVn7pNdA2ZygSb6Lso/Ds0l2jt+MeKRTxm
	 kw2Dj/buKwQcH74k8eBjwmC0sDqj9VtEv4a4Du+vGE0D3iW2YmE3Ek0G2tJMnrwCER
	 VWmzgLeKnD4W8xPypwo7IA3d1c8Jc1xg5/NNsmZdnjnml3kOxOmYnY8cDdGHiHmfxD
	 BLc6eyhUp2wcKYRehbZge92OSkDy7Qfq4i8tbNeyIGqoLam7wkUMeN5RX2Cv/K7ley
	 WL6i5Qhhe7SBg==
Date: Sat, 25 Nov 2023 11:04:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Message-ID: <20231125110431.0bfebe0d@jic23-huawei>
In-Reply-To: <13cd5524-0d40-4f07-b542-002b79b37533@salutedevices.com>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
	<ZWDBOfpsC5AVT8bX@smile.fi.intel.com>
	<13cd5524-0d40-4f07-b542-002b79b37533@salutedevices.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kernel@salutedevices.com, Andy Shevchenko <andriy.shevchenko@intel.com>, vadimp@nvidia.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, pavel@ucw.cz, linuxppc-dev@lists.ozlabs.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 25 Nov 2023 03:47:41 +0300
George Stark <gnstark@salutedevices.com> wrote:

> Hello Andy
> 
> Thanks for the review.
> 
> On 11/24/23 18:28, Andy Shevchenko wrote:
> > On Wed, Oct 25, 2023 at 04:07:29PM +0300, George Stark wrote:  
> >> Lots of drivers use devm_led_classdev_register() to register their led objects
> >> and let the kernel free those leds at the driver's remove stage.
> >> It can lead to a problem due to led_classdev_unregister()
> >> implementation calls led_set_brightness() to turn off the led.
> >> led_set_brightness() may call one of the module's brightness_set callbacks.
> >> If that callback uses module's resources allocated without using devm funcs()
> >> then those resources will be already freed at module's remove() callback and
> >> we may have use-after-free situation.
> >>
> >> Here is an example:
> >>
> >> module_probe()
> >> {
> >>      devm_led_classdev_register(module_brightness_set_cb);
> >>      mutex_init(&mutex);
> >> }
> >>
> >> module_brightness_set_cb()
> >> {
> >>      mutex_lock(&mutex);
> >>      do_set_brightness();
> >>      mutex_unlock(&mutex);
> >> }
> >>
> >> module_remove()
> >> {
> >>      mutex_destroy(&mutex);
> >> }
> >>
> >> at rmmod:
> >> module_remove()  
> >>      ->mutex_destroy(&mutex);  
> >> devres_release_all()  
> >>      ->led_classdev_unregister();
> >>          ->led_set_brightness();
> >>              ->module_brightness_set_cb();
> >>                   ->mutex_lock(&mutex);  /* use-after-free */  
> >>
> >> I think it's an architectural issue and should be discussed thoroughly.
> >> Some thoughts about fixing it as a start:
> >> 1) drivers can use devm_led_classdev_unregister() to explicitly free leds before
> >> dependend resources are freed. devm_led_classdev_register() remains being useful
> >> to simplify probe implementation.
> >> As a proof of concept I examined all drivers from drivers/leds and prepared
> >> patches where it's needed. Sometimes it was not as clean as just calling
> >> devm_led_classdev_unregister() because several drivers do not track
> >> their leds object at all - they can call devm_led_classdev_register() and drop the
> >> returned pointer. In that case I used devres group API.
> >>
> >> Drivers outside drivers/leds should be checked too after discussion.
> >>
> >> 2) remove led_set_brightness from led_classdev_unregister() and force the drivers
> >> to turn leds off at shutdown. May be add check that led's brightness is 0
> >> at led_classdev_unregister() and put a warning to dmesg if it's not.
> >> Actually in many cases it doesn't really need to turn off the leds manually one-by-one
> >> if driver shutdowns whole led controller. For the last case to disable the warning
> >> new flag can be brought in e.g LED_AUTO_OFF_AT_SHUTDOWN (similar to LED_RETAIN_AT_SHUTDOWN).  
> > 
> > NAK.
> > 
> > Just fix the drivers by wrapping mutex_destroy() into devm, There are many
> > doing so. You may be brave enough to introduce devm_mutex_init() somewhere
> > in include/linux/device*
> >   
> 
> Just one thing about mutex_destroy(). It seems like there's no single 
> opinion on should it be called in 100% cases e.g. in remove() paths.
> For example in iio subsystem Jonathan suggests it can be dropped in 
> simple cases: https://www.spinics.net/lists/linux-iio/msg73423.html
> 
> So the question is can we just drop mutex_destroy() in module's remove() 
> callback here if that mutex is needed for devm subsequent callbacks?

I've never considered it remotely critical. The way IIO works means that things
have gone pretty horribly wrong in the core if you managed to access a mutex after
the unwind of devm_iio_device_register() has completed but sure, add a
devm_mutex_init() and I'd happily see that adopted in IIO for consistency
and to avoid answering questions on whether it is necessary to call mutex_destroy()

My arguement has always eben that if line after(ish) a mutex_destroy() is going to
either free the memory it's in, or make it otherwise inaccessible (IIO is proxying
accesses via chardevs if there are open so should ensure they never hit the driver)
then it's pointless and messy to call mutex_destroy().  devm_mutex_init() gets rid
of that mess..

Jonathan


> 

