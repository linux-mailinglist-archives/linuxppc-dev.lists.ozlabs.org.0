Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63C690B7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 15:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCJp66TsGz3f4m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 01:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CTfWL8pj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CTfWL8pj;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCD1m5PF6z3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 21:41:30 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id a1so1784776ybj.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 02:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=CTfWL8pjm8f2MrW7uavUbnvldEyg0bhDjX9kzmJAomtRXVNHa/aGLoocEdHD0fyy/Y
         fEKylqcVs1Rm6vCkJ86UCaYPU6SgxWlbi4HnnDcv7Bz22EuLo8VnW5wtx9Bdq3ozCs7A
         lZNkMVc+naW+d5b+0eDsi+iQsjJg8Q3YhD4iP1td0QgnSPS70YmDicHTJMzjun3aNplC
         sZJW9L4XCkQP1k06jvz134a+Cjmc7KfiYD3pjsjNdX3Y/BgLss5Jg+vJgVWN5BpvDERW
         BN28nTKVj1O3Zhkbf2gj8UPBUdyuQZp8hD6GqbCQ1PcojQJtzxTJ1vptev4FdI5FrQI1
         Ewyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=g6Cdp8SMxxV46ivfoNJrTbJj1EVBMpu0YRi6hbXpy0DB5t55PJFnf+CB+oh5Rkj4lX
         Swa1fXngUlo5mkRSUI1/sEAcSROx5EAypdkKvNVrr5a0pZKTVq9lfxiZZwj5AyM8cGto
         g1xsNfC0EGP+OQnH/E/MytfsKSuJTj3w7lu5fGi7jIAzoDnotIK6DA2w3GbQHncR+JGh
         m3Etg5nimyL5hXGl+JLdCOXjEXSo6dFWDfPscVSBKw38Loi1aNEitu3M1ljQgudItZrT
         xUt8KKpBlWRQKeI7DHrh9hER4r7+b7fgW1JKsBJxDxX615CLxEp3q0dFdtX0XgmBAFqB
         AKCA==
X-Gm-Message-State: AO0yUKWDI7Rm7cIAtJal0hKFtKHWG1T46PGDGsfkWpoVWUzxz0mL+AmX
	/AiXr4LDsX5ymg8h3BfCKFCpBWvWbzwSD4Qxeq8rGQ==
X-Google-Smtp-Source: AK7set8zUBoMuKEkh07dateX8DXDKQwFdadaIyfZa9ErQD4UXOsRHzHAgRvHHkEB2ER9MGhyrUUFZo9EgHYFwleS790=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr1338256ybq.24.1675939286984;
 Thu, 09 Feb 2023 02:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-15-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-15-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Feb 2023 11:41:15 +0100
Message-ID: <CACRpkdbyosRgubdbNDiHZddK-hPAX7C2MV26eaeKnPO5xy+=Eg@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] gpio: regmap: Add missing header(s)
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
