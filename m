Return-Path: <linuxppc-dev+bounces-16011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E14D3B731
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 20:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw0k06QY6z2xS5;
	Tue, 20 Jan 2026 06:23:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768850616;
	cv=none; b=ifSYmZS7HVY26DvbNkQW6vjeIex8UPAOmUkmXpriZ5EMSuZtbHqgWAE6J2LLo7O8m8CMRe1hq0UL/3mcirxoM/TRne5eGj4t9w16JLUv310XF1I7CzfyuaoOIipD3cln/FnDQixL18T6Tk6i9GrAGmjc7fyYaOHHRTLU0IVz8eOre4GggZWJDd8VUA5GTCePFuFVXkrbPLeukvyFkBczy2PMEB4aZEcfnH4SM8Wf7qJOb0QOuftm02SyYaH/h78pyJXx2Z1nNdskiQt0Vi7PYWIPpHOXO+jTkFL0C1rbHePiN1GF7oAIoIP6Xfs1OOc0ww+sLnD88G2tQP0n/t35LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768850616; c=relaxed/relaxed;
	bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8gpuZ/FlISF15K2tGlJTm2hMI2QhZmBGAYpPzdFc204ZbK+J0w7lfpKeydUfV9hE/gjLT6BUz7XZN0ndVwHKZ8SZjUrPQWhsSQgp7SPcPeGxc9Abp6T7oKXqXFpUrGxasqEYK6FYRP2wnTgbOyqQ86F2bqcb271ZTc7DO2y3YfGkZhURcB1nJuNBfsKPw5qEe3YwLpQ+1ApyEvfxKR/NYlP/iccHUCKEcf++/GKP33/qrHkBOYB2EaixJxA5RfKpFZXXrUtprYq7shs0Ynj1G1J5EBYU8DgV5CAwqFnxUCnY9xhxym55NagPWrFmgSwjcxG97+Z7LYw+9CMt3Z7wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw0k0055Kz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 06:23:35 +1100 (AEDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5634feea416so3480151e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850613; x=1769455413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCb1Q/eNGJuZWnaSy0QMCWG02dACV3WSdsoPlEt9HTE=;
        b=F+DXK5bj4hPz4UwEUTlUEbk+btx/zv2BsqFJEiY6esifAghldB+GKkxo8YsTwVJEUy
         j8VylQCikenAqxfxjhxSlIdlCmEtvOYTupIGNvI+/4iMlHGAd3V73JAtPx771ZatzBDj
         Xh5WzdxG5Y74Md7cFN26M4WZSqCFkFJf8LUOGeCrKw6HmBTFj0ldYa6JXwMDfqazbQUa
         v6VG01Lfbxb3tJuXC51UI+NpG6Dy9mzyPVF77MWXsiYA7eHms46oMA+Nq84csjUlN0Jl
         N5Cf22LxZTP2pRJ5JZzZ77V7zkNUXxu7UE7QGQxl+ATByy0FwMX2BSEdYgd4nNRSH8vS
         oA1g==
X-Forwarded-Encrypted: i=1; AJvYcCUywq5MK9mpOsgtfXnIVmsepY3yPjunklrcnPjsWrL9GGTjQ1aOaddNBBLcZBFXtNYPGV+2+/h2OZ+j2o0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxT+L95S2qtEeagx3acou8ZaeZEQtNdxeubSaFyeLy/aHZw/IkC
	T8HzIGq3U4XAZoSLcLIo7JRk4XFnZAuYroHJlPpBMDwRTYOOOZn6XFUhZ+1enzxe
X-Gm-Gg: AY/fxX55hq5RP2cBZaj7PTUYPsdSMgJHu8YlDPV552Z6Luv6wafaaHFQ5Vv41hrdsym
	RFdjGa/To+I2JqB7WymWBIa6hh+A1W/YzeyvADR/pQ42JRY2im0Tv4dQ28oxts54c0W/GwcNEUj
	jvTASx8+ez76ggoWS0kLuhXRqMeKkNkedq3b1LvYwPFzJ6TMO08ho8893T383gCTbtChjXh1mBD
	9VpBZJAEGC6oYv5K4eSXSpDTgvP8hoFzCZtE6XX9Vi7LdQEozU6jIMTvE06kcWUM+q97jhdbewv
	QCgZeiaQKGiybKal7tbld0jP7zjMCK+QYiRK7f0LFenIPRoR3Erd+dBuk7D9jSwXen4f9BhRblw
	AEMZxwxBm1pVLf2ddO/vVhPzxGCJ5z0kTsYev3cR5I85uYgf4k7BzbIo5iGbTrVgM0pnn+5LwYz
	Uhfh0uQvw/pgLZTwRJJjsJ4f/DxOuB9M10gcCIabyoO2GaNpAI
X-Received: by 2002:a05:6122:829f:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-563b5cafd1emr4566388e0c.17.1768850612865;
        Mon, 19 Jan 2026 11:23:32 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e58cesm3016562e0c.11.2026.01.19.11.23.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:23:32 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94120e0acbeso2794625241.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbVKpiuIJC3gRt1o4jHD5PKW4i7c4fa7DpB8IthYWmpWDcgQas7/owkBCfE193UunBEdNWnX4/MXntLCA=@lists.ozlabs.org
X-Received: by 2002:a05:6102:44d2:10b0:5f1:c453:b5ab with SMTP id
 ada2fe7eead31-5f1c453b6acmr1782180137.13.1768850612507; Mon, 19 Jan 2026
 11:23:32 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:23:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
X-Gm-Features: AZwV_Qja2okCrIX9za1x2Adx7NBF3Qx2Xd3iJQm2I4PbFkiFeek_zkUKX3woR2E
Message-ID: <CAMuHMdXt69AywBVsY3DKH+cS52=Cw1xsvvBDBV3MXirZ+LYj+A@mail.gmail.com>
Subject: Re: [PATCH 3/8] base: soc: export soc_device_get_machine()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Some SoC drivers reimplement the functionality of
> soc_device_get_machine(). Make this function accessible through the
> sys_soc.h header. Rework it slightly to return a negative error number
> on failure to read the machine string (SoC core can keep on ignoring
> it). While at it: make it use the __free() helper from cleanup.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/base/soc.c
> +++ b/drivers/base/soc.c
> @@ -5,6 +5,7 @@
>   * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/glob.h>
>  #include <linux/idr.h>
> @@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
>         kfree(soc_dev);
>  }
>
> -static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
> +int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
>  {
> -       struct device_node *np;
> -
>         if (soc_dev_attr->machine)
> -               return;
> +               return -EBUSY;
> +
> +       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> +       if (!np)
> +               return -ENOENT;
>
> -       np = of_find_node_by_path("/");
> -       of_property_read_string(np, "model", &soc_dev_attr->machine);
> -       of_node_put(np);
> +       return of_property_read_string(np, "model", &soc_dev_attr->machine);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_machine_get_model() helper?

>  }
> +EXPORT_SYMBOL_GPL(soc_device_get_machine);
>
>  static struct soc_device_attribute *early_soc_dev_attr;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

