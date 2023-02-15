Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7D69872F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 22:14:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH9n25zx5z3fVW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 08:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uFE2tcYX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20210112.gappssmtp.com header.i=@bgdev-pl.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uFE2tcYX;
	dkim-atps=neutral
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH2f80p3Yz3cQV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 02:52:44 +1100 (AEDT)
Received: by mail-ua1-x933.google.com with SMTP id b18so3670384uan.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 07:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHEckESBmtanHoXNoCvk3gYsaCb3mmNnsjrBL0CHXHo=;
        b=uFE2tcYXYvgsB0sRGahu4i6/jR0i1fWRumRbB6+LOj6E4ZTQeoJQKY+uir8dwyQAPf
         0tFSiyKW/Fnvdx7G9YqrFDzJ5rpovQR98oqoI9mDNOHpQoG6qkudJ1v0/vpv9DTZyvHu
         2FZ5pBhMrW+AwLQ0UHgvstufkVnkWswfeG6NT/qsFhsMW+RqE4zXszDTo9BrlFUTp25+
         B7HTBOKfeZtBkRm441r7YFaJc0rXVKo3xjPJcpiXV6JNc9DsILiJLKJHBFrcxHls+m2Y
         ZP+U/dMUytGegPXffNuxumCFe0jCae7w9HsecNZLfJZoIChNvNanAquRYPfNiHANjZr/
         6auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHEckESBmtanHoXNoCvk3gYsaCb3mmNnsjrBL0CHXHo=;
        b=rbf+6HTQxY9XAdWmIB43rZvp/bBg7qOnsfNwnCvRpDQDqu/OaZUKOCcb9mTMoD8Xvu
         U/m4NsZRNDsKk4PIcDI+6tILyvZZ11jSdDLItSzlhMOqLWSM5wMcIA3I45I09A2NBvfN
         7vgFAg/ZO7JnqOV1RYRwI26WoZqQjhBuUc1lDv2P4Ox03pEM3guSWxsP34/mdrMV7psX
         8dZYKSfJAJMnqhOpDe75kKye+4uuSRFXWeN9hG1mAW+0gs03bUpajVxsvrvaA9rs+DR/
         7DAYfsDR5pIJKDYdiJZA/xAj4yMPtDx4Z7XJUdt2iJBFe9QaSRkv9AEIA7awpSSijH65
         aOzw==
X-Gm-Message-State: AO0yUKUL80M4XN9pM+AQiUTiWQXvQ3dKapiMgZjoDgjQEqM2bGtCa8u7
	v5fGyPNmT9bQ+pXRmEhTc8E7kMUmHgeCRGcaHEI5ig==
X-Google-Smtp-Source: AK7set+vnGRn5VJvyu0QxjkbABjPQvrEocRoV7wexNKYGw75YkBBJD0qPPmjAkmta0f6ajtUkrNDoiyJSIKAB5KOn4A=
X-Received: by 2002:ab0:654d:0:b0:68a:7054:58a6 with SMTP id
 x13-20020ab0654d000000b0068a705458a6mr367631uap.22.1676476360679; Wed, 15 Feb
 2023 07:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Feb 2023 16:52:29 +0100
Message-ID: <CAMRc=MdsCZKh12QcqdWk+Zht5UDpA_G1+rx6+_3dzwjDYe6L+Q@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] gpiolib cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Feb 2023 08:12:07 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krzysztof Kozlowski <krzysz
 tof.kozlowski@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Yoshinor
 i Sato <ysato@users.sourceforge.jp>, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 8, 2023 at 6:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> These are some older patches Arnd did last year, rebased to
> linux-next-20230208. On top there are Andy's patches regarding
> similar topic. The series starts with Linus Walleij's patches.
>
> The main goal is to remove some of the legacy bits of the gpiolib
> interfaces, where the corner cases are easily avoided or replaced
> with gpio descriptor based interfaces.
>
> The idea is to get an immutable branch and route the whole series
> via GPIO tree.
>

Andy,

looks like this series has all the acks it needs but I decided to not
send it in the upcoming merge window, I'd prefer it gets some time in
next so I'll let it sit until the next release cycle.

Bart
