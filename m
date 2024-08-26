Return-Path: <linuxppc-dev+bounces-529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2E95EDC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 11:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsmHw28pRz2yGh;
	Mon, 26 Aug 2024 19:55:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724659870;
	cv=none; b=S2dXVW08Z8eiZGcp9fMNmLVBMSY7D+WRCNIf/uC3ipS4Pu5qd4DXcnTBS4IUnfSM7y5NbSXdx0L8km8y0zrUYDP3OubAgEQA2pzmWgRJxDXvw1cgTYoqGHd2dWKIlL0Q+R8tVH/4PrOpsSNcfgw/h7IhsLTybZGNnJsbo0ZWtl4t4NxbGDlCipkLREocV2nH7uOfCJNRJp+ZoSnFYueGNuFXugqd+u+xnY6triLQW+bFCaGDk9iOb96bQMNbVG0y2OD+vHADkUmvSXiHiJmTkUBUQdAdoGPmj7g8cf4k+r8WOhSbH5OSNJ2E5kvbB2/NT/0evegexiXWng2NZ2KXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724659870; c=relaxed/relaxed;
	bh=IFgD/NSL0WJrKXnkqNks0aX5A7Stfo4Zhha7qxndCFk=;
	h=X-Greylist:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=ZM2vT+Nr9Abce8+69tLdtWPQOrTAWV2STIwLe3YsVmowO/rghuvp7URIOl0qawaoXyt27lQuHxVsStXygp0m19DuH990tUQ9R+xmvLKT6dJUJKILjtofz9WDzmrkkip6/GducJfsGUI9LFg/VdCXyzuI16xEyfiQ9GdlGm6aD8xUBoIREVZFwwsY9/iWYbIen5tgT/iWFy/LnvtpjTbDbzbojlnUAyfkfMViqdH5horVvDJleahhJ4cnoqh3mJoMUoO1975VYPHx/D4whpJA8ZjON7Fff6ZI+3LE0+bVLf2pjdv3RJTjmY7MftzrwjmX94nEPIf/ISc9N0KOGNykFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1076 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 18:11:09 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsjzx5JDNz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 18:11:09 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVR-0006mO-Jk; Mon, 26 Aug 2024 09:51:17 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-0038Ph-Cg; Mon, 26 Aug 2024 09:51:10 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1siUVK-006xmZ-0b;
	Mon, 26 Aug 2024 09:51:10 +0200
Date: Mon, 26 Aug 2024 09:51:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zsi3s9XithGEROwX@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org

Hi Andy,

On 24-08-23, Andy Shevchenko wrote:
> On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > This series adds the intial support to handle EEPROMs via the MTD layer
> > as well. This allow the user-space to have separate paritions since
> > EEPROMs can become quite large nowadays.
> > 
> > With this patchset applied EEPROMs can be accessed via:
> >   - legacy 'eeprom' device
> >   - nvmem device
> >   - mtd device(s)
> > 
> > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > 
> > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > the last patch is required at the moment. Please be notified that the
> > list of recipients is quite large due to the defconfig changes.
> 
> FWIW, I think that MTD is *not* the place for EEPROMs.
> 
> Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> historical reasons and absence an umbrella subsystem for them), but it's not
> the reason to hack them into something which is not quite suitable.

Thank you for you input. There are two things to mention:
 1st) I send a RFC patch and asked for feedback and all I got was: looks
      okay, please send a proper patch [1] which I did.
 2nd) I don't see the hacky part in this patchset.

Anyway the customer doesn't need the nvmem-partitions anymore and
therefore this patchset can be seen as obsolote.

Regards,
  Marco

[1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2

> 
> If NVMEM needs to be updated and may cover these cases after all (and do not
> forget about *small* size EEPROMs that most likely appear on the devices with
> limited amount of resources!) in a reasonable size and performance, why not?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
> 

