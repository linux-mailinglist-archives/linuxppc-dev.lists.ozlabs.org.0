Return-Path: <linuxppc-dev+bounces-482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB3095DE9C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:55:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wrg2w4ddtz2y0B;
	Sun, 25 Aug 2024 00:55:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724428744;
	cv=none; b=KkY6Qie4WzJg1fGhNtE/JmVLPQllzoilYgfLklX597Rs5p/KJB6Wr5xNJJ1jMq6lIPtXwDzof/8ld/usVdQjDXaCLN++0xhEZhj99ZqQ0SxP+DlSQ7QyNjMFKzj/BEy/eRh6uoUNtSfHkMwt/ZHuRckKvFDqu+aKZPFGTPXXoxNQfTnDOlUQgue87/bFmyr58QW2SH0ArBV+gHd7XNUnkHtEx88xfIAM1NHgiQx8B9WHdHJzaFTNdjbXF7p121L78huGSodibtfMt7AkdXDvodzhb+CYqgKmH8i5s6x0oTYU9Kgr/ojXhXsHLxxeMO7jThFOTgu6YmgrHhU4Y3vEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724428744; c=relaxed/relaxed;
	bh=7CutgodhxN+FJr5V+VHWsJBhY68LFF7RKhgiCY4alWI=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-GND-Sasl; b=cMdD+xAiBtm+cpmJY1aLOWM18fxjAKj9tGQhoFaElCy5Wk1AsJtAHFtJztVKQMY8jXez7x0z7zrdLOa0scRXZeV09KsmUUldHhiIFNtRt9dDH6KZzdZW4YR33BGVV8kvxh2rhiSD2C/3PNIcdEYMlYqKZUeub2K+MOhqSrK6tJvuG+VkPB8eSRkoBOIgL3qrIiOF+aGpqEqtZFI3vAinMnfVuHo5OA5pIdjOzPVLgWNyQPgvCK6p7DjJ3C4liKtbfHoOCOCCgBdO1cmh5TCloyF/CZTMpXuoiNHlSW8/Xdt1Y5cIG/t/m9yhWiIeFUJvYa9PWLO8aQVwjCZTim6hDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EQgdhHc1; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=EQgdhHc1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1240 seconds by postgrey-1.37 at boromir; Sat, 24 Aug 2024 01:59:01 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr4W96rJ3z2yvj;
	Sat, 24 Aug 2024 01:58:57 +1000 (AEST)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C9B9FC66E7;
	Fri, 23 Aug 2024 15:38:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCDC41BF206;
	Fri, 23 Aug 2024 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724427477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CutgodhxN+FJr5V+VHWsJBhY68LFF7RKhgiCY4alWI=;
	b=EQgdhHc1vU0jHveAWULFKVBKA5K/Reu7E11e/ThNq9x2gK+seD0B13sWiulonMlwdOssZ+
	k+eOdW0o2tv4Ud7+Sc+JOMrfETHvLbvlgyy+kMY6NXxlMbsUmLZ7/FAN5WXqj27n4bSlr+
	dmDpxLQ/Z+1AQ01pr9Z1lBOL3BCycoIwydon6a7UJIbtuAqynLhzcVgS7Tyw1JXQgEmX0x
	VOnCrmUGt8M8ZePqnH/ue6a4gvzyEDN1u3bA6Elhg+jRCgsbvMd5Mx/JhrjqIxq4e6ckw+
	detDzZoFkx9y82FATvoOoDjp178jqdsLKA7rVAVuQiUuWcQl3YXaclc2dwkXfg==
Date: Fri, 23 Aug 2024 17:37:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Maxime Ripard <mripard@kernel.org>, Pratyush Yadav
 <pratyush@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev, Michael Walle
 <michael@walle.cc>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240823173748.2b3a364a@xps-13>
In-Reply-To: <20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
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
	<20240718091753.apwsrvmekn2vvo4k@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Marco,

m.felsch@pengutronix.de wrote on Thu, 18 Jul 2024 11:17:53 +0200:

> Hi Miquel,
>=20
> On 24-07-17, Miquel Raynal wrote:
> > Hi Marco,
> >  =20
> > > > > > Overall I think the idea of getting rid of these misc/ drivers =
is goes
> > > > > > into the right direction, but registering directly into NVMEM m=
akes
> > > > > > more sense IMO.     =20
> > > > >=20
> > > > > So you propose to have two places for the partition handling (one=
 for
> > > > > MTD and one for NVMEM) instead of one and moving the code into NV=
MEM
> > > > > directly?   =20
> > > >=20
> > > > Why two places for the partitions handling? Just one, in NVMEM. Als=
o   =20
> > >=20
> > > Without checking the details I think that converting the MTD
> > > partitioning code into NVMEM partitioning code is a bigger task. As y=
ou
> > > said below there are many legacy code paths you need to consider so t=
hey
> > > still work afterwards as well.
> > >  =20
> > > > usually EEPROMs don't require very advanced partitioning schemes,
> > > > unlike flashes (which are the most common MTD devices today).   =20
> > >=20
> > > As said in my cover letter EEPROMs can become quite large and MTD
> > > supports partitioning storage devices which is very handy for large
> > > EEPROMs as well. =20
> >=20
> > Did you had a look at nvmem-layouts ? In particular the fixed-layout. =
=20
>=20
> Yes I had a look at nvmem-layouts and we use them within a
> mtd-partition. Using them instead of a mtd-partition is not sufficient
> since they:
>  1) don't support user-space write (I send a patch for it but it doesn't
>     seem to be accepted soon).

Yes, this needed improvements maybe but was not refused either.

>  2) If write would be supported the user-space need to write the
>     complete cell e.g. no partial writes.

Maybe that can also be brought to nvmem. Again, nvmem was introduced
for handling EEPROMs in the first place.

Anyway, if other people in Cc: want to share some thoughts, they are
also welcomed, I don't want to block this series for bad reasons. I'm
also adding Michael Walle in Cc: who might have an opinion on that.

Link: https://lore.kernel.org/linux-mtd/20240701-b4-v6-10-topic-usbc-tcpci-=
v1-4-3fd5f4a193cc@pengutronix.de/

Thanks,
Miqu=C3=A8l

