Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB76618823
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 20:02:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3Cmh2gM1z3cfB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 06:02:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxy4WSjj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jxy4WSjj;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3Clk0jfjz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 06:01:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667502082; x=1699038082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sNkpjDaE4wFtOA2SWrBA99Yi2yLtSUQQFYkHqzgZpY0=;
  b=jxy4WSjj79lkheOUf5M1qu6FW2vAOAXtmQPKvDAFNRszCvOUlHV10iCI
   WYT9yU76r0beOuNkN4zK2tq5exZ9JsY0L+fH2T+E2YEthZLZTZZ2OR8XY
   n8d4Q7kVUcluJX79C2HdRoLtuY/+UT3WZRR0HtaBnZZHM0rUKM16tuUSY
   K4fOedIjjZ11pZzwBqJoI4jM5RIt3blSkkk4A1sqJknIKx65k7eFMJR3k
   2+0WIB1jo3KSyuCYSweK5P5R2jBHOuMEe+QVAQT/9qtBhp1KZgPRAsZjO
   /XoOqhOzDSSXWxlTlqDFGV9OmmQ6G9SwEi+dZceCWxCboL01veBd8Fp/b
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289495742"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="289495742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 12:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="629452994"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="629452994"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2022 12:01:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oqfSd-006zXu-1O;
	Thu, 03 Nov 2022 21:01:07 +0200
Date: Thu, 3 Nov 2022 21:01:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QP8yrZ7/9fpUQQ@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
 <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <d
 avem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 07:38:07PM +0100, Dominik Brodowski wrote:
> Am Fri, Nov 04, 2022 at 03:29:44AM +0900 schrieb Krzysztof Wilczyński:

...

> > That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> > word, so to speak. :)
> > 
> > > Considering this is done, can you issue your conditional tag so I will
> > > incorporate it in v3?
> > 
> > No need, really.  Again, unless Dominik thinks otherwise.
> 
> Ah, thanks for the correction. Then v2 is perfectly fine.

I'm fine with either, thanks!

-- 
With Best Regards,
Andy Shevchenko


