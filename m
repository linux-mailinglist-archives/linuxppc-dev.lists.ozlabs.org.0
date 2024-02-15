Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A91856D83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 20:18:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksNhaci6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbPwm5Jshz3vZ0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 06:18:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksNhaci6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbPw037Htz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 06:17:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708024657; x=1739560657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nq1gXXMtQTFmzjqZbMFawObh/b5GZMKjRfQ9FOAf2eI=;
  b=ksNhaci6zaqOu1cHSY0nY9p5zAZ+Pq71mOMogvmnAbn7Nmn97yuYb/5R
   +YK9wd15+zrYKvu0CFehc3j/7N+MAhFAmO1lntoSgq408ixwHIa/Y0yWA
   ky52bRhLJNvbDH5BjqY6ry5Ay5cqqjsrFLZYGc9o6PAyYLvn54kfRsvU5
   pdIIcwDSjcaBcj3RZn7326SAQTWHRT6r0MN07nKcQqxwDkWvz490P7AdN
   T61LChR8RndImeST74Yw5LaCpX/sUMVgJ42sXaPnldWSgg8wB2giJjJlw
   3osCSFaFnFtbNRbaPbvGoSC03tVc5Mlx7WJz6h6mWQpEqcW6OBULXMMJ2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2255254"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2255254"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 11:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912215250"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912215250"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 11:17:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rahEa-00000004s7i-0DgF;
	Thu, 15 Feb 2024 21:17:24 +0200
Date: Thu, 15 Feb 2024 21:17:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <Zc5jQ3zR51MDIovB@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-4-herve.codina@bootlin.com>
 <ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
 <20240212143753.620ddd6e@bootlin.com>
 <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
 <20240212152022.75b10268@bootlin.com>
 <Zcos9F3ZCX5c936p@smile.fi.intel.com>
 <Zcptyd/AWrDD3EAL@yury-ThinkPad>
 <20240215184612.438bd4f2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215184612.438bd4f2@bootlin.com>
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

On Thu, Feb 15, 2024 at 06:46:12PM +0100, Herve Codina wrote:
> On Mon, 12 Feb 2024 11:13:13 -0800
> Yury Norov <yury.norov@gmail.com> wrote:

...

> > That's I agree. Scatter/gather from your last approach sound better.
> > Do you plan to send a v2?

See below.

...

> > I think your scatter/gather is better then this onto/off by naming and
> > implementation. If you'll send a v2, and it would work for Herve, I'd
> > prefer scatter/gather. But we can live with onto/off as well.
> 
> Andy, I tested your bitmap_{scatter,gather}() in my code.
> I simply replaced my bitmap_{onto,off}() calls by calls to your helpers and
> it works perfectly for my use case.
> 
> I didn't use your whole patch
>   "[PATCH v1 2/5] lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers"
> because it didn't apply on a v6.8-rc1 based branch.
> I just manually extracted the needed functions for my tests and I didn't look
> at the lib/test_bitmap.c part.
> 
> Now what's the plan ?
> Andy, do you want to send a v2 of this patch or may I get the patch, modify it
> according to reviews already present in v1 and integrate it in my current
> series ?

I would like to do that, but under pile of different things.
I would try my best but if you have enough time and motivation feel free
to take over, address the comments and integrate in your series.

I dunno what to do with bitmap_onto(), perhaps in a separate patch we can
replace it with bitmap_scatter() (IIUC) with explanation that the former
1) uses atomic ops while being non-atomic as a whole, and b) having quite
hard to get documentation. At least that's how I see it, I mean that I would
like to leave bitmap_onto() alone and address it separately.

> Yury, any preferences ?

-- 
With Best Regards,
Andy Shevchenko


