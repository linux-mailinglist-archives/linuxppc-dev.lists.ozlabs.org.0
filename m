Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6C992B57E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 12:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJHYs4TSbz3dDP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 20:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJHYV456zz3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 20:39:42 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8FD-0003rR-B5; Tue, 09 Jul 2024 12:38:47 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8F7-008G9a-MD; Tue, 09 Jul 2024 12:38:41 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sR8F7-006Uv6-1k;
	Tue, 09 Jul 2024 12:38:41 +0200
Date: Tue, 9 Jul 2024 12:38:41 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240709103841.7x7n4hdtqrunyoc3@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
 <20240702-mighty-brilliant-eel-b0d9fa@houat>
 <20240708084440.70186564@xps-13>
 <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
 <20240709114302.3c604ef3@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709114302.3c604ef3@xps-13>
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

On 24-07-09, Miquel Raynal wrote:
> Hi Marco,
> 
> > > > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
> > > > > >> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
> > > > > >> drivers under a single interface. I am not sure what came of it though,
> > > > > >> since I can't find any patches that followed up with the proposal.    
> > > > > >
> > > > > > That discussion led to drivers/nvmem after I started to work on
> > > > > > some early prototype, and Srinivas took over that work.    
> > > > > 
> > > > > So would you say it is better for EEPROM drivers to use nvmem instead of
> > > > > moving under MTD?    
> > > > 
> > > > I thought so at the time, but that was more than 10y ago, and I have
> > > > followed neither nvmem nor MTD since so I don't really have an opinion
> > > > there.
> > > > 
> > > > It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> > > > and MTD can be used as an nvmem provider too, so it's not clear to me
> > > > why we would want to create yet another variant.
> > > > 
> > > > But again, you shouldn't really ask me in the first place :)
> > > > 
> > > > I'm sure Miquel, Srinivas, and surely others, are much more relevant to
> > > > answer that question.  
> > > 
> > > More relevant, I doubt, but just a feeling: EEPROMs have their own
> > > subsystem now, NVMEM, which, as Maxime said, was initially written for
> > > that very specific case. EEPROMs don't have the complexity of MTD
> > > devices, and thus pulling the whole MTD subsystem just for getting
> > > partitions seems counter intuitive to me. You can definitely "split"
> > > EEPROM devices with NVMEM as well anyway.  
> > 
> > I asked for feedback on my RFC [1] and all I got was to merge both
> > drivers into one and make the driver backward compatible, which I did by
> > this commit.
> 
> I'm sorry for not bringing this earlier.

The purpose of the RFC was exactly to figure out the way to go therefore
I'm a bit surprised now :/

> > > Overall I think the idea of getting rid of these misc/ drivers is goes
> > > into the right direction, but registering directly into NVMEM makes
> > > more sense IMO.  
> > 
> > So you propose to have two places for the partition handling (one for
> > MTD and one for NVMEM) instead of one and moving the code into NVMEM
> > directly?
> 
> Why two places for the partitions handling? Just one, in NVMEM. Also

Without checking the details I think that converting the MTD
partitioning code into NVMEM partitioning code is a bigger task. As you
said below there are many legacy code paths you need to consider so they
still work afterwards as well.

> usually EEPROMs don't require very advanced partitioning schemes,
> unlike flashes (which are the most common MTD devices today).

As said in my cover letter EEPROMs can become quite large and MTD
supports partitioning storage devices which is very handy for large
EEPROMs as well.

> > That doesn't sound right to me either. Also I don't get the
> > point why EEPROMs can't be handled by the MTD layer?
> 
> They can, but should they? Just compile the two layers and observe
> the size difference. MTD is complex and old, carries a lot of history,
> and the user interface is also not straightforward because you need to
> handle pages, blocks, erases, bitflips, ECC stats, OOB bytes and
> positions, two OTP areas... None of that exists in the EEPROM world. So
> why would you want to register into MTD and pull a huge subsystem while
> there is a much more recent, simpler and way lighter subsystem fitting
> much better your device?

Didn't checked the size but the honest, MTD provides many Kconfig
switches to trim the size down. As of now the mtd.o is made of up to 5
(6 if chipreg.o is counted -> should be an opt) files which is of course
larger than the pure misc/eeprom/at24.c driver but not that large. 

Regards,
  Marco

> > The layer already
> > supports devices of type MTD_RAM which are very simple and don't require
> > an erase-op at least I don't see one.
> 
> MTD_RAM has been there forever, probably for "bad" reasons. BTW there
> has been an attempt at removing it which was reverted in _2006_ and then
> felt into the cracks:
> 21c8db9eff95 ("[MTD] Restore MTD_ROM and MTD_RAM types")
> 
> Thanks,
> Miquèl
> 
