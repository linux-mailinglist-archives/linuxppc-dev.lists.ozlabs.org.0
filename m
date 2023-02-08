Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C568EF8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgPj6b3nz3f5X
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.170; helo=mail-qt1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBbLt0fZHz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 21:09:08 +1100 (AEDT)
Received: by mail-qt1-f170.google.com with SMTP id 5so10158939qtp.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 02:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Al90dbaVnMvp1zrarwIGYloHZEfuuu1TJgBG8XepFdE=;
        b=DbO46Bw05pCEM763GIAVhBaI0Vj+v53unJIPM1npO6sdcaSeQb1Mh3tlTOOR8FdHR1
         yHWJV6TBi12GJHg3kYd982r6C9czpSS7W0TJIvlzUZvOwoYy4TIf9XOyqaEhhKgh7lPs
         dV6goGQx+Pg55N2zC1OojXPMKEhbyQJkvmgujwJMis05hwAm2v8+HYM3XvZUlx1I2aC/
         c/RIKyeB1fRGP4yjiW9zoncBi+Veo8RhRB79fXn+qU1HXSq9PJE/cRyLYfJ4ZVveEvyr
         jjPpU3lZh+p2GEYFDrMsD0NyFqnHVyR6Gheupnyo/b2Y0dHbcLXkiCxdSv/nOGbUOziV
         CJIA==
X-Gm-Message-State: AO0yUKUVztkHPrSAka6VFg3YRloWX7GJLrXsaSfKsYaXQDfE0F7BKjpV
	xnvyv3MlOm9uRsfUMyUZ7dHQ6adAY+WnSiqK
X-Google-Smtp-Source: AK7set+I27hpH2UL94kUbZhjxOIx+shEhk/c3ndOunUA4HSXsL9wCtTKC7H8YZT6xc9TJ2ZdZdBZmQ==
X-Received: by 2002:a05:622a:130e:b0:3b9:b761:b0aa with SMTP id v14-20020a05622a130e00b003b9b761b0aamr11187060qtk.11.1675850945064;
        Wed, 08 Feb 2023 02:09:05 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id h184-20020a376cc1000000b006fcb77f3bd6sm11234237qkc.98.2023.02.08.02.09.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:09:03 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id q9so569112ybk.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 02:09:02 -0800 (PST)
X-Received: by 2002:a5b:508:0:b0:8a3:59a4:340e with SMTP id
 o8-20020a5b0508000000b008a359a4340emr741320ybp.604.1675850942618; Wed, 08 Feb
 2023 02:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com> <20230207142952.51844-9-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230207142952.51844-9-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2023 11:08:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkhymFCys_LnqKtpXLBT6sKURbVqBnp2wDUc63nhxvSw@mail.gmail.com>
Message-ID: <CAMuHMdVkhymFCys_LnqKtpXLBT6sKURbVqBnp2wDUc63nhxvSw@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] gpio: aggregator: Add missing header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Feb 2023 00:10:33 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Alex Shi <alexs@kernel.org>, linux-input@vger.kernel.org, Jaku
 b Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Krzysz
 tof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

Thanks for your patch!

On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.

That applies only to the addition of #include <linux/slab.h>...
Please also describe the other changes.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> index 6d17d262ad91..20a686f12df7 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -10,19 +10,20 @@
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/ctype.h>
> -#include <linux/gpio.h>
> -#include <linux/gpio/consumer.h>
> -#include <linux/gpio/driver.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +
>  #define AGGREGATOR_MAX_GPIOS 512

For the actual changes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
