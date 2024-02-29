Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88886CAD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:58:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XdMB1u+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlt9p1y91z3vYk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 00:58:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XdMB1u+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlt954qBCz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 00:58:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709215098; x=1740751098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vsDRj1lrlW5nFpY8MoqEfXKmAZAXlZ0hsF8p7PHkdVo=;
  b=XdMB1u+g7HtHyJ+yLUJg+6l3mNrL/ldHZ48a6BFNvcMquEIXTQRkJPWp
   fcz2TfLFwHRU48s3/s3RBEgEIBXm2FFOxMYXUT62tfuC2byQ0klUoQQm3
   E2h5Q89zJ5DNItUpMqZBoXYPQwnxhWIDRJAX6nK8dmIXw4mkECWI16U9m
   vGy4Sn0a8VbK2NEsixKDQNS7TmPgQsbJm+BrD98lPerU1lFIEcoCjQyDj
   GqKVX9yb/XWeUMSgGpDS+FxfCSnSg8DotSo+r6v5d4nn3yCjtWs9QCzw5
   y92hBJGcxYz7Fs1W94AlaKFMhd9a3tbVtDHZssgDcaSqyhad2+AHpHPf6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14836184"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14836184"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="913982739"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913982739"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 05:58:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfgvG-00000008gYy-3Yqf;
	Thu, 29 Feb 2024 15:58:06 +0200
Date: Thu, 29 Feb 2024 15:58:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 5/5] net: wan: fsl_qmc_hdlc: Add framer support
Message-ID: <ZeCNboCslYgT8tjb@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-6-herve.codina@bootlin.com>
 <ZddtFG4bvCX-lsn3@smile.fi.intel.com>
 <20240229135605.6454052f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229135605.6454052f@bootlin.com>
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

On Thu, Feb 29, 2024 at 01:56:05PM +0100, Herve Codina wrote:
> On Thu, 22 Feb 2024 17:49:40 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 22, 2024 at 03:22:18PM +0100, Herve Codina wrote:

...

> I've got an issue with guard(spinlock_irqsave).

No, you got an issue with sparse.

> I have the following warning (make C=1):
> drivers/net/wan/fsl_qmc_hdlc.c:49:12: warning: context imbalance in 'qmc_hdlc_framer_set_carrier' - wrong count at exit
> 
> I also tried to call guard(spinlock_irqsave) before 'if (!qmc_hdlc->framer)'
> but it does not change anything.
> 
> Did I miss something in the guard(spinlock_irqsave) usage ?

You may ignore that for now. Not your problem, no problem in the code.

https://lore.kernel.org/linux-sparse/8d596a06-9f25-4d9f-8282-deb2d03a6b0a@moroto.mountain/

-- 
With Best Regards,
Andy Shevchenko


