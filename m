Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80870929C65
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 08:45:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PzOy6Z2W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHZPx1hXNz3cXb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 16:45:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=PzOy6Z2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHZPD1wSTz3cGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 16:44:57 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 817CBE0006;
	Mon,  8 Jul 2024 06:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720421086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN45r2MzRBKAE4raZ17kWauJPTnIek3N3oaVcC2BO/g=;
	b=PzOy6Z2WDoUDIURvXSdTtpzbHX3JQqR2TwTpbeUTnfB6vX3dNcZ37ATxjxBqYPJmXyybOW
	/cSvPuilXVhZeR7B2dXURK6eJ39WhH4IRmB3cgvultxkXbdYRWIJAVPOSzfOAYpJjJ6yjj
	T4otuw7FybtaZrQhYLIzqq3zUvj4Jc9ZhqWNxjCSwxjRvmd7Z4M+rCx4VXtxp9PGAb8E1q
	oZ1dnF7ScZhNf1MbVD05qQH3qQWLfMAQwFkOz4wVja8KUEs30B2F3BIx4guMRdC+Ulvnk+
	YXsH623cgVPmDlxftJRPmEBJAk7rpJRwu3UnaQOHOTk3BC9lbm01fchVhlirnQ==
Date: Mon, 8 Jul 2024 08:44:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240708084440.70186564@xps-13>
In-Reply-To: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
	<mafs0ikxnykpr.fsf@kernel.org>
	<20240702-congenial-vigilant-boar-aeae44@houat>
	<mafs0ed8byj5z.fsf@kernel.org>
	<20240702-mighty-brilliant-eel-b0d9fa@houat>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> > >> >> Port the current misc/eeprom/at24.c driver to the MTD framework s=
ince
> > >> >> EEPROMs are memory-technology devices and the framework already s=
upports =20
> > >> >
> > >> > I was under the impression that MTD devices are tightly coupled by=
 erase
> > >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices afte=
r all? =20
> > >>=20
> > >> I was curious as well so I did some digging.
> > >>  =20
> > [...] =20
> > >>=20
> > >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting ad=
ding
> > >> EEPROMs to MTD [1]. The main purpose would have been unifying the EE=
PROM
> > >> drivers under a single interface. I am not sure what came of it thou=
gh,
> > >> since I can't find any patches that followed up with the proposal. =
=20
> > >
> > > That discussion led to drivers/nvmem after I started to work on
> > > some early prototype, and Srinivas took over that work. =20
> >=20
> > So would you say it is better for EEPROM drivers to use nvmem instead of
> > moving under MTD? =20
>=20
> I thought so at the time, but that was more than 10y ago, and I have
> followed neither nvmem nor MTD since so I don't really have an opinion
> there.
>=20
> It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
> and MTD can be used as an nvmem provider too, so it's not clear to me
> why we would want to create yet another variant.
>=20
> But again, you shouldn't really ask me in the first place :)
>=20
> I'm sure Miquel, Srinivas, and surely others, are much more relevant to
> answer that question.

More relevant, I doubt, but just a feeling: EEPROMs have their own
subsystem now, NVMEM, which, as Maxime said, was initially written for
that very specific case. EEPROMs don't have the complexity of MTD
devices, and thus pulling the whole MTD subsystem just for getting
partitions seems counter intuitive to me. You can definitely "split"
EEPROM devices with NVMEM as well anyway.

Overall I think the idea of getting rid of these misc/ drivers is goes
into the right direction, but registering directly into NVMEM makes
more sense IMO.

Thanks,
Miqu=C3=A8l
