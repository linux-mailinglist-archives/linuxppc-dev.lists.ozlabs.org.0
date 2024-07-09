Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112292B442
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 11:44:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pS12M/hF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJGKC6tTMz3dJs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 19:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=pS12M/hF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 97099 seconds by postgrey-1.37 at boromir; Tue, 09 Jul 2024 19:43:22 AEST
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJGJV28jlz30WJ;
	Tue,  9 Jul 2024 19:43:18 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 896761BF20E;
	Tue,  9 Jul 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720518188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVMmtSjwlNQmVjxtUeUdR3iKhz4W+lQLl2pkn1Xk12k=;
	b=pS12M/hFFtUvUahs26E5vD/JZJjIQ8CmyPf5kCaaSJzFbR3RDeMCaG4WkQ18U83Kje7Xfl
	AyN919sqdbsVTsmreQhwHSygXqgRJ0kdPQ5zjcJUGtxlT4Ho9p8ijdF8YfTeIO6HFDK7eO
	9ZWZUOd5wpLbo4/rkrKRN8+RnXilQYghyruJzJG1B0By1AlkPDEswaoM56ChbKqR9xzmtO
	jhtQebyqSJwnet2P69DvwaCq24fYzhp/MVzppGLvK1eJdhxGBanp5/LzDMV65mb+L+itk6
	lQKaVcgNUEyq8U3sZF8TqV+3RTbRtu+1Gi6vNNP28kc9H4uebjsO4mk9Ei94yg==
Date: Tue, 9 Jul 2024 11:43:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240709114302.3c604ef3@xps-13>
In-Reply-To: <20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
	<20240708084440.70186564@xps-13>
	<20240709092214.omr7ccphdzdk7z7j@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Marco,

> > > > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggestin=
g adding
> > > > >> EEPROMs to MTD [1]. The main purpose would have been unifying th=
e EEPROM
> > > > >> drivers under a single interface. I am not sure what came of it =
though,
> > > > >> since I can't find any patches that followed up with the proposa=
l.   =20
> > > > >
> > > > > That discussion led to drivers/nvmem after I started to work on
> > > > > some early prototype, and Srinivas took over that work.   =20
> > > >=20
> > > > So would you say it is better for EEPROM drivers to use nvmem inste=
ad of
> > > > moving under MTD?   =20
> > >=20
> > > I thought so at the time, but that was more than 10y ago, and I have
> > > followed neither nvmem nor MTD since so I don't really have an opinion
> > > there.
> > >=20
> > > It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> > > and MTD can be used as an nvmem provider too, so it's not clear to me
> > > why we would want to create yet another variant.
> > >=20
> > > But again, you shouldn't really ask me in the first place :)
> > >=20
> > > I'm sure Miquel, Srinivas, and surely others, are much more relevant =
to
> > > answer that question. =20
> >=20
> > More relevant, I doubt, but just a feeling: EEPROMs have their own
> > subsystem now, NVMEM, which, as Maxime said, was initially written for
> > that very specific case. EEPROMs don't have the complexity of MTD
> > devices, and thus pulling the whole MTD subsystem just for getting
> > partitions seems counter intuitive to me. You can definitely "split"
> > EEPROM devices with NVMEM as well anyway. =20
>=20
> I asked for feedback on my RFC [1] and all I got was to merge both
> drivers into one and make the driver backward compatible, which I did by
> this commit.

I'm sorry for not bringing this earlier.

> > Overall I think the idea of getting rid of these misc/ drivers is goes
> > into the right direction, but registering directly into NVMEM makes
> > more sense IMO. =20
>=20
> So you propose to have two places for the partition handling (one for
> MTD and one for NVMEM) instead of one and moving the code into NVMEM
> directly?

Why two places for the partitions handling? Just one, in NVMEM. Also
usually EEPROMs don't require very advanced partitioning schemes,
unlike flashes (which are the most common MTD devices today).

> That doesn't sound right to me either. Also I don't get the
> point why EEPROMs can't be handled by the MTD layer?

They can, but should they? Just compile the two layers and observe
the size difference. MTD is complex and old, carries a lot of history,
and the user interface is also not straightforward because you need to
handle pages, blocks, erases, bitflips, ECC stats, OOB bytes and
positions, two OTP areas... None of that exists in the EEPROM world. So
why would you want to register into MTD and pull a huge subsystem while
there is a much more recent, simpler and way lighter subsystem fitting
much better your device?

> The layer already
> supports devices of type MTD_RAM which are very simple and don't require
> an erase-op at least I don't see one.

MTD_RAM has been there forever, probably for "bad" reasons. BTW there
has been an attempt at removing it which was reverted in _2006_ and then
felt into the cracks:
21c8db9eff95 ("[MTD] Restore MTD_ROM and MTD_RAM types")

Thanks,
Miqu=C3=A8l
