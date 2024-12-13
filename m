Return-Path: <linuxppc-dev+bounces-4094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D689F066F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:36:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8jNH1Fz9z3bM7;
	Fri, 13 Dec 2024 19:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734078959;
	cv=none; b=Wv1LE3v77UkhetfUbdxmxFOooMYbAFsqJm0+vuQpt6wZmPgurE6zIU9LrY7RojbxmSB4rhniMSFj8a1se+AyIJ89l6P+bo54m9o19vIvq2Ph+aFOi7xNvpVLacQkbmMxDFNW9iBYlizUG66elRjdDlgbR0cXVnVFNnnwAWf6GHGK0Nutf/Po3UhZqv/b3aWYWeYnIW/9pLYblnx06oSRxABo8y5vg5GGNfCpiPJB4zvy9TKpVJtmoK0nnU8AxrmWyWGHGltUztAVjD6S5HH54HUtVh1FiBgtDrB+Oka/gF9h+KyppraQoP6HBAk8p3aaUw9LKd6IGfSSz1du+Drdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734078959; c=relaxed/relaxed;
	bh=Idr5Li285A9xYhmvvfUS9nxuxqyz9INnz9YXESH4A08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNJhHoeWak/uRfCGjSqm7WqUShMotaorwld5ic2uQNKln6DCywh7++BCiYBQWkl0J3uW7Lt4XVUDBpdp4qOS85i0dtTQCL8ng4ZEIrECvEuONfdn7lfDzxV8OjibN4CZ6M/yMZHynTLPv9SJ428dQE1i2DDb5bj3BTz+qd1tiFMNmH7ShgsC2EhnOLF/x5R2AYXcHzbk3pmUJCbAu3ItideRZlkxYxZ39LVI/hocHKNatmYQ2y7xlJiKR9M9pV7a76Z2vHx0FxYWVx06XOGsf+2p1NGwJ2HMDI2KV5wys2u3vCn2wDmu1SyOBu+dkP2C03mdgQWtatGLKGSwPt+aug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8jNG0vF0z30jZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:35:58 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9C731F394;
	Fri, 13 Dec 2024 08:35:51 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8289C13927;
	Fri, 13 Dec 2024 08:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9P0cHufxW2c3IgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 13 Dec 2024 08:35:51 +0000
Message-ID: <553d1a14-f0dd-4c37-a617-d2fddf36cd0a@suse.de>
Date: Fri, 13 Dec 2024 09:35:51 +0100
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
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
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
In-Reply-To: <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C9C731F394
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi


Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>
>
> Le 13/12/2024 à 09:05, Thomas Zimmermann a écrit :
>> Hi
>>
>>
>> Am 13.12.24 um 08:44 schrieb Christophe Leroy:
>>>
>>>
>>> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>>> only controls backlight support within fbdev core code and data
>>>> structures.
>>>>
>>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>>> select it explicitly. Fixes warnings about recursive dependencies,
>>>> such as
>>>>
>>>> error: recursive dependency detected!
>>>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>>>     symbol FB_DEVICE depends on FB_CORE
>>>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>>>
>>>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>>>> it is the correct approach in any case. For most drivers, backlight
>>>> support is also configurable separately.
>>>>
>>>> v2:
>>>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>>>> - Fix fbdev driver-dependency corner case (Arnd)
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> ---
>>>>   drivers/auxdisplay/Kconfig       |  2 +-
>>>>   drivers/macintosh/Kconfig        |  1 +
>>>>   drivers/staging/fbtft/Kconfig    |  1 +
>>>>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>>>>   drivers/video/fbdev/core/Kconfig |  3 +--
>>>>   5 files changed, 17 insertions(+), 8 deletions(-)
>>>
>>> Build fails which pmac32_defconfig :
>>>
>>>   LD      .tmp_vmlinux1
>>> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in 
>>> function `pmu_backlight_init':
>>> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
>>> `backlight_device_register'
>>> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
>>> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] 
>>> Error 2
>>
>> The attached patch selects backlight support in the defconfigs that 
>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>> patchset and report on the results?
>>
>
> That works for the defconfig but it is still possible to change 
> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>
> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
> deselect it.

If you disable CONFIG_BACKLIGHT_CLASS_DEVICE, shouldn't that 
auto-disable PMAC_BACKLIGHT as well?

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


