Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD01690B80
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:17:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJq73Gs4z3fBC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:17:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoRufYnW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NoRufYnW;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD2x0WJDz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:42:32 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 184so1804293ybw.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1EVNZNpF/Er877/te7k/r7KimgWui6kPYTMbzlbMpHE=;
        b=NoRufYnWd3sLfMds3pddswGHnqjpzO29628T+k+Q97BW963D2fJT2hsh+eLfD4RQRH
         zdt1oPrfGIR6Ose1yZAl+8pQgeUH06VeoxND49uyRtLk5wZaK6P1vWkHUPfwzBs82HZR
         oz2k/BMEaFgmS29Yh5uwqHaYMz9Lhz6PDpDDMeI348cBYuVGYWvMWT7QO/+7wp9T5Vuw
         22Lz60wzbBdJCYBR+gQPrDMAhySTtLLftil07FrKSjq7YegvR0bKStX2X/FTg/1VqIdH
         Sge2BQn9ZdQJjuaYgcGGeAH8hZsKUPivgELlTQNAPWs8P8uYFiU7J3aJu1bicHqUtpvb
         002g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EVNZNpF/Er877/te7k/r7KimgWui6kPYTMbzlbMpHE=;
        b=5/MIXgpP86RYxMPKnboTdYxYcKO+EvUejE506ajF55rNcLbhD/jku9bX8o62e4ue+C
         rSN4sfkE+6yQ3Tc/dLpCebiXkNEth1d7NPNQBE4rEX+rAms3FkC+3CW239JugJFLEf23
         L7KGibX6XDasQztk1NznM/+f1R3TcEbFJG8cVDBzXQXkIj+dNRb2cAQ3PGLz3HeLyBz1
         sGLdAOIpzGQMPZ6GKw/twYahI3EN0la+XwX9fBmRRqMKWqrbc2CAiGPFPGG1wlYMP/tA
         V+V8u25aKGgobYGjhRdOEPFyIRl0vOeVuPXhnW9N1+cKWdt7cP3mHPD6LiSnWnufnG9d
         GB1A==
X-Gm-Message-State: AO0yUKViZ9B596QXFgN20LpHMwYJnWkGB75+uAzLSoAlM2Z5dZeUVpma
	yG4+1uxlqPVBkHVjsraADGWRwAIAuS04cmTGUAgOrA==
X-Google-Smtp-Source: AK7set/4egQ6ymaaXnifQxB1VP1BF0zfzUZPRKdac18DBhBo3kRtxaBrvl/7jPL1oolTNNR8WQJzGyOCYU7Jrhx58mc=
X-Received: by 2002:a5b:1c4:0:b0:8c9:2650:4ece with SMTP id
 f4-20020a5b01c4000000b008c926504ecemr420798ybp.210.1675939349691; Thu, 09 Feb
 2023 02:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-17-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-17-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:42:18 +0100
Message-ID: <CACRpkdY+u4uQAXLggL=Shf7_dES_HRRtew+9Cxuipxi3nHRRCA@mail.gmail.com>
Subject: Re: [PATCH v4 16/18] gpiolib: Deduplicate forward declarations in consumer.h
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

> The struct fwnode_handle pointer is used in both branches of ifdeffery,
> no need to have a copy of the same in each of them, just make it global.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
