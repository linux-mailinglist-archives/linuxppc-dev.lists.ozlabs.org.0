Return-Path: <linuxppc-dev+bounces-4419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F99FA812
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 21:16:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGXTz0nbnz2xnS;
	Mon, 23 Dec 2024 07:16:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734898567;
	cv=none; b=byifrkuaeUu7jg+T5SsibHh0oRVLpwyU8zzTHPYuYytbsYU4RLsbaAN98EYUvYGxzbdVST1q3BAfqtlczPRNwFglv/zbwi8vOXoVJ6v3rWTbg3FcCjXckKoqzVNCHGmqd8TpK48/8D88mgnkJ2hwVadG0yVuPbeeShUi5yzlCa3i4mKfU4Xi11ZBc6QNuUpOk3ka9j025jJBHnwXvi/0zjyOCuxgBMIFBkdTitHYARM6ftbuwaz/8y6jPCDrNqx7BuntW8yuQc1eB+JhSs003I8hEA9MXoRK6yXjtg0KoKSOoCzdW95GLLC/GgAF0aSZZ6aeTd4YThipwRsxHPvhcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734898567; c=relaxed/relaxed;
	bh=4+YJaj6bWDjRyIaCYzEoaWrYt00NPZxQ7SPu361/P18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZD7+GlN7WaWSO/zZpQ6PWPtBlEG6BtXby6xvIUQ4SyXiQ0SrVhsmLQIIOv3AZUOQgPulo3KUA3Rpty14Oq6cQbxRFnflCf3JG8HwnVvTIzAa/m3SflYS2bYOByXJjNLATZkCTjc2hSUmfUnnwE8GRcdJeZ/XMjkmzae7vIs3hQ2aFwJ+11d3bAPOMq/j2h3pJdxA5pD2vDJRTJxX8vBfbJ8Dm8UuTSAw7IZ9kW2r7CAl1PCLEyFLD/W6dWlLHNGxEgPUoS7NsyLxwSPZ/7SPKI33rNcwmpveZdCHvQfBJwuk18KGqMjd8yOG9GjYS7gbxl2Tj7uKLuYRHObVpuwXtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=GYnXpAjQ; dkim-atps=neutral; spf=pass (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=GYnXpAjQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGXTs4txNz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 07:15:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734898535; x=1735503335; i=deller@gmx.de;
	bh=4+YJaj6bWDjRyIaCYzEoaWrYt00NPZxQ7SPu361/P18=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GYnXpAjQ1Rh8M2H7pmGbH6Muj/ItFmVtrXX8GI/mh++mKTkpdh6ZBSxBKxbnL2EN
	 gya9TLDXYLB32fb7T0IX+bNI8PtV+hwf42J+nHjVnq8fcdhMUz9dE9fMJ+/tgNXSz
	 nWKLlYdv0UcNE/x9qbq/dk+TOWP21ERsEAdQI+Yt+pGIfiZTg50TxxJSFVpmibeSP
	 tQSMLIhgTyewV3cJuvOtMqeRxl3LNPEqW0gPpTbs6KKCtg7Rr70P+Kuupd/oCw+Go
	 Y0K2s4rImMhYI/3Wa9mAQk3Nd7ghxyPAb0H6DqETOZy1FowgGEH0apxd9jei4+55m
	 RZFdt79BAKj6prJaUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZktj-1t5GNM2ruZ-00X30D; Sun, 22
 Dec 2024 21:15:35 +0100
Message-ID: <83c2f489-4ef1-4b31-8fb3-50f027bebd4c@gmx.de>
Date: Sun, 22 Dec 2024 21:15:33 +0100
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
Subject: Re: [PATCH v3 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, jani.nikula@linux.intel.com, christophe.leroy@csgroup.eu,
 simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241216074450.8590-1-tzimmermann@suse.de>
 <20241216074450.8590-2-tzimmermann@suse.de>
 <6ed9693e-e8f5-4786-b440-4e27c6d31da3@gmx.de>
 <4e1a06aa-3b00-45b5-a5e3-bb802e774c88@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <4e1a06aa-3b00-45b5-a5e3-bb802e774c88@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:54lEiR+g9F3kljoFp172QPsHyGnFxNVpw0WMQUheSmWi4DUbz4u
 HOI2IcmP5kYUxGKXY/0MYEYEB+XDkhaOcZmeglNKO66kM59IHeh4Saq+9ATN5DrvJIYIqn3
 gx6A/8xBum959byEf4XKNUROzAwujMpkx1Phdqr2Npxl4za15i4oK/HOTyxFx7h+UJr4cwp
 xq4FHzo1FAXgmT/8ECi1Q==
UI-OutboundReport: notjunk:1;M01:P0:UVez4zGeoNI=;jJHQ41T3m4bKH4JxhgItCpDHeYp
 MVmn3dTESnl7bnp4jRSkWuPJPw+0kRp/86flj17lwlAehO9iTtr2x8MPKFYi0hShTjZUa9ni5
 WEn64QdWhSdHzUmNreEeJa7De9Hg8rRe4EZopezFwbEVwABrFFdktzXxYhwOaADepwOoNm5Ft
 YDrmJDMW9wamMutm0yt3PZAEJGw9iOSTqEixlhBB9aOgBijq4TFaaSHTNXzW07qLAli/K7tnm
 2+Na0tIGCMYNVdMEOOPgEsm6hQq/2bUeoDzmQ8ZR/e+MoEmNCqlzMbA/YrJoWp77DKtZ0M7ja
 jO/O2TR/rt3kxBXf1tmJK/16usnRo/mVnh3+ncMzs+4Uy1yNP0znUyVEzdo60NgXjvzYsPFrx
 8sGEFJjZJ9378lOBr8kH3Jage8/jU+WHnAdsKVrH8YYPGXXS2P2XszSMA+KGwziOdTXHtkghu
 L1RKIUesRyHqiPDHJKRe04QTIxwaxY+Q4sU6/ILqK8csYpt9biIH6xw7L91HVURPiQmNMQxB3
 OkOO3HNfeqwOhpWyeV71h5UvXCTAQEGcmvtbRXIsw4Wm8vcVKkAhRB0m8lXuKcJwy+fBksVY5
 pwkYSzPHB9INNhW/ittspa5VPV8JAL33HaX75fDDWTmh26Mv+fhrJyj10tIJXjewB9PGcCjUM
 w5V72HDTYVES09bfSvhp5RK8MchH1jz0PVps+EZfSi+2n/2XKKwQCx9dMm1nW32Hu1M7KZoTy
 8764UFdQrOivvSO1xdBRygsLoWyZL+nnBaUXxI2kNFPIuMbP+07+ZyFPAmuTFnWd+XEbmq/3O
 A7Ji6J4N8JPfFfha2gM4tHvH2/73zE/W76ItUeBh5HxVYRuJtMzbIPpGlLTzNzTbEOxbbVl0i
 XYB/x2GKnl82I9JKlEa0086pHYDBxGkYxQ12Mr+pHRME8P6TkSeTC8LzPRwxkN7wyRh00tF4Z
 BXcYPioKT1cSfZmGcwc3uDtytTfy6jonB5AR1ExXjvo+4QWkd+3PWRhgCSBycEbe54endXXsM
 oU9Do3UksfhrnoXb/ehzIFdJlLZd/bzVrvj2wldQheH2tJ3p3b/afXX7aJooGS5QgoSV+RSmq
 LBkZgseeUY4NWZYp+kNfPUqVNMxBaa
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/22/24 17:09, Thomas Zimmermann wrote:
> Hi
>
>
> Am 22.12.24 um 07:31 schrieb Helge Deller:
>> On 12/16/24 08:42, Thomas Zimmermann wrote:
>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>> only controls backlight support within fbdev core code and data
>>> structures.
>>>
>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>> select it explicitly. Fixes warnings about recursive dependencies,
>>> such as
>>>
>>> error: recursive dependency detected!
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol BACKLIGHT_CLASS_DEVICE is selected by F=
B_BACKLIGHT
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol FB_BACKLIGHT is selected by FB_SH_MOBIL=
E_LCDC
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol FB_SH_MOBILE_LCDC depends on FB_DEVICE
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol FB_DEVICE depends on FB_CORE
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol FB_CORE is selected by DRM_GEM_DMA_HELP=
ER
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol DRM_GEM_DMA_HELPER is selected by DRM_P=
ANEL_ILITEK_ILI9341
>>> =C2=A0=C2=A0=C2=A0=C2=A0symbol DRM_PANEL_ILITEK_ILI9341 depends on BAC=
KLIGHT_CLASS_DEVICE
>>>
>>> BACKLIGHT_CLASS_DEVICE is user-selectable, so making drivers adapt to
>>> it is the correct approach in any case. For most drivers, backlight
>>> support is also configurable separately.
>>>
>>> v3:
>>> - Select BACKLIGHT_CLASS_DEVICE in PowerMac defconfigs (Christophe)
>>> - Fix PMAC_BACKLIGHT module dependency corner cases (Christophe)
>>> v2:
>>> - s/BACKLIGHT_DEVICE_CLASS/BACKLIGHT_CLASS_DEVICE (Helge)
>>> - Fix fbdev driver-dependency corner case (Arnd)
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 arch/powerpc/configs/pmac32_defconfig |=C2=A0 1 +
>>> =C2=A0 arch/powerpc/configs/ppc6xx_defconfig |=C2=A0 1 +
>>> =C2=A0 drivers/auxdisplay/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>> =C2=A0 drivers/macintosh/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 drivers/staging/fbtft/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 drivers/video/fbdev/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++++++++++-----
>>> =C2=A0 drivers/video/fbdev/core/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 3 +--
>>> =C2=A0 7 files changed, 19 insertions(+), 8 deletions(-)
>>>
>>> ...
>>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>>> index de035071fedb..55c6686f091e 100644
>>> --- a/drivers/video/fbdev/Kconfig
>>> +++ b/drivers/video/fbdev/Kconfig
>>> @@ -649,6 +649,7 @@ config FB_S1D13XXX
>>> =C2=A0 config FB_ATMEL
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "AT91 LCD Controller support"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && OF && HAVE_CLK && HAS_=
IOMEM
>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_CLASS_DEVICE
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on HAVE_FB_ATMEL || COMPILE_TES=
T
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_BACKLIGHT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_IOMEM_HELPERS
>>> @@ -660,7 +661,6 @@ config FB_ATMEL
>>> =C2=A0 config FB_NVIDIA
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "nVidia Framebuffer Support"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && PCI
>>> -=C2=A0=C2=A0=C2=A0 select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_CFB_FILLRECT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_CFB_COPYAREA
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_CFB_IMAGEBLIT
>>> @@ -700,6 +700,8 @@ config FB_NVIDIA_DEBUG
>>> =C2=A0 config FB_NVIDIA_BACKLIGHT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Support for backlight control"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_NVIDIA
>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_CLASS_DEVICE=3Dy || BACKLIGHT=
_CLASS_DEVICE=3DFB_NVIDIA
>>
>> Seems wrong. BACKLIGHT_CLASS_DEVICE is of type tristate.
>> There are more of those, please check.
>
> It's exactly correct. Linking would fail with FB_NVIDIA=3Dy and BACKLIGH=
T=3Dm. The above construct avoids this case. Please see Arnd's review comm=
ent at [1].

I'm not arguing against "depends on BACKLIGHT_CLASS_DEVICE=3Dy".
It's the "BACKLIGHT_CLASS_DEVICE=3DFB_NVIDIA" which is wrong.
BACKLIGHT_CLASS_DEVICE is tristate, so either "y", "n" or "m", but never "=
FB_NVIDIA".

> That's also why I mentioned that 'imply' could be used rather than 'depe=
nds on'. It would handle this situation automatically.
>
> Best regards
> Thomas
>
> [1] https://patchwork.freedesktop.org/patch/628099/?series=3D142356&rev=
=3D1

