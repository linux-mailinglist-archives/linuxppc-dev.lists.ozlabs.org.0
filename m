Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F57690B85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:19:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJs76wx7z2ym7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GLwl7Q7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GLwl7Q7S;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD3z53z9z3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:43:27 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id q9so1846678ybk.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7bf9Uq485R2NtxZEe67divp+n6UAi9uTuUydnCWVSg=;
        b=GLwl7Q7S+sW3h6atJzFjD9AilOcYqsPpQ3N3GeZ/D1Q88eJFYLRx7SByx2MKR3Tbg6
         QubdUMrA1FyWuDBqNGk/KYgKHj88NCbcdHz0TdxzXQlWldCFmt+T88T3OTKYV4CWPws+
         UJNXxHkfOucmMuvDGUcoQO0SeUM/g0ki7Fy81zLeWxa8HJRrq0tPaCgVq8mtC+dl1KTG
         v1A/7RHpawAeO/VgRA2to2txj8hRpIw2aZGHWCGR5He7S8Yx5BD5smCOGAdYNCvajG6I
         Ri7bl0JjbLdIsGg97InNpJ8AnGnu5MYrxD0Ms9oC/qKIpgK736+hK9g4RDJvTDvM1KLX
         Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7bf9Uq485R2NtxZEe67divp+n6UAi9uTuUydnCWVSg=;
        b=cRi5LBCBonUVmJIqaI++gdieB67JuHpNXIzfezGP2/KqEOy89Vpx+r2uwT61vLob0w
         VH0F2b9ANHW9lsLh/7HHBYY9cbOkVa1CpoHa/fDD43r9jlrqqa2I/sL3g0NJi6o4hH02
         bwScOpOO6BukSiuD92mxgveVwUp2/vRtZdjAfL5DTXw+5rz/p1PXSQ8CGMkuQyMWsBj3
         T7XvzbjBZJ3yZc5GZMB90Ft4isncKVEVxxWTA+l+f93dgKzP+d43XW+CkQZLDuec0j2G
         NA/luMev4gyrmm6vZaAs7vLeuHsgWaeeZkGUrqNWwiQKOBPrj2YVkR+dsWeouaCxRPf4
         Pl8Q==
X-Gm-Message-State: AO0yUKXk74phvxEGl4/RaXyuEFf1a4h1fi1vTmWIfXaJXdUQjw9Og3nI
	/NnvQb6pkaCcQ4DLXBvDNyc3wddg9QE0rhKWQFn5iA==
X-Google-Smtp-Source: AK7set+gn4TRcnw/Px4w/IuFAMVTVJyu4IvoJ/vrCRoCZs1e5OwtzAnC5LkZeezUkZu5vWtv8zRWrBwhSzP2jQpPPmI=
X-Received: by 2002:a5b:150:0:b0:88f:92ec:4292 with SMTP id
 c16-20020a5b0150000000b0088f92ec4292mr1180607ybp.460.1675939405127; Thu, 09
 Feb 2023 02:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-13-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-13-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:43:13 +0100
Message-ID: <CACRpkdaTvKhRi2_szWCPv+NrXAzsT7ROKv-OJDh5NgLJznDzCQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/18] gpio: aggregator: Add missing header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Feb 2023 01:15:07 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krz
 ysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-k
 eerthy@ti.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 8, 2023 at 6:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, drop unused linux/gpio.h and split out the GPIO group of
> headers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
