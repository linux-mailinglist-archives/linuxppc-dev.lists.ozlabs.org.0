Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050986CCBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:21:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RMeWNvbi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlw1R0GGxz3vYt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RMeWNvbi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlw0j5kXbz3dk2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 02:21:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709220070; x=1740756070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mtw1Are5X4Bl/MyGWxpW8u5oJvyM4o2l4h/oPvehucM=;
  b=RMeWNvbi8/pkNyehdhdt4I/kaI66pU41s15RH0T9YoZANupk0Y6kIiHh
   BHkO/Gu0uoBcZadY9yQ1nr004Y3cYNBZJ4kt/G0VPLEY1HoZ6Epw7Q4O3
   h0u8JSFuJdENXRuWoGlnBYTbXuC+JC1P1Recm87Ng9bMy3bwRuhSdwxqR
   XY2vJKoS9sAx3fz4WxzEegKRkk0Sn3rQjlVIxxVB0g3m5v4y1Q78+AvVF
   pSoO45CEeJOiifZ0MKxdOlUGcDZfQTfa/RYLra/Nrzj01thOHf6zM2S8k
   o7r/ut1eg7pvIqZihx6zdCqGUlF4a9VaKSX5HQkZsfHvtHlewUUW60x9b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3574683"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3574683"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913984387"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913984387"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:21:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfiDT-00000008hgQ-3rit;
	Thu, 29 Feb 2024 17:20:59 +0200
Date: Thu, 29 Feb 2024 17:20:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <ZeCg24Iv8qDmxNV9@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
 <20240229141554.836867-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229141554.836867-5-herve.codina@bootlin.com>
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

On Thu, Feb 29, 2024 at 03:15:52PM +0100, Herve Codina wrote:
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
> 
> Use existing IFACE ioctl in order to configure the timeslots to use.

...

> +	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);

Wondering if we may have returned value more useful and hence having something like

	n = bitmap_scatter(...);

> +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {

	if (n != ...) {

?

> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %64pb -> (%64pb, %64pb)\n",
> +			map, ts_mask_avail, ts_mask);
> +		return -EINVAL;
> +	}

...

> +	bitmap_gather(map, ts_mask, ts_mask_avail, 64);
> +
> +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots (%64pb, %64pb) -> %64pb\n",
> +			ts_mask_avail, ts_mask, map);
> +		return -EINVAL;
> +	}

Ditto.

-- 
With Best Regards,
Andy Shevchenko


