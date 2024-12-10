Return-Path: <linuxppc-dev+bounces-3954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33A9EBF85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 00:42:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Ff62HTDz2xQD;
	Wed, 11 Dec 2024 10:42:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733874174;
	cv=none; b=dcdQkVj5fOCcudNrlBraEtmkFgYZoOh4NXQ2lqwfs+REI9ta00snz0/Z3cgP18zwq+KRhz5Z10Pe3UhVa+6S29FMewh6F12iQPq5FEd5eAa8NiaysAWqihEav7Tuf4gf6PE3cf8//rQhm8alj1Bs2nkXrTUD6RJNwGwxAfRua5h0av+LwfSfF3GAjsXu+Yus5m/nbxw7MRC1C/h+qEqpcKp29V9rDoJGaDIEoT1TqQHPjn2xwRYt5ebrULD8X18CsdBNTT62/pPeFoOyTGDB8fIeFrC+pL6d5jqNuU+moX5Hy+8mebIhfq7aDL7IZh+ml8M7cBN1lHu9Z5/NtMIIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733874174; c=relaxed/relaxed;
	bh=4x76lr1uKp4dzIQCuND/FkrveBcE5jD6f/7njWUTaiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UI+xeUH2oSAhDmp/Vv+Y9Ggs4tkepX39mjqtjdheCzHfrophiuLjxpQCCDWQHu9/j2FsxvtzEA6k+lpqDCd8hlSIow3BW66hltlPLsr4VXcgGGFfwFNJS0epwVm3/5jbp02S0KnJInMIIRgBJL7qkWG+pythHiow3TeYlalHwsDzfd3eV7KtsmfKhTw4fnQxXWx2394bVzD0xxWjITVeG+MsfLdS76I1ZgdQh9bhu6sfTjYhPhO/X2PTNRsyufKZj6oSm/GrY4As1Q982sZXtl/6sSEM3FZYiUCc2IrvMqUFytEI+lnSaQtzXtaQJmJ0VXBtdaIKR/G/cFhbgJYceA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=huz+xtrR; dkim-atps=neutral; spf=pass (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=huz+xtrR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 317 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 10:42:52 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Ff42Hftz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 10:42:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733874166; x=1734478966; i=deller@gmx.de;
	bh=4x76lr1uKp4dzIQCuND/FkrveBcE5jD6f/7njWUTaiA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=huz+xtrRouSYxByEl1ItmA4n+WCpjouBI95w63/YN1MH+sLEiF0wtOEAltJO94dg
	 2TbkSH0uanJY7OEo97R0fD7LU9ZrGTz31jDzF+ni/6NwJ96H4p0T1ISBEOnBYZCds
	 rYop6vkHKLSP+e/y7bjKjC5ZdhrZY3RHmwECk7XFIdSHf7UQr1UgqSJ2cCt+Y5W1I
	 OoOMEdv+xmHUsrcqXHD5hy5gXzWEe/BrDaxI7k1mCFAf2kl3yUHWKp0kCvM1BJJeb
	 e1BdE+M8kOGWmQeyRhPzVmw1k+bycmdjHuof5GpvGdl1+3nef6KEi3Lm5S5e2z7Wp
	 SZJ+2eCY99YXQfk+BQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1ttPCy1m7Z-00qmUT; Wed, 11
 Dec 2024 00:37:17 +0100
Message-ID: <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
Date: Wed, 11 Dec 2024 00:37:15 +0100
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
Subject: Re: [PATCH 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
 <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
 <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1Z0RuN2yHK9zdK3CN22uyAaY3zXwn4gKn0FK6xqV6R+ixLc/i4
 kGhsVpxhwsBiadg84ryrKGNgsw+JtXoUIZmSBpKG69w/Xl0xfLXHvdA2QiwbwN98aoBZ5jg
 DQjsB9+lzwim64goruIinUYjq8BD6XrE5EBKC/uf6pYsWowsO1WVSylEWq5fngYJWsOYVlc
 AOuYYYlHPERuMQGL/CT4g==
UI-OutboundReport: notjunk:1;M01:P0:s1oy+DEVWtc=;/t7LjRn3uabP/s3D36jOCrzIHYb
 /nIv+uxLpJ+axEoFjO4aTMIVQKsUxxnBg7mcg40uvwR7M22wdmB2dm+LSZ3Hshj2DobLvSsn3
 UO0ZmZMpVRTMXOQhb8PTkYzkDnUHT9xG6/VwLa6Miel6RiOtVh8nxT7SR2+ZVKhHcL9DQO4An
 +0jseCDa7URyfStLQOhsiNTtnw7BgFbCf40humtUsoATNGXNhuRW7N5C3zXA+kJhvzioQ2UQU
 aJxn6SMJBic5FOwxHHN4fRZu8Lg4KzmFarXnP+ffdXdVXfcDYFOCNfzvCCClR4WOhdKj8gw4/
 q9SwNNqPDtn3rz6Mf7nXVlsVywSiVbBSF9fyiSFTnxWGDv4v4+H8fNGK/5Bw5I3qth/AZftp7
 YhbeVKkl1B3Ix2lfTS9yzFfL6gehl9RqeThfXmSROPBf4TTwrAg1rVB1Hh6x9LFzT7h2zNatN
 t7/Vp7SG8mwf7xjZ5DavK1XttaTJ16dhnt8R45cC1MRDNGq2qvTDXGBE0Um7l9Xq68exIQTfB
 /3ob99VYMv0O1RWfZlgG1feOwbcl1uojF5We2szDaniYjXHmZ1JD5jSy+HO1ZcKkqiBpLJRlB
 v8nEiyU7fw/4fCoaQ4n77JBhoo+GxOFSbalAaBwOzAhK19+IonygXx3DC/koZRv6rDw6mKpUh
 Y4VsFGYg8qdJlsC8xetvQ9ACInyondxFBgql9+XoTEw9u9sVg98X7c8jY+FA4WfzPnYuA68CD
 qBLZzxDvPaaLMkC+SdDkZnHtww+4eBdfdnqx7NmC6NvXmuhhuKmhM0niDahvOyT3I96amu5PJ
 5lCe+mxfErjOtO2G/41ENDQ0pMTRiBs76A+9jyzyas8tMcxVojxTg5i04l3cTyZe6knlc2xkB
 66XsAD3R2RuUQ5FpjIHmD1EXR9Ofb0v/PBA5HAWHFdWVtj137Xpca5UDbiVDPSzZwkImYreUY
 r8CeN3oRwCLDIECL4UuDcOE1yQK64ow6urx1mUBT2m7Q8akmdh/Q1qFdTDBh6FtYKnnhwelYk
 GMzuuBTz8EGwxZpkT4UTewnrG29A/uHZ6AnovQXxaZSVj+XN8KCfpqK2UA8SdMlid4OZDeO9Q
 pioNWIbVGohmMX9LVf7XeS8uFtuKnt
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/24 16:41, Thomas Zimmermann wrote:
> Hi
>
>
> Am 10.12.24 um 15:34 schrieb Helge Deller:
>> On 12/10/24 15:29, Helge Deller wrote:
>>> On 12/10/24 15:09, Thomas Zimmermann wrote:
>>>> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kc=
onfig
>>>> index 77ab44362f16..577e91ff7bf6 100644
>>>> --- a/drivers/staging/fbtft/Kconfig
>>>> +++ b/drivers/staging/fbtft/Kconfig
>>>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD di=
splay modules"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
>>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>>>
>>> Typo. Should be BACKLIGHT_CLASS_DEVICE...
>
> Ah, thanks. I'll better check the rest of the series for similar mistake=
s.
>
>>
>> Beside the typo:
>> In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS" =
instead?
>
> That causes the dependency error mentioned in the commit message. This t=
ime it's just for fbtft instead of shmobilefb.
>
>> If people want the fbtft, backlight support should be enabled too.
>
> As a user-visible option, it should not be auto-selected
> unnecessarily.

Right, it should not be auto-selected.
Unless if fbtft really needs it enabled to function.
IMHO all fb/drm drivers have higher priority than some low-level
background backlight controller code.

> The DRM panel drivers already depend on the backlight
> instead of selecting it. It's the correct approach.

Sounds wrong IMHO.

> As I mentioned
> in the cover letter, the few remaining driver that select it should
> probably be updated.

That dependency sounds weird, but maybe I simply misunderstand your logic.=
..?

As a Linux end user I usually know which graphic cards are in my machine
and which ones I want to enable.
But as a normal user I think I shouldn't be expected to know
that I first need to enable the "backlight class device"
so that I'm then able to afterwards enable the fbtft (or any other drm/fb =
driver).

Am I wrong?

Helge

