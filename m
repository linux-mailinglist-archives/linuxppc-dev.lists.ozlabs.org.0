Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AE185DFAE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 15:31:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y137kzra;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfzGb65ryz3ckj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 01:31:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y137kzra;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfzFs0jM1z3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 01:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708525825; x=1740061825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AnVfYPg9QLlMiSY5zHzUg1A2vSHWhrEptn7kKIChBoo=;
  b=Y137kzrahKjLKTq4+MbZBIu8MZ1+hiwbrH5pi8e0xa+GEBCByKSIcip7
   3JU3+psrW64C3jhc2fpLNmqfmUK6GBqM2hSyS7g+BdcoMLaTEU9AW6Tas
   /sRpWhjeTOHh0tX9tsGgew+sKyQ+fWfb1Is9UqmXcF1rVd56CRj198aks
   w4WCfXf8kmur1vum9Dk5CGGfhBNSV2GMVpCC/nVDgQEtMp9/cX0QSDsvF
   M0tQf9velw7gh/++K8mx+GCXenWsVocN8JVN2XuyHcQJ7Lw02mYgm/jYf
   91u8GskpPqNbD9AE7egzeAvQUtLCiEyjwMq9Xhu5utGkdlBlQUiDWR0lY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2549602"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2549602"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 06:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913314388"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="913314388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 06:30:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rcnbv-00000006N3D-3zA2;
	Wed, 21 Feb 2024 16:30:11 +0200
Date: Wed, 21 Feb 2024 16:30:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <ZdYI81yKNisoLR7Y@smile.fi.intel.com>
References: <20240212075646.19114-4-herve.codina@bootlin.com>
 <ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
 <20240212143753.620ddd6e@bootlin.com>
 <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
 <20240212152022.75b10268@bootlin.com>
 <Zcos9F3ZCX5c936p@smile.fi.intel.com>
 <Zcptyd/AWrDD3EAL@yury-ThinkPad>
 <20240215184612.438bd4f2@bootlin.com>
 <Zc5jQ3zR51MDIovB@smile.fi.intel.com>
 <20240221144431.149c3a16@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221144431.149c3a16@bootlin.com>
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

On Wed, Feb 21, 2024 at 02:44:31PM +0100, Herve Codina wrote:
> On Thu, 15 Feb 2024 21:17:23 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

[...]

> > > Now what's the plan ?
> > > Andy, do you want to send a v2 of this patch or may I get the patch, modify it
> > > according to reviews already present in v1 and integrate it in my current
> > > series ?  
> > 
> > I would like to do that, but under pile of different things.
> > I would try my best but if you have enough time and motivation feel free
> > to take over, address the comments and integrate in your series.
> > 
> > I dunno what to do with bitmap_onto(), perhaps in a separate patch we can
> > replace it with bitmap_scatter() (IIUC) with explanation that the former
> > 1) uses atomic ops while being non-atomic as a whole, and b) having quite
> > hard to get documentation. At least that's how I see it, I mean that I would
> > like to leave bitmap_onto() alone and address it separately.
> 
> I will take the Andy's bitmap_{scatter,gather}() patch in my next iteration.
> And use bitmap_{scatter,gather}() in my code.

Thank you and sorry that I have no time to finish that. I will be happy to help
reviewing if you Cc me.

> For bitmap_onto() replacement, nothing will be done in my next iteration as
> it is out of this series scope.

I agree on this. This will be a separate logical change related to NUMA with
explanation and replacement of all callers at once.

-- 
With Best Regards,
Andy Shevchenko


