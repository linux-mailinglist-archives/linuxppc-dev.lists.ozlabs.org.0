Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0AD690B95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:22:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJw85YC4z2xT9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PVhgmNxs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PVhgmNxs;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD6Q1lCyz3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:45:34 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id n1so537548ybm.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ECisu58Ou5Xr+AMVxHOSKNEG1TgY5Zq0H9DdDE7KjY=;
        b=PVhgmNxsQQPyBAEDdyt8QfmWO6MNCgn8yXiI9Mk1P0Ph6Z19uULy1nXT56GCFjrWPx
         kjKAE5+lQs+meWWdvnVXJViYasQ2BIpN581gJLur43fb8v+TauC8ZGc8lXkHOKYKGPcA
         FP9AoOGP4SFr4QMxn1WBQianBQR4oWtc3600hrLz3lvn4coxlQ/kaFuOWt2ycqbFfbXj
         SxVqq2jNdWE80O8KHlaeEokxbPI9aumzyK9cn0FOyw0rWNFqZc4gomcB9McjjYB1Bcm8
         Us5DeeJ+v5hZbjP8yos1A+fhfcFeiZ/hBxsKgjJrx5lCY9fTmG5/RwJWvoKjyWMph0k2
         WXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ECisu58Ou5Xr+AMVxHOSKNEG1TgY5Zq0H9DdDE7KjY=;
        b=I1V3QTe6vAo3qTDJWRCfCrZR5JooI7w6Y8+kX3qmZJW0pr5xRbPdIfjxw4Vlk3W1mE
         8U7Hh/dSUfljzs6ySQAxyfhx236AXyavIsd5tAwcUFtNHUXP3lUp+Ouz2XnUKw4HmGU7
         7W0WxUOMFslbj0xywnTncXh97/Ea1pU9y7wd8UmTkuixesY2+AfTJvk32XqFj1N8k20j
         7okQl3h+256vFi+xLvy25T0YcrQA+TP1ZnWPMJy3etTFlH6mymo0heyKNf/wGyPauhTf
         sImVr/xJzaO9bcbWXyJs1UQQJJDFGZjKKnaCHQsn8mEM0lkQVUR/pJDtlI19Eu4lF44I
         cBlw==
X-Gm-Message-State: AO0yUKWhBnRp4xup9vZ/F8aeSLhM9DB4p08vj9OrXzBVefIuZRic2f8k
	gjWLdG1fhjRazSGH192bz6J4A4UISfr+UCjOyjaC8g==
X-Google-Smtp-Source: AK7set+c8vMXQoWt9zrvvB2u9a8HdXjW8xESL/qxrGLNm0jpSb7R5TJb/uyrRXXnVWpXHWRj2G52DUyGkXuHv+E8/cU=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr1339211ybq.24.1675939530421;
 Thu, 09 Feb 2023 02:45:30 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-3-andriy.shevchenko@linux.intel.com> <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
In-Reply-To: <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:45:18 +0100
Message-ID: <CACRpkdYRTq35gJq3YODGh9S_JnH1jxSOT8mNnetyRQY9Z5LhWQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/18] ARM: s3c24xx: Use the right include
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-omap@vger.kernel.org, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.
 kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Yanteng Si <siyanteng@loongson.cn>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Yoshinori Sato <ysato@users.sou
 rceforge.jp>, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 8, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> On 08/02/2023 18:33, Andy Shevchenko wrote:
> > From: Linus Walleij <linus.walleij@linaro.org>
> >
> > The file s3c64xx.c is including <linux/gpio.h> despite using no
> > symbols from the file, however it needs it to implicitly bring in
> > of_have_populated_dt() so include <linux/of.h> explicitly instead.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  arch/arm/mach-s3c/s3c64xx.c | 2 +-
>
> It's not s3c24xx anymore, so subject prefix:
> ARM: s3c64xx:

My mistake, mea culpa.

Yours,
Linus Walleij
