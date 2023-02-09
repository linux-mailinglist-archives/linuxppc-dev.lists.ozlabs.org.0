Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBAE690B8A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:20:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJt82w4Hz3f5H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:20:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJPsu/Wz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HJPsu/Wz;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD4Q2rsGz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:43:50 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-527979e8670so19260227b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=HJPsu/Wz/435Gl3W5fT4LJ0iVcWC4lhFzEpUL8YyaR7PHlvhZ83ixgxoByTXAid1J6
         Q5GAhluj0HC3PbE1r/44Y5Po7Dcqxzy82TkQMMXBgK87a8FhdSiUApImVIBuCtr7BiYC
         dQLEBtEZdWctRXxi6/C2opdxP4i1uwAWHCHdDSA/D1SRv93/BupZ5BhMYI4QvWArqCap
         jvLGTJwRxDNHq2E5jYN8fkuP96FlRR3JcB7Y5i9dj53kAAZKJ1YJN62fLu6KRbhOa9LI
         tP08YGlrCMdjGNwfJa+qKCNB8+CEi1mdDPS1pUUWPuKXJEJYoVbW8egTh0v2xuSgaBHI
         mAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=6EVKjq8iYfjEfgqAEL3/nB8aEttygAVDtz2oALcYS8ISJ+Trys3vvllSzMbOHcm0Wn
         QFLHH2+Kojznb1d1saWnd9wzTsinjAkIEMS+kD5E5ty4D6xUjJ28DM5dmuljMC9KJZha
         2osWc01cAvQkElNR3VxlFPO4G39yIY/Y3CA2WoaOoSTz53XDY20b94UzT8TGkmeRjIg+
         mgtg01vsZHmQqMw63lo39KB525EHuFrDp+oc0qM7gpoW3c/v6X47w08vaYws0mysCnQP
         TonWnjCbEzH760VoeV4ZT9pLTdOGi+V1Ii8ZMWI+gzkW8KSm/pshkcvmE+R8sUFffxvX
         /ZRQ==
X-Gm-Message-State: AO0yUKV/N894w9Dc5oC4oAUrriIDtD3DF4Ti7sEb1mQQ+DTGtcPnA9Tg
	92xokOpkAQKVB63a568yzvhNy4Rh0Sp5IG2Ie72+/g==
X-Google-Smtp-Source: AK7set9ymol3+anqgOuNHLyeYoAoKJBt8lF4LiRuMMBcOpRzV7KXZewKH5NE/Xez2syh1Qjfl7P5JUsj0CNKmumi+ig=
X-Received: by 2002:a0d:ca01:0:b0:52a:ac51:c6d1 with SMTP id
 m1-20020a0dca01000000b0052aac51c6d1mr903762ywd.477.1675939426884; Thu, 09 Feb
 2023 02:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-14-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-14-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:43:35 +0100
Message-ID: <CACRpkdYvZyon5hkgbks0dUqY8QsfrKcuU048LHRPg=UwLezE-A@mail.gmail.com>
Subject: Re: [PATCH v4 13/18] gpio: reg: Add missing header(s)
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

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, split out the GPIO group of headers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
