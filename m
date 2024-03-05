Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11AB87220A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 15:54:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQ5yDmlL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpz9l46sxz3vdT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 01:54:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bQ5yDmlL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpz922SMmz307y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 01:53:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709650439; x=1741186439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0dOILnGFoAvtiNpVkLvJTAajQBVZzcEdsS8kcLekRAc=;
  b=bQ5yDmlLIEB7rAWnPNB4GYrUH4JzXW7ZiAb6W9qenXhiTtRj1KzAmZzK
   lTbep2OxZsK05adD3v9DI7X+wYXtzT46XDkkbpbo0Ec0CEyILjywkvBe1
   wO2jsC3UXnrURwkdQAF1GiQ6MVpdelNK0m4uy1UnVwydQqVDDdbiqInzV
   RzRKIiumGddh3ydsC3PPm1RXvzCMP6Iwm3pziLVvYnV/rAeBwF/7MO38k
   Hpo9+m6VmC+CBmZzrtNPKttkchwC9zsPCd6SbVo0OQzF5Jeh95In16MQE
   zXXkZF37GwnnvkfRnSGzXlP6s6CX0r864PsqCmLmQtqL9tlTPhlBRTJ+8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29628518"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="29628518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="914142173"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="914142173"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:53:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rhWAt-0000000A0d6-1ywE;
	Tue, 05 Mar 2024 16:53:47 +0200
Date: Tue, 5 Mar 2024 16:53:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add support for QMC HDLC
Message-ID: <Zecx-3mbOtb33DdB@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
 <ZeChdAsAhrC8a75t@smile.fi.intel.com>
 <20240305120226.791bfe9a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305120226.791bfe9a@bootlin.com>
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

On Tue, Mar 05, 2024 at 12:02:26PM +0100, Herve Codina wrote:
> On Thu, 29 Feb 2024 17:23:32 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> > I think it's a good series and next version will be final. The only question is
> > possible use of the returned values from bitmap_scatter()/bitmap_gather(), the
> > rest are minors.
> 
> I replied about the reason why I didn't return any values from
> bitmap_{scatter,gather}() in that patch 4 discussion.
> 
> Are you ok to keep them returning void in this series ?

Sure. We can amend that later if needed.

-- 
With Best Regards,
Andy Shevchenko


