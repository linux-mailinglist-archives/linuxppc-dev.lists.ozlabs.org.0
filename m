Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB82AB269
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 09:31:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CV42m4swLzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 19:31:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CV40j0y9ZzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 19:29:16 +1100 (AEDT)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3DCAD6000C;
 Mon,  9 Nov 2020 08:28:57 +0000 (UTC)
Date: Mon, 9 Nov 2020 09:28:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/23] Rid W=1 warnings in MTD
Message-ID: <20201109092855.495174dc@xps13>
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sergey Lapin <slapin@ossfans.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Choudary Kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Dan Brown <dan_brown@ieee.org>, linux-samsung-soc@vger.kernel.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <gleixner@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Dmitriy B <rzk333@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jochen =?UTF-8?B?U2Now6R1Ymxl?= <psionic@psionic.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Nicolas Pitre <nico@fluxnic.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Jian Zhang <jzhang@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lee,

Lee Jones <lee.jones@linaro.org> wrote on Fri,  6 Nov 2020 21:36:32
+0000:

> This set is part of a larger effort attempting to clean-up W=3D1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
>=20
> v1 =3D> v2:
>   - Added tags
>   - Satisfied Miquel's review comments
>=20

You probably missed my request to update the titles. That's why I
wanted the entire series to be resent. Anyway, as I forgot a few,
please find below the prefixes that should be used:

> Lee Jones (23):
>   mtd: mtdpart: Fix misdocumented function parameter 'mtd'
>   mtd: devices: phram: File headers are not good candidates for
>     kernel-doc
>   mtd: nand: onenand: onenand_base: Fix expected kernel-doc formatting

mtd: onenand: Fix...

>   mtd: devices: docg3: Fix kernel-doc 'bad line' and 'excessive doc'
>     issues
>   mtd: mtdcore: Fix misspelled function parameter 'section'

mtd: Fix...

>   mtd: nand: onenand: onenand_bbt: Fix expected kernel-doc formatting

mtd: onenand: Fix...

>   mtd: spi-nor: controllers: hisi-sfc: Demote non-conformant kernel-doc

mtd: spi-nor: hisi-sfc: Demote...

>   mtd: ubi: build: Document 'ubi_num' in struct mtd_dev_param
>   mtd: nand: spi: toshiba: Demote non-conformant kernel-doc header

mtd: spinand: toshiba: Demote...

>   mtd: ubi: kapi: Correct documentation for 'ubi_leb_read_sg's 'sgl'
>     parameter
>   mtd: ubi: eba: Fix a couple of misdocumentation issues
>   mtd: ubi: wl: Fix a couple of kernel-doc issues
>   mtd: nand: raw: brcmnand: brcmnand: Demote non-conformant kernel-doc
>     headers

mtd: rawnand: brcmnand: Demote...

>   mtd: ubi: gluebi: Fix misnamed function parameter documentation
>   mtd: nand: raw: diskonchip: Marking unused variables as
>     __always_unused

mtd: rawnand: diskonchip: Marking...

>   mtd: nand: raw: cafe_nand: Remove superfluous param doc and add
>     another

mtd: rawnand: cafe: Remove

>   mtd: nand: raw: s3c2410: Add documentation for 2 missing struct
>     members

mtd: rawnand: s3c2410: Add...

>   mtd: nand: raw: omap_elm: Finish half populated function header,
>     demote empty ones

mtd: rawnand: omap_elm: Finish

>   mtd: nand: raw: omap2: Fix a bunch of kernel-doc misdemeanours

mtd:r rawnand: omap2: Fix

>   mtd: nand: raw: sunxi_nand: Document 'sunxi_nfc's 'caps' member

mtd: rawnand: sunxi: Document

>   mtd: nand: raw: arasan-nand-controller: Document 'anfc_op's 'buf'
>     member

mtd: rawnand: arasan: Document

>   mtd: nand: onenand: onenand_base: Fix some kernel-doc misdemeanours

mtd: onenand: Fix

>   mtd: devices: powernv_flash: Add function names to headers and fix
>     'dev'

Otherwise the content of the series looks good to me.

Thanks,
Miqu=C3=A8l
