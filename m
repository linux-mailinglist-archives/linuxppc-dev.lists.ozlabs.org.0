Return-Path: <linuxppc-dev+bounces-4403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167229FA450
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 07:25:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGB3g5T7Lz2xKL;
	Sun, 22 Dec 2024 17:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734848735;
	cv=none; b=Wb6B/ZoSn1dGnr78tkBOYPE6yprXG05SQcPCTgl68v7pG5vFjcWToFP7mHo+X1ARFJ/2RK46bUDwzl8o18Z5s5qQOe8v1bhkc/wMB/KubqnTxOBEWj3sjuQgNdY3AH65HmEmVM5iLyyk2WDVuaOQJBrYlJIPBVI2IY+eyLltx3KVdhha3+nZxzlvRkOg9Y4T1nS/ZW3pO4bQhbLA0FuBN3y0UIS0uLr7ls5rVaHI1dkv7vpuXTfxeI6MMAEFSJa8qI1SHD28Yi1oi49Dgp8MlYkLe6n/RekQ26iT2tWUiHGRB/IyH31i917Oi0U8ZfcuKPxaLVy/PH6x4Rr9hQ1YJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734848735; c=relaxed/relaxed;
	bh=pXJ2oMmF2CMAKN2B4GZMENmYy9GZitiRqDMzxdJK4qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Msig4SQ3QV0WRILB5dc5avJc0iOHGKg7ThRVU7QF7zBqKT1Ruze805e83a9CyK/wiAZ2IyeKEj4l0iWy0z5ClqlH77HyIOzkkaFe89nB8YjDKmYSbNOAzcwg8tvG06gtSMZxmUpJnH0TZigrI2mba74fq5EflCRLDw/4I9BcWdjyBgIjxMW+Bu9UwrMZZCd5HTRnlXETU7uqziSAVe25C/pUWI9eVfYBEVyaq9V9P1DcBOr3GBM0ZX1SyQENnicukJsN3ZduJS6GzKa9LHwyjg3eUR8jS9M69L5TKLplkmlsDOF/312qia91pY/lo75WJO47BBKI3/ms6eB+SJfQ+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=YwvuZuZ8; dkim-atps=neutral; spf=pass (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=YwvuZuZ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGB3b6t9jz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 17:25:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734848710; x=1735453510; i=deller@gmx.de;
	bh=pXJ2oMmF2CMAKN2B4GZMENmYy9GZitiRqDMzxdJK4qs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YwvuZuZ8YAUrSkm0mNc2JH/TTJcOKazZ9SH+vDPDLVJ1uvW2+BIkgxDJJZy8KOvo
	 ygbHcP0lOL3ovHCCTWSlSbLnDIF3+DxOElx0n6SmjcnJls3XR0URxP03Hwem4bmgo
	 uIm5GWlP4b96t1tcLd9rvw24FNfMaPRGGymiNLdHcf6QzxQfb/DT/5lubAnRg+ATt
	 iPHpqo0jBgXEiDyyvQYQAeEt8JTHRBbRcY42TNUDmidXaD4fne+L14AVKy0bHcO2S
	 xay252kvVsOVpvwcpn+R0jpRm2GXtPsUyYt6UkfjEpjL9cGO2vnyWVkXJDg9cZmND
	 SUmLek8TRU33s4hnBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1u44nl0A5z-00kV0N; Sun, 22
 Dec 2024 07:25:10 +0100
Message-ID: <3dc51082-57d5-4bbd-b6eb-febf1d13d6fd@gmx.de>
Date: Sun, 22 Dec 2024 07:25:08 +0100
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
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241212100636.45875-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:49gBNI1l6uSlxv0xDOXqslC0lAFzppCqw/9kkQlCRzeiOIs5dvN
 tV+MO0VNnBeVocS6r0t4GV+cGuO7P9WPJ91GCJiBhn6cwT19+/BOQ2dhNZ3SudRKxRYqUpT
 AgKQuW3tlPzz7ACXF3Pclb0qZ3JspR2a1xyS+lFlspI9AvA5/FDVmqKYJoB1M19NprfAkGj
 wbJYNj0rz8s01mS4BUU2A==
UI-OutboundReport: notjunk:1;M01:P0:QVMY1zI2Yl8=;u7vFYIE7903EeQL3HWcK8vy0Xt7
 ZXPoKqHWEhYfJvdmVnXQx88L8q4T3QYwfWIt2iQRy+L3NpBHue9pvDHgPtDkt1sGAiqRjMU55
 Z0orTyhkNtfqy/Nf8gBa+zSI4i4UGVPw/WrygOI5PiH7ZOpSD+CYb24HN+zVVjITSWN7h2NmK
 8lKkC8FZ66Rg2DncOJVWx9bT+TBSYZTFMMJZnb66d9JKjjmrByUk8pixflsODV5ylWtaKjJaP
 jL5ip6TaSpNByIi4x6HXRxbgEkc6cR+1+VX9vFP8cKcT/g/CqWJ0Xx2RifF8aMJsvlr0QPhP3
 VoyjtwXT5MKLpxqKjw4SLoj45EsAAkuFklNBT06ktIpix030aiTz04zBHhsY3LU3MGr8S2uZq
 exjCpHuYdAezZ+Pw0BIeidfWvhJ9Gdh7fbw5kr2dgpYqU1/kx2B9OV3dwg6UjmSStFakuFECT
 WA4N3Vx3OGp20a7o/xggStdIbT3BEAcdhpEd0RwRaw8oeAUSUxFd7YHMvhTliznaRzWk/mVLZ
 oLuJIfGyJq3bIGEalfZ15D7sv+m40J14Nig30n5afbheJzoKVMQaHf0gGhIZUxIFiFUQ+rOh9
 j36WqEc7CnybYmewCbr0p9xaI5sK7fH+u5Ai1y5W4qxX994H+sxxw0zQGOPwCqh54/V6pJPUm
 YDgZQzNVvUIEDqiONs9QrRTsyj4GTDaT41LFWIHDH9PBRD8RPIKxEC7y86AQTx9PB+JMcabZf
 R6kFvbvuW6IuA4mawP/YL93q8SvEh8AfVNhmlXnqU83NcqixmyLNT5uhBzQYYRUvM/TS6DXoP
 tUmHN4gvPz3o2YEGg7wLBkAr8cpHLMVzCUUEPqlaCBC81xp45Iaa4N19WwgGDNXjPT42kw0Wa
 UjTZ+R5sntoZFwI96kTSu1EztHto8l6eok39jzzzpN6Xn9RLjFjaleaNJZAJcvVM96O5B6kjs
 Bh309W06LTPNnhRK/0zMVwYAfhYCvjKdcm3pB+QdW9PNDBCbRoFcNL8V4HnTSa/MdvD+4yBir
 IM7+R7Oa5g8Hvrrj20jGs61qkA6kn3eZA57DCMfV60BjaPjNIodddi6pyPGYQeZsuYHs3Npce
 V965EGODkF8lEcVqX6eW3E7eptjcLJ
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/12/24 11:04, Thomas Zimmermann wrote:
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
>   	depends on PPC_PMAC && ADB_PMU && FB =3D y && (BROKEN || !PPC64)
> +	depends on BACKLIGHT_CLASS_DEVICE
>   	select FB_BACKLIGHT
>   	help
>   	  Say Y here to enable Macintosh specific extensions of the generic
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconf=
ig
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
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_N=
VIDIA

BACKLIGHT_CLASS_DEVICE is of type tristate.

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
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_R=
IVA

here too. BACKLIGHT_CLASS_DEVICE is of type tristate.

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
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_R=
ADEON

and here.

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
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_A=
TY128

and here.

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
> +	depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT_CLASS_DEVICE=3DFB_A=
TY

and here

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
> diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core=
/Kconfig
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


