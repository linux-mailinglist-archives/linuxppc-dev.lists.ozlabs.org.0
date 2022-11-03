Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5606185F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:13:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N39Mk1hQ0z3cJY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:13:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hlb6Zeul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hlb6Zeul;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N39Ll1zbBz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:13:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667495583; x=1699031583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7YpyRAArYVbF9WNy66xCFId6MSUjEg0Z+IBgztnk6pE=;
  b=Hlb6ZeulMNX84C8TzIaZhHQn6gv37m+rlTiiG7xUDZa5z5AqG6LAKBxd
   F1i4/4LUYkTcYIKFQzg7ittzY02I7oK1toTCbcKcKepKj3NJhDQY3OsqT
   H7s0qunnFJ3qSAW6utqhozubObK3Zg0nquAtt6LnPDgUHNFvgEVWK2iey
   EB+l4FaOmmN+SRiXuYNPjRZtfLDle8dewhZjZJuamv7nE+Todemy/Rdue
   y8o6n1l3bT89kIMvx9Gl2P8jp30mnjOd5PDTkI6E/605Nl8fX2XKNgod9
   YRi4oVIb2NK5/biG9yMcqCQ3L4oI8yZG2L0nDTAOv6oy7tDIXA7ylWfpL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="307364180"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="307364180"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 10:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="666046647"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="666046647"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 03 Nov 2022 10:12:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oqdlm-006wiw-0o;
	Thu, 03 Nov 2022 19:12:46 +0200
Date: Thu, 3 Nov 2022 19:12:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
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
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:

...

> > -
> > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > -		res = s->cb_dev->bus->resource[i];
> > -#else
> > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> >  #endif
> > +
> > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> >  		if (!res)
> >  			continue;
> 
> Doesn't this remove the proper iterator for X86? Even if that is the right
> thing to do, it needs an explict explanation.

I dunno what was in 2010, but reading code now I have found no differences in
the logic on how resources are being iterated in these two pieces of code.

But fine, I will add a line to a commit message about this change.

Considering this is done, can you issue your conditional tag so I will
incorporate it in v3?

-- 
With Best Regards,
Andy Shevchenko


