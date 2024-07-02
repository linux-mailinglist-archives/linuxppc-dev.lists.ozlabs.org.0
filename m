Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CEA923FCC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 16:01:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=meadaPSQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4Mr3mRwz79Jt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 00:01:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=meadaPSQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=mripard@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD4GL0wJ2z79jg;
	Tue,  2 Jul 2024 23:56:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0ED09CE1F0A;
	Tue,  2 Jul 2024 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FE2C116B1;
	Tue,  2 Jul 2024 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719928615;
	bh=2C/dfpjesDaWHRmIpWeBPH1MXFkYQjqK4EO539CJrjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meadaPSQglu7unL8Z8Z6MQ46aSSUX2EWfgybQ2BFIt3Ue5V5SIZc+X0BTwR/tBvjK
	 +O0zcbbp3j5JiED8Vvia52Mzo1OnlxmuPoAVRp24Px95+mOxM4ochB6CF+2Ys5XJZn
	 gHmylmK9JYVBc/NkxY+xyi999zbhxd//O7pM66+tl29RLZqsIb54WGzfnk6jrX0AAt
	 CeIvMC80ssIF3uXW+mFr3SUAP9KueCGRZqxxEZqxJqGla7fCByIBJZeuDswyeZCfvt
	 3ukRRa1SerrwIeO9oFt9iNIbpSj0T+u6Nnp213aKUip7Euj+RtteCYlKfCc8G/nPHv
	 QlyaKoAcXcV+g==
Date: Tue, 2 Jul 2024 15:56:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
Message-ID: <20240702-congenial-vigilant-boar-aeae44@houat>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
 <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
 <mafs0ikxnykpr.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wpznzlm3ricogeh2"
Content-Disposition: inline
In-Reply-To: <mafs0ikxnykpr.fsf@kernel.org>
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


--wpznzlm3ricogeh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 03:41:52PM GMT, Pratyush Yadav wrote:
> On Mon, Jul 01 2024, Tudor Ambarus wrote:
>=20
> > On 7/1/24 2:53 PM, Marco Felsch wrote:
> >> EEPROMs can become quite large nowadays (>=3D64K). Exposing such devic=
es
> >> as single device isn't always sufficient. There may be partitions which
> >> require different access permissions. Also write access always need to
> >> to verify the offset.
> >>=20
> >> Port the current misc/eeprom/at24.c driver to the MTD framework since
> >> EEPROMs are memory-technology devices and the framework already suppor=
ts
> >
> > I was under the impression that MTD devices are tightly coupled by erase
> > blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?
>=20
> I was curious as well so I did some digging.
>=20
> The Kconfig help says:
>=20
>     Memory Technology Devices are flash, RAM and similar chips, often
>     used for solid state file systems on embedded devices [...]
>=20
> The FAQ on the MTD documentation [0] says:
>=20
>     Unix traditionally only knew block devices and character devices.
>     Character devices were things like keyboards or mice, that you could
>     read current data from, but couldn't be seek-ed and didn't have a siz=
e.
>     Block devices had a fixed size and could be seek-ed. They also happen=
ed
>     to be organized in blocks of multiple bytes, usually 512.
>=20
>     Flash doesn't match the description of either block or character
>     devices. They behave similar to block device, but have differences. F=
or
>     example, block devices don't distinguish between write and erase
>     operations. Therefore, a special device type to match flash
>     characteristics was created: MTD.
>=20
>     So MTD is neither a block nor a char device. There are translations to
>     use them, as if they were. But those translations are nowhere near the
>     original, just like translated Chinese poems.
>=20
> And in the section below, it lists some properties of an MTD device:
>=20
>     - Consists of eraseblocks.
>     - Eraseblocks are larger (typically 128KiB).
>     - Maintains 3 main operations: read from eraseblock, write to
>       eraseblock, and erase eraseblock.
>     - Bad eraseblocks are not hidden and should be dealt with in
>       software.
>     - Eraseblocks wear-out and become bad and unusable after about 10^3
>       (for MLC NAND) - 10^5 (NOR, SLC NAND) erase cycles.
>=20
> This does support the assumption you had about MTD devices being tightly
> coupled with erase block. It also makes it quite clear that an EEPROM is
> not MTD -- since EEPROMs are byte-erasable.
>=20
> Of course, the existence of MTD_NO_ERASE nullifies a lot of
> these points. So it seems the subsystem has evolved. MTD_NO_ERASE was
> added by 92cbfdcc3661d ("[MTD] replace MTD_RAM with MTD_GENERIC_TYPE")
> in 2006, but this commit only adds the flag. The functionality of "not
> requiring an explicit erase" for RAM devices has existed since the start
> of the git history at least.
>=20
> I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
> EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
> drivers under a single interface. I am not sure what came of it though,
> since I can't find any patches that followed up with the proposal.

That discussion led to drivers/nvmem after I started to work on
some early prototype, and Srinivas took over that work.

Maxime

--wpznzlm3ricogeh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoQHJAAKCRDj7w1vZxhR
xcDlAP9DQxX4F3MhMtO+FlHTFu+wxuxX+ZgAUtWf1AzFSKdAXwD/Vb6XmtdU4OXO
fQTMfYwmoIMqez6M7+ko/r2XXgK7BQ4=
=KD1l
-----END PGP SIGNATURE-----

--wpznzlm3ricogeh2--
