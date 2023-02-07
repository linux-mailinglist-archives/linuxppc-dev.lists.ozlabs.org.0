Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84768E160
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBD4K2VXHz3fY7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=icQIS6QV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=icQIS6QV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBBqD3yHsz3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 05:43:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6F8F60F6A;
	Tue,  7 Feb 2023 18:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D06C433D2;
	Tue,  7 Feb 2023 18:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675795429;
	bh=z46LV0K67pYt+9sG+8XPfphcBy3wjoS4vl+j+OOVUvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icQIS6QVs3SIYrh/ewyBWxOXyRdTzSi5iQLtHvNEjG7lvYhQ+DvHhk+3KEs5qU2sU
	 TMTqOav5kG8GY5JR22dKb78qqMAt/Bg2JYkWEyM+MGuclGw0hQvMcVEtbzsmiJlItD
	 IEGaquWuCLNILvUo5685guZahlOFm7IGWB2GaIQ6/vE/h0SUH8mRyEHQMupAISjrjW
	 fnVVq+bZn0SaHzKt6ZHA6LtwE38N/APEa35C82I5WgacjEtf/+fE+N1kuSQDae5KOg
	 NbPJHolFeXjK9+XKnt9280QC9hb68ZWPxwLnKvG03l5612lhbMN4Z8sBFUzc9BZ9vj
	 q3xPIHrd6PLJg==
Date: Tue, 7 Feb 2023 10:43:45 -0800
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of
 linux/gpio.h
Message-ID: <Y+Kb4Ql+I7/Abm48@google.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 08 Feb 2023 06:27:18 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Alex Shi <alexs@kernel.org>, linux-input@vger.k
 ernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemlo
 ft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 07 Feb 2023, Andy Shevchenko wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Almost all gpio drivers include linux/gpio/driver.h, and other
> files should not rely on includes from this header.
> 
> Remove the indirect include from here and include the correct
> headers directly from where they are used.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/arm/mach-omap1/irq.c                              | 1 +
>  arch/arm/mach-orion5x/board-rd88f5182.c                | 1 +
>  arch/arm/mach-s3c/s3c64xx.c                            | 1 +
>  arch/arm/mach-sa1100/assabet.c                         | 1 +
>  arch/arm/plat-orion/gpio.c                             | 1 +
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c | 1 +
>  include/linux/gpio.h                                   | 2 --
>  include/linux/mfd/ucb1x00.h                            | 1 +

Acked-by: Lee Jones <lee@kernel.org>

>  8 files changed, 7 insertions(+), 2 deletions(-)

-- 
Lee Jones [李琼斯]
