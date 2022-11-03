Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4DC6187F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3CWT2F24z3dvL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 05:50:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=dominikbrodowski.net (client-ip=136.243.71.142; helo=isilmar-4.linta.de; envelope-from=linux@dominikbrodowski.net; receiver=<UNKNOWN>)
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3CVs6hJXz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:50:13 +1100 (AEDT)
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from owl.dominikbrodowski.net (owl.brodo.linta [10.2.0.111])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id A7E69201457;
	Thu,  3 Nov 2022 18:50:07 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
	id 564FF801F1; Thu,  3 Nov 2022 19:38:07 +0100 (CET)
Date: Thu, 3 Nov 2022 19:38:07 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QKjzL+nH6Zabg7@owl.dominikbrodowski.net>
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
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <da
 vem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Fri, Nov 04, 2022 at 03:29:44AM +0900 schrieb Krzysztof Wilczyński:
> Hello,
> 
> [...]
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
> 
> > But fine, I will add a line to a commit message about this change.
> 
> I wouldn't, personally.  The change you are proposing is self-explanatory
> and somewhat in-line with what is there already - unless I am also reading
> the current implementation wrong.
> 
> That said, Dominik is the maintainer of PCMCIA driver, so his is the last
> word, so to speak. :)
> 
> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
> 
> No need, really.  Again, unless Dominik thinks otherwise.

Ah, thanks for the correction. Then v2 is perfectly fine.

Thanks,
	Dominik
