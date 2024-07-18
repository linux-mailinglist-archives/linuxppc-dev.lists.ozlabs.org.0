Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C13934ACB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 11:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPnMv445gz3fRG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 19:20:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPnMW35Zrz3cNc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 19:20:07 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGz-0002U5-TA; Thu, 18 Jul 2024 11:18:01 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-000PqF-MB; Thu, 18 Jul 2024 11:17:53 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sUNGr-003zXS-1Y;
	Thu, 18 Jul 2024 11:17:53 +0200
Date: Thu, 18 Jul 2024 11:17:53 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
References: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
 <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
 <20240709114302.3c604ef3@xps-13>
 <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
 <20240717101948.2e99f472@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717101948.2e99f472@xps-13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Miquel,

On 24-07-17, Miquel Raynal wrote:
> Hi Marco,
> 
> > > > > Overall I think the idea of getting rid of these misc/ drivers is goes
> > > > > into the right direction, but registering directly into NVMEM makes
> > > > > more sense IMO.    
> > > > 
> > > > So you propose to have two places for the partition handling (one for
> > > > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > > > directly?  
> > > 
> > > Why two places for the partitions handling? Just one, in NVMEM. Also  
> > 
> > Without checking the details I think that converting the MTD
> > partitioning code into NVMEM partitioning code is a bigger task. As you
> > said below there are many legacy code paths you need to consider so they
> > still work afterwards as well.
> > 
> > > usually EEPROMs don't require very advanced partitioning schemes,
> > > unlike flashes (which are the most common MTD devices today).  
> > 
> > As said in my cover letter EEPROMs can become quite large and MTD
> > supports partitioning storage devices which is very handy for large
> > EEPROMs as well.
> 
> Did you had a look at nvmem-layouts ? In particular the fixed-layout.

Yes I had a look at nvmem-layouts and we use them within a
mtd-partition. Using them instead of a mtd-partition is not sufficient
since they:
 1) don't support user-space write (I send a patch for it but it doesn't
    seem to be accepted soon).
 2) If write would be supported the user-space need to write the
    complete cell e.g. no partial writes.

> Is there anything you would like to achieve already that is not
> possible with nvmem but is with mtd?

Please see above.

Regards,
  Marco
