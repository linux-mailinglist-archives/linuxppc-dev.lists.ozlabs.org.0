Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD09246AC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 19:50:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krETZqZR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD9RY6GRTz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 03:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=krETZqZR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pratyush@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD3x657Mfz30Tm;
	Tue,  2 Jul 2024 23:42:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99CABCE1E02;
	Tue,  2 Jul 2024 13:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF12C116B1;
	Tue,  2 Jul 2024 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927719;
	bh=xIoq5ERoFam9CoYgw94MfcDDBIP2EzSXozZdimkHqf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krETZqZRZTW0k1iXLzs/FxWIvDBiOf5o+FbJZkpGtilaCd7GZcjqyo6SomGAunMEB
	 BUZlu7wccEG6kossKFkepABl2/j8Nsn7yh5jjmmGZM1zHjJ9xrqOuEtGVXyytIMsr2
	 wG70VQbbYM2x2Z/V9Ig4oLAFMTqYBVlvAMt9/+Ln7Tq6kiinYWiEYV3FCbh+gW1XUs
	 fS2rs45SRfaUC94gwzDWRVv91uNOx//oOHa5IBx4jkma5NwzrumUbaXnlnE+BGlD5D
	 5wo+CtDPOBVAmhVS6Z9McL5acmawuElTWYvsSBGtPlNdIXCvftH0RegptVZxUnYM36
	 rCuzSmxjJO+hA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
In-Reply-To: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org> (Tudor
	Ambarus's message of "Mon, 1 Jul 2024 17:14:14 +0100")
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
	<20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
	<07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
Date: Tue, 02 Jul 2024 15:41:52 +0200
Message-ID: <mafs0ikxnykpr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 03 Jul 2024 03:49:43 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jonathan Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Maxime Ripard <mripard@kernel.org>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01 2024, Tudor Ambarus wrote:

> On 7/1/24 2:53 PM, Marco Felsch wrote:
>> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
>> as single device isn't always sufficient. There may be partitions which
>> require different access permissions. Also write access always need to
>> to verify the offset.
>> 
>> Port the current misc/eeprom/at24.c driver to the MTD framework since
>> EEPROMs are memory-technology devices and the framework already supports
>
> I was under the impression that MTD devices are tightly coupled by erase
> blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?

I was curious as well so I did some digging.

The Kconfig help says:

    Memory Technology Devices are flash, RAM and similar chips, often
    used for solid state file systems on embedded devices [...]

The FAQ on the MTD documentation [0] says:

    Unix traditionally only knew block devices and character devices.
    Character devices were things like keyboards or mice, that you could
    read current data from, but couldn't be seek-ed and didn't have a size.
    Block devices had a fixed size and could be seek-ed. They also happened
    to be organized in blocks of multiple bytes, usually 512.

    Flash doesn't match the description of either block or character
    devices. They behave similar to block device, but have differences. For
    example, block devices don't distinguish between write and erase
    operations. Therefore, a special device type to match flash
    characteristics was created: MTD.

    So MTD is neither a block nor a char device. There are translations to
    use them, as if they were. But those translations are nowhere near the
    original, just like translated Chinese poems.

And in the section below, it lists some properties of an MTD device:

    - Consists of eraseblocks.
    - Eraseblocks are larger (typically 128KiB).
    - Maintains 3 main operations: read from eraseblock, write to
      eraseblock, and erase eraseblock.
    - Bad eraseblocks are not hidden and should be dealt with in
      software.
    - Eraseblocks wear-out and become bad and unusable after about 10^3
      (for MLC NAND) - 10^5 (NOR, SLC NAND) erase cycles.

This does support the assumption you had about MTD devices being tightly
coupled with erase block. It also makes it quite clear that an EEPROM is
not MTD -- since EEPROMs are byte-erasable.

Of course, the existence of MTD_NO_ERASE nullifies a lot of
these points. So it seems the subsystem has evolved. MTD_NO_ERASE was
added by 92cbfdcc3661d ("[MTD] replace MTD_RAM with MTD_GENERIC_TYPE")
in 2006, but this commit only adds the flag. The functionality of "not
requiring an explicit erase" for RAM devices has existed since the start
of the git history at least.

I also found a thread from 2013 by Maxime Ripard (+Cc) suggesting adding
EEPROMs to MTD [1]. The main purpose would have been unifying the EEPROM
drivers under a single interface. I am not sure what came of it though,
since I can't find any patches that followed up with the proposal.

Overall, I'd say that while originally MTD was written with flash
devices with erase blocks in mind, the subsystem seems to have evolved
with time to include other types of devices.

I don't see anything obviously wrong with adding EEPROMs to the type of
devices in MTD as well. It doesn't seem to be too invasive to the
subsystem (I do see some dubious code when skimming through the patches,
but nothing unfixable). And the EEPROM drivers can get a common
interface. The other option would be to create a separate subsystem for
EEPROMs, but perhaps that would just lead to a bunch of code being
duplicated.

I'd like to hear if somebody thinks otherwise, and sees reasons to _not_
do this.

[0] http://www.linux-mtd.infradead.org/faq/general.html
[1] https://lore.kernel.org/linux-mtd/20130705201118.GM2959@lukather/

-- 
Regards,
Pratyush Yadav
