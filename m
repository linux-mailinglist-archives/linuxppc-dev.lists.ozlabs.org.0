Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00835873807
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:43:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJwz8edx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqYYf5C7Rz3dV1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:43:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJwz8edx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqYXx5nLCz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:43:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709732594; x=1741268594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dpzqs+qEHnXZBkM+HHklxhqynUa//LfFylt3W/ZJSLw=;
  b=CJwz8edx6dYVWLwhcB9+mDhIRiq863+UNFg4BgOJOndKsDAejpdEBK9c
   NJvEGBWZrE6ZUzVZF/V4/Zhy6HZJTBdL+h3613j1z7RiscEEAXsSRbdPg
   ESCijQ0Rf0/5txPGIL6lhXtFrVXxLbxwBgKxqgNfJlki0FzLEnLSorJ+b
   9ikPo+LbihLmuXo4ubNMGA8H/Jf8ZCC3OIz9+/uWIq+D4u8jAOHccHE2y
   IPwQlYVZNXsiW2GNNMegt4gMp/THttIfu6O1WbTewG2MIMScOmR3DzGMC
   W4QdKLPwQ/1gJnWKjpgptXiEn0HatnWdm7/F9lBeI7jJkDzcuCIdRCAn0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4208302"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4208302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:43:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="914178807"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="914178807"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:43:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rhrY0-0000000AHKB-1gCu;
	Wed, 06 Mar 2024 15:43:04 +0200
Date: Wed, 6 Mar 2024 15:43:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v6 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <Zehy6K0Sj-cqcxZE@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-5-herve.codina@bootlin.com>
 <ZehqRMZwtazTf6P6@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZehqRMZwtazTf6P6@yury-ThinkPad>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 05:06:12AM -0800, Yury Norov wrote:
> On Wed, Mar 06, 2024 at 09:07:20AM +0100, Herve Codina wrote:

...

> > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > +	DECLARE_BITMAP(ts_mask, 64);
> > +	DECLARE_BITMAP(map, 64);


> > +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> > +	bitmap_from_u64(map, slot_map);

> We've got a BITMAP_FROM_U64() for this:
> 
> 	DECLARE_BITMAP(ts_mask_avail, 64) = { BITMAP_FROM_U64(ts_info->rx_ts_mask_avail) };
> 	DECLARE_BITMAP(map, 64) = { BITMAP_FROM_U64(slot_map) };

This looks ugly. Can we rather provide a macro that does this under the hood?

Roughly:

#define DEFINE_BITMAP_64(name, src)				\
	DECLARE_BITMAP(name, 64) = { BITMAP_FROM_U64(src) }

-- 
With Best Regards,
Andy Shevchenko


