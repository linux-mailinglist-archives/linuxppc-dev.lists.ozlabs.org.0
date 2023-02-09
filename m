Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094C690B92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:21:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJv82Fznz3fHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:21:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uuZ/oXOr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uuZ/oXOr;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD5P1s3Xz3cbV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:44:41 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id x4so1860527ybp.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4qUYzBh+htvaSXOzFbNonzhWIZMquhylnwgwaeahDZw=;
        b=uuZ/oXOru1y5UKbjewNxej2lUBZUjA/1ggGu58hEptHz0z4GXGOaT7FaMOglr+2wPj
         4/MsVJ6KLCikf3ZFZNyK0Gy12bs9MQqkPAtfTr75QUjILYQQ/DRnb2+a60m8owu7ZRy6
         STtBilq89ZUzNjAwwp8kE2q+7q6e6f5g/d+9CTEAorBMILiidfS6YQHMkfUk7LQYdTv/
         NI++1y0LwBY9js8Sr97WQfezP1Ee3hKFW9ffbD2Ed7rpzUZN3ALWW0F5B6y9hYsVO7uT
         0dDXJ4o+1R2iwk4/GIy5Xk4EtkzULEIoKVf/W3QINP0rEKMAOq0w8D/WStNV1a1neNO3
         Xjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qUYzBh+htvaSXOzFbNonzhWIZMquhylnwgwaeahDZw=;
        b=rN0soqdzpj/MCTwyHG9rrQQ5TFQFPBNCOU8yB+7jiwGr2V9G667pxq3L7STfFXosgE
         yUvwb6ihNzbppxXuZbWrZ0Ko+So1/N8LWEY13SqmQZ66b3I5OnYX7GNCnRZwBki4KB60
         /zY0euYoMiOq04G5riPU1D3a0jKDGBTIyjLnQejjlyRU5Fdu9H+TVSTZRozxFQL7VZpm
         pmbJuHi3jx2ml5DusLziKzuRgpxgbAwTdhgo0K4dLWq1k5dHonR5F7gqzYzK6v19Yl0+
         Dcupz3F1gZ8lWnH23fiIq2HB9FdhK05MCnxns2SK7/Jes49+jCBsbx23TG6T8IZQQjMO
         0vGA==
X-Gm-Message-State: AO0yUKXfIkoWHlFIl7hBFTIWhu4BpdY9WINgTZCX7uwZB5YILtU6i3kM
	3/Q3bLBvyy19dc4VsVgGakCTk+r6bn1H8Hhpe5vPqg==
X-Google-Smtp-Source: AK7set9d9VE2L5hryiHb25bGtGaGLrBq8cYlmsHU1RCuAZ6kpI7lLERRU7ZJG+pSow3smAjpy+w5g/+hxXK6eBZGKHY=
X-Received: by 2002:a25:d987:0:b0:893:76b2:9200 with SMTP id
 q129-20020a25d987000000b0089376b29200mr1091099ybg.584.1675939478849; Thu, 09
 Feb 2023 02:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-19-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-19-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:44:27 +0100
Message-ID: <CACRpkdbO85vArYXF1iY8Z1wXXFTs5rOffyzy2zWK=PgM+mGM_g@mail.gmail.com>
Subject: Re: [PATCH v4 18/18] gpiolib: Clean up headers
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.o
 rg>, Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Yoshinori Sato <ysato@users.so
 urceforge.jp>, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 8, 2023 at 6:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> There is a few things done:
> - include only the headers we are direct user of
> - when pointer is in use, provide a forward declaration
> - add missing headers
> - group generic headers and subsystem headers
> - sort each group alphabetically
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
