Return-Path: <linuxppc-dev+bounces-14604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77BCA4954
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 17:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMgQq5Lh0z2xHG;
	Fri, 05 Dec 2025 03:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764866348;
	cv=none; b=KvdXrh4elAmyDEwZ57zntfGG7gJj9j0j9EL1QH7QdrQ1PtHZGXv5glZ77o4RgR0Sn7wGwDK2psWJwC/LnGyOr61TDBQxO4mqyg3AmyRm6oQG5d9BEX4c8/jKadaR5ktReHIFqbE8XFwp/htE6wtb8Yfr4y0sm4gnMTpq7w2nXo0hv/mhZuy5/dtEqxNu5InGE+f7J1zlrhh20br+hk0/yk63l2FGdvxTcqKzRsYWG6ryinYM6yBZ7mLk39yktGQZPr+pEE6MF+lBYXE4RgeonIkTsSKcxm0ZLa0no9cGBICQGcIV/Savb3VR4g9toEJDrxcWDOYIw8Yp0CN2YBsP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764866348; c=relaxed/relaxed;
	bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=io/49JK8B53B62i14fsYAJGsr6plL4vu+tp8apy0DR98KE+VnxrTJQPN74vpgQELC7jQ6iCUDvusQmKU0AwZ/Q6vYg9lB1S5W7s43oClcqB5AM3CrSa3wtWBPW8eQO8HTVf3bsIZuSXWsNun1tEmq/XVneWNKDr3p/XSrVQLZ2lNw8ExbGStWRFt9KkZ+9VARDsQSHsfUItNEWUYoh4dOZwXtHJoshXMPwF8x3qf5XLKAA7u+x1fNXzAK9eHI6E/hbN0QcBYCjhWGASliwYnMlZhE1paK91Gx3FOyar9GNaZ6Szvps+TulZ57H/O4WYXr5iw4xOqAu8Wow5bYRH/Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DKkXhJp4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=jmkrzyszt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DKkXhJp4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=jmkrzyszt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMgFQ3Jdtz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 03:39:06 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso12573805e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764866342; x=1765471142; darn=lists.ozlabs.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=DKkXhJp4ksgb7BYGA6QUHdsxwSJCp5gmZG1SdCQtz9s/NyiDP20KR0mZszwiKkidIU
         WJK7eYjk/da94R4UA1fwdJB1ph/gKAoeRTzRzagAA7Mzd4k1i93Rf+lV/mlxyBTqCRkP
         8rVcDw1/fXrnxWgwq9tEiKRuZhCX7IE88nyz+L0esM2rHbMJGtYfRc/Tn6XxtYEzOqiN
         jJ5JU+mn+v5C9QeffJoXwWcCvqujzoHYaEni6sruPUkTbazRpVGr0DZIVSI7Us6rTDTt
         DWR4tb4ClBM8Y04nSND7xS5x86YviNtAi90/YwrosP9Hq/EtW/oBAjCaojgJy8IA3fMd
         Sbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764866342; x=1765471142;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3Ml0jWCuH/33LJ6xOAJUPn9vl8+nWQjtPcrbdX2QrE=;
        b=uSCniHWBZITk2urbRkeOkdIVSJN0LoGDToh7N5po7shqXAOh2tnQeVzzoLWReCdfHX
         k/vpakVV6p7DZtqkmXV9Pn7l8wDznNMFlBNXzkTZ9+uuoN2rxkq23gJ4X4DGsljWVuiQ
         5vUVpU4nWQJVrb97ra6DWHBtrYFpdZUhBf/dI3MMnFiJmGlQ/FwK/v2T2pEUKn6ONYa6
         eK1Gsa4aT+Lcr+RqF/UeBkv0V5Mj0+pM/opYNhAOsoFp0/jFTS9aOuKevKJYQDOLvcGS
         228uXzJj5pR7HeAtuLLn7Wsw8ZH6/nVqTIZ9+VQwTuAhvl4qtxNNF0XKsbh6hDRlRW6u
         kBog==
X-Forwarded-Encrypted: i=1; AJvYcCVRvyAxFPQJEnEAqtvP8rPriVXAaMvi3ECMFpvAfzUPQK74WuUlOJkzTGvN9sZqOhrFYDL19WDK8T4vog8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYGl8mcf50EXzmcduF1GPO+mjjhWYfyvMtp7prwthoYjzaaWvD
	0ZAMcqeNJhD+G2vDXBuFlwgpCwTw3PsPo52/sXWDmjlxm6DQZgfn4bpj
X-Gm-Gg: ASbGncska6ES1FhC4sFN3DsSA4RqCb0syJn5UA+37mg8PsjRaQ2ze3ZAzAaKMhR6o8M
	QJe/vtbaUj6vIBdhANtVgdebN51Tdh0oCAC/7sXOo40KtP1i9ZmXdDtG1kjtDwFqlEePTzoqqO9
	JJwXw4Xf287gkIC/Ngps9vOUg7Umr5cocLAdCa1M99ZX+/XyC6u1TV8FThmjDVM2zRRTz2wzdn0
	hpYeR9ZWqeln4hTTOALVwjo9ix4gRj0cW6CGO2gE0m5ko5La7h4pVaW/roF0aS6L/NqeTjW6w4k
	6vOaK8v7kUka9nQfnQtulVDPRniPcII5fKEkHz9FfLhlvMJdOnoweRXDAZU1EUdIqZDnoWnSKxc
	31NE0oCq1uELTVJzZpodFxRJnsv8/fQpUyXR4cqLJkIJd+3Iwq2vdBm1rgCSykjO2mDgqy26M2f
	9/VdmA5kDJrhvvm+j0H95lKq+dr1j8Rk8Y//m2g3lqnNfAxzEq2fJDEF2hQSjS//KzsAHTk0rbP
	TMDXQ==
X-Google-Smtp-Source: AGHT+IFsyy5YStgxmY5AXM0tdH84tJ569HxdiHRQT0I3Oz0EaQQxZDq00b76OtLTDgynIknFJ4swPA==
X-Received: by 2002:a05:600c:4710:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4792af3d16fmr63824975e9.23.1764866341710;
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
Received: from dell.localnet (2a01-114f-4013-18c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4013:18c0::540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092c039sm39198205e9.5.2025.12.04.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:39:01 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 david@ixit.cz
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org,
 David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
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
Content-Type: multipart/signed; boundary="nextPart2244374.irdbgypaU6";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
	HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--nextPart2244374.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] ALSA: Do not build obsolete API
Date: Thu, 04 Dec 2025 17:38:59 +0100
Message-ID: <1939135.tdWV9SEqCh@dell>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
MIME-Version: 1.0

On Wednesday, 3 December 2025 23:34:10 CET David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?
> 
> David
> ---
>  arch/arm/configs/am200epdkit_defconfig    | 1 -
>  arch/arm/configs/lpc32xx_defconfig        | 1 -
>  arch/arm/configs/omap1_defconfig          | 1 -

For omap1:

Reviewed-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>


>  arch/arm/configs/tegra_defconfig          | 1 -
>  arch/mips/configs/gcw0_defconfig          | 1 -
>  arch/mips/configs/loongson1_defconfig     | 1 -
>  arch/mips/configs/qi_lb60_defconfig       | 1 -
>  arch/mips/configs/rbtx49xx_defconfig      | 1 -
>  arch/mips/configs/rs90_defconfig          | 1 -
>  arch/powerpc/configs/85xx-hw.config       | 1 -
>  arch/powerpc/configs/86xx-hw.config       | 1 -
>  arch/powerpc/configs/mpc5200_defconfig    | 1 -
>  arch/powerpc/configs/ppc6xx_defconfig     | 1 -
>  arch/sh/configs/edosk7760_defconfig       | 1 -
>  arch/sh/configs/se7724_defconfig          | 1 -
>  arch/sh/configs/sh7785lcr_32bit_defconfig | 1 -
>  sound/core/Kconfig                        | 2 +-
>  17 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index 134a559aba3dd..2367b1685c1cf 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -68,7 +68,6 @@ CONFIG_SOUND=m
>  CONFIG_SND=m
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_PXA2XX_AC97=m
>  CONFIG_USB_GADGET=y
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 2bddb0924a8c0..b9e2e603cd95e 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -113,7 +113,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index dee820474f444..df88763fc7c3d 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -148,7 +148,6 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_DUMMY=y
>  CONFIG_SND_USB_AUDIO=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index ce70ff07c978a..68aedaf92667a 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -219,7 +219,6 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  CONFIG_SND_HDA_TEGRA=y
>  CONFIG_SND_HDA_INPUT_BEEP=y
> diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
> index fda9971bdd8d9..adb9fd62ddb0d 100644
> --- a/arch/mips/configs/gcw0_defconfig
> +++ b/arch/mips/configs/gcw0_defconfig
> @@ -79,7 +79,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
> index 02d29110f7024..1d9781ff96986 100644
> --- a/arch/mips/configs/loongson1_defconfig
> +++ b/arch/mips/configs/loongson1_defconfig
> @@ -119,7 +119,6 @@ CONFIG_WATCHDOG_SYSFS=y
>  CONFIG_LOONGSON1_WDT=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
>  # CONFIG_SND_USB is not set
> diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
> index 5f5b0254d75e7..a1bb0792f6eb1 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -81,7 +81,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_LINUX_CLUT224 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
> index 03a7bbe28a532..49c709d663beb 100644
> --- a/arch/mips/configs/rbtx49xx_defconfig
> +++ b/arch/mips/configs/rbtx49xx_defconfig
> @@ -53,7 +53,6 @@ CONFIG_TXX9_WDT=m
>  # CONFIG_VGA_ARB is not set
>  CONFIG_SOUND=m
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
> diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
> index a53dd66e9b864..8382d535e6dc1 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -105,7 +105,6 @@ CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
>  # CONFIG_SND_PCM_TIMER is not set
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_PROC_FS is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_MIPS is not set
> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
> index 8aff832173977..2b19c20a9a2c4 100644
> --- a/arch/powerpc/configs/85xx-hw.config
> +++ b/arch/powerpc/configs/85xx-hw.config
> @@ -117,7 +117,6 @@ CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_POWERPC_SOC=y
>  # CONFIG_SND_PPC is not set
>  CONFIG_SND_SOC=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_USB is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
> diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
> index e7bd265fae5a4..07f30ab881e59 100644
> --- a/arch/powerpc/configs/86xx-hw.config
> +++ b/arch/powerpc/configs/86xx-hw.config
> @@ -80,7 +80,6 @@ CONFIG_SERIO_LIBPS2=y
>  CONFIG_SND_INTEL8X0=y
>  CONFIG_SND_MIXER_OSS=y
>  CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND=y
>  CONFIG_SOUND=y
>  CONFIG_ULI526X=y
> diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
> index c0fe5e76604a0..617650cea56a9 100644
> --- a/arch/powerpc/configs/mpc5200_defconfig
> +++ b/arch/powerpc/configs/mpc5200_defconfig
> @@ -75,7 +75,6 @@ CONFIG_FB_SM501=m
>  CONFIG_LOGO=y
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_PCI is not set
>  # CONFIG_SND_PPC is not set
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index b082c1fae13c9..787d707f64a42 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -726,7 +726,6 @@ CONFIG_SND_OSSEMUL=y
>  CONFIG_SND_MIXER_OSS=m
>  CONFIG_SND_PCM_OSS=m
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
>  CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
> index abeae220606a3..905fac1072845 100644
> --- a/arch/sh/configs/edosk7760_defconfig
> +++ b/arch/sh/configs/edosk7760_defconfig
> @@ -79,7 +79,6 @@ CONFIG_FB_TILEBLITTING=y
>  CONFIG_FB_SH_MOBILE_LCDC=m
>  CONFIG_SOUND=y
>  CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_SOC=y
> diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
> index 9e3a54936f76f..8ca46d704c8ba 100644
> --- a/arch/sh/configs/se7724_defconfig
> +++ b/arch/sh/configs/se7724_defconfig
> @@ -83,7 +83,6 @@ CONFIG_LOGO=y
>  # CONFIG_LOGO_SUPERH_VGA16 is not set
>  CONFIG_SOUND=y
>  CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
>  # CONFIG_SND_SPI is not set
>  # CONFIG_SND_SUPERH is not set
> diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
> index eb63aa61b0465..5468cc53cddb4 100644
> --- a/arch/sh/configs/sh7785lcr_32bit_defconfig
> +++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
> @@ -93,7 +93,6 @@ CONFIG_SND_PCM_OSS=y
>  CONFIG_SND_SEQUENCER_OSS=y
>  CONFIG_SND_HRTIMER=y
>  CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_VERBOSE_PROCFS is not set
>  CONFIG_SND_VERBOSE_PRINTK=y
>  CONFIG_SND_DEBUG=y
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index 48db44fa56feb..4e7bc370ffd7f 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -155,7 +155,7 @@ config SND_MAX_CARDS
>  
>  config SND_SUPPORT_OLD_API
>  	bool "Support old ALSA API"
> -	default y
> +	default n
>  	help
>  	  Say Y here to support the obsolete ALSA PCM API (ver.0.9.0 rc3
>  	  or older).
> 
> ---
> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
> change-id: 20251203-old-alsa-fa2c2cb038e1
> 
> Best regards,
> 


--nextPart2244374.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmkxuSMACgkQ2WqSnlts
jBoEqQf/Sjc0qt+Drex1cQ2k/z80kq9/GzHrmnzgVxa+5a/fQpOUSV9mjQ8dXZT1
MWYxTSIbMYegarGZ7hbByLrhKbbV04MghXJ5m+sAhdDrN6QAJp5BaVu5Ols6Z5xH
MOUch2VVP88w08L9IBrwqJNFyBNxM5O4hpgEWCoO0CccbgAmtg+M3yJfxLqpz//Y
pBXwt0bdY/fKicChMpUmrsSFda0rnItv56Mp17YoibFbVxRCKSnfOLDiE4qaIAae
L09ouH5JZ3U9AxOel2JETxGJiWxv5iDWTrsKFdKt6LCYQ/zOsCerakNM8PSxlsUo
hOPg0Wrf2HhofRo0M2unRvM7bCbPpA==
=HYXo
-----END PGP SIGNATURE-----

--nextPart2244374.irdbgypaU6--




