Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E102385F978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 14:20:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXzXZ6c5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgYfG5z3rz3dRY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 00:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXzXZ6c5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgYdV3qGTz3bx2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 00:19:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708607967; x=1740143967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rM+QYYYxCsdPj+BR4nYWbptpIkJSRUn3xXx4ABpm30o=;
  b=CXzXZ6c582qsUvtIvK9/cErWeUtaHUQqDk2TEfDJ2dibcKPEwcqlpcLQ
   YXL21Qo1pOjQZAmYxvpSYNDiToUShg3gLXbW+gKwNfvx9+Rt3DASzZ6Bz
   cwj+izpmb6Id91cz51ewY99SMwpEvRS1gSQra3i/rMCDwx5Z5NX9kjDWF
   NPGLo1Hm3uJcWj4NcWtp+KjOY19Z97ts+brIxISihAPYmNH8kTcezrbO7
   a3ljrPcxCyXiRNFIln68GFXlouZ3JeQjM9nJvWWOC3tgFE41e27jgzJPW
   jSCO2uNk/OMKK79YWL/ITEVhKWuVbdToZoHgXAZjILrI/oB2pq5IscLWi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25291526"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="25291526"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913522881"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="913522881"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:19:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rd8yl-00000006dTP-2xKh;
	Thu, 22 Feb 2024 15:19:11 +0200
Date: Thu, 22 Feb 2024 15:19:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 RESEND 1/6] net: wan: Add support for QMC HDLC
Message-ID: <ZddJz9msz1ACmw_k@smile.fi.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-2-herve.codina@bootlin.com>
 <ZcoNoDRF6h2C7TQd@smile.fi.intel.com>
 <20240222130516.5e139612@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222130516.5e139612@bootlin.com>
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

On Thu, Feb 22, 2024 at 01:05:16PM +0100, Herve Codina wrote:
> On Mon, 12 Feb 2024 14:22:56 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/hdlc.h>
> > > +#include <linux/module.h>  
> > 
> > > +#include <linux/of.h>
> > > +#include <linux/of_platform.h>  
> > 
> > I do not see how these are being used, am I right?
> > What's is missing OTOH is the mod_devicetable.h.
> 
> Agree for removing of.h and of_platform.h.
> 
> Why do I need mod_devicetable.h ?
> Isn't including module.h enough ?

In that header the definitions of many of ID table data structures are located.
You are using that in the code.

-- 
With Best Regards,
Andy Shevchenko


