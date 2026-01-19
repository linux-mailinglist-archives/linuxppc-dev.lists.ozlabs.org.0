Return-Path: <linuxppc-dev+bounces-16010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FABD3B719
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 20:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw0bK4HGhz2xS5;
	Tue, 20 Jan 2026 06:17:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768850269;
	cv=none; b=VIXVCbIj0fPCCcOluePQO563tedBI6w6FchOHHrDoz1p57fvzm6VGtAVq4d929pqmQaLIfSF1nd2QpOl0/tDe4jzuB8RKFJ9XRI5cCi/OijqBXfWGcJrSguv26qzasLGBWUy80fyBHhZSufmfu/VWlj0gwyoqtjg06LfWE7QUfdCV/ZD6fMPrb8KREHm2zWqZSUprIdXHue81mceBsDgiJ+fbINmqdYdRPLSOqnrUBq4gmFSoHcYKmK8GLxPzf7bLdCFKVK0dtmgfKpfFycsTw+wjZTRHG66GArW0GwX25Sc5SVyPebRk9PcJloMTDP0OWrCvp0cC4yVYkHohun0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768850269; c=relaxed/relaxed;
	bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OX66KvleOe3eN9IcCHgx5FtrkwocI1fP7hMz4jMzng4Shr9m4n702iU3ZfINm9fhfGgGLl09TjlDEbhlpah1DwWI26YpjOx2FVLxoNq23FN4vVZIdtHwri2SEe1Y6UjmvbmDpbzmDnIh0/Wl9/mB3AsS2p33EjAF+FBnVZ4SG0617B0eHrAt4n7bNRI9pyeu++/66e84ZA9KmeHtej40wS7hKO1VZWOPa8KgBE4rXSE8cGhD+yeziBhGhrfnZPiVN+JHIQDAIgV5s0t2KBg9YLEciAVDFPkmJRX+ewAwriF7zp/T6aMjZXOkGXrQLkbfYozkcYpvqABm4tcvzOJ/Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.170; helo=mail-vk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.170; helo=mail-vk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw0bH5xLpz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 06:17:46 +1100 (AEDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56378a18ba4so1162911e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850263; x=1769455063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ksvhxDAHEK6GRShjDfoLa3UE0f58CuM5UI6afaKhU=;
        b=sVdpcAY1ckSFP8G5rThCPS6geDIDzIYuApAeiFZBGNoE/SoeViLNFx201EtC4766o7
         pry/d3iP0CaawCyHwYcxx9Rf2jgq27syKFckBSG5WjO7lzHxxJYBhq+AFiO2KE0WKuP3
         qvL8dh0AZgGG92K43bQ9tOxquHzkl2HLojxLYtgS1JRlMRPl3Bp+yXSoEnhWthARDKl7
         SbBiguDbyCFf2N0gWNFf3VIHTp5uDe6QsDXnVXOGovDdWxOdGwFTfaH9ZuxIMOzcbDRe
         LzqYbnSq+OBCs5NZP93IY99AsI1cJjHC4EPruc/0RVh8o9jz+rE4DTm14aK1WLKC+mfq
         SZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp9SWqNRbfFN8GpBR14n2W0WVgamszogDsungYkB8eN0+FrxuJbeu0CpCK0kw5nNgZsUEt93Ze150X/Co=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcOaqXZny/wLJpsj3j8wxC5ORMbWyTUCoCoLoVo+POvgdNSZsy
	9DJP7RGFqBGwFm9NCTdgNecyv53mzek0GKsK3wJ5SHXW+/aq4YNqLB9jyFj59IGm
X-Gm-Gg: AY/fxX51v5x9NRdIltmRdusyt3nbw+Tp4CoXCiyrVs7Wfuf3mAwedb0kYcmeMASY8Wk
	KZd7QALUFQ3dQiSAULLDv/fewHMhAGApcbFp6ujPaQ0qrEucn4YHzKsvRcxpPMAi3yVxEUi11HM
	YT7LnkkU0DMhYNENbj6oblJ6VdTreYlrkmGncpZp+2uv0tuVRTabUaXUQxmApAfrB8OUNhFhlh/
	x+bVdFBKiB5/f2aSQn6ZPxvsnfRQw+Omqk2/iGA5QUxgupLp3RRFa34LTXVLvl/EHIz//9Fcep9
	Yy9ZJnHnuM91uKFxmd220Ig9O6mqQ3Zo53qHxpZ30/lQ6oV7cx0T09Jikkax8hn+evm9fVyWoKP
	DvVP58mSryABADU80RkGVxF6mqkM8eP7hUPM8drvwHDZERIjXwoYbeu8Stf3hHLW7kg6sxzSLS9
	aglX59PiCXeRSQad319VRAs2g4VzqMnUDtSKYce+jw8ElCbv8O5yEAIbbcdvE=
X-Received: by 2002:a05:6122:a03:b0:53c:6d68:1cce with SMTP id 71dfb90a1353d-563b738ca87mr2621930e0c.16.1768850263075;
        Mon, 19 Jan 2026 11:17:43 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b70e7eaasm2963681e0c.12.2026.01.19.11.17.41
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:17:42 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso1282675241.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 11:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhCmcBETXw2CSexwZI7iantNUfJhqZbjTTPkiTC43PMWQptO3EMYS+SLHmtBuP56Rh65LmHmGsRzQVBpQ=@lists.ozlabs.org
X-Received: by 2002:a05:6102:dcb:b0:5dd:84f1:b51a with SMTP id
 ada2fe7eead31-5f1a720e344mr3315725137.43.1768850261678; Mon, 19 Jan 2026
 11:17:41 -0800 (PST)
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:17:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
X-Gm-Features: AZwV_QiDYUVl5G1JTvUBamxzE_5VCyogXoHB30dVWIYjGOrIgN6mvoOLoE2_KFA
Message-ID: <CAMuHMdVG-2qucH5dB40CO=8Haw080NqxE-zg=GyVmD2njs-ibg@mail.gmail.com>
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine

... the first compatible string...

Do you see a need for adding an index parameter?

> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +       return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>  /**
>   * of_machine_device_match - Test root of device tree against a of_device_id array
>   * @matches:   NULL terminated array of of_device_id match structures to search in

> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>         return of_machine_compatible_match(compats);
>  }
>
> +int of_machine_get_compatible(const char **compatible);
> +
>  extern int of_add_property(struct device_node *np, struct property *prop);
>  extern int of_remove_property(struct device_node *np, struct property *prop);
>  extern int of_update_property(struct device_node *np, struct property *newprop);
>

Do you need a dummy for the !CONFIG_OF case?
This is only used by drivers/soc/fsl/guts.c, and FSL_GUTS is selected
by MMC_SDHCI_OF_ESDHC, which is OF-only, but can be enabled
when PPC || COMPILE_TEST.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

