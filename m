Return-Path: <linuxppc-dev+bounces-4090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C09F05F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8hjL4sLLz3Wtr;
	Fri, 13 Dec 2024 19:05:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734077142;
	cv=none; b=VBfWd5YEnOcV5y/51YOQR0U3ZDSIR4dTC2TmKAige0+1/AGhGdUUJUyaa4gRMWn22WiJeIEnmG4qWLe41kD8xo0ykvBMr0KkY/8gmrAIPD2cOX/grfpaoC8B8Cupvj9KCumxg/K1WEVQb2FYG2w96nI0Qq1pwPpXlJx6O1Dbwt8ZkPrWtbFRxzAyGWUhm3hAJbM1y2oWk+d0zcnhiFDxFD9eBP/PHIyysFw8FwuQzAGaPZjm+VbHyKr31CNjFOeH/XDWivuPfNryakSIl5F4t4HAiiSZhvdL3gR2GOuRXjvfmUHaikn3A9HsQ+DvFhi7YsT/A4ZiXt//MI5dME397Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734077142; c=relaxed/relaxed;
	bh=FVOw+h27NlpLmIELNvAEpmKH/+bAsnaydDaBUOfayo4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=PdG9uPyIpqZNcXoO9Af9BIiqqwciMDLoaSyAOjl629uZNPacmQbFFAZkNWr9YwjXVdKvIx8dFdKKWBLpRFjBQZTfHi5cLdxnbDgJ8hYwngUtkVyV2eoTszqb06mnJEMuNYzv1SNTl8H9M4tB7dRqFLlpa07xJN1K639XL5psBgz+WHpdeAPiXN/NSESZQhb8BFArTXKslAStLADeGD70FrZHud+mO0HIKMz3KH/LitfaMd4aPjHd5gsZUV9Yb/YZ9CCZqFnXGn92rzHprfmxWnDfTe29hPcPSUZ8JUKvzQmup8jnFutCbtCeY3JHmqly+xxu/sDwfdQlJeWWrrOYnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8hjK0JnWz30hf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:05:41 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59CE41F394;
	Fri, 13 Dec 2024 08:05:38 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1192E137CF;
	Fri, 13 Dec 2024 08:05:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NRQEA9LqW2caGQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 08:05:38 +0000
Content-Type: multipart/mixed; boundary="------------nWuwnrygt0CNMuDcyFiuvcB0"
Message-ID: <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
Date: Fri, 13 Dec 2024 09:05:37 +0100
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>, javierm@redhat.com,
 arnd@arndb.de, deller@gmx.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 59CE41F394
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------nWuwnrygt0CNMuDcyFiuvcB0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi


Am 13.12.24 um 08:44 schrieb Christophe Leroy:
>
>
> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>> only controls backlight support within fbdev core code and data
>> structures.
>>
>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>> select it explicitly. Fixes warnings about recursive dependencies,
>> such as
>>
>> error: recursive dependency detected!
>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>     symbol FB_DEVICE depends on FB_CORE
>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>
>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>> it is the correct approach in any case. For most drivers, backlight
>> support is also configurable separately.
>>
>> v2:
>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>> - Fix fbdev driver-dependency corner case (Arnd)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/auxdisplay/Kconfig       |  2 +-
>>   drivers/macintosh/Kconfig        |  1 +
>>   drivers/staging/fbtft/Kconfig    |  1 +
>>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>>   drivers/video/fbdev/core/Kconfig |  3 +--
>>   5 files changed, 17 insertions(+), 8 deletions(-)
>
> Build fails which pmac32_defconfig :
>
>   LD      .tmp_vmlinux1
> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in function 
> `pmu_backlight_init':
> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
> `backlight_device_register'
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] Error 2

The attached patch selects backlight support in the defconfigs that also 
have PMAC_BACKLIGHT=y. Can you please apply it on top of the patchset 
and report on the results?

Best regards
Thomas

>
>
>>
>> diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
>> index 21545ffba065..8934e6ad5772 100644
>> --- a/drivers/auxdisplay/Kconfig
>> +++ b/drivers/auxdisplay/Kconfig
>> @@ -489,7 +489,7 @@ config IMG_ASCII_LCD
>>     config HT16K33
>>       tristate "Holtek Ht16K33 LED controller with keyscan"
>> -    depends on FB && I2C && INPUT
>> +    depends on FB && I2C && INPUT && BACKLIGHT_CLASS_DEVICE
>>       select FB_SYSMEM_HELPERS
>>       select INPUT_MATRIXKMAP
>>       select FB_BACKLIGHT
>> diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
>> index fb38f684444f..bf3824032d61 100644
>> --- a/drivers/macintosh/Kconfig
>> +++ b/drivers/macintosh/Kconfig
>> @@ -120,6 +120,7 @@ config PMAC_MEDIABAY
>>   config PMAC_BACKLIGHT
>>       bool "Backlight control for LCD screens"
>>       depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       select FB_BACKLIGHT
>>       help
>>         Say Y here to enable Macintosh specific extensions of the 
>> generic
>> diff --git a/drivers/staging/fbtft/Kconfig 
>> b/drivers/staging/fbtft/Kconfig
>> index 77ab44362f16..dcf6a70455cc 100644
>> --- a/drivers/staging/fbtft/Kconfig
>> +++ b/drivers/staging/fbtft/Kconfig
>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>       tristate "Support for small TFT LCD display modules"
>>       depends on FB && SPI
>>       depends on FB_DEVICE
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       depends on GPIOLIB || COMPILE_TEST
>>       select FB_BACKLIGHT
>>       select FB_SYSMEM_HELPERS_DEFERRED
>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> index de035071fedb..55c6686f091e 100644
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -649,6 +649,7 @@ config FB_S1D13XXX
>>   config FB_ATMEL
>>       tristate "AT91 LCD Controller support"
>>       depends on FB && OF && HAVE_CLK && HAS_IOMEM
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       depends on HAVE_FB_ATMEL || COMPILE_TEST
>>       select FB_BACKLIGHT
>>       select FB_IOMEM_HELPERS
>> @@ -660,7 +661,6 @@ config FB_ATMEL
>>   config FB_NVIDIA
>>       tristate "nVidia Framebuffer Support"
>>       depends on FB && PCI
>> -    select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>>       select FB_CFB_FILLRECT
>>       select FB_CFB_COPYAREA
>>       select FB_CFB_IMAGEBLIT
>> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>>   config FB_NVIDIA_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_NVIDIA
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
>> +    select FB_BACKLIGHT
>>       default y
>>       help
>>         Say Y here if you want to control the backlight of your display.
>> @@ -707,7 +709,6 @@ config FB_NVIDIA_BACKLIGHT
>>   config FB_RIVA
>>       tristate "nVidia Riva support"
>>       depends on FB && PCI
>> -    select FB_BACKLIGHT if FB_RIVA_BACKLIGHT
>>       select FB_CFB_FILLRECT
>>       select FB_CFB_COPYAREA
>>       select FB_CFB_IMAGEBLIT
>> @@ -747,6 +748,8 @@ config FB_RIVA_DEBUG
>>   config FB_RIVA_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_RIVA
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_RIVA
>> +    select FB_BACKLIGHT
>>       default y
>>       help
>>         Say Y here if you want to control the backlight of your display.
>> @@ -934,7 +937,6 @@ config FB_MATROX_MAVEN
>>   config FB_RADEON
>>       tristate "ATI Radeon display support"
>>       depends on FB && PCI
>> -    select FB_BACKLIGHT if FB_RADEON_BACKLIGHT
>>       select FB_CFB_FILLRECT
>>       select FB_CFB_COPYAREA
>>       select FB_CFB_IMAGEBLIT
>> @@ -960,6 +962,8 @@ config FB_RADEON_I2C
>>   config FB_RADEON_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_RADEON
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_RADEON
>> +    select FB_BACKLIGHT
>>       default y
>>       help
>>         Say Y here if you want to control the backlight of your display.
>> @@ -975,7 +979,6 @@ config FB_RADEON_DEBUG
>>   config FB_ATY128
>>       tristate "ATI Rage128 display support"
>>       depends on FB && PCI
>> -    select FB_BACKLIGHT if FB_ATY128_BACKLIGHT
>>       select FB_IOMEM_HELPERS
>>       select FB_MACMODES if PPC_PMAC
>>       help
>> @@ -989,6 +992,8 @@ config FB_ATY128
>>   config FB_ATY128_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_ATY128
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_ATY128
>> +    select FB_BACKLIGHT
>>       default y
>>       help
>>         Say Y here if you want to control the backlight of your display.
>> @@ -999,7 +1004,6 @@ config FB_ATY
>>       select FB_CFB_FILLRECT
>>       select FB_CFB_COPYAREA
>>       select FB_CFB_IMAGEBLIT
>> -    select FB_BACKLIGHT if FB_ATY_BACKLIGHT
>>       select FB_IOMEM_FOPS
>>       select FB_MACMODES if PPC
>>       select FB_ATY_CT if SPARC64 && PCI
>> @@ -1040,6 +1044,8 @@ config FB_ATY_GX
>>   config FB_ATY_BACKLIGHT
>>       bool "Support for backlight control"
>>       depends on FB_ATY
>> +    depends on BACKLIGHT_CLASS_DEVICE=y || 
>> BACKLIGHT_CLASS_DEVICE=FB_ATY
>> +    select FB_BACKLIGHT
>>       default y
>>       help
>>         Say Y here if you want to control the backlight of your display.
>> @@ -1528,6 +1534,7 @@ config FB_SH_MOBILE_LCDC
>>       depends on FB && HAVE_CLK && HAS_IOMEM
>>       depends on SUPERH || COMPILE_TEST
>>       depends on FB_DEVICE
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       select FB_BACKLIGHT
>>       select FB_DEFERRED_IO
>>       select FB_DMAMEM_HELPERS
>> @@ -1793,6 +1800,7 @@ config FB_SSD1307
>>       tristate "Solomon SSD1307 framebuffer support"
>>       depends on FB && I2C
>>       depends on GPIOLIB || COMPILE_TEST
>> +    depends on BACKLIGHT_CLASS_DEVICE
>>       select FB_BACKLIGHT
>>       select FB_SYSMEM_HELPERS_DEFERRED
>>       help
>> diff --git a/drivers/video/fbdev/core/Kconfig 
>> b/drivers/video/fbdev/core/Kconfig
>> index 0ab8848ba2f1..d554d8c543d4 100644
>> --- a/drivers/video/fbdev/core/Kconfig
>> +++ b/drivers/video/fbdev/core/Kconfig
>> @@ -183,9 +183,8 @@ config FB_SYSMEM_HELPERS_DEFERRED
>>       select FB_SYSMEM_HELPERS
>>     config FB_BACKLIGHT
>> -    tristate
>> +    bool
>>       depends on FB
>> -    select BACKLIGHT_CLASS_DEVICE
>>     config FB_MODE_HELPERS
>>       bool "Enable Video Mode Handling Helpers"
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

--------------nWuwnrygt0CNMuDcyFiuvcB0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-add-BACKLIGHT_CLASS_DEVICE-on-PPC-defconfigs.patch"
Content-Disposition: attachment;
 filename="0001-add-BACKLIGHT_CLASS_DEVICE-on-PPC-defconfigs.patch"
Content-Transfer-Encoding: base64

RnJvbSBiMDI4MzM5NmFlZWQxOWNlZjhlMTM0MGMwNTEwMzkyOWNiNDFmYWY2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KRGF0ZTogRnJpLCAxMyBEZWMgMjAyNCAwOTowMjo0MSArMDEwMApTdWJqZWN0
OiBbUEFUQ0hdIGFkZCBCQUNLTElHSFRfQ0xBU1NfREVWSUNFIG9uIFBQQyBkZWZjb25maWdz
CgotLS0KIGFyY2gvcG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcgfCAxICsKIGFy
Y2gvcG93ZXJwYy9jb25maWdzL3BwYzZ4eF9kZWZjb25maWcgfCAxICsKIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2NvbmZp
Z3MvcG1hYzMyX2RlZmNvbmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZj
b25maWcKaW5kZXggNTdkZWQ4MmMyODQwLi5lOGIzZjY3YmYzZjUgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcG93ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcKKysrIGIvYXJjaC9wb3dlcnBj
L2NvbmZpZ3MvcG1hYzMyX2RlZmNvbmZpZwpAQCAtMjA4LDYgKzIwOCw3IEBAIENPTkZJR19G
Ql9BVFk9eQogQ09ORklHX0ZCX0FUWV9DVD15CiBDT05GSUdfRkJfQVRZX0dYPXkKIENPTkZJ
R19GQl8zREZYPXkKK0NPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNFPXkKICMgQ09ORklH
X1ZHQV9DT05TT0xFIGlzIG5vdCBzZXQKIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFPXkK
IENPTkZJR19MT0dPPXkKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9jb25maWdzL3BwYzZ4
eF9kZWZjb25maWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9wcGM2eHhfZGVmY29uZmlnCmlu
ZGV4IDRkNzdlMTc1NDFlOS4uY2EwYzkwZTk1ODM3IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2Vy
cGMvY29uZmlncy9wcGM2eHhfZGVmY29uZmlnCisrKyBiL2FyY2gvcG93ZXJwYy9jb25maWdz
L3BwYzZ4eF9kZWZjb25maWcKQEAgLTcxNiw2ICs3MTYsNyBAQCBDT05GSUdfRkJfVFJJREVO
VD1tCiBDT05GSUdfRkJfU001MDE9bQogQ09ORklHX0ZCX0lCTV9HWFQ0NTAwPXkKIENPTkZJ
R19MQ0RfUExBVEZPUk09bQorQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9eQogQ09O
RklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQogQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVf
Uk9UQVRJT049eQogQ09ORklHX0xPR089eQotLSAKMi40Ny4xCgo=

--------------nWuwnrygt0CNMuDcyFiuvcB0--

