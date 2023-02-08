Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D0D68FADE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:07:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwdQ4VcXz3f5y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:07:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lhYn0UKt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lhYn0UKt;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnrj5HZyz3cbV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 05:02:11 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso2115893wms.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 10:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5KNVHSrC7/cdAAppvSovX1BQYH1mlKeTzSZkndabzI=;
        b=lhYn0UKt1gI8oDRgPLyn7ikFvTDGwf2Vq24dv2LgPHiV8ihqRT2k7qLxUMyUBPC8iL
         1kjRzv0p5FOr/OPZoPqTsOomSmdtG6dRIDCmM2zWnykN/NsN+pnvQRcekBxPpLb+7dnJ
         WMII8V513jFjWV6EbLbZAVMg7+7MzRwZc69Es0ZafU8E7dTwE8PemItdaGxExyYCNWB8
         VicfQ5HP97OFsOvy5HtV54Dl9qvPAh4xrxJ0Tfty7jVCL1BqJCUFOP0rvw4UZintMu+r
         YcjZHNEqmas9yN+Xvh+FoJd90tCEohAYODXdGcG3sjItNhs8JWgRGQ4Vm8tIfLxbUBbk
         X96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5KNVHSrC7/cdAAppvSovX1BQYH1mlKeTzSZkndabzI=;
        b=ftvbb/Km/0Xtokqmi4v7CPC+kvI1nZW0lJ/6soo3dgHFpA+IIZLf7RWXCwWewAwDG7
         uwnilCUPb4vaAtfrFDQn8ribl4gw/7hTfZvtx6JyVpDsMja6iF1PC3oLdl8HAPOpzmQ6
         dyGzZd2AE7W0TQX5EYjeXmsqFe0FUBqbwEWa0ycquAdpVWoWk30qLpxd8NB25caWh0K+
         SYQHp1aYiaYruo5I50wfzRrwwsBr8ZR+54gee7uzKTWmRNmwB9NeZw6viRQjaZtnfMHv
         +GNYuL+eNy/jVQ9IJhmv9jDPaJp2VFtUw2mxj6ItVDAskl0SMRKniWytVHMQkD7AHaI4
         ICXQ==
X-Gm-Message-State: AO0yUKXxtMSsPyLD48Uyc7751bxbEXfeaNn8G02Xpvu1yD3xioF/HnGi
	BrKHL8tbsfE/YKLpspz4bJP4ig==
X-Google-Smtp-Source: AK7set/N7X08/6/zDIwTs2SW3WqzqwHVir4In+cx7rhLGQNf+mB7g+wx8kSFQo+gWqS8ovXbhXrHVg==
X-Received: by 2002:a05:600c:9a2:b0:3dd:393c:20b5 with SMTP id w34-20020a05600c09a200b003dd393c20b5mr7247364wmp.35.1675879326639;
        Wed, 08 Feb 2023 10:02:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j40-20020a05600c1c2800b003dc4480df80sm3034104wms.34.2023.02.08.10.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 10:02:06 -0800 (PST)
Message-ID: <80f5271e-6fe6-df5a-beff-f3723110edf7@linaro.org>
Date: Wed, 8 Feb 2023 19:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 02/18] ARM: s3c24xx: Use the right include
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tony Lindgren <tony@atomide.com>, Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
 Devarsh Thakkar <devarsht@ti.com>, Michael Walle <michael@walle.cc>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dipen Patel
 <dipenp@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lee Jones <lee@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-3-andriy.shevchenko@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208173343.37582-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:48:32 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Alex Shi <alexs@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Yanteng Si <siyanteng@loongson.cn>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kalle Valo <kvalo@kernel.org>, Hante Meuleman <hante.meuleman@broadcom.com>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Frank
 y Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>, Mun Yew Tham <mun.yew.tham@intel.com>, Hu Haowen <src.res@email.cn>, Keerthy <j-keerthy@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, "David S. Miller" <davem@davemloft.net>, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/2023 18:33, Andy Shevchenko wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> The file s3c64xx.c is including <linux/gpio.h> despite using no
> symbols from the file, however it needs it to implicitly bring in
> of_have_populated_dt() so include <linux/of.h> explicitly instead.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

