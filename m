Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14E85FCF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:48:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWEcV22/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgcxP1WWJz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:48:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EWEcV22/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgcwf5tBQz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 02:47:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708616867; x=1740152867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qNO63zIkGbx+1iQfTUn4yfr86/RWZAYZ7RtIlx0aB0A=;
  b=EWEcV22/z4M2htw/FyoS+bQWqZwA+kpOU8hZS+YvPy3qXt6KQZtxhy6f
   C0LT4PPFpqM3bUdCb56WmET1mcJfF8DZtUVZ4lHfXMXgzvUy4LwDhDAaU
   OPgPyS0sWLPz9ylm66f5J1/Nbor43c3wgJDjXv4yB7dM/5FVCDPoSXHhC
   eXf023jEse1B+L1NRCvnWu4hk581jWkSvuuADp54oZkgpv5hLnL2n6Wzk
   qa0mQHN8g6lUO0qo0sovjiSexhjjr5eFkai2RhHztzqeegC6NGJ69h5HR
   8s9JvvjmniYej9wn10aSrwl7mU3qgpbGOhbbZ4k/kep7AitThROzK7vix
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2986577"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2986577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:47:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913545306"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913545306"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:47:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdBIN-00000006fSw-0zPE;
	Thu, 22 Feb 2024 17:47:35 +0200
Date: Thu, 22 Feb 2024 17:47:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <Zddslpw398MJ49SS@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-5-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222142219.441767-5-herve.codina@bootlin.com>
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

On Thu, Feb 22, 2024 at 03:22:17PM +0100, Herve Codina wrote:
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
> 
> Use existing IFACE ioctl in order to configure the timeslots to use.

...

> +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> +				   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> +{
> +	DECLARE_BITMAP(ts_mask_avail, 64);
> +	DECLARE_BITMAP(ts_mask, 64);
> +	DECLARE_BITMAP(map, 64);

Perhaps more 1:1 naming?

	DECLARE_BITMAP(rx_ts_mask_avail, 64);
	DECLARE_BITMAP(tx_ts_mask, 64);
	DECLARE_BITMAP(slot_map, 64);

> +	/* Tx and Rx available masks must be identical */
> +	if (ts_info->rx_ts_mask_avail != ts_info->tx_ts_mask_avail) {
> +		dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x%llx, 0x%llx)\n",
> +			ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +		return -EINVAL;
> +	}
> +
> +	bitmap_from_u64(ts_mask_avail, ts_info->rx_ts_mask_avail);
> +	bitmap_from_u64(map, slot_map);
> +	bitmap_scatter(ts_mask, map, ts_mask_avail, 64);
> +
> +	if (bitmap_weight(ts_mask, 64) != bitmap_weight(map, 64)) {
> +		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %*pb -> (%*pb, %*pb)\n",
> +			64, map, 64, ts_mask_avail, 64, ts_mask);


You can save a bit of code and stack:

		dev_err(qmc_hdlc->dev, "Cannot translate timeslots %64pb -> (%64pb, %64pb)\n",
			slot_map, rx_ts_mask_avail, tx_ts_mask);

> +		return -EINVAL;
> +	}
> +
> +	bitmap_to_arr64(&ts_info->tx_ts_mask, ts_mask, 64);
> +	ts_info->rx_ts_mask = ts_info->tx_ts_mask;
> +	return 0;
> +}

...

> +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)

Similar comments apply as per above function.

...

> +	ret = qmc_chan_get_ts_info(qmc_hdlc->qmc_chan, &ts_info);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "get QMC channel ts info failed %d\n", ret);
> +		return ret;

		return dev_err_probe(...);

> +	}

-- 
With Best Regards,
Andy Shevchenko


