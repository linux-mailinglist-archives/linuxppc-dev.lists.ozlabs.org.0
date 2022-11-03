Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFB618622
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:26:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N39f93DZqz3dvV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:26:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=dominikbrodowski.net (client-ip=136.243.71.142; helo=isilmar-4.linta.de; envelope-from=linux@dominikbrodowski.net; receiver=<UNKNOWN>)
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N39dc2JWVz3bc4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:25:56 +1100 (AEDT)
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
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 5C1742013E3;
	Thu,  3 Nov 2022 17:25:53 +0000 (UTC)
Received: by owl.dominikbrodowski.net (Postfix, from userid 1000)
	id 6880A8024B; Thu,  3 Nov 2022 18:25:45 +0100 (CET)
Date: Thu, 3 Nov 2022 18:25:45 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
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

Am Thu, Nov 03, 2022 at 07:12:45PM +0200 schrieb Andy Shevchenko:
> On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:
> > Am Thu, Nov 03, 2022 at 06:46:44PM +0200 schrieb Andy Shevchenko:
> 
> ...
> 
> > > -
> > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > -		res = s->cb_dev->bus->resource[i];
> > > -#else
> > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > >  #endif
> > > +
> > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > >  		if (!res)
> > >  			continue;
> > 
> > Doesn't this remove the proper iterator for X86? Even if that is the right
> > thing to do, it needs an explict explanation.
> 
> I dunno what was in 2010, but reading code now I have found no differences in
> the logic on how resources are being iterated in these two pieces of code.
> 
> But fine, I will add a line to a commit message about this change.
> 
> Considering this is done, can you issue your conditional tag so I will
> incorporate it in v3?

Certainly, feel free to add

	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
