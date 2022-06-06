Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D953E4B5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 15:22:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGvLN33Z4z3bnV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 23:22:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Q5TqKuS6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Q5TqKuS6;
	dkim-atps=neutral
X-Greylist: delayed 207 seconds by postgrey-1.36 at boromir; Mon, 06 Jun 2022 23:22:23 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGvKq4yH3z3bc9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 23:22:22 +1000 (AEST)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C14FDCEF43
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 13:19:06 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43D8924000A;
	Mon,  6 Jun 2022 13:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654521528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQMnz3kE25tuaHePTw9IIcU1s7DFhes1/13W4tlWP0g=;
	b=Q5TqKuS6rm5fKUbW/to2iIks63dYveytMItZN2hQSGiABR1yQZaWIH2Wv3feBM+l71PDhZ
	7hym5Z3FW0h+npJn81HTjHLseNMoNrZ0oZ/kspCkbk5Ka7N0ZwnLqP4EYcgXTtQ3/L9X4N
	zdw6nHv4EtsheM4g0P3UtTdddQD0ITB2W3HM+r4MZNQ/1tuLq5GIG8pvs8TMps7AAAWvDq
	KWEheiUzVKJwXJ40gpKBdibyxlFHBpB7P1POSyqkmc9F4g26Gm1ZcN7V/ikAnPNjpsZEC8
	r6WqDp2Hd1vqY4u3kJfrLvtgLCgxjfK9U+wbX7n6tDiG5WHcgk0IWvmrDbijNA==
Date: Mon, 6 Jun 2022 15:18:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220606151841.682a5939@xps-13>
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Liang Yang <liang.yang@amlogic.com>, kernel@pengutronix.de, Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@micr
 ochip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Folks,

u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:44 +0200:

> Hello,
>=20
> this series prepares to make platform remove callbacks return void.
> Therefor first update them to always return 0. The rationale is that the
> Linux device model doesn't handle failures on remove and if a remove
> callback returns an error, it just emits a quite generic error message
> and still removes the device.

Tudor, Pratyush, Richard, Vignesh,

The series looks good to me (besides the atmel patch), I think it's
best to take it directly through mtd/next instead of going through all
the different internal branches, please let me know if you disagree
with the idea.

Cheers,
Miqu=C3=A8l

>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=C3=B6nig (14):
>   mtd: hyperbus: Make hyperbus_unregister_device() return void
>   mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
>   mtd: powernv_flash: Warn about failure to unregister mtd device
>   mtd: st-spi_fsm: Warn about failure to unregister mtd device
>   mtd: lpddr2_nvm: Warn about failure to unregister mtd device
>   mtd: spear_smi: Don't skip cleanup after mtd_device_unregister()
>     failed
>   mtd: spear_smi: Drop if with an always false condition
>   mtd: rawnand: atmel: Warn about failure to unregister mtd device
>   mtd: rawnand: omap2: Suppress error message after WARN in .remove()
>   mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister()
>     failed
>   mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister()
>     failed
>   mtd: rawnand: meson: Drop cleaning platform data in .remove()
>   mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
>   mtd: physmap: Drop if with an always false condition
>=20
>  drivers/mtd/devices/powernv_flash.c          |  4 +++-
>  drivers/mtd/devices/spear_smi.c              | 10 ++--------
>  drivers/mtd/devices/st_spi_fsm.c             |  4 +++-
>  drivers/mtd/hyperbus/hbmc-am654.c            |  6 +++---
>  drivers/mtd/hyperbus/hyperbus-core.c         |  8 ++------
>  drivers/mtd/hyperbus/rpc-if.c                |  5 +++--
>  drivers/mtd/lpddr/lpddr2_nvm.c               |  4 +++-
>  drivers/mtd/maps/physmap-core.c              | 13 +++----------
>  drivers/mtd/nand/raw/atmel/nand-controller.c |  5 ++++-
>  drivers/mtd/nand/raw/meson_nand.c            | 16 +++-------------
>  drivers/mtd/nand/raw/omap2.c                 |  6 ++----
>  drivers/mtd/nand/raw/tegra_nand.c            |  5 +----
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c |  8 ++++----
>  include/linux/mtd/hyperbus.h                 |  4 +---
>  14 files changed, 37 insertions(+), 61 deletions(-)
>=20
> base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f

