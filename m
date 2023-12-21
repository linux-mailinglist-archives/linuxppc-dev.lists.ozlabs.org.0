Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 224ED81BA51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 16:12:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TwGUel50;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swv6Z4wfbz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 02:12:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TwGUel50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swv5k68q5z30gr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 02:11:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D794CE1FCC;
	Thu, 21 Dec 2023 15:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15165C433C8;
	Thu, 21 Dec 2023 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703171478;
	bh=W1V9iuz27C48mcTlqdM84d1TvizSzj69f6WQ4WY/wVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwGUel50uL+FDdnJI4Nx7w8bbZ1gLxQiTAPJkXHQ7oQ9ckAb/J5ZNNvA8XSm/A1CM
	 1CqjVjgnR0WeQKhjKbY74jVKh3SvK6MQqlczBeAjY3D5oABn92wBdsOm6JJkniezlf
	 uvnX8vMWTNj7e+qCelDRXDDe69MGKkgK7y0zzWHvRSw5tZiPvVtPiO3pAFXd+R3G0g
	 yoEVPuqFhRkkq/DuHaHI+ObRKSHZZmG301GPzanBE8tBEC71m4rGnM2O0ucHiI6tyq
	 ugfIApkUhglx5DJ9uINOc4q4igWuKfzcyOWhQpWno/jH+klKRX4FPPDfUdc5XlARj/
	 H3pBTlqkQDGzA==
Date: Thu, 21 Dec 2023 15:11:11 +0000
From: Lee Jones <lee@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v4 00/10] devm_led_classdev_register() usage problem
Message-ID: <20231221151111.GJ10102@google.com>
References: <20231214173614.2820929-1-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214173614.2820929-1-gnstark@salutedevices.com>
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, hdegoede@redhat.com, andy.shevchenko@gmail.com, mingo@redhat.com, npiggin@gmail.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Dec 2023, George Stark wrote:

> This patch series fixes the problem of devm_led_classdev_register misusing.
> 
> The basic problem is described in [1]. Shortly when devm_led_classdev_register()
> is used then led_classdev_unregister() called after driver's remove() callback.
> led_classdev_unregister() calls driver's brightness_set callback and that callback
> may use resources which were destroyed already in driver's remove().
> 
> After discussion with maintainers [2] [3] we decided:
> 1) don't touch led subsytem core code and don't remove led_set_brightness() from it
> but fix drivers
> 2) don't use devm_led_classdev_unregister
> 
> So the solution is to use devm wrappers for all resources
> driver's brightness_set() depends on. And introduce dedicated devm wrapper
> for mutex as it's often used resource.
> 
> [1] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/
> [2] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mc132b9b350fa51931b4fcfe14705d9f06e91421f
> [3] https://lore.kernel.org/lkml/8704539b-ed3b-44e6-aa82-586e2f895e2b@salutedevices.com/T/#mdbf572a85c33f869a553caf986b6228bb65c8383
> 
> Changelog:
> v1->v2:
> 	revise patch series completely
> 
> v2->v3:
> locking: add define if mutex_destroy() is not an empty function
> 	new patch, discussed here [8]
> 
> devm-helpers: introduce devm_mutex_init
> 	previous version [4]
> 	- revise code based on mutex_destroy define
> 	- update commit message
> 	- update devm_mutex_init()'s description
> 
> leds: aw2013: unlock mutex before destroying it
> 	previous version [5]
> 	- make this patch first in the series
> 	- add tags Fixes and RvB by Andy 
> 
> leds: aw2013: use devm API to cleanup module's resources
> 	previous version [6]
> 	- make aw2013_chip_disable_action()'s body oneline
> 	- don't shadow devm_mutex_init() return code
> 
> leds: aw200xx: use devm API to cleanup module's resources
> 	previous version [7]
> 	- make aw200xx_*_action()'s bodies oneline
> 	- don't shadow devm_mutex_init() return code
> 
> leds: lm3532: use devm API to cleanup module's resources
> leds: nic78bx: use devm API to cleanup module's resources
> leds: mlxreg: use devm_mutex_init for mutex initializtion
> leds: an30259a: use devm_mutext_init for mutext initialization
> leds: powernv: add LED_RETAIN_AT_SHUTDOWN flag for leds
> 	- those pathes were planned but not sent in the series #2 due to mail server
> 	problem on my side. I revised them according to the comments.
> 
> v3->v4:
> locking: introduce devm_mutex_init
> 	new patch
> 	- move devm_mutex_init implementation completely from devm-helpers.h to mutex.h
> 
> locking: add define if mutex_destroy() is not an empty function
> 	drop the patch [9]
> 
> devm-helpers: introduce devm_mutex_init
> 	drop the patch [10]
> 
> leds: aw2013: use devm API to cleanup module's resources
> 	- add tag Tested-by: Nikita Travkin <nikita@trvn.ru>
> 
> [4] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mf500af0eda2a9ffc95594607dbe4cb64f2e3c9a8
> [5] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#mc92df4fb4f7d4187fb01cc1144acfa5fb5230dd2
> [6] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m300df89710c43cc2ab598baa16c68dd0a0d7d681
> [7] https://lore.kernel.org/lkml/20231204180603.470421-1-gnstark@salutedevices.com/T/#m8e5c65e0c6b137c91fa00bb9320ad581164d1d0b
> [8] https://lore.kernel.org/lkml/377e4437-7051-4d88-ae68-1460bcd692e1@redhat.com/T/#m5f84a4a2f387d49678783e652b9e658e02c27450
> [9] https://lore.kernel.org/lkml/20231213223020.2713164-1-gnstark@salutedevices.com/T/#m19ad1fc04c560012c1e27418e3156d0c9306dd84
> [10] https://lore.kernel.org/lkml/20231213223020.2713164-1-gnstark@salutedevices.com/T/#m63126025f5d1bdcef69bcad50f2e58274d42e2d7
> 
> George Stark (10):
>   leds: aw2013: unlock mutex before destroying it
>   locking: introduce devm_mutex_init
>   leds: aw2013: use devm API to cleanup module's resources
>   leds: aw200xx: use devm API to cleanup module's resources
>   leds: lp3952: use devm API to cleanup module's resources
>   leds: lm3532: use devm API to cleanup module's resources
>   leds: nic78bx: use devm API to cleanup module's resources
>   leds: mlxreg: use devm_mutex_init for mutex initializtion
>   leds: an30259a: use devm_mutext_init for mutext initialization
>   leds: powernv: use LED_RETAIN_AT_SHUTDOWN flag for leds
> 
>  drivers/leds/leds-an30259a.c | 15 +++++----------
>  drivers/leds/leds-aw200xx.c  | 33 ++++++++++++++++++++++-----------
>  drivers/leds/leds-aw2013.c   | 27 +++++++++++++++------------
>  drivers/leds/leds-lm3532.c   | 30 ++++++++++++++++++------------
>  drivers/leds/leds-lp3952.c   | 21 +++++++++++----------
>  drivers/leds/leds-mlxreg.c   | 17 ++++++-----------
>  drivers/leds/leds-nic78bx.c  | 25 +++++++++++++------------
>  drivers/leds/leds-powernv.c  | 23 ++++++++---------------

FYI: I'll conduct my review once the locking side is settled.

>  include/linux/mutex.h        | 23 +++++++++++++++++++++++
>  kernel/locking/mutex-debug.c | 22 ++++++++++++++++++++++
>  10 files changed, 143 insertions(+), 93 deletions(-)
> 
> -- 
> 2.25.1
> 
> 

-- 
Lee Jones [李琼斯]
