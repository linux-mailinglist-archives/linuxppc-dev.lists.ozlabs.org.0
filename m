Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D13924102
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 16:35:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0rEUcXO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD56L2LZ0z3vwG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 00:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u0rEUcXO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD55f4WB3z3dTT;
	Wed,  3 Jul 2024 00:34:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 05E8ACE02C5;
	Tue,  2 Jul 2024 14:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0D1C116B1;
	Tue,  2 Jul 2024 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719930867;
	bh=98l+a3pWB42qJAPZ0GCAZ++B7ulUfPolVvoVx0ArV80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0rEUcXOsmoKrUeeA1jklOR1g18AnF0Flxfk/JNfZrjZqFZs0wqyXic4zXwXwSGdj
	 aLsOouz97xRzytjtZK2aq10SqTea7EC19f/UFenwnER62QLyQ6Lcj6yWGfHLN2AbNG
	 Hg+15ZtFlABzxtZ2uNC3Gni4U+sPwMMrT0t0Xb9CTTA8wHTk8+nS5pPm9BMfqNnK8S
	 BpoxZ8ZYdvrIHqwSMXp+L00o9v1Lps4Wu1Nqgg5yFxjX09CTCMdCgxemgE797kH2/b
	 eLr0VOBUH/xaIpNk0zQetIDIfIJly0q2Dvnl0sHjtWFEjUn2t5bms0jug9msMi6A7N
	 lZZiwIZkpMCRw==
Date: Tue, 2 Jul 2024 16:34:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240702-mighty-brilliant-eel-b0d9fa@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
 <20240702-congenial-vigilant-boar-aeae44@houat>
 <mafs0ed8byj5z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gypj655hqo5gwvn3"
Content-Disposition: inline
In-Reply-To: <mafs0ed8byj5z.fsf@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--gypj655hqo5gwvn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 04:15:20PM GMT, Pratyush Yadav wrote:
> On Tue, Jul 02 2024, Maxime Ripard wrote:
>=20
> > On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
> >> On Mon, Jul 01 2024, Tudor Ambarus wrote:
> >>=20
> >> > On 7/1/24 2:53 PM, Marco Felsch wrote:
> >> >> EEPROMs can become quite large nowadays (>=3D64K). Exposing such de=
vices
> >> >> as single device isn't always sufficient. There may be partitions w=
hich
> >> >> require different access permissions. Also write access always need=
 to
> >> >> to verify the offset.
> >> >>=20
> >> >> Port the current misc/eeprom/at24.c driver to the MTD framework sin=
ce
> >> >> EEPROMs are memory-technology devices and the framework already sup=
ports
> >> >
> >> > I was under the impression that MTD devices are tightly coupled by e=
rase
> >> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after =
all?
> >>=20
> >> I was curious as well so I did some digging.
> >>=20
> [...]
> >>=20
> >> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting addi=
ng
> >> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPR=
OM
> >> drivers under a single interface. I am not sure what came of it though,
> >> since I can't find any patches that followed up with the proposal.
> >
> > That discussion led to drivers/nvmem after I started to work on
> > some early prototype, and Srinivas took over that work.
>=20
> So would you say it is better for EEPROM drivers to use nvmem instead of
> moving under MTD?

I thought so at the time, but that was more than 10y ago, and I have
followed neither nvmem nor MTD since so I don't really have an opinion
there.

It looks like drivers/misc/eeprom/at24.c has support for nvmem though,
and MTD can be used as an nvmem provider too, so it's not clear to me
why we would want to create yet another variant.

But again, you shouldn't really ask me in the first place :)

I'm sure Miquel, Srinivas, and surely others, are much more relevant to
answer that question.

Maxime

--gypj655hqo5gwvn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQP7wAKCRDj7w1vZxhR
xelSAQDyHdp3qs5OhZUbyv1sIG+7PHV3rzbQJu5zbjdgtcsnUwD/Vd5FuxDSVZrq
YEHzmHdDyuPknfgYexiAvC7jtdFIlwk=
=B/wG
-----END PGP SIGNATURE-----

--gypj655hqo5gwvn3--
