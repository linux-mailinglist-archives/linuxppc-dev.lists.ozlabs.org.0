Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C876C54E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 20:29:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhdnT6nmYz3chw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 06:29:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kI7PD7oK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kI7PD7oK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhdmW022dz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 06:28:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6684621BD;
	Wed, 22 Mar 2023 19:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E40C433EF;
	Wed, 22 Mar 2023 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679513286;
	bh=QIwrcxSinbm192yIC5GYq8pmRiEZXatEfhuZCKvaZVA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kI7PD7oKOFUaqAGxpAEV1J4pqcq5sYqOlE6tZdI8XvLDftVUW7xBLrIm39EDMCeew
	 YbY7ekOsQ8pk2imeaozqedO08eUYORwgATq+PR72VZKK9Z+xSe875Jwime72E5sujt
	 OKX3MZ05HrUnh6VUWqiK4KPTgw44b5/A4+dvjU5eUJO6DS6BfQZ05ojXQDveuaCfbR
	 6kmoRGkL8zdl0AgEDHh0jZJq5WemnXINfkZV2PRGtY6aFlS4evcy50ZkNqbrgQ5Ywt
	 FkmgtOO8ISwsbbhE86dRqqKL+QyXR15+6PMXkOeNiqH/SJXrUqlZdQCXic7R1fgBC0
	 vZjopyk7ipwkQ==
Date: Wed, 22 Mar 2023 14:28:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <20230322192804.GA2485349@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320131633.61680-2-andriy.shevchenko@linux.intel.com>
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

Hi Andy and Mika,

I really like the improvements here.  They make the code read much
better.

On Mon, Mar 20, 2023 at 03:16:30PM +0200, Andy Shevchenko wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> ...

>  static void fixup_winbond_82c105(struct pci_dev* dev)
>  {
> -	int i;
> +	struct resource *r;
>  	unsigned int reg;
>  
>  	if (!machine_is(pseries))
> @@ -251,14 +251,14 @@ static void fixup_winbond_82c105(struct pci_dev* dev)
>  	/* Enable LEGIRQ to use INTC instead of ISA interrupts */
>  	pci_write_config_dword(dev, 0x40, reg | (1<<11));
>  
> -	for (i = 0; i < DEVICE_COUNT_RESOURCE; ++i) {
> +	pci_dev_for_each_resource_p(dev, r) {
>  		/* zap the 2nd function of the winbond chip */
> -		if (dev->resource[i].flags & IORESOURCE_IO
> -		    && dev->bus->number == 0 && dev->devfn == 0x81)
> -			dev->resource[i].flags &= ~IORESOURCE_IO;
> -		if (dev->resource[i].start == 0 && dev->resource[i].end) {
> -			dev->resource[i].flags = 0;
> -			dev->resource[i].end = 0;
> +		if (dev->bus->number == 0 && dev->devfn == 0x81 &&
> +		    r->flags & IORESOURCE_IO)

This is a nice literal conversion, but it's kind of lame to test
bus->number and devfn *inside* the loop here, since they can't change
inside the loop.

> +			r->flags &= ~IORESOURCE_IO;
> +		if (r->start == 0 && r->end) {
> +			r->flags = 0;
> +			r->end = 0;
>  		}
>  	}

>  #define pci_resource_len(dev,bar) \
>  	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
>  							\
> -	 (pci_resource_end((dev), (bar)) -		\
> -	  pci_resource_start((dev), (bar)) + 1))
> +	 resource_size(pci_resource_n((dev), (bar))))

I like this change, but it's unrelated to pci_dev_for_each_resource()
and unmentioned in the commit log.

> +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> +	for (vartype __i = 0;						\
> +	     res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;	\
> +	     __i++)
> +
> +#define pci_dev_for_each_resource(dev, res, i)				\
> +       __pci_dev_for_each_resource(dev, res, i, )
> +
> +#define pci_dev_for_each_resource_p(dev, res)				\
> +	__pci_dev_for_each_resource(dev, res, __i, unsigned int)

This series converts many cases to drop the iterator variable ("i"),
which is fantastic.

Several of the remaining places need the iterator variable only to
call pci_claim_resource(), which could be converted to take a "struct
resource *" directly without much trouble.

We don't have to do that pci_claim_resource() conversion now, but
since we're converging on the "(dev, res)" style, I think we should
reverse the names so we have something like:

  pci_dev_for_each_resource(dev, res)
  pci_dev_for_each_resource_idx(dev, res, i)

Not sure __pci_dev_for_each_resource() is worthwhile since it only
avoids repeating that single "for" statement, and passing in "vartype"
(sometimes empty to implicitly avoid the declaration) is a little
complicated to read.  I think it'd be easier to read like this:

  #define pci_dev_for_each_resource(dev, res)                      \
    for (unsigned int __i = 0;                                     \
         res = pci_resource_n(dev, __i), __i < PCI_NUM_RESOURCES;  \
         __i++)

  #define pci_dev_for_each_resource_idx(dev, res, idx)             \
    for (idx = 0;                                                  \
         res = pci_resource_n(dev, idx), idx < PCI_NUM_RESOURCES;  \
         idx++)

Bjorn
