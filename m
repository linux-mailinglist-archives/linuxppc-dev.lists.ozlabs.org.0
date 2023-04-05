Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB126D8819
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 22:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsGF61N9dz3fQq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qSIFfK6l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qSIFfK6l;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsGDF4yWwz3cjB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 06:18:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8C1A62A31;
	Wed,  5 Apr 2023 20:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF579C433EF;
	Wed,  5 Apr 2023 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680725914;
	bh=nzqjLaTJey3sRM+1TqQcKEYWams7IVp4kAG1Ou4QbaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qSIFfK6lOkdOAB5LY9zLp6kglpMt1j7LNegofExp0NbD3DdGJu2FIQSd9fKDakYSF
	 8EdaJODqwbg6kctJMgL0riv0zeo2GlzJNTyce/xBoaGt5wkbyslXtmEQr79jETD5VN
	 JkGR/SuDh0S5XNaO9WvVcUE8aLyF+fq2KHagkNoYCPN/ufYZsMFzIEL8TOwxz22rru
	 dTfc7KYc7iXQfdVOTiFqncjiOZ6vNACqFFlXmfZkUJ6vh6opIHeXG2F88mLt2+N1/j
	 qSW8PkxMlDLNSe4zXOh05GwayXmUNnmLRiK0jPqk3fXDd1WbPKGLoR9/9OHb8FIaNI
	 uOrsrDeBHNVGg==
Date: Wed, 5 Apr 2023 15:18:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <20230405201832.GA3638070@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
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
 physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 11:28:27AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > Provide two new helper macros to iterate over PCI device resources and
> > > convert users.
> > > 
> > > Looking at it, refactor existing pci_bus_for_each_resource() and convert
> > > users accordingly.

> > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> 
> Btw, can you actually drop patch 7, please?

Done.

> > I omitted
> > 
> >   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> > 
> > only because it's not essential to this series and has only a trivial
> > one-line impact on include/linux/pci.h.
> 
> I'm not sure I understood what exactly "essentiality" means to you, but
> I included that because it makes the split which can be used later by
> others and not including kernel.h in the header is the objective I want
> to achieve. Without this patch the achievement is going to be deferred.
> Yet, this, as you have noticed, allows to compile and use the macros in
> the rest of the patches.

I haven't followed the kernel.h splitting, and I try to avoid
incidental changes outside of the files I maintain, so I just wanted
to keep this series purely PCI and avoid any possible objections to a
new include file or discussion about how it should be done.
