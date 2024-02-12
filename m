Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF08C851724
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:37:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NF85sie6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYRrB4s8tz3d2S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NF85sie6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYRqR0WK9z2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:36:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707748612; x=1739284612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NgxONl1Mo80zC/wVZflOnNJ1Dx1W2G8WQMUGFtld7AY=;
  b=NF85sie6svJoL7R4OM2GSae1QiWlbp0Jr4Lii45LBqLirQVIcENBLr6j
   dREjr0qD0kNI/4QZErskGJQrvI/1zErEd2al/CfbRCMcrK76iC7cQLZ3Z
   cWeSKwpgaWNOcIUXNpMTjVCyDfyfK2WGBgAZ3mo0fekSDCZ8m/hLI5+rf
   Ceb2RgwUz09erJKaMUrZQnStT64XrpgwGmdPgHRsalTc17/ApsRcBmA0E
   d5GvNtXYWWu6315SRYPMiHcKMsr9Tx8jT8f4fpZibjNSpNtXt7YPYpxDc
   cs+Sp31TKwh/6wfssGB80UEms7waaR1UJiRb4Xovlc+Zuae/v97xxGXRQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12815639"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="12815639"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 06:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="911498069"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="911498069"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 06:36:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rZXQD-00000003vJa-11bE;
	Mon, 12 Feb 2024 16:36:37 +0200
Date: Mon, 12 Feb 2024 16:36:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <Zcos9F3ZCX5c936p@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-4-herve.codina@bootlin.com>
 <ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
 <20240212143753.620ddd6e@bootlin.com>
 <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
 <20240212152022.75b10268@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212152022.75b10268@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 03:20:22PM +0100, Herve Codina wrote:
> On Mon, 12 Feb 2024 16:01:38 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> Agree, the bitmap_onto() code is simpler to understand than its help.
> 
> I introduced bitmap_off() to be the "reverse" bitmap_onto() operations
> and I preferred to avoid duplicating function that do the same things.
> 
> On my side, I initially didn't use the bitmap_*() functions and did the the
> bits manipulation by hand.
> During the review, it was suggested to use the bitmap_*() family and I followed
> this suggestion.

I also would go this way, the problems I see with the current implementation are:
- being related to NUMA (and as Rasmus once pointed out better to be there);
- unclear naming, esp. proposed bitmap_off();
- the quite hard to understand help text
- atomicity when it's not needed (AFAICT).

> I did tests to be sure that bitmap_onto() and bitmap_off() did
> exactly the same things as my previous code did.

Yuri, what do you think about all this?

-- 
With Best Regards,
Andy Shevchenko


