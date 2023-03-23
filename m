Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4236C6BD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 16:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj7rm6V3Rz3fDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 02:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QZ2KDQiD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QZ2KDQiD;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj7qp2LfZz3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:02:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 27E14B8208A;
	Thu, 23 Mar 2023 15:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7276DC4339E;
	Thu, 23 Mar 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679583760;
	bh=A4cz5sAtdGojClghNnzslTTn+0telsrqWPrc7ZEY92A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QZ2KDQiDLNeolamz/rBZXmXKaml10w90GcGwB6l5yO87qYFqQPDIQgKZ80zht8Qsc
	 Xeoi/zLrt2EtH3nbngx/R5sYZx0Xwf4JkO9knqHSrKtOYd2+7MSeapV8B/zw9rxmZf
	 9UhNHPKZpA1ucTpj/VgulfE/ACFQnVZP8YBw36pan4Gf8wwyvTOnEEDjDM2KPQPTQp
	 ZGCnVZCISmiqwx5zKNrKd8Mk7Zh6u/0oYwI8LPRfc1PEUXu67DDtdxfqNx9ryyF1pw
	 4cNq1h1H67JIwrFngX1Sl9ypuAP/OCB5kx8wJtxg7nOzQYMGU2gbmFC/O67YEr6JCJ
	 aHqE0tG0UVQoQ==
Date: Thu, 23 Mar 2023 10:02:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <20230323150238.GA2550157@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
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

On Thu, Mar 23, 2023 at 04:30:01PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 22, 2023 at 02:28:04PM -0500, Bjorn Helgaas wrote:
> > On Mon, Mar 20, 2023 at 03:16:30PM +0200, Andy Shevchenko wrote:
> ...
> 
> > > +	pci_dev_for_each_resource_p(dev, r) {
> > >  		/* zap the 2nd function of the winbond chip */
> > > -		if (dev->resource[i].flags & IORESOURCE_IO
> > > -		    && dev->bus->number == 0 && dev->devfn == 0x81)
> > > -			dev->resource[i].flags &= ~IORESOURCE_IO;
> > > -		if (dev->resource[i].start == 0 && dev->resource[i].end) {
> > > -			dev->resource[i].flags = 0;
> > > -			dev->resource[i].end = 0;
> > > +		if (dev->bus->number == 0 && dev->devfn == 0x81 &&
> > > +		    r->flags & IORESOURCE_IO)
> > 
> > This is a nice literal conversion, but it's kind of lame to test
> > bus->number and devfn *inside* the loop here, since they can't change
> > inside the loop.
> 
> Hmm... why are you asking me, even if I may agree on that? It's
> in the original code and out of scope of this series.

Yeah, I don't think it would be *unreasonable* to clean this up at the
same time so the maintainers can look at both at the same time (this
is arch/powerpc/platforms/pseries/pci.c, so Michael, et al), but no
need for you to do anything, certainly.  I can post a follow-up patch.

> > but
> > since we're converging on the "(dev, res)" style, I think we should
> > reverse the names so we have something like:
> > 
> >   pci_dev_for_each_resource(dev, res)
> >   pci_dev_for_each_resource_idx(dev, res, i)
> 
> Wouldn't it be more churn, including pci_bus_for_each_resource() correction?

Yes, it definitely is a little more churn because we already have
pci_bus_for_each_resource() that would have to be changed.

I poked around looking for similar patterns elsewhere with:

  git grep "#define.*for_each_.*_p("
  git grep "#define.*for_each_.*_idx("

I didn't find any other "_p" iterators and just a few "_idx" ones, so
my hope is to follow what little precedent there is, as well as
converge on the basic "*_for_each_resource()" iterators and remove the
"_idx()" versions over time by doing things like the
pci_claim_resource() change.

What do you think?  If it seems like excessive churn, we can do it
as-is and still try to reduce the use of the index variable over time.

Bjorn
