Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14632363E4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:13:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP1MN73Qgz3bt8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.48; helo=mail-vs1-f48.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP0B56xf8z2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 18:20:27 +1000 (AEST)
Received: by mail-vs1-f48.google.com with SMTP id l11so8666943vsr.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 01:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltv54OOOgcKhPoH7oRaigoXMRi+Z2QqH7bQ4dTNkEvU=;
 b=Z+hv3WsiWBGRhf04OfpkwqH1yIWTm3a0l9YB4TXK4Q6lGawwgYxuV60ACtwDmZ0Rtc
 uTzJgYakBZtRpDlWh4uPN3Lp6p0bm19Sq3AIy52qUzRQFgNqhcFV2GfqkOMc2T9u/qpX
 iAAMRc+00V6AfiTYbhhgA24GbDKevusgST3vN+1pGMC0Zw/egx1igubzkG8ZcibU0av7
 nqc4cNkaB50uiXVyLlpKx3GBUxvMkY9wWX7DZ/sYvdD8eeQYlNmavrYpGvR+Fp2L9gO8
 xXPUy5lFfZgAs+dzKo7bKJVzrf8QYBoEXnHJp6UUQrKQIWKQEUvYCtDKLJBcdujVA8k5
 V1pg==
X-Gm-Message-State: AOAM533c0AjorcMElSvgX3iQF+5KtblYKeP86ebV3Vh0s7xrotig++Ru
 Ny0oRDrHjHY7CsO/y35MeTpw69lCioPStfwcEW0=
X-Google-Smtp-Source: ABdhPJw0QI7XOFx1TPnFrXWAlR/QW1v6zaWS/KnYbAtB/CEX2DsVVO2yNBv9r1VAA3kWmuOXuQwF2fQGH/J1go6B4oc=
X-Received: by 2002:a67:f503:: with SMTP id u3mr12373252vsn.3.1618820424835;
 Mon, 19 Apr 2021 01:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 10:20:13 +0200
Message-ID: <CAMuHMdUbrPxtJ9DCP0_nFrReuuO4vFY2J79LrKY82D7bCOfzRw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for soc_device_match
 returning -EPROBE_DEFER
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Apr 2021 19:11:47 +1000
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
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 wim@linux-watchdog.org, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 khilman@baylibre.com, joro@8bytes.org, narmstrong@baylibre.com,
 linux-staging@lists.linux.dev, iommu@lists.linux-foundation.org,
 peter.ujfalusi@gmail.com, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linus.walleij@linaro.org, linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Roy.Pledge@nxp.com, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, tomba@kernel.org,
 sboyd@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com, robert.foss@linaro.org,
 leoyang.li@nxp.com, linux@prisktech.co.nz, vkoul@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org, daniel@ffwll.ch,
 j-keerthy@ti.com, dmaengine@vger.kernel.org, jyri.sarha@iki.fi,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alice,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 6:28 AM Alice Guo (OSS) <alice.guo@oss.nxp.com> wrote:
> From: Alice Guo <alice.guo@nxp.com>
>
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

I'm wondering if this is really a good idea: soc_device_match() is a
last-resort low-level check, and IMHO should be made available early on,
so there is no need for -EPROBE_DEFER.

>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -110,6 +110,7 @@ static void soc_release(struct device *dev)
>  }
>
>  static struct soc_device_attribute *early_soc_dev_attr;
> +static bool soc_dev_attr_init_done = false;

Do you need this variable?

>
>  struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr)
>  {
> @@ -157,6 +158,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
>                 return ERR_PTR(ret);
>         }
>
> +       soc_dev_attr_init_done = true;
>         return soc_dev;
>
>  out3:
> @@ -246,6 +248,9 @@ const struct soc_device_attribute *soc_device_match(
>         if (!matches)
>                 return NULL;
>
> +       if (!soc_dev_attr_init_done && !early_soc_dev_attr)

if (!soc_bus_type.p && !early_soc_dev_attr)

> +               return ERR_PTR(-EPROBE_DEFER);
> +
>         while (!ret) {
>                 if (!(matches->machine || matches->family ||
>                       matches->revision || matches->soc_id))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
