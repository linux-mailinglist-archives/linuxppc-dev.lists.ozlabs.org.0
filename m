Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561AC541F2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 00:43:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHllD17Bcz3bn4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 08:43:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=k3vx5fmY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com; envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=k3vx5fmY;
	dkim-atps=neutral
X-Greylist: delayed 922 seconds by postgrey-1.36 at boromir; Tue, 07 Jun 2022 19:48:48 AEST
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHQXw1s9dz308b;
	Tue,  7 Jun 2022 19:48:46 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2579Wc0I091949;
	Tue, 7 Jun 2022 04:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654594358;
	bh=4gEuMclZBhRQsDp0tvKaU3YrWccQZAGJURM8nh1W4Dc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k3vx5fmY3w2g9Kjy9vS3FS56toxZSl4jg/ajU1hdRRImusYUUI39kNg2qhLfeXCDd
	 F7OzJAHN5T4gAJh/8Fu9mAhSWZ+FGGvj2oIwfhncphIoKXvPIxSBH/WdWhJW7XynOc
	 YBUg7FOlGe/94JgUoQ+dgpWXspuXRavwoYOd/Kzs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2579WcaD112036
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jun 2022 04:32:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 04:32:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 04:32:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2579WbvB057541;
	Tue, 7 Jun 2022 04:32:37 -0500
Date: Tue, 7 Jun 2022 15:02:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 00/14] mtd: Fix platform remove callbacks to always
 return 0
Message-ID: <20220607093236.67txulke76mi6t75@ti.com>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
 <20220606151841.682a5939@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606151841.682a5939@xps-13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 08 Jun 2022 08:42:57 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>, Liang Yang <liang.yang@amlogic.com>, kernel@pengutronix.de, Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, 
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Miquel,

On 06/06/22 03:18PM, Miquel Raynal wrote:
> Hi Folks,
> 
> u.kleine-koenig@pengutronix.de wrote on Fri,  3 Jun 2022 23:07:44 +0200:
> 
> > Hello,
> > 
> > this series prepares to make platform remove callbacks return void.
> > Therefor first update them to always return 0. The rationale is that the
> > Linux device model doesn't handle failures on remove and if a remove
> > callback returns an error, it just emits a quite generic error message
> > and still removes the device.
> 
> Tudor, Pratyush, Richard, Vignesh,
> 
> The series looks good to me (besides the atmel patch), I think it's
> best to take it directly through mtd/next instead of going through all
> the different internal branches, please let me know if you disagree
> with the idea.

Patch 2 does not look good to me. It modifies the aspeed-smc driver in 
drivers/mtd/spi-nor/controllers/ but the driver has been moved to 
drivers/spi/ in Mark's next branch [0]. The patch would likely conflict 
with that.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?id=9c63b846e6df43e5b3d31263f7db545f32deeda3

> 
> Cheers,
> Miquèl
> 
> > 
> > Best regards
> > Uwe
> > 
> > Uwe Kleine-König (14):
> >   mtd: hyperbus: Make hyperbus_unregister_device() return void
> >   mtd: spi-nor: aspeed-smc: Make aspeed_smc_unregister() return void
> >   mtd: powernv_flash: Warn about failure to unregister mtd device
> >   mtd: st-spi_fsm: Warn about failure to unregister mtd device
> >   mtd: lpddr2_nvm: Warn about failure to unregister mtd device
> >   mtd: spear_smi: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: spear_smi: Drop if with an always false condition
> >   mtd: rawnand: atmel: Warn about failure to unregister mtd device
> >   mtd: rawnand: omap2: Suppress error message after WARN in .remove()
> >   mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: rawnand: meson: Don't skip cleanup after mtd_device_unregister()
> >     failed
> >   mtd: rawnand: meson: Drop cleaning platform data in .remove()
> >   mtd: physmap: Don't skip cleanup after mtd_device_unregister() failed
> >   mtd: physmap: Drop if with an always false condition
> > 
> >  drivers/mtd/devices/powernv_flash.c          |  4 +++-
> >  drivers/mtd/devices/spear_smi.c              | 10 ++--------
> >  drivers/mtd/devices/st_spi_fsm.c             |  4 +++-
> >  drivers/mtd/hyperbus/hbmc-am654.c            |  6 +++---
> >  drivers/mtd/hyperbus/hyperbus-core.c         |  8 ++------
> >  drivers/mtd/hyperbus/rpc-if.c                |  5 +++--
> >  drivers/mtd/lpddr/lpddr2_nvm.c               |  4 +++-
> >  drivers/mtd/maps/physmap-core.c              | 13 +++----------
> >  drivers/mtd/nand/raw/atmel/nand-controller.c |  5 ++++-
> >  drivers/mtd/nand/raw/meson_nand.c            | 16 +++-------------
> >  drivers/mtd/nand/raw/omap2.c                 |  6 ++----
> >  drivers/mtd/nand/raw/tegra_nand.c            |  5 +----
> >  drivers/mtd/spi-nor/controllers/aspeed-smc.c |  8 ++++----
> >  include/linux/mtd/hyperbus.h                 |  4 +---
> >  14 files changed, 37 insertions(+), 61 deletions(-)
> > 
> > base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
