Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D40086CC9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:14:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D0M+edqO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlvsK24Kzz3vbs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:14:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D0M+edqO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlvrZ43MCz3fCg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 02:14:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709219647; x=1740755647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QsL+ZAdDVYizAYNGrUGef+IMlP9BDK8a2fH3vRdP9FU=;
  b=D0M+edqO9G4bVMRyT23Pm6SRG8xjXJ0bPsSO2zKxWsmZlWHoHRIYZ7++
   dh8Oc3CuS+8LzwPcPxR1SV7sOx1dvQk+7aW1ya9hqTSs9YQDOF+P2jb/+
   ys4TYOh92RdJel470W7RQACG4GcUKEiG7HjpTNoSTRluI+zBUj4p7s5i2
   O+dhyZllcaQZh0Nb08cDdNDB5nDSOwxA6mEjvQ56nToz5y8GOKSd4WJMd
   wdIOqq6BlvKVI4d5WpPIhEp74GpFIDTAArZVcq2Tok+MVrfX8iH6rwO+D
   qLL4wm6slO+IuosyVIiE74ODBH8KjqHbJ3BcOvxSanXM5ZMgsrYS4MaXj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3573490"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3573490"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913984248"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913984248"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:13:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfi6b-00000008hap-2Rgi;
	Thu, 29 Feb 2024 17:13:53 +0200
Date: Thu, 29 Feb 2024 17:13:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 1/5] net: wan: Add support for QMC HDLC
Message-ID: <ZeCfMfuMI4hJ54Bb@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
 <20240229141554.836867-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229141554.836867-2-herve.codina@bootlin.com>
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

On Thu, Feb 29, 2024 at 03:15:49PM +0100, Herve Codina wrote:
> The QMC HDLC driver provides support for HDLC using the QMC (QUICC
> Multichannel Controller) to transfer the HDLC data.

...

+ array_size.h
+ bug.h

> +#include <linux/cleanup.h>
> +#include <linux/dma-mapping.h>

+ device.h
+ err.h

> +#include <linux/hdlc.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

+ spinlock.h
+ types.h

With this fixed (below is up to you),
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +free_desc:
> +	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
> +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {

I'm wondering what prevents you from doing

	while (i--) {

> +		desc = &qmc_hdlc->rx_descs[i];

> +		if (!desc->skb)
> +			continue;

...and probably get rid of this check?

> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> +				 DMA_FROM_DEVICE);
> +		kfree_skb(desc->skb);
> +		desc->skb = NULL;
> +	}

-- 
With Best Regards,
Andy Shevchenko


