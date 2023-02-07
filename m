Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D868E15F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:39:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBD3L08N7z3fBS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 06:39:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=waPM8nbR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=waPM8nbR;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB5ly2v6Gz3bZn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 01:55:39 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id a1so18848940ybj.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 06:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kpS3HgKPmEogc2Gw9AlFJQlCzGdEEgzV3gaAp0/AV2s=;
        b=waPM8nbRluE35gGhrnOOlYCVoqMbSzXI/bIeppE9bSuFFI+RZAzc6Kl5AasZ9otGI4
         OBcaMb89VmJlQA1BqQM9ko3ab0J+4Uob3evLCOBCdMRAvfPWqBlGowOBUJ6rCj1/Vw5l
         XsdeMKH6QAcOLrAjl8BW/dfg2o5OtyicTpibLycC02L1REZwkd+Y7rbkJkOqOlSQv3La
         cTVllcV5wizPEPJZkmwzpovhOVse1MS8EUFEA5YXboPA/Yu4/bznLdms8azWGLg7n+wf
         jmU54a3NqzhTvcksWe8Tw1hVTpGGhzzkCQdkP6PiJjo5P+u9SwIiWyDKskkWkkK6MrhL
         sNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpS3HgKPmEogc2Gw9AlFJQlCzGdEEgzV3gaAp0/AV2s=;
        b=AjnLy55jX6KtWih21mmQXMpMBqS0YaIsMp2m8rGnwhkWQ6xb5T9G7wjGpYGRJt6cMe
         va3SMuVM5atV1I8d/PekyKUszlFWzJwPZ5IIuMgkn/jil328pMowOgHilRrm6+q9YyCu
         NBqcUtpNAgl1vHNuVS12qxB5RcOt6a5xW05upz2YqDA3n8tpkR++gY957nfEKT5xztFD
         vg7RE/T+Ncf5n8fhuqkxYjyIXBEw2edjmmQ4DWm5GWxN1ZZxfORGXjR/Kmx6LjmmpA8j
         av4ms0UbN+YHC9jlWAtH3z+R9nHDRNhSpulPG82jMXpWm4/WklxbVJizZULM5qGtzHEe
         +w7g==
X-Gm-Message-State: AO0yUKVC+xBgmsQMWU8s3Xa0koNvvIYLOkM/ox3XMlg4bc2kzslSzZ1g
	yp1y+Y/igHOF41qU0FQj4M6KxgUq3abIzg2lkGSAWw==
X-Google-Smtp-Source: AK7set+FPiZG8Q0bqmAM+3oI4VA9/UkIXmLGvn2kwzKpYMs61nqxRIkPG0TtYZXh9iAdflkTtIBPO8Shde99ziPoa9c=
X-Received: by 2002:a5b:150:0:b0:88f:92ec:4292 with SMTP id
 c16-20020a5b0150000000b0088f92ec4292mr401234ybp.460.1675781735294; Tue, 07
 Feb 2023 06:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com> <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230207142952.51844-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Feb 2023 15:55:23 +0100
Message-ID: <CACRpkdaPgjDijPjCdinWy5_Rd8g3idv-8K=YPTv5iTfJKFuJfw@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sh@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Alex Shi <alexs@kernel.org>, linux-input@vger.kernel.org, Jak
 ub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Krzys
 ztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

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

Make sure you push this to the kernel.org build servers (zeroday builds),
I think this patch needs to hit some more files, in my tests with a similar
patch at least these:

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index 5d776a185bd6..79eb866558d3 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -6,10 +6,11 @@
  */

 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/timer.h>
 #include <linux/platform_device.h>
 #include <linux/workqueue.h>


diff --git a/arch/arm/mach-pxa/viper-pcmcia.c b/arch/arm/mach-pxa/viper-pcmcia.c
index 26599dcc49b3..2c7af4ed57d5 100644
--- a/arch/arm/mach-pxa/viper-pcmcia.c
+++ b/arch/arm/mach-pxa/viper-pcmcia.c
@@ -19,6 +19,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/gpio.h>

 #include <pcmcia/ss.h>

Yours,
Linus Walleij
