Return-Path: <linuxppc-dev+bounces-3400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C09D0B86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 10:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsMYz14k2z2y6G;
	Mon, 18 Nov 2024 20:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731921671;
	cv=none; b=Z0phOauTc9ZWn1zdnPl+CoeJ2EOZne4dReODezg0Y9ZMFggKipUvghvlRWLw6pUhMbiZhAVKevmgL6EYBkBVdkEEq8uvvXjMvyE3kUgOwIRu9zQRI8qZyGiLHuXGthJAwUL53D5wtGL+ackIvRSfdzs8I12dK+DCSE7PWxKmfMADSpzkWf20xrixjAfj+5t5dm6jASaHFbNK+0UirM3UNG5n17rWuAi6MMzqDCAzHgUmTNJ6sMldSymgDYMOLS5mrQfnh0aXTxt2VuCca+kEcfGeg+N2uc2Uf+xDQar5L4EdWYUUmzqzuQ5vANhr/6IU6+dJXpKZEDvO+AUHtyOfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731921671; c=relaxed/relaxed;
	bh=0hxmkkOYRfbQCNvCIuW4iYr0WQbENducYb441SJjF10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONLsVCFFlACdeYsok4R45Cijf2qbOFE9RaC3ETEZioSTyU48l7nCe8HBeiRb3Z43hxzIiopVjKtpKyPCBuUnl24XbykEDcLljt7CYTBkM3LxeLQk/KiIkLe1is5/fyD/Os7lkb5uWQJ29zlXzmvpur0GIjb4oGCAqzJXCK9hSVTMKBvv6AupRPNJLOwKX2ANFoOqJ+QsS3nqH4FhPVDkZye+7IJcpcGm6h5jakErgKEUit7zQxfnlEjxW/jKEde5+wejUz0+tfdc18SnrPGgVU3FcRNz63xkCP0Hplaoc/pPAolNQOthCH4y6CU1uYcn39AR7uclp7OjYa7wb/gRmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7CdQKsY; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7CdQKsY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsMYq2P75z2y34
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 20:21:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731921664; x=1763457664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ugfZnn5J96rAO7xJaylkbIGnNeAO2t/ZYiEJsCSX0/A=;
  b=C7CdQKsYSwZUQ6/AkDdpA1JkMs4ue5sMfBe/1dzGl6ShcH9wg+zrsLTv
   4kXH2FSjuSd15+SxL1x4CSj1mUObax0umnfk5yM9XR5+cYJCxG+56t4WO
   JO5AAsqwY68LzsYge3hT1VzF7qbqOQ6fj42pHHzh/N6ZARJJVseFewjiu
   fje/hiiTB7DC+K/sCl5aSj88eHil2dsHvCgtaQXAaMbdx/8nWUEZfRv9p
   lWQ6WdSf9r20oCqmakoY/9ei8YQ4KLlf3a+TDZNMlgSFzrj8T+b01vqQQ
   AtEMLpOcKLEvmUVtOflTj00wUV0xzWKrBgcS7Sw/8ozikgqDl/DIOda/y
   Q==;
X-CSE-ConnectionGUID: R5nrgXGJTR+53CTKkfjkIA==
X-CSE-MsgGUID: 84tOxN7eScG0uzXotnXHtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="54367161"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="54367161"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:20:58 -0800
X-CSE-ConnectionGUID: vyZTs5DpQiKdNdoeJy54xA==
X-CSE-MsgGUID: ggMpVe6gQ8Wd/iuMyoVi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120022881"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:20:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tCxwC-0000000Fwtr-1EaC;
	Mon, 18 Nov 2024 11:20:52 +0200
Date: Mon, 18 Nov 2024 11:20:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] powerpc/8xx: Drop legacy-of-mm-gpiochip.h header
Message-ID: <ZzsG9EjzV82Crl2W@smile.fi.intel.com>
References: <20241115133802.3919003-1-andriy.shevchenko@linux.intel.com>
 <5b44abcc-f629-4250-9edf-7f173b78172c@csgroup.eu>
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
In-Reply-To: <5b44abcc-f629-4250-9edf-7f173b78172c@csgroup.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Nov 16, 2024 at 11:44:35AM +0100, Christophe Leroy wrote:
> Le 15/11/2024 à 14:38, Andy Shevchenko a écrit :
> > Remove legacy-of-mm-gpiochip.h header file, replace of_* functions
> > and structs with appropriate alternatives.
> 
> Looks like you don't really have an alternative to
> of_mm_gpiochip_add_data(), you are replacing one single line by 11 new ones,
> and that is done twice (once for cpm1_gpiochip_add16(), once for
> cpm1_gpiochip_add32()).

True, but that's the issue that we have of_specific API. If someone propose
the common API for the agnostic approach,  it would be nice, but I am not
the one. And TBH I do not see the advantage of it right now as almost every
GPIO driver is using its own labeling schema (*). Note, that this patch also
fixes a memory leak as a side effect.

*) the legacy API is mostly used by PPC code, do you want that of_mm_* thingy
to be moved to PPC specific code instead of killing it? Would be done this
way as well.

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   arch/powerpc/platforms/8xx/cpm1.c | 119 +++++++++++++++---------------
> 
> Does not build:

Crap, I most likely built something else and not these files...
I have carefully build-test this for v2.

Note to myself: Never ever send the patches on Friday evenings! :-)

-- 
With Best Regards,
Andy Shevchenko



