Return-Path: <linuxppc-dev+bounces-4096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC989F0697
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 09:41:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8jVl1fP2z3bP7;
	Fri, 13 Dec 2024 19:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734079295;
	cv=none; b=NUtM45fMItEZPSvwt4Fe1ju3ENlJBEpg7z8mBwf26xt5Sb6XPkUp08d3JQSrrgZVFIhexzSJ1ucfN/mayMsjUv5hCYMUmj6S3RSvqtxWqd+elwgZ/2HLW51dHjcKkRirQFrfB3HZvMgD8cg7l4oof5CNbXhq1yZCK1YZOwh3fTUj0qObWJRlu3Thg+BDx9bBmfGuF20GTThiBBtabEIhmpSwJ3OwpOkSpk0rXMSMw9/zqYxLro62Fo1dLDcp+9Ji2DgnFpIXAU35VdSPhRku2ToLR285mv1PGrTM05ju9+ewgNObYQia6yWNsoviuwS8HS4Wx0M70nfwCvmxyUtM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734079295; c=relaxed/relaxed;
	bh=Kvtf5oeVjmIMQG37wi8+kqW2Vhww/tnC5qOJLJxDeCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gn0rlON9woiTgaKQC28jch7W+jdAB8jVFMA3uV6h87rYM2atbZ7AAYlKTe+j/cz21ylSo+G7i1Jd4kLNrYn0ZoxaCvo5wv+EvrNYcMgxXLnaz4jtSPJhpk78BADz6m+DaB44Ggy0bNerDz++IHif6v1BB/K/fjxshM13OW16l/qylsAvXO+1S8v6TWjxw6Rn5CRdKi+ahR5SzxM5pc9H2egyKEIPLbHkPqs4I6L4DuF8VBA7a3qJSbArqccqlm0pRqbAXM/zjJ6u3Vqk0WMTzwIBqdyMBNNktlqQ0pKbppkm2vC6uNnd6Nb2ZAr16of6lYFOWKkCEe/69ZRicWc4dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8jVk2J4Zz30jZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 19:41:34 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8jVg4y7Qz9sts;
	Fri, 13 Dec 2024 09:41:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mAt5aBlV4a8; Fri, 13 Dec 2024 09:41:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8jVg425cz9stk;
	Fri, 13 Dec 2024 09:41:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7888F8B773;
	Fri, 13 Dec 2024 09:41:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UuxGPi-K0oVp; Fri, 13 Dec 2024 09:41:31 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E9FCD8B763;
	Fri, 13 Dec 2024 09:41:30 +0100 (CET)
Message-ID: <44cde2c9-e21e-495f-bcde-9ec4cf4aede7@csgroup.eu>
Date: Fri, 13 Dec 2024 09:41:30 +0100
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
 <8403f989-c1de-48c9-ab48-83c1abb9e6f2@csgroup.eu>
 <5484d576-d63e-4166-85ea-0b508b0cb865@suse.de>
 <1248a2b6-71b0-4909-917f-a5605415a816@csgroup.eu>
 <553d1a14-f0dd-4c37-a617-d2fddf36cd0a@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <553d1a14-f0dd-4c37-a617-d2fddf36cd0a@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/12/2024 à 09:35, Thomas Zimmermann a écrit :
> Hi
> 
> 
> Am 13.12.24 um 09:33 schrieb Christophe Leroy:
>>
>>
>> Le 13/12/2024 à 09:05, Thomas Zimmermann a écrit :
>>> Hi
>>>
>>>
>>> Am 13.12.24 um 08:44 schrieb Christophe Leroy:
>>>>
>>>>
>>>> Le 12/12/2024 à 11:04, Thomas Zimmermann a écrit :
>>>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>>>> only controls backlight support within fbdev core code and data
>>>>> structures.
>>>>>
>>>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>>>> select it explicitly. Fixes warnings about recursive dependencies,
>>>>> such as
>>>>>
>>>>> error: recursive dependency detected!
>>>>>     symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
>>>>>     symbol FB_BACKLIGHT is selected by FB_SH_MOBILE_LCDC
>>>>>     symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>>>>     symbol FB_DEVICE depends on FB_CORE
>>>>>     symbol FB_CORE is selected by DRM_GEM_DMA_HELPER
>>>>>     symbol DRM_GEM_DMA_HELPER is selected by DRM_PANEL_ILITEK_ILI9341
>>>>>     symbol DRM_PANEL_ILITEK_ILI9341 depends on BACKLIGHT_CLASS_DEVICE
>>>>>
>>>>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>>>>> it is the correct approach in any case. For most drivers, backlight
>>>>> support is also configurable separately.
>>>>>
>>>>> v2:
>>>>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>>>>> - Fix fbdev driver-dependency corner case (Arnd)
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>>   drivers/auxdisplay/Kconfig       |  2 +-
>>>>>   drivers/macintosh/Kconfig        |  1 +
>>>>>   drivers/staging/fbtft/Kconfig    |  1 +
>>>>>   drivers/video/fbdev/Kconfig      | 18 +++++++++++++-----
>>>>>   drivers/video/fbdev/core/Kconfig |  3 +--
>>>>>   5 files changed, 17 insertions(+), 8 deletions(-)
>>>>
>>>> Build fails which pmac32_defconfig :
>>>>
>>>>   LD      .tmp_vmlinux1
>>>> powerpc64-linux-ld: drivers/macintosh/via-pmu-backlight.o: in 
>>>> function `pmu_backlight_init':
>>>> via-pmu-backlight.c:(.init.text+0xc0): undefined reference to 
>>>> `backlight_device_register'
>>>> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
>>>> make[1]: *** [/home/chleroy/linux-powerpc/Makefile:1225: vmlinux] 
>>>> Error 2
>>>
>>> The attached patch selects backlight support in the defconfigs that 
>>> also have PMAC_BACKLIGHT=y. Can you please apply it on top of the 
>>> patchset and report on the results?
>>>
>>
>> That works for the defconfig but it is still possible to change 
>> CONFIG_BACKLIGHT_CLASS_DEVICE manually.
>>
>> If it is necessary for PMAC_BACKLIGHT then it shouldn't be possible to 
>> deselect it.
> 
> If you disable CONFIG_BACKLIGHT_CLASS_DEVICE, shouldn't that auto- 
> disable PMAC_BACKLIGHT as well?

For the time being it doesn't, hence the build failure.

You can do it that way if you want, you need to add a dependency for 
that. Other solution is that PMAC_BACKLIGHT selects 
CONFIG_BACKLIGHT_CLASS_DEVICE.

Christophe

