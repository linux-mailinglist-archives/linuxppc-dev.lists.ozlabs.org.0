Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 587576B9EE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 19:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbj9n1mw4z3cLx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 05:44:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2SM+Pnc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2SM+Pnc;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbj8t1ds3z2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 05:43:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678819422; x=1710355422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcDoA6lnkNndAAvLyrmktLzn4ToTWYKaGtwl/HFFUFk=;
  b=Q2SM+PncGWYFJsJbm4vISbUrRV85QIpSIy4A0sRsGzUZGLXxWY+g9onv
   +Xh0IxCgqqgS4OgGiiynt5lFyxrC/6uy7YvKUXj3DvrMUlCZ6eJ/RFwJx
   Iyeic7/p8QSE+BudxA3u/TQn3oG3egdgCg3siLGPUNknRpgR9hnh+M+4A
   wnCqORaQld/eclXVEnjAZ1IEqOBzDYOQQmF/mdqsQOWnqCkZfYucvTGmj
   PzDQNwFM0LFOdrYlJxwuzxeEY/TwaPws+HoVhdYwzKKJ97d8/G22zfrel
   bh2Dyj5CoF3qBErTqBpHh1bcTVlxNYYAA5MGX8Jwg8Wc+3jBtFCkFmBSk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365185412"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="365185412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="802973476"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="802973476"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 14 Mar 2023 11:43:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pc9cO-003NLi-0Q;
	Tue, 14 Mar 2023 20:43:28 +0200
Date: Tue, 14 Mar 2023 20:43:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBDAT4MJO+fBy61n@smile.fi.intel.com>
References: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, oe-kbuild-all@lists.linux.dev, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, lkp@intel.com, Juergen Gross <jgross@suse.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
 , linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 11, 2023 at 04:54:32PM +0300, Dan Carpenter wrote:

> 059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
> 999ed65ad12e37 Rene Herman     2008-07-25  247  
> 059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
>                                                                                                   ^^
> This || needs to be &&.  This loop will always hit the continue path
> without doing anything.
> 
> 059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
> 0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;

Thanks, I'll fix in v5.

-- 
With Best Regards,
Andy Shevchenko


