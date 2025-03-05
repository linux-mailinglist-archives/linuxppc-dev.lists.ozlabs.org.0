Return-Path: <linuxppc-dev+bounces-6733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28777A4FD39
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 12:08:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z78tS5jKGz3btj;
	Wed,  5 Mar 2025 22:08:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741170703;
	cv=none; b=QvQd2VXSvqKFsAp488Fb5vMntKkPjxjCSQy7hqR2d0I/hbtuU0/X5H3NM2Wjz10k+dgU5xlgrmMlGi9UnWXjl0XiNI3LRJx2aFpd/icMDXIopB0HnHevLCMZ2a708/VM/udOC5tkIEIKFAQ6WfQOIoSknmxT1Cv+OEIm95N1GrwmSQp/8uoG7mCBP52lJc8LpwA/DVq7Oqvn/AMyNDCqqV0TGbaTIjhFE0wTO0C4zDFPy1GoPwfMO+VSHjHLuhV0ZSwgpymhPvGAY6drfJstq3eBST+bVdCWWUPj2ZfUUEofzVfLo6XgGAStJOOn2N5Q/wFTQjYEjE4vmjPIgNjwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741170703; c=relaxed/relaxed;
	bh=1QcG68X2dThxXn08oi0mv/sMSvoU2vw3JRxKH+1IpVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyX7hxgQ2c4rYRqAAJzpRjCWDy15Q3BC3ITbbvApSNGiSJes1zGX/2gDA8ucEXtfnS5E4v0ie5boWWdJMMfVfwAcLScmp2ek9K5OPr7U6CuSfuPAHidWLkS8C4lGOjI5/d7YBw19iURxhUVLR/6wLdKW3JBd0nkdYIN+qM/PuA63mWjojfaW2bacyFctLI9iHmVnv3JJh90BrbpmpM8ndtjxq0Cv/SLoAa8arrJ6H9QwIA4njE1r/WtWvQJVairp75aLHRAGfZuH2AUH8nn4DtPdhoQjqUSygUQw3eXT615nwyp6klb3yzIzaTzY/MMZ8+psN11JscC5ck0lJBbIqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=softfail (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andy@kernel.org; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z783x6pSsz30XR;
	Wed,  5 Mar 2025 21:31:41 +1100 (AEDT)
X-CSE-ConnectionGUID: Ef8UzhJZS6SQSqLMYME2Lg==
X-CSE-MsgGUID: GRTxDFPMT9SztimAcp/a+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64567011"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="64567011"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:36 -0800
X-CSE-ConnectionGUID: WDkYJmSHT0OrYH3RzlgbQw==
X-CSE-MsgGUID: ttOP2cH/SDKXIxbe3IsO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122783306"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 02:30:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tpm18-0000000HNpF-00A7;
	Wed, 05 Mar 2025 12:30:22 +0200
Date: Wed, 5 Mar 2025 12:30:21 +0200
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
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <Z8gnvXQ9OMXoq9Fz@smile.fi.intel.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
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
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 05, 2025 at 10:10:24AM +0000, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.

...

>  	.options =	WDIOF_SETTIMEOUT |
>  			WDIOF_MAGICCLOSE |
> -			WDIOF_KEEPALIVEPING,
> +			WDIOF_KEEPALIVEPING |
> +			WDIOF_STOP_MAYSLEEP,

You may heavily reduce this change if you squeeze the new option just before
the last one. Currently it's a lot of unneeded churn that makes review a bit
harder (each needs to be carefully checked for the correctness).

-- 
With Best Regards,
Andy Shevchenko



