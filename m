Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272692D227
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 15:01:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=aNlY30uM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJyfJ6J3pz3fsb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=aNlY30uM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJyd04BsNz3fQs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 23:00:04 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ee910d6a8bso56781601fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616398; x=1721221198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=aNlY30uMeH5EGrccUZw9Fq5LaSNgt/aYMSFxGEleqKzrWZzLlBNPVs9PaDq5Q/KX7P
         lTE0RoBoufGgWuJExmK4JnMNAtk4GgE7HDKLCyOGDjqCXp6NRDos9EuEFCV0ZgItbmMb
         CYlU8UkkoUUADy2/XtrUn+mW74ADwaZEiMQuGv2BXf9AJ63Q9zq/A3tM+Yr4dz4MT88A
         HEwX4QKvbhY2iXPGHWxkONg0swCQE8Z7DcfSIySuOiC3kAh7ICeuAdJ0gozcnB5xoVkn
         iTZgPtne7nbmE//RoW+vPU0+Fx2pTtBBmzKzAcUM1XCJ5ubbtAv20nremoT2tsdpeFNF
         qrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616398; x=1721221198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=QmAcRDyEKAXti4UUpJ030aCsckEkP2xAJittRZhlkSzqnaOSzP0xhi4Zd3shKcQ7Am
         dLsI1QC9Gw5qcAQCl+o/BHMWWJs4bPdp/0wEHPj+ocPARAHdZkEgzIesom/drsqDc7Uu
         6Ad7B8kdJ8yNA0EUo4Q0Rb7j43KquC7bGJkvCZD78aWSEnensqBaauPV6cibmVSaHXQH
         vPTTPBHqOueY1vWK4D6iJu2cHCCifzGoHCzmxk2hYcUix+5lBGzALjX2ZrJZvE0iq0vH
         lzekn4/89H2BLMFgSP6xOCSuvAMPHSsYrc30uA+GGmSkmsXPNpOS66u3TZ7V637M/znh
         +rOA==
X-Forwarded-Encrypted: i=1; AJvYcCXXp2klKtfpbZOzRm0192axfmXSNquPJuYU82mTYFzWzTc1pIWpv5s9UfD/Dmltez8/pcihDm3i7ND3dPh+Cxh5iHU0sboT0iXPdTcETg==
X-Gm-Message-State: AOJu0Yzge17iQBN5L4aJZnkZirZ/piXAbypc9wn/Q3EG8tI1WQmHSdmd
	D05myPnAyKQ/Ze9a87O8damB9cQBIYYQJGJOe6pxeXctJBrCb+kscZ2nuULF9sDWxJceyf6F9V8
	ZCLsGo8p/gMlAkqwQW4VW7CN7u7SWu7dyzO/MuA==
X-Google-Smtp-Source: AGHT+IH/j0tB3q6Oob0h+dYBea8dzUqqOODjZONtdFvf3j/P6dPoyQJkhUenc2mYLdwUqlwO12I2J5bpi1srvsWqmLs=
X-Received: by 2002:a2e:b046:0:b0:2ee:83f7:8b32 with SMTP id
 38308e7fff4ca-2eeb30dc45amr34980521fa.21.1720616398404; Wed, 10 Jul 2024
 05:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de> <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 14:59:47 +0200
Message-ID: <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>, Marco Felsch <m.felsch@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, WANG Xuerui <kernel@xen0n.name>, Fabio Estevam <festevam@gmail.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Jon Hunter <jonathanh@nvidia.com>, Joel Stanley <joel@jms.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, loongarch@lists.linux.dev, linux-tegra@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2024 at 2:49=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> > The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> > new Kconfig symbol to select the I2C EEPROM driver support.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
> >  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
> >  arch/arm/configs/at91_dt_defconfig     | 2 +-
> >  arch/arm/configs/axm55xx_defconfig     | 2 +-
> >  arch/arm/configs/davinci_all_defconfig | 2 +-
> >  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
> >  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
> >  arch/arm/configs/ixp4xx_defconfig      | 2 +-
> >  arch/arm/configs/keystone_defconfig    | 2 +-
> >  arch/arm/configs/lpc18xx_defconfig     | 2 +-
>
> Applied to soc/defconfig, thanks
>
>    Arnd

No! Why? This is still being discussed and it's not clear it will even
make it upstream.

Bart
