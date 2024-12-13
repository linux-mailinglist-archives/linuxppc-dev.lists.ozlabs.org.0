Return-Path: <linuxppc-dev+bounces-4087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7A19F05AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 08:44:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hDp5J5tz30hj;
	Fri, 13 Dec 2024 18:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734075866;
	cv=none; b=ORdl444CXj8MD95DARMvdgetmc+PZpkGeF2BuBhyi2hVEBRPdNd/6ktezIzzcnYUhKyf2siBIeEZKH9+RG96HQIlOIkX54rqpFoYhmWZ43Q/4aoltyxFHInJwWmlbW/FaDG/lpzLKZghp4ffCuo3BZip7fiEcZse3HS0oTV/lkVFY1xEUQcSjgm2BCLPoa2LBnOO/yqdVL2652BkZvHwn9aMBVV/TGzRF07nikDuE0ExCe/d3oHL4uPr2kLg1doSLXDUCfi/I4D7bOCyDojJKwrw+am2AS2v/mlbhnBD3PYs5n6cMdwRJ3mXMh4vwLWDJAUcwHw1a3E3txCaA9924A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734075866; c=relaxed/relaxed;
	bh=FHfYPIx50sSyA94R18kC3zCSycWO8BfBTUdyvsOeEFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcLdG5Pd+GfQrLxAcEDYxv9XXbn8vt2O5wRNng8+fdX6HcePMKHVpEmzY888x/wjVScf72amrmx3D2Up9n2x6Vy/Fct+WD1agaPKBFiiorgtkUJXVQPw52N47X4u3J92uKAzO+Za96JL2eHzpWmF9VwpTk7U7HkY9CQXJ0T1IXhQb5sfcws80J1bF0QL6UmxSNfgHXesW60GqefdgqEERjQnkmDEa2E3LYJWOe0hSu5fmt9dJ+SKoKhdwnTrNKOxKzb3c2+SHjQQEQYQrBQsKofMK0pP4HzST+apJvEFz2yBl2YZnk8sDxGptf/3XR7AQGr1fxRDLuRB2wg9+Ho25g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hDn69GZz30hL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 18:44:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8hDk74H4z9stv;
	Fri, 13 Dec 2024 08:44:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjS4Zc5qZafH; Fri, 13 Dec 2024 08:44:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8hDk5dmMz9sts;
	Fri, 13 Dec 2024 08:44:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AEA558B773;
	Fri, 13 Dec 2024 08:44:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aCRMBn4qewz9; Fri, 13 Dec 2024 08:44:22 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2720D8B763;
	Fri, 13 Dec 2024 08:44:22 +0100 (CET)
Message-ID: <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
Date: Fri, 13 Dec 2024 08:44:21 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241212100636.45875-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
> only controls backlight support within fbdev core code and data
> structures.
> 
> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
> select it explicitly. Fixes warnings about recursive dependencies,
> such as
> 
> error: recursive dependency detected!
> 	symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
> 	symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
> 	symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
> 	symbol FB_DEVICE depends on FB_CORE
> 	symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
> 	symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
> 	symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
> 
> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
> it is the correct approach in any case. For most drivers, backlight
> support is also configurable separately.
> 
> v2:
> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
> - Fix fbdev driver-dependency corner case (Arnd)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/auxdisplay/Kconfig       |  2 +-
>   drivers/macintosh/Kconfig        |  1 +
>   drivers/staging/fbtft/Kconfig    |  1 +
>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>   drivers/video/fbdev/core/Kconfig |  3 +--
>   5 files changed, 17 insertions(+), 8 deletions(-)

Build fails which pmac32_defconfig :

   LD      .tmp_vmlinux1
powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in function 
`pmu_backlight_init':
via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
`backlight_device_register'
make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] Error 2


> 
> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> index 21545ffba065..8934e6ad5772 100644
> --- a/drivers/auxdisplay/Kconfig
> +++ b/drivers/auxdisplay/Kconfig
> @@ -489,7 +489,7 @@ config IMG_ASCII_LCD
>   
>   config HT16K33
>   	tristate "Holtek Ht16K33 LED controller with keyscan"
> -	depends on FB && I2C && INPUT
> +	depends on FB && I2C && INPUT && BACKLIGHT_CLASS_DEVICE
>   	select FB_SYSMEM_HELPERS
>   	select INPUT_MATRIXKMAP
>   	select FB_BACKLIGHT
> diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> index fb38f684444f..bf3824032d61 100644
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -120,6 +120,7 @@ config PMAC_MEDIABAY
>   config PMAC_BACKLIGHT
>   	bool "Backlight control for LCD screens"
>   	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	select FB_BACKLIGHT
>   	help
>   	  Say Y here to enable Macintosh specific extensions of the generic
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
> index 77ab44362f16..dcf6a70455cc 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>   	tristate "Support for small TFT LCD display modules"
>   	depends on FB && SPI
>   	depends on FB_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on GPIOLIB || COMPILE_TEST
>   	select FB_BACKLIGHT
>   	select FB_SYSMEM_HELPERS_DEFERRED
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index de035071fedb..55c6686f091e 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -649,6 +649,7 @@ config FB_S1D13XXX
>   config FB_ATMEL
>   	tristate "AT91 LCD Controller support"
>   	depends on FB && OF && HAVE_CLK && HAS_IOMEM
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on HAVE_FB_ATMEL || COMPILE_TEST
>   	select FB_BACKLIGHT
>   	select FB_IOMEM_HELPERS
> @@ -660,7 +661,6 @@ config FB_ATMEL
>   config FB_NVIDIA
>   	tristate "nVidia Framebuffer Support"
>   	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>   config FB_NVIDIA_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_NVIDIA
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
> +	select FB_BACKLIGHT
>   	default y
>   	help
>   	  Say Y here if you want to control the backlight of your display.
> @@ -707,7 +709,6 @@ config FB_NVIDIA_BACKLIGHT
>   config FB_RIVA
>   	tristate "nVidia Riva support"
>   	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -747,6 +748,8 @@ config FB_RIVA_DEBUG
>   config FB_RIVA_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_RIVA
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RIVA
> +	select FB_BACKLIGHT
>   	default y
>   	help
>   	  Say Y here if you want to control the backlight of your display.
> @@ -934,7 +937,6 @@ config FB_MATROX_MAVEN
>   config FB_RADEON
>   	tristate "ATI Radeon display support"
>   	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_RADEON_BACKLIGHT
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> @@ -960,6 +962,8 @@ config FB_RADEON_I2C
>   config FB_RADEON_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_RADEON
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RADEON
> +	select FB_BACKLIGHT
>   	default y
>   	help
>   	  Say Y here if you want to control the backlight of your display.
> @@ -975,7 +979,6 @@ config FB_RADEON_DEBUG
>   config FB_ATY128
>   	tristate "ATI Rage128 display support"
>   	depends on FB && PCI
> -	select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
>   	select FB_IOMEM_HELPERS
>   	select FB_MACMODES if PPC_PMAC
>   	help
> @@ -989,6 +992,8 @@ config FB_ATY128
>   config FB_ATY128_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_ATY128
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY128
> +	select FB_BACKLIGHT
>   	default y
>   	help
>   	  Say Y here if you want to control the backlight of your display.
> @@ -999,7 +1004,6 @@ config FB_ATY
>   	select FB_CFB_FILLRECT
>   	select FB_CFB_COPYAREA
>   	select FB_CFB_IMAGEBLIT
> -	select FB_BACKLIGHT if FB_ATY_BACKLIGHT
>   	select FB_IOMEM_FOPS
>   	select FB_MACMODES if PPC
>   	select FB_ATY_CT if SPARC64 && PCI
> @@ -1040,6 +1044,8 @@ config FB_ATY_GX
>   config FB_ATY_BACKLIGHT
>   	bool "Support for backlight control"
>   	depends on FB_ATY
> +	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY
> +	select FB_BACKLIGHT
>   	default y
>   	help
>   	  Say Y here if you want to control the backlight of your display.
> @@ -1528,6 +1534,7 @@ config FB_SH_MOBILE_LCDC
>   	depends on FB && HAVE_CLK && HAS_IOMEM
>   	depends on SUPERH || COMPILE_TEST
>   	depends on FB_DEVICE
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	select FB_BACKLIGHT
>   	select FB_DEFERRED_IO
>   	select FB_DMAMEM_HELPERS
> @@ -1793,6 +1800,7 @@ config FB_SSD1307
>   	tristate "Solomon SSD1307 framebuffer support"
>   	depends on FB && I2C
>   	depends on GPIOLIB || COMPILE_TEST
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	select FB_BACKLIGHT
>   	select FB_SYSMEM_HELPERS_DEFERRED
>   	help
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
> index 0ab8848ba2f1..d554d8c543d4 100644
> --- a/drivers/video/fbdev/core/Kconfig
> +++ b/drivers/video/fbdev/core/Kconfig
> @@ -183,9 +183,8 @@ config FB_SYSMEM_HELPERS_DEFERRED
>   	select FB_SYSMEM_HELPERS
>   
>   config FB_BACKLIGHT
> -	tristate
> +	bool
>   	depends on FB
> -	select BACKLIGHT_CLASS_DEVICE
>   
>   config FB_MODE_HELPERS
>   	bool "Enable Video Mode Handling Helpers"


