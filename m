Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58A68E534
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 02:04:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBMGF3kL4z3cd9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:04:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e1mwDgXa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=vincenzopalazzodev@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e1mwDgXa;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBFhd4MHZz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 07:53:19 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id jg8so6300733ejc.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 12:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfKELKMAnQFkkEbZHEYEZttNxlmjlMVEh0XNdBoEsjw=;
        b=e1mwDgXaY5E6n859Lh8E/kA9NZHYyP0k8s2hCe1rVhBqfHpVx2nL0YTe0MZ/wz2muP
         sYRVk2PWCxOlDfKJiEYlUoBZl1Ac9dgZlGQUxRRsfo+TJ4hBpI5bJ6GGFt/iv7yZpRuV
         QJwv/W3L55N3/gC0OcYRYriT9MeJNabif8VtIjcuEG+Uk72Ib/UpIy3A4Wl21UycyGeV
         khphF77pzIvpuuNw3it4HAM5Bhbv+J+/cXG7jY1bIIVSkuk0pymjT4CR2+CXdZ7aILGi
         +dV8eymgVbI7VDVjM4FRnhr/cX1PTT27Ux51VwSTwf6Ea8dAeAkQ/9jIrMwF1hoVs8mR
         tT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfKELKMAnQFkkEbZHEYEZttNxlmjlMVEh0XNdBoEsjw=;
        b=amiJioG6hlFuMeUeAgl4meX+3ziubZ0F/ZOueR/bXw/pGBCfOVKvO8OKWBjllQWHOj
         ZL8ZYASFG+HglQEneiaKO82Z3SHTXGaeKVyxzSpzjIEr96X2192rZGv0hoO8Ab0LW0wx
         Q0WURjZvC9Vf3E9YWqoNhbRNRDW+oBYBQZiDsKMSMzHuz3OVrjCeac/xVtE0VEz98Nup
         WL883DzMSFqIlVfEDSLYyNJjDP4KEDqBrOL4e4tvVZp8oENf1Vxo/uY6bKh5YVXBN6mV
         XsyhjHpebPMdk90On3GD2G73BiHRFRhMo91ly2PwYLjBs7TiLpxd7PM21dpIBAyPKJQ6
         Kzgw==
X-Gm-Message-State: AO0yUKWfLoMk4CYaNmyaxo0UffAmlNVj6a6SdeCuG8O/z+581vVnRjJw
	R9vpLlUeFlkG5cJGp5TJ7eQ=
X-Google-Smtp-Source: AK7set8gSzfFyLFzaRMOX6lLIPCjFSzze6dgA1JenhwCC1vYAs7beQOSSrNlWqOlog2SIUGPkEcD0g==
X-Received: by 2002:a17:906:bc54:b0:8aa:d923:faf0 with SMTP id s20-20020a170906bc5400b008aad923faf0mr104030ejv.10.1675803193728;
        Tue, 07 Feb 2023 12:53:13 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:cd23:cd6e:ae14:44fe])
        by smtp.gmail.com with ESMTPSA id g4-20020a170906348400b007add62dafbasm7323912ejb.157.2023.02.07.12.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 12:53:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Feb 2023 20:53:09 +0000
Message-Id: <CQCMNHG923N3.3991UZTUP9WFA@vincent-arch>
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>, "Tony Lindgren"
 <tony@atomide.com>, "Thomas Gleixner" <tglx@linutronix.de>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Devarsh Thakkar"
 <devarsht@ti.com>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Stefan
 Schmidt" <stefan@datenfreihafen.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, <linux-gpio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc-tw-discuss@lists.sourceforge.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-sh@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-wpan@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <brcm80211-dev-list.pdl@broadcom.com>, <SHA-cyfmac-dev-list@infineon.com>,
 <linux-arch@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 01/12] gpiolib: remove empty asm/gpio.h files
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230207142952.51844-2-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Wed, 08 Feb 2023 12:03:35 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Eric
 Dumazet <edumazet@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Alex Shi <alexs@kernel.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Yanteng Si <siyanteng@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory
 Clement <gregory.clement@bootlin.com>, Kalle Valo <kvalo@kernel.org>, Hante Meuleman <hante.meuleman@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Franky
 Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, Keerthy <j-keerthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Li Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly, with the exception of magicpanelr2, which is
> easily fixed. This leaves coldfire as the only gpio driver
> that needs something custom for gpiolib.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
