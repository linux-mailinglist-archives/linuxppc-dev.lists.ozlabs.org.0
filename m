Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FED61881A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 20:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3Ckp6FXkz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 06:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwuaEKRj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwuaEKRj;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3Cjv4qvFz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:59:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667501987; x=1699037987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iDzJkwIYDgDj9s9QyYyQqMun6Fj8NrFnD6UKX0fcnAs=;
  b=MwuaEKRjZaSc+IJEudiD+wyUTTzxtTx9XAT2gE4OOwpis7ECQFtH3uxU
   bhc1GsTHDXORSVb5RJtWwLH+hrk3Lb1KQO0MFt/wK/C4U2p6djE8oemS+
   dyJYX/VgYULln7+YpkfHOeuiyvEpcgfVnUy15819wi4Xv6vNd6TNUFsmf
   SYhO81aj0bRI8MTZvJT85kzPcdOi4OFhMIq9xBXwzL9wLAio/sdTbzZJH
   Gck3AAovH/seuZLKVLsDtPGAWJPiD5z2tZxFjStFpxd+KS4WyKqxmEnB4
   Wlh36JtgCcnulrGltJm2FlFPZnFxgWKY/6WPZYlJwj8RqunQ+APbEbNvo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="290166543"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="290166543"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 11:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="724055696"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; 
   d="scan'208";a="724055696"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2022 11:59:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oqfR8-006zVP-0o;
	Thu, 03 Nov 2022 20:59:34 +0200
Date: Thu, 3 Nov 2022 20:59:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QPlZ0mhLvKw7X5@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2QImB0OLakzz1+F@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2QImB0OLakzz1+F@rocinante>
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
Cc: linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@d
 avemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 04, 2022 at 03:29:44AM +0900, Krzysztof Wilczyński wrote:

> > > > -
> > > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > > -		res = s->cb_dev->bus->resource[i];
> > > > -#else
> > > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > > >  #endif
> > > > +
> > > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > > >  		if (!res)
> > > >  			continue;
> > > 
> > > Doesn't this remove the proper iterator for X86? Even if that is the right
> > > thing to do, it needs an explict explanation.
> > 
> > I dunno what was in 2010, but reading code now I have found no differences in
> > the logic on how resources are being iterated in these two pieces of code.
> 
> This code is over a decade old (13 years old to be precise) and there was
> something odd between Bjorn's and Jesse's patches, as per:
> 
>   89a74ecccd1f ("PCI: add pci_bus_for_each_resource(), remove direct bus->resource[] refs")
>   cf26e8dc4194 ("pcmcia: do not autoadd root PCI bus resources")

Yeah, thanks for pointing out to the other patch from the same 2010 year.
It seems the code was completely identical that time, now it uses more
sophisticated way of getting bus resources, but it's kept the same for
the resources under PCI_BRIDGE_RESOURCE_NUM threshold.

> > But fine, I will add a line to a commit message about this change.
> 
> I wouldn't, personally.  The change you are proposing is self-explanatory
> and somewhat in-line with what is there already - unless I am also reading
> the current implementation wrong.

But it wouldn't be harmful either.

> That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> word, so to speak. :)
> 
> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
> 
> No need, really.  Again, unless Dominik thinks otherwise.

I think that what is wanted to have to get his tag.

Thanks for review, both of you, guys!

-- 
With Best Regards,
Andy Shevchenko


