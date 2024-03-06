Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD45873B5E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 16:58:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T0xVfv1f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqcXq3Zhjz3vlL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 02:58:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T0xVfv1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqcV46QmFz3vXt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 02:55:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709740557; x=1741276557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWLsQTYRY4NV202mbVOUcPSKxCp8J/1ljk2rS3jeIHY=;
  b=T0xVfv1fHcRbPg5zNob7S0Z1ogavwlgMqXzu93zTVdtc0fQA4pfEzczF
   lUJjvERCjO1k/KbRumbdYPhaRSj6zgnTJneBoBPPfhltGXXzHSOxFID8j
   FP/jtj7Y1f+TEW26Hx6z7jUPgRC++/Oq8GFvAM1AdWSrPWaHKvKiPxTQ0
   MkymuRGN9Z3AEC3mOeScgCmBytEFIISCyLBlIjLydkQsdTdeajpfzYZGA
   IpQHb9jHxmNShSL2LjwpCua4EGu1afEKX0C1k+Q0YhgdVVlzJH1f7FBgS
   4SGIE1aU/UfT5USb+pnRMEdWYXa7kq9hqO0YOIVv9EbIgbnOldWEp0O/8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4541554"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4541554"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 07:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="914182389"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="914182389"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 07:55:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rhtcQ-0000000AItQ-22Eu;
	Wed, 06 Mar 2024 17:55:46 +0200
Date: Wed, 6 Mar 2024 17:55:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <ZeiSArlb24aSp-CJ@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-5-herve.codina@bootlin.com>
 <ZehqRMZwtazTf6P6@yury-ThinkPad>
 <Zehy6K0Sj-cqcxZE@smile.fi.intel.com>
 <20240306164311.735ded83@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306164311.735ded83@bootlin.com>
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

On Wed, Mar 06, 2024 at 04:43:11PM +0100, Herve Codina wrote:
> On Wed, 6 Mar 2024 15:43:04 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Mar 06, 2024 at 05:06:12AM -0800, Yury Norov wrote:
> > > On Wed, Mar 06, 2024 at 09:07:20AM +0100, Herve Codina wrote:  

...

> > > > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > > > +	DECLARE_BITMAP(ts_mask, 64);
> > > > +	DECLARE_BITMAP(map, 64);  
> > 
> > 
> > > > +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> > > > +	bitmap_from_u64(map, slot_map);  
> > 
> > > We've got a BITMAP_FROM_U64() for this:
> > > 
> > > 	DECLARE_BITMAP(ts_mask_avail, 64) = { BITMAP_FROM_U64(ts_info->rx_ts_mask_avail) };
> > > 	DECLARE_BITMAP(map, 64) = { BITMAP_FROM_U64(slot_map) };  
> > 
> > This looks ugly. Can we rather provide a macro that does this under the hood?
> > 
> > Roughly:
> > 
> > #define DEFINE_BITMAP_64(name, src)				\
> > 	DECLARE_BITMAP(name, 64) = { BITMAP_FROM_U64(src) }
> > 
> 
> Well, the construction I used:
> 	DECLARE_BITMAP(foo, 64);
> 	...
> 	bitmap_from_u64(foo, init_value);
> 	...
> can be found in several places in the kernel.
> 
> Having the DEFINE_BITMAP_64() macro can be a way to remove this
> construction but I am not sure that this should be done in this
> series.

I also think that this can be done later, above is just a pure suggestion how.

> IMHO, a specific series introducing the macro and updating pieces of
> code in the kernel everywhere it is needed to replace this construction
> would make much more sense.

Right.

-- 
With Best Regards,
Andy Shevchenko


