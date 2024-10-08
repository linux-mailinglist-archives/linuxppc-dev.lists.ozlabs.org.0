Return-Path: <linuxppc-dev+bounces-1818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A42B9994259
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 10:43:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN8g32JMCz2xjP;
	Tue,  8 Oct 2024 19:43:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728376991;
	cv=none; b=ghUlVT1tP5frvy8yoYcV/IPcbJ4VljMGI5V1lmcFi97GOe0FLVCsTOuUqrDef13RYfmJt2aPPP7Blnwx9JIiyvqaIk+VlUNM8ydj1V9h5333ewmvssh+RF+pMQc84uQoKBC4y9TQu+qzXQJFP8l3wwHOjQbY7/Ff4G6aJQvLVKdSwYNo7qjhbRmlau3/81wWzI9MAEbpxRZS1XPAJYy1TnkCPAnUWbUiwBj2A3FXZ155fwbE+R2f8nNbBLbjD3IbY6SCH6JY/eLtGjddPk4+RoReDfEKQx4yba7mLLeDcZ8n1U0luvY+k5m4EtcU+jCofFGP2liSAB7bbSCcRZ1xGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728376991; c=relaxed/relaxed;
	bh=TmLP/WI1VtrRBkIucS2941CxDdB37ieasR6WFFSWafs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlIsj1lX+WTXJz0FE61qrinxCBqt9k2dkS72CfPWzG67y8TrC8j3/9fW+t2Gk8GBef3oK6zAQThI4ePYGq10AIc5uYicwWaT64+/W2VGaJIKTTgpviuXt5QiwM0sy72NG+jf/bttDHQHG3puf91FV18lZIk+vIdoYc4CMH+l+yT9GjUQZxLZ4roFwY/hheEUFuoMB9inb3IUGKIjAbzzOUhjVDxtR3y/PxqHmMwCy9DR4vCOWPMfCbZBP4xH/8OzyzJq+kfDTeEjTeTYHII7rCZ9HcBeQ3nLjW2NFoClE4vqK5zvRVmlGFpwlPhW3Xfgv7xlJwQUEjzAF1oSWQUCZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=POSKCKOp; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=POSKCKOp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN8g110kLz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 19:43:07 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 849C1C33A8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 08:33:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EFBD1C000A;
	Tue,  8 Oct 2024 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728376392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmLP/WI1VtrRBkIucS2941CxDdB37ieasR6WFFSWafs=;
	b=POSKCKOpM0S5Rro9I7JX/yFDGVQEbxnQfOlbhvDuVflBTc9b0oQzIQp7fKtzf6mJwdOQ+0
	Ea9yaFhepRPa3MqaYNcDO/VEW6QLHJqANEHtweXO5D876vZq8tICxDlfjrmrbTDnklWsBz
	0pAYroBCDAgXQON2fmL69ED1dgdlzDy5jho/yQO5tqH0EdwHwUBc86MuNxTZZ0aBcTJr+T
	UHYVDWD5LAAELveRyE4v2cHZeoPtNyyU8w7VYOZiIGEcGGrpmUancBz/ZYPglMSFDCCVy6
	Izc1kwXhCGbPtsztfFaqEyh0UYZq966m3DrL4DrW+CqDmsEUQlcF0xSAXpcASQ==
Date: Tue, 8 Oct 2024 10:33:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Julian Vetter <jvetter@kalrayinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, Yann Sionneau
 <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v8 13/14] mtd: Add HAS_IOMEM || INDIRECT_IOMEM
 dependency
Message-ID: <20241008103306.44123824@xps-13>
In-Reply-To: <20241008075023.3052370-14-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
	<20241008075023.3052370-14-jvetter@kalrayinc.com>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Julian,

jvetter@kalrayinc.com wrote on Tue,  8 Oct 2024 09:50:21 +0200:

> The UM arch doesn't have HAS_IOMEM=3Dy, so the build fails because the
> functions memcpy_fromio and memcpy_toio are not defined anymore. These
> functions are only build for targets which have HAS_IOMEM=3Dy or
> INDIRECT_IOMEM=3Dy. So, depend on either of the two.

There are many mtd drivers using memcpy_fromio and memcpy_toio, I'm not
sure I get why only this subset of drivers would be impacted?

Also, from a general standpoint, I don't see with a good eye the
proliferation of the use of || INDIRECT_IOMEM just for the um
architecture:

$ git grep HAS_IOMEM | wc -l
611
$ git grep INDIRECT_IOMEM | wc -l
15

I believe the Kconfig symbol should adapt to reflect the fact that IO
operations are fine, regardless of their type ("direct" or "indirect")
rather than move the load on the individual drivers.

> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v8:
> - New patch
> ---
>  drivers/mtd/chips/Kconfig | 4 ++++
>  drivers/mtd/lpddr/Kconfig | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index 19726ebd973d..78afe7ccf005 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -4,6 +4,7 @@ menu "RAM/ROM/Flash chip drivers"
> =20
>  config MTD_CFI
>  	tristate "Detect flash chips by Common Flash Interface (CFI) probe"
> +	depends on HAS_IOMEM || INDIRECT_IOMEM
>  	select MTD_GEN_PROBE
>  	select MTD_CFI_UTIL
>  	help
> @@ -16,6 +17,7 @@ config MTD_CFI
> =20
>  config MTD_JEDECPROBE
>  	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
> +	depends on HAS_IOMEM || INDIRECT_IOMEM
>  	select MTD_GEN_PROBE
>  	select MTD_CFI_UTIL
>  	help
> @@ -211,12 +213,14 @@ config MTD_CFI_UTIL
> =20
>  config MTD_RAM
>  	tristate "Support for RAM chips in bus mapping"
> +	depends on HAS_IOMEM || INDIRECT_IOMEM
>  	help
>  	  This option enables basic support for RAM chips accessed through
>  	  a bus mapping driver.
> =20
>  config MTD_ROM
>  	tristate "Support for ROM chips in bus mapping"
> +	depends on HAS_IOMEM || INDIRECT_IOMEM
>  	help
>  	  This option enables basic support for ROM chips accessed through
>  	  a bus mapping driver.
> diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
> index 0395aa6b68f1..f35dd8052abc 100644
> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -4,6 +4,7 @@ menu "LPDDR & LPDDR2 PCM memory drivers"
> =20
>  config MTD_LPDDR
>  	tristate "Support for LPDDR flash chips"
> +	depends on HAS_IOMEM || INDIRECT_IOMEM
>  	select MTD_QINFO_PROBE
>  	help
>  	  This option enables support of LPDDR (Low power double data rate)


Thanks,
Miqu=C3=A8l

