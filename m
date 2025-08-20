Return-Path: <linuxppc-dev+bounces-11166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E376B2DEC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Aug 2025 16:11:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6T0C10Rhz2yhD;
	Thu, 21 Aug 2025 00:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755699099;
	cv=none; b=EQAfAqJ9vUEDJRpgY2wFlMl8TMPuqAnR+LuKu65iEoVRcSksPOlZO1Yg8yfGtk71bkiRC2zz6Dm/h4L5HaO//NQOqjIQdrka8t+LHFikA1Xk/SIxGilwrgfRAlHt+2c/3qY/orCm2W5Syy1OjlVssFnPegglta5J4lLCN2oYIkd/FcObXQIbKjnRCbG/28/lKFq/NGWnM4fHj/NnCeuRdlNM1ftFiCyVvD0kx0e3JsMh5jNwy1fTJJgsmtKdJDU6OVplOuIlcTygD2EsitGzocO24wGzLeLItBHPCk9DLOGp9hEQXNQdHZh1/aDoWVD3P8DZ0H41Kf8dksP+ngYlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755699099; c=relaxed/relaxed;
	bh=KcCCG63uWpRa+4mIeBMEtGvTor5sRVKqyuGK3CarDsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaRQgy+ozGXAkLNMp1hyGBFMWMd//cIH6xRIeW1hLC4wFRy//Fd+UmvDFXwQ1V2soFGh3fYW0KTaWFMKD9a9Q8ga5KHePUcLDy6STQToHuDdSZphBunBj9VVc9vF3DxEpJEzGeiVcKtaCztca40CwV/bpHTZDyistTlz7bNekFgdt0BwRcuWTzzBsywlTY6FUbhpPAVpwjFjBHUFEAuoesiOjYQMG4dBoINBBgKPjp3S0XWbMoqRq+LiqXqzDHDJJrIasFGc8F2rMI69hrEgc3uMxQlrRnuLsT+JMlwaEBo7XEvMRdaYe7RLCBmpq8mqoD14ZBFw11E2zzpU4ANSTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KoZlvCK6; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KoZlvCK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 21 Aug 2025 00:11:36 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6T082tJXz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 00:11:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755699097; x=1787235097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yBTCe/hjFm230cCQYrtw8FKht4lpTzaJPb4j5vc77is=;
  b=KoZlvCK6D25VMQZgxjTAhvsuw0EnceKT6vpQFfrQjdAU/D+YYVrhd7os
   FC1rOyg81tTrlx4Q3lTvROfccIExgPXEjkgZVU60Hi9Tn0imYyiRp+kN6
   T/eo0sqXT+XDiYMqKyma8k3tSYTTtY0WN+oLTYuZ1Urp8lpDXTraqFcXX
   b8PUm/HROwbgoVM6Q5DOMKv9PHkmF6baAN+ENDsf0yX3B4aHp0jaQIny9
   WWzgyZeajrGR7yoXH6n1akZWHJXUTUKR2LaXwDS/B6fkx2FxRkYbUsszd
   nfroDZdqqHD/yDv9b9Ry7gWzNvJtCWoIGaS0AEvf+aM6jOqG0x9ks+hzv
   A==;
X-CSE-ConnectionGUID: tirdKofaTWqtjIPr4wzboQ==
X-CSE-MsgGUID: 6vulWTWXQXi/bwyCYvko5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58030881"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="58030881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:10:27 -0700
X-CSE-ConnectionGUID: DeO6UepqREmAMrM+2c55UA==
X-CSE-MsgGUID: J7H6kWnMTFqol10RG3qTlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="167753943"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 07:10:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uojW9-00000006x9e-3KIH;
	Wed, 20 Aug 2025 17:10:21 +0300
Date: Wed, 20 Aug 2025 17:10:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <aKXXTcqpi-6TjWrU@smile.fi.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <52be7ae1-34f7-49ef-80b0-0eb6577205ff@csgroup.eu>
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
In-Reply-To: <52be7ae1-34f7-49ef-80b0-0eb6577205ff@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 10:33:52AM +0200, Christophe Leroy wrote:
> Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > file provides an OF API that's deprecated. There is no agnostic
> > alternatives to it and we have to open code the logic which was
> > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > drivers are using their own labeling schemas and resource retrieval
> > that only a few may gain of the code deduplication, so whenever
> > alternative is appear we can move drivers again to use that one.
> > 
> > As a side effect this change fixes a potential memory leak on
> > an error path, if of_mm_gpiochip_add_data() fails.
> 
> Is there a reason for having done this change in cpm1_gpiochip_add16() and
> cpm1_gpiochip_add32() [arch/powerpc/platform/8xx/cpm1.c] and not in
> cpm2_gpiochip_add32() [arch/powerpc/sysdev/cpm_common.c] while all three
> functions are called from cpm_gpio_probe() [arch/powerpc/sysdev/cpm_gpio.c]
> ?

No specific reason, just lack of time to have got all of the cases.

-- 
With Best Regards,
Andy Shevchenko



