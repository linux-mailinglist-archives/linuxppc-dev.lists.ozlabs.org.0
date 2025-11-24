Return-Path: <linuxppc-dev+bounces-14459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6630C8141B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 16:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFTnY5672z2yw7;
	Tue, 25 Nov 2025 02:12:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763997121;
	cv=none; b=HEaimJwK7ttl6WMQNUSdxDLpirqxF9aiqHWFh/pbwUBrWVdJx3J5BuJf7ZFYOk8em7zSGwUn8Azhag+cxNfe+aPvBXNvPLetXOMe4NTtu3AXWqs4lZXp4is1LOsq/2IBYxhPTaY1RPkJJwz2iC1Ac3XrNPUkVDij9V9Ercdf6I3adJ59DhUm+RTJ6m//7On11lfwk96/kB6vLwtOz6lb8BjFBw6dlQvSWE8spzqlpQjUGjuR9qKmT8aOWkwsodoDoXmAZ3NpzoDHKdDKYOJZ30Pq+Y2lSP1/OLYmIzsa+Tjyz60KMSIbmllAWsv1uZz67Rm3El/pfHb599fHVGlX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763997121; c=relaxed/relaxed;
	bh=JHBmrsBd1dbuNO81pabuWtsEfbDLwQWcF64OpOHzOiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCTuauH5MnANEhjzpGZOMnnL5pDRjb2ENUpgWsFZT9DBLN0xUEgD/H2Uq1T5jF5nRExCmdx32BFJnt2o8fUb8C/wP5TilDHIVICo7YI4vonrBHaUzm8Cie4Qb53KXhcbjajW5/xarYUxAmBrLdCynN2J/0C8wai7c9VyxboE5LMIbEh9HAOqXbZKVr2JYZMNuuESAM4VvpFVQiJvcelSokpyPBvuWSiSnaUzd+z8RpLHoIAW2Rw6MUGrdkiGiZnaQnXvPN1SEinZ8sq41RY3sdvwPjQMIzW58+2S5ARD3rkIT3ryN4UaI5oj/mRItwPZubAmtodauJQVsPIET3V5ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ptz91OUN; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ptz91OUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 25 Nov 2025 02:11:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFTnV355mz2yvN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 02:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763997119; x=1795533119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MDUGAVH9GkmUH/2cOnfyRGxhN7agAX2fjFQ3bVjAqyM=;
  b=Ptz91OUNSSbCauxJYHhznCSeMl0JmjoJtFRgST/Tn6TPipKAj2UiTaEE
   WRO6fF6/NIFsxYCR3JADY2GsrXxCj43+WsMgBI9l6YrEe/Ip9ZDWETd7G
   x9DpZqh0zmyZWI5SdUiXp73lJQHLX9Isw1NGm+jVYPcsbzt8EdrXrW9Rn
   LH7VWArh3PD7ihRTftv/WwtcODeGl6i7GsHm3vo5nrGjZZQUF6Iaf1hBy
   JgXrfRB/RxIQva9RbgMmzC+UDKkOPfCqbpA5UjPNOb3k45OEyia5sgl/S
   ErxYmVu7DbPAmkP+48KpTwpmao/Eue6y3nj19sZvsiJ5lC0dS70cTi85/
   w==;
X-CSE-ConnectionGUID: nGrN6BdJRR2UETaYQxnmrA==
X-CSE-MsgGUID: yzdn+dJySsyA4jRbXFP86A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65947062"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65947062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:10:50 -0800
X-CSE-ConnectionGUID: 3hOsrAk3TraGObfKJnMBtA==
X-CSE-MsgGUID: 0Pe3/K5cTm2Pa6Wy574vqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="193145960"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 07:10:47 -0800
Date: Mon, 24 Nov 2025 17:10:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <aSR1dBucp88ucBvN@smile.fi.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <52be7ae1-34f7-49ef-80b0-0eb6577205ff@csgroup.eu>
 <aKXXTcqpi-6TjWrU@smile.fi.intel.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKXXTcqpi-6TjWrU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 20, 2025 at 05:10:21PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 14, 2025 at 10:33:52AM +0200, Christophe Leroy wrote:
> > Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> > > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > > file provides an OF API that's deprecated. There is no agnostic
> > > alternatives to it and we have to open code the logic which was
> > > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > > drivers are using their own labeling schemas and resource retrieval
> > > that only a few may gain of the code deduplication, so whenever
> > > alternative is appear we can move drivers again to use that one.
> > > 
> > > As a side effect this change fixes a potential memory leak on
> > > an error path, if of_mm_gpiochip_add_data() fails.
> > 
> > Is there a reason for having done this change in cpm1_gpiochip_add16() and
> > cpm1_gpiochip_add32() [arch/powerpc/platform/8xx/cpm1.c] and not in
> > cpm2_gpiochip_add32() [arch/powerpc/sysdev/cpm_common.c] while all three
> > functions are called from cpm_gpio_probe() [arch/powerpc/sysdev/cpm_gpio.c]
> > ?
> 
> No specific reason, just lack of time to have got all of the cases.

I have noticed that you cleaned all them up, I appreciate the work, thanks!

-- 
With Best Regards,
Andy Shevchenko



