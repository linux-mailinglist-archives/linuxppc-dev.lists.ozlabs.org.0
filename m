Return-Path: <linuxppc-dev+bounces-4131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B59F212E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 23:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9gbT2BgHz305n;
	Sun, 15 Dec 2024 09:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734214741;
	cv=none; b=QePGDH4ZHdHlHg6GrSFyddv9F90XvyTwkGd22lRnzidoT+f17+oYPX7PN3xesbduLtaj232C5JFSnicHDUZ2d2FWNNaRbah8WzA+Cky92nvIGVyHzlQoSPppUqVEGH2/ItTtbCnYr8bD6I7XCdDH9x0tsM+6IsUraUHCPbQqgNq3FM/WRwqnDaEEy8XPxZZy9pvVWLJSEmzCnyvx6rFO27FUkOBtsx4rlQNd2X4Tk6q3Sx3oSf9hFvpGXmmKvTgyvu7Av28sDrdGs9XA2po+0mQDf8yHl9WCkKWlrweNJoj7XwoVcVQUUWqxqrbclz3PrYUJZn7dv4I4OfjnOPYp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734214741; c=relaxed/relaxed;
	bh=ojvhoipSj9uYqFkxWM0ZJvN8PHOfCvAHw33hHU8rMo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJKZBNpXlJX7gF0aA+mpZfqNnLghUUkcuZS2D5eoMGTboyKMA6tf1/Eqwz9FrKHn2rdUlAWJm1Nd39/kFTAOEGTNG/Q1pu3URy1hNsIRmsAKucKqjlPJsTTjberSa1orgAuWTTESXBIzPWCyvIGB9sOkbe4AIUGmQCYUuKzADPMwdCXI8319fDEgbuGROi8p4j1p35v7Xpu40U4bEXHIp7OYuV6o5soik1sbUBS3wbPAClIVNn+iY7UVh4UZyNiReFKZZOZXuPDS0qGtdpsjnH5+78U5K0EwuX16LAYXBDw+5vj7/K58CtAxlBqwu4eoPzWEd9W6otxKUyeaJwhCLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gpBLExQq; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gpBLExQq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9gbP3KW2z305Y
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2024 09:18:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734214737; x=1765750737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rrJn6Y3w1pf8OHmv/ZNQSjjsloyZOFExYTXbxTK9eXQ=;
  b=gpBLExQqW+wgrxDoHZ2Fe5+YZL07mFqn4Ho7QjWLeY0F/QF+GzFSytjy
   AvPxxffLPpSNTaoqnGyiE+nxxXdcUZAFYHFc3roC9igsabm4PSwRwvz2U
   vnFNAtsHVCvDDqsWT9yhBdQ2U4ZBQ1dWlDuDaHo/QoRK7lyfqN7/WQ49B
   j5j2qEUy4OD6bFP+68hjRFXJde8BOl8NoJrN/h0bwJuv4wR3AJC/w2SPS
   0Z54djYkmHDZC9EUqAIiX3kT9egWlayxO6FqlfxlrGUztvrcVeEYMeMr9
   AIYJIpyC/p/d4f+anVKaxizhQsO6iTW6BN4g9eg9WEKnyfIzZImDmLf1a
   Q==;
X-CSE-ConnectionGUID: mHg6O26qTz6L5RMcbERbZA==
X-CSE-MsgGUID: HvR+wKXgSHCM4qZyA5H/6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34515556"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="34515556"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:18:51 -0800
X-CSE-ConnectionGUID: SRIzwWp+TsKokfDWIcZDeQ==
X-CSE-MsgGUID: aNCuxcMYS92jKAMx48kYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101942157"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:18:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tMaTG-00000007voL-0SSV;
	Sun, 15 Dec 2024 00:18:46 +0200
Date: Sun, 15 Dec 2024 00:18:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <Z14ERRHbVALHs8AT@smile.fi.intel.com>
References: <20241118123254.620519-1-andriy.shevchenko@linux.intel.com>
 <514964ea-0795-41d6-91d3-f3d4f193fc6d@csgroup.eu>
 <Z1sOTf6UZbruptnl@smile.fi.intel.com>
 <991aee8b-fb10-4152-89fb-6ac542ee87c1@csgroup.eu>
 <Z1xp1xwLXAvkKgwD@smile.fi.intel.com>
 <95951cd6-f98f-4793-a35c-22f4e8d743af@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95951cd6-f98f-4793-a35c-22f4e8d743af@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 07:01:42PM +0100, Christophe Leroy wrote:
> Le 13/12/2024 à 18:07, Andy Shevchenko a écrit :
> > On Fri, Dec 13, 2024 at 07:28:45AM +0100, Christophe Leroy wrote:
> > > Le 12/12/2024 à 17:24, Andy Shevchenko a écrit :
> > > > On Mon, Nov 18, 2024 at 03:10:09PM +0100, Christophe Leroy wrote:
> > > > > Le 18/11/2024 à 13:31, Andy Shevchenko a écrit :
> > > > > > Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> > > > > > file provides an OF API that's deprecated. There is no agnostic
> > > > > > alternatives to it and we have to open code the logic which was
> > > > > > hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> > > > > > drivers are using their own labeling schemas and resource retrieval
> > > > > > that only a few may gain of the code deduplication, so whenever
> > > > > > alternative is appear we can move drivers again to use that one.
> > > > > > 
> > > > > > As a side effect this change fixes a potential memory leak on
> > > > > > an error path, if of_mm_gpiochip_add_data() fails.
> > > > > > 
> > > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > 
> > > > > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > > 
> > > > Thanks, what's next?
> > > 
> > > Next step is that Michael or Madhavan apply it I guess ?
> > 
> > Folks, do you have any comments? Can you apply this and we move forward towards
> > removing the legacy API from the kernel?
> 
> If you have some work which depends on this patch, you can also take it
> together with that work through another tree. Just let us know.

Not right now.
If Linus or Bart want to take this via their tree, it also would be good.

> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

-- 
With Best Regards,
Andy Shevchenko



