Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262A69160C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 02:08:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCbFc6hLqz3f67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 12:08:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m45PZQvJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m45PZQvJ;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCZQS3BZsz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 11:30:40 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id n3so2684882pgr.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 16:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j/k0erUD/kDhxh7/K7OwX/bqJpwb0bJwB0iaNCFMZK4=;
        b=m45PZQvJM/hD/Xj9vlTDu7tBQyIzoAKV+Ug121N7xEPFN7JnwalygRfN9Deee662VD
         1QVbr7FN2GjKS80HHKfM2VRvvS5Vumhqz4Q+X5SC3+HRHqlG8a7QYMW60YZ5vMmXuVWT
         Whj682Dxwd3DP/j9rmnilydYjFYDO78yDRgj3f2c7t5Yh9pLdW/rRTvgu6ytHpVWH4Bp
         WyfwWCyWVkyOkZzxzrnyvN21unxPk7gjxu9VkavwgK4rgme7Roz1XT+g6ILjuGTvn1Ca
         djNyiDLTeCH+LIzJyxsFu0Lca5uXhw3bVHkTtzSaYa2Z8GkE/XD13cpHeodi0b9EwBno
         w3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/k0erUD/kDhxh7/K7OwX/bqJpwb0bJwB0iaNCFMZK4=;
        b=7CTDPFaRNw34KSjwxKCqg6jV4fhg/dPVq6Ws47UgQRKcheK8Mkct9M8SXOWnEHgcV9
         J9rZP+bpxuHOoonkyzPyPXFj0lU54CsEXVHydkBbKD8EkHgA2b6PWLV1ISHzgbh1KgHp
         pv3m1Lj0uTbKrZ55hx3ucSgbt81vyPW3XVWYF/nR8ZUe6nWW0fInVr9+G0A+YVaZ7SEH
         ra+lfNkJqDSWIqybgoED9mxqkaTDjL2g8HrbrgFFsU1T62tHKnP8fMTTrXvi1q3lUV2a
         /fNMKFtQkszkl7RBkdKt1JB57K8fBwq+yl0/p++pHJnAEHPMF33DQwOFc4UWlrKqYlmu
         mKqg==
X-Gm-Message-State: AO0yUKXCinnGlsV+4iImimEc3Aj8a0WYz8xhaQqCMn2dikl3U/UCcnxA
	ARUPNxC0jRblnybejR5q27c=
X-Google-Smtp-Source: AK7set8J843VCb5Swh1of6p2yfW1raUVGGmO4Q3S+xAJAvwl45nss0avFGNhPNql2c/P0j9nxUjhIg==
X-Received: by 2002:aa7:9e42:0:b0:5a8:5424:d13a with SMTP id z2-20020aa79e42000000b005a85424d13amr3990100pfq.11.1675989036714;
        Thu, 09 Feb 2023 16:30:36 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4b3d:5db5:694e:89d0])
        by smtp.gmail.com with ESMTPSA id e24-20020aa78c58000000b005815217e665sm392161pfd.65.2023.02.09.16.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 16:30:35 -0800 (PST)
Date: Thu, 9 Feb 2023 16:30:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 08/18] gpiolib: remove gpio_set_debounce()
Message-ID: <Y+WQJTsdeZeAEs/S@google.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208173343.37582-9-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Fri, 10 Feb 2023 12:07:18 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@
 linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Yoshinori Sato <ysato@
 users.sourceforge.jp>, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 08, 2023 at 07:33:33PM +0200, Andy Shevchenko wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gpio_set_debounce() only has a single user, which is trivially
> converted to gpiod_set_debounce().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
