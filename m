Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018636B541C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 23:16:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYL4M5j1Lz3fWN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 09:16:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OfS4jME/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OfS4jME/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYL3S5Nvgz307t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 09:15:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BDC6BB82428;
	Fri, 10 Mar 2023 22:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749CFC433EF;
	Fri, 10 Mar 2023 22:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678486543;
	bh=DBl3XYhVnPnvHREV6khsX0zced8HUvT1CffAKeLd3Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfS4jME/FTj7znUmYf295mHvCJSGHW15meDAWvWzrPF00ribhkkR54Qzq1xN8JWLo
	 4ifTzybHNa9ZODC6VxC42vmMGTVR8rpuWOM6tKK420xu8RHuuxnRruXC7YKzvCsgbR
	 u/3W/J52kt+Sw35gEY+GHE+yc90z2JKYQ8ziYt9KjcC+XD8bNVo3dAsYq1L9Dq9Z0P
	 F78mqifIRtEWY9l2xPq1eww1JPlj0DytsnzKq9XlcZ3XWB4shMaJ1Gp356DNbpjhAm
	 fT6kd6cAHwWNZ9v/mPpirze0bthx/rOXMwvra8reVtn+1Ve3YO1CPCN4cOH1gbnOxg
	 +A+CV4nR0FY6w==
Date: Fri, 10 Mar 2023 15:15:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZAusCnLSXeEcpQs+@kbusch-mbp.dhcp.thefacebook.com>
References: <20230310171416.23356-1-andriy.shevchenko@linux.intel.com>
 <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 07:14:13PM +0200, Andy Shevchenko wrote:
> +#define __pci_dev_for_each_resource(dev, res, __i, vartype)		\
> +	for (vartype __i = 0;						\
> +		res = &(dev)->resource[__i], __i < PCI_NUM_RESOURCES;	\
> +		__i++)

...

> +#define pci_dev_for_each_resource_p(dev, res)				\
> +	__pci_dev_for_each_resource(dev, res, i, unsigned int)

It looks dangerous to have a macro declare a variable when starting a new
scope. How do you know the name 'i' won't clash with something defined above?
