Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E6851662
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:04:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZrRRaBaV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYR5y1DHlz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 01:04:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZrRRaBaV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 13 Feb 2024 01:02:58 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYR4L6RHCz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707746579; x=1739282579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+k/jxrO0zWN40HjTz5V2N5DaQA7u2Sd/R7/hgOheP60=;
  b=ZrRRaBaVzWOhtmJHLtWvocIlrfsMv8l1CCXcKQ8biKb0ISSpuAs8ncdS
   e/eMqPUG/1VoNXc7NzhPbkkwS9jHA53MJJu3URlVZm1bYKJ0kaqCjVYuQ
   T1hIU/uV2J5IJNMgYI92RHNXCz1lB25Yl7OvYw37T/nX21GEAPL8B4/ij
   xin2Pat//M8ECwGOTBrSywIWDt3D9wuTvGB/kouHM3laaxIJ5pNIT8HTG
   LjY3IpzYp2TZP6BX/PwKp5tewmDTvu8rpfAjhvVwlUVyNn38UQH/sFlua
   iabLHgkxNyUagRLeFg/rcndN60qJtvmBgYULCTjxj0yVk9yMGcbX/S+/H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5535975"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="5535975"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 06:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="911490360"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="911490360"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 06:01:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rZWsM-00000003unC-1szc;
	Mon, 12 Feb 2024 16:01:38 +0200
Date: Mon, 12 Feb 2024 16:01:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-4-herve.codina@bootlin.com>
 <ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
 <20240212143753.620ddd6e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212143753.620ddd6e@bootlin.com>
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

On Mon, Feb 12, 2024 at 02:37:53PM +0100, Herve Codina wrote:
> On Mon, 12 Feb 2024 14:27:16 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 12, 2024 at 08:56:31AM +0100, Herve Codina wrote:
> > > Currently the bitmap_onto() is available only for CONFIG_NUMA=y case,
> > > while some users may benefit out of it and being independent to NUMA
> > > code.
> > > 
> > > Make it available to users by moving out of ifdeffery and exporting for
> > > modules.  
> > 
> > Wondering if you are trying to have something like
> > https://lore.kernel.org/lkml/20230926052007.3917389-1-andriy.shevchenko@linux.intel.com/
> 
> Yes, it looks like.
> Can you confirm that your bitmap_scatter() do the same operations as the
> existing bitmap_onto() ?

I have test cases to be 100% sure, but on the first glance, yes it does with
the adjustment to the atomicity of the operations (which I do not understand
why be atomic in the original bitmap_onto() implementation).

This actually gives a question if we should use your approach or mine.
At least the help of bitmap_onto() is kinda hard to understand.

> If so, your bitmap_gather() will match my bitmap_off() (patch 4 in this
> series).

Yes.

-- 
With Best Regards,
Andy Shevchenko


