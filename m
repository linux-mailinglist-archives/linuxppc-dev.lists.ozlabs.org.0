Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D76C6B01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj77Q09xhz3fBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:31:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bwv/RXM6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bwv/RXM6;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj76T02Kwz3chw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 01:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679581825; x=1711117825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yycxH1AeGogQsiHx6KGAN/nQ6jWFX888/jtMkSYZfjo=;
  b=Bwv/RXM6P+zHpdECma+ZgVBjZIcARK0507jQzzDm19wqBOMiDD3JZbIW
   vbiu7UD0f2q56BltW0y2EuOu0ysajieEHHaHghMCtTtI0HiW2ya6wRJ2r
   JBdxRSEOFP7Esg0dQ14uPe+JsmnxKYpBcpOccYK7PSiV3sR3DUo/ii122
   4gKcRFRt1WzABMs5cL3k3TFLZYuRZKwTpac0dUfKe+Ih6ftMdl4qRVT2F
   rpfFXk/oKg5Obo+9TLsMK6Zg5/UaFlrAkNxMJQIlY6fIeE5iFSmUygP8p
   GUrXiIfWg5iqD2VPo+71Wmt1BcNhvX4pEyd0PpSLaWRrgzHOhfRe4oKve
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="367241209"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367241209"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 07:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684752720"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684752720"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 07:30:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pfLx3-007XTh-2N;
	Thu, 23 Mar 2023 16:30:01 +0200
Date: Thu, 23 Mar 2023 16:30:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
References: <20230320131633.61680-2-andriy.shevchenko@linux.intel.com>
 <20230322192804.GA2485349@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322192804.GA2485349@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@
 physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 22, 2023 at 02:28:04PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 20, 2023 at 03:16:30PM +0200, Andy Shevchenko wrote:

...

> > +	pci_dev_for_each_resource_p(dev, r) {
> >  		/* zap the 2nd function of the winbond chip */
> > -		if (dev->resource[i].flags & IORESOURCE_IO
> > -		    && dev->bus->number == 0 && dev->devfn == 0x81)
> > -			dev->resource[i].flags &= ~IORESOURCE_IO;
> > -		if (dev->resource[i].start == 0 && dev->resource[i].end) {
> > -			dev->resource[i].flags = 0;
> > -			dev->resource[i].end = 0;
> > +		if (dev->bus->number == 0 && dev->devfn == 0x81 &&
> > +		    r->flags & IORESOURCE_IO)
> 
> This is a nice literal conversion, but it's kind of lame to test
> bus->number and devfn *inside* the loop here, since they can't change
> inside the loop.

Hmm... why are you asking me, even if I may agree on that? It's
in the original code and out of scope of this series.

> > +			r->flags &= ~IORESOURCE_IO;
> > +		if (r->start == 0 && r->end) {
> > +			r->flags = 0;
> > +			r->end = 0;
> >  		}
> >  	}

...

> >  #define pci_resource_len(dev,bar) \
> >  	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> >  							\
> > -	 (pci_resource_end((dev), (bar)) -		\
> > -	  pci_resource_start((dev), (bar)) + 1))
> > +	 resource_size(pci_resource_n((dev), (bar))))
> 
> I like this change, but it's unrelated to pci_dev_for_each_resource()
> and unmentioned in the commit log.

And as you rightfully noticed this either. I can split it to a separate one.

...

> > +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> > +	for (vartype __i = 0;						\
> > +	     res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;	\
> > +	     __i++)
> > +
> > +#define pci_dev_for_each_resource(dev, res, i)				\
> > +       __pci_dev_for_each_resource(dev, res, i, )
> > +
> > +#define pci_dev_for_each_resource_p(dev, res)				\
> > +	__pci_dev_for_each_resource(dev, res, __i, unsigned int)
> 
> This series converts many cases to drop the iterator variable ("i"),
> which is fantastic.
> 
> Several of the remaining places need the iterator variable only to
> call pci_claim_resource(), which could be converted to take a "struct
> resource *" directly without much trouble.
> 
> We don't have to do that pci_claim_resource() conversion now,

Exactly, it's definitely should be separate change.

> but
> since we're converging on the "(dev, res)" style, I think we should
> reverse the names so we have something like:
> 
>   pci_dev_for_each_resource(dev, res)
>   pci_dev_for_each_resource_idx(dev, res, i)

Wouldn't it be more churn, including pci_bus_for_each_resource() correction?

...

> Not sure __pci_dev_for_each_resource() is worthwhile since it only
> avoids repeating that single "for" statement, and passing in "vartype"
> (sometimes empty to implicitly avoid the declaration) is a little
> complicated to read.  I think it'd be easier to read like this:

No objections here.

>   #define pci_dev_for_each_resource(dev, res)                      \
>     for (unsigned int __i = 0;                                     \
>          res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;  \
>          __i++)
> 
>   #define pci_dev_for_each_resource_idx(dev, res, idx)             \
>     for (idx = 0;                                                  \
>          res = pci_resource_n(dev, idx), idx < PCI_NUM_RESOURCES;  \
>          idx++)

-- 
With Best Regards,
Andy Shevchenko


