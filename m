Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B347085FCFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:50:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bi815Jkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgczl4TyVz3fFT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bi815Jkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgcz26vMmz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 02:49:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708616991; x=1740152991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V5q0olFZaHFjv75+8HL4XJGmUV94kfnMQJIuIkAcg7o=;
  b=Bi815Jkvw/k4EJNBpDyoMWRf/HCoTZYZ/s+vt7KQHzKMxZnMkyKhBKhg
   PaPZFxRltoqdmUYybN7ZJnN2kiIe5jvYkyXBIaLvwPbwcqejEBLMUL4To
   R35jgbA35X221Vc/OUxiYu0bVZoTmFbHxv3oGE/s9pR96gOhl7IPPsNJX
   9ftNdvByJ5Ey74/6pHLIW0CIwKoihh+ncxTUN1EPOBT02WXs8LGZ4JysS
   bQtD3G4zKnqLjoIIkJxpgeGPTfL/P+IzcQeNIF33tlf/0F+FLS5JC/XvB
   WRYQIGAsljkY9Q/Vo38GFTaPB24IQaqUx3cE5mpHIV73Fi6QA8xM8Ird9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2986844"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2986844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:49:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913545530"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913545530"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:49:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdBKO-00000006fUF-46u7;
	Thu, 22 Feb 2024 17:49:40 +0200
Date: Thu, 22 Feb 2024 17:49:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 5/5] net: wan: fsl_qmc_hdlc: Add framer support
Message-ID: <ZddtFG4bvCX-lsn3@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-6-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222142219.441767-6-herve.codina@bootlin.com>
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

On Thu, Feb 22, 2024 at 03:22:18PM +0100, Herve Codina wrote:
> Add framer support in the fsl_qmc_hdlc driver in order to be able to
> signal carrier changes to the network stack based on the framer status
> Also use this framer to provide information related to the E1/T1 line
> interface on IF_GET_IFACE and configure the line interface according to
> IF_IFACE_{E1,T1} information.

...

> +static int qmc_hdlc_framer_set_carrier(struct qmc_hdlc *qmc_hdlc)
> +{
> +	struct framer_status framer_status;
> +	unsigned long flags;
> +	int ret;
> +
> +	if (!qmc_hdlc->framer)
> +		return 0;

> +	spin_lock_irqsave(&qmc_hdlc->carrier_lock, flags);

cleanup.h ?

> +	ret = framer_get_status(qmc_hdlc->framer, &framer_status);
> +	if (ret) {
> +		dev_err(qmc_hdlc->dev, "get framer status failed (%d)\n", ret);
> +		goto end;
> +	}
> +	if (framer_status.link_is_on)
> +		netif_carrier_on(qmc_hdlc->netdev);
> +	else
> +		netif_carrier_off(qmc_hdlc->netdev);
> +
> +end:
> +	spin_unlock_irqrestore(&qmc_hdlc->carrier_lock, flags);
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko


