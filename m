Return-Path: <linuxppc-dev+bounces-6736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0C7A4FDDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:40:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z79bJ1mDBz3bt2;
	Wed,  5 Mar 2025 22:40:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741174827;
	cv=none; b=oy/DrknekUzm9sp7PsnWbnJkXBUAGVzd+Z51guuzF2Jk0PvBbrPcKD8nNvOiqsjJxpHVEtok8MgT61+5QWCKtWVp/pT0hP62rJiL0yKlaz/ojkXVfyt3Fo/4WZ6UJQdyojkjRkWBrz31p5D1OqwgYB1lbE97e35/Pn5fvRYBc0eNNEDOTOGqyRmQQjt4pR5l9xXqIO8QFVSlJ1T+Ens5EGW3joSx8PdHcybNzdeUlakYL8sErayAtID5v2gDSCOK2DIWC0oH2nYk+3cLEa35qxA1orT7yGRBPlTaZL7VQNlBa1HCRBM/W1Vj7lPt8goQG/k4jtwuFWk+A5TaBPTQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741174827; c=relaxed/relaxed;
	bh=cw3XxnLHNZ3/+eN3jxwlLiOsY4HaGwfk0dlunI0m4sE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YndaTaZ3JpKDuSXExStZL3qyAKM4nPHJrjLkzH2DKr+spmgywTOaoc/HWFBlsEG9WLp/Nd46r8Dak6ee7kbKbvY3DokwVAnSCJe1BJrMonZfWsd/0g6uGEGdijJtOl62cDu7biiMQiglF1qKh2QcUCk4owYXvxRBTwfYWxC3jnc3G5zLryGrAeSNdH5ZScI1ASND+Ab0FgRZ9Q8+IBxuvZNQK2U2h4mA7zFP5cPFQ2ghDsEbVpzJO6AJsoCAc9FzxuBW86HSbem43eSFiZzyP/rFxLHxt6SySMQx5VRhyx/rKaEdzefbm5fEArQu6Bfw4xErbhZXyeaKdJO5v8ZxuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z79bH0YB0z3bsY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 22:40:27 +1100 (AEDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpn64-0004on-HO; Wed, 05 Mar 2025 12:39:32 +0100
Message-ID: <28d0ea70-db7a-40e7-aac9-86808320f252@pengutronix.de>
Date: Wed, 5 Mar 2025 12:39:27 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v4 0/2] Add stop_on_panic support for
 watchdog
To: George Cherian <gcherian@marvell.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "jwerner@chromium.org" <jwerner@chromium.org>,
 "evanbenn@chromium.org" <evanbenn@chromium.org>,
 "kabel@kernel.org" <kabel@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
 "lma@chromium.org" <lma@chromium.org>,
 "bleung@chromium.org" <bleung@chromium.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andy@kernel.org"
 <andy@kernel.org>, "paul@crapouillou.net" <paul@crapouillou.net>,
 "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
 "andreas.werner@men.de" <andreas.werner@men.de>,
 "daniel@thingy.jp" <daniel@thingy.jp>,
 "romain.perier@gmail.com" <romain.perier@gmail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "naveen@kernel.org" <naveen@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
 "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>
Cc: "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
 <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi George,

On 05.03.25 12:28, George Cherian wrote:
> Hi Ahmad,
>> Hi George,
>> On 05.03.25 11:10, George Cherian wrote:
>>> This series adds a new kernel command line option to watchdog core to
>>> stop the watchdog on panic. This is useul in certain systems which prevents
>>> successful loading of kdump kernel due to watchdog reset.
>>>
>>> Some of the watchdog drivers stop function could sleep. For such
>>> drivers the stop_on_panic is not valid as the notifier callback happens
>>> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
>>> options to indicate whether the stop function would sleep.
>>
>> Did you consider having a reset_on_panic instead, which sets a user-specified
>> timeout on panic? This would make the mechanism useful also for watchdogs
> 
> /proc/sys/kernel/panic already provides that support. You may echo a non-zero value 
> and the system tries for a soft reboot after those many seconds. But this doesn't happen 
> in case of a kdump kernel load after panic.

The timeout specified to the Watchdog reset_on_panic option would be programmed into
the active watchdogs and not be used to trigger a software-induced reboot.

>> that can't be disabled and would protect against system lock up: 
>> Consider a memory-corruption bug (perhaps externally via DMA), which partially
>> overwrites both main and kdump kernel. With a disabled watchdog, the system
>> may not be able to recover on its own.
> 
> Yes, that is the reason why the kernel command-line is optional and by default it is set to zero.
> So that in cases if you have a corrupted kdump kernel then watchdog kicks in.

The existing option isn't enough for the kdump kernel use case.
If we (i.e. you) are going to do something about it, wouldn't it be
better to have a solution that's applicable to a wider number of
watchdog devices?

>> If you did consider it, what made you decide against it?
> watchdog.stop_on_panic=1 is specifically for systems which can't boot a kdump kernel due to the fact 
> that the kdump kernel gets a watchdog reset while booting, may be due to a shorter watchdog time.
> For eg: a 32-bit watchdog down counter running at 1GHz.
> reset_on_panic can guarantee only the largest watchdog timeout supported by HW, 
> since there is no one to ping the watchdog.

If you are serious with the watchdog use, you'll want to use the watchdog to
monitor kernel startup as well. If the bootloader can set a watchdog timeout
just before starting the kernel and it doesn't expire before the kernel watchdog
driver takes over, why can't we do the same just before starting the dumpkernel?

Thanks,
Ahmad

 
>>
>> Thanks,
>> Ahmad
>>
>>>
>>>
>> Changelog:
>> v1 -> v2
>> - Remove the per driver flag setting option
>> - Take the parameter via kernel command-line parameter to watchdog_core.
>>
>> v2 -> v3
>> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
>> - There are no users for this. 
>>
>> v3 -> v4
>> - Since the panic notifier is in atomic context, watchdog functions
>>   which sleep can't be called. 
>> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>>   function sleeps.
>> - Simplify the stop_on_panic kernel command line parsing.
>> - Enable the panic notiffier only if the watchdog stop function doesn't
>>   sleep
>>
>> George Cherian (2):
>>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>>   drivers: watchdog: Add support for panic notifier callback
> 
> - George


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

