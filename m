Return-Path: <linuxppc-dev+bounces-6734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB096A4FD3A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z78tr2Kv4z3btn;
	Wed,  5 Mar 2025 22:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741170904;
	cv=none; b=kwJs8MISG28uBk0PxcE3RVKPgeGrdYxMzvDu5pCCnj+sUoyFb3rkmj0VpkPKBW3FmbtWSLGkEDGj09e26DoQLEEe1NdfhlC9lm403aMkhWWL5qNEkJJNgiDb+pJT4TuaYiJHcw9JM1uEOvQvPCYC46h7cKvjoJ1n8wz4ro2J2GWD9vf/1gDdEznxF29Zudcd3njaXaOsIDT/Vp/5UUKe2CCgI2zD3w6snPfUzYKwKzKvzZlaYXZJb1zi3706jBYEx0cnIbn5kRlZYfFxTPZvgw9mEU6/H9SaiZcY0hGITE8uP4bYXoQkUCEYrJ4+wTXHrRUiA2WmGO8KOFPHakzWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741170904; c=relaxed/relaxed;
	bh=zbIgnxo33TJwl2XpIuiDYO43qXbswWCH8QpY4+o4tns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpS50WgaTscOCZPJTqKwk4bQJnfEriSP6SZ//UsGd0xrN6GZ+GT7guzVNdX29YyU2DJwdECNSCoUvnLOBDws1q7pd6g6EMmuhyhP232csL33QJOFHtzBluFYHVyBCAoTw0pxFAmu6hkGMbv07eZgul/CQJGHNo8/vOAQqnl4aauryG2/Qz+jRmvzgXUlVPBMO7a5lkwzDSHr+GNn4A8zkHCFJMsnHV4luy1qGbxRcACQTyL3PqBUytYmwebikCV1/VLESa+7A74WrttkViqIBgD7LZwWjv5yvyZLteYtSCwnsdzfAFh5SVvwhWTYHXwXr7uNPyHprwuzYsgT++og2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=softfail (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 05 Mar 2025 21:35:02 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z787p2C2Mz30XR;
	Wed,  5 Mar 2025 21:35:02 +1100 (AEDT)
X-CSE-ConnectionGUID: ++ps7kicTHGCWI+rNmw7ww==
X-CSE-MsgGUID: K7EgXrosR3+qvlwT+R5BYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44936608"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="44936608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:56 -0800
X-CSE-ConnectionGUID: Pmo02+QiRyuCyBTsLyBQKA==
X-CSE-MsgGUID: +3/qaz49Qz6WtsiJJYV/Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123579370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:33:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm4L-0000000HNsf-1gjT;
	Wed, 05 Mar 2025 12:33:41 +0200
Date: Wed, 5 Mar 2025 12:33:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org,
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org,
	mazziesaccount@gmail.com, thomas.richard@bootlin.com,
	lma@chromium.org, bleung@chromium.org,
	support.opensource@diasemi.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	paul@crapouillou.net, alexander.usyskin@intel.com,
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org,
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
Message-ID: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-3-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
> Watchdog is not turned off in kernel panic situation.
> In certain systems this might prevent the successful loading
> of kdump kernel. The kdump kernel might hit a watchdog reset
> while it is booting.
> 
> To avoid such scenarios add a panic notifier call back function
> which can stop the watchdog. This provision can be enabled by
> passing watchdog.stop_on_panic=1 via kernel command-line parameter.

...

First of all, do we really need a new module parameter for that? Why can't it
be done automatically if kdump is expected?

> +static bool stop_on_panic;
> +module_param(stop_on_panic, bool, 0444);
> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=keep watching, 1=stop)");

+ blank line.

Also I do not see the documentation update. Where is it lost?

>  /*

-- 
With Best Regards,
Andy Shevchenko



