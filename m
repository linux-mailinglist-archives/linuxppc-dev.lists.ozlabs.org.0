Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091255F6627
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjrW21spFz3bjS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:35:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R4alV+IR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R4alV+IR;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjrV30htgz3bjL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 23:34:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665059659; x=1696595659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KLPlNjfONSRgkRmAk1/3zUaUpgzi9KonOZUB6whE/kI=;
  b=R4alV+IRpHkSI+yb07TJtBYfCpbvQ+JHq1WE4Agreb8BmZUA4dOBYZLa
   wpnJXkotN4xB4fTXGupjxWkqazkthv3umw36MjNW6n14zaj0qdzVMicOL
   bq7AVBVpiIsN7evxCyeT+o6AQ4tavxzpfYLKBqHd6H/wol1fsaj5WgRkC
   G9beWjgXEM9sdoCOp6pcZqxGEwZaFjuxR9M9U2L3tA54be+iUzS0983gX
   cHTCfFUw/Zjkm6VTxpgZm4Pmt4AFb1LoX6EFXSi5dfDi1dqPuUy8ab/7D
   jhjlhhdLb6jqOT8UXh1YxDpJzpSl03uC5L3799Qne2Iob7dD3X+EUwnCm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="290687806"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="290687806"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 05:34:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="953601835"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="953601835"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2022 05:34:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ogQ4o-0038tb-1b;
	Thu, 06 Oct 2022 15:34:10 +0300
Date: Thu, 6 Oct 2022 15:34:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/2] device property: Introduce
 fwnode_device_is_compatible() helper
Message-ID: <Yz7LQuf0L29cne3I@smile.fi.intel.com>
References: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
 <20221005152947.71696-2-andriy.shevchenko@linux.intel.com>
 <Yz3xsmy/3wlntStv@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz3xsmy/3wlntStv@paasikivi.fi.intel.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 05, 2022 at 09:05:54PM +0000, Sakari Ailus wrote:
> On Wed, Oct 05, 2022 at 06:29:46PM +0300, Andy Shevchenko wrote:

...

> fwnode_property_match_string() returns zero on success, therefore >= 0 is
> not needed. I'd just use !fwnode_property_match_string(...).

No, it's bug in the documentation, thanks to rising an attention,
I forgot to send a fix for it earlier.

> For both patches:
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, but as stated above the condition in my patch is correct.
It seems due to documentation bug we have some kind of "buggy" code,
luckily not too many to fix.

That said, I'm not going to resend this until PPC (Freescale) maintainers
ask for it. Yang, what's your vision on this series?

-- 
With Best Regards,
Andy Shevchenko


