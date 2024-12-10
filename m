Return-Path: <linuxppc-dev+bounces-3955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD39EBFA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 00:54:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7Fv50WqKz30TZ;
	Wed, 11 Dec 2024 10:54:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733874848;
	cv=none; b=iunNIh7SB+Jn2+7yEgtRCNaG4TiXfOI0dTdtXrgXvgXgpd4aavuUuRFf4dMrXhI794CpJd1r/+0f90nXDKEDTgGO6Xaw32GQB0ChPBrsM1RQScxM238VfrjXoB1nxLOmMH6ef4ySKAuSaIltUH9VYwO6zdJdBqt4nDcuMxfmdBAZj2huc6Aa43ofOC5SEjSMBOHOVvA9I/ROLyAXoLflfcnqRFthEq6In+3IbDVBh+HXVcaF++PYOJLjWupqeICdR2fwqqD98gV/ewKGkDKJq5bqvpQANEnKZXa7RVsf/ObV4d0y8c8niIBHjAiMseYGjeqR9GdhWuDHseSrW68tkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733874848; c=relaxed/relaxed;
	bh=0EtnPcDYFUhiPkZvmv6OGFJVn7a1rYxmS/x9tbTqyK0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TsOpr4gUgiueJ8iFPPxYagCB2+erxryJ4aceOCAtTFZG0SNZ1b/M9FFvSksT6ey8WMtT2U7g+/tiq3BjeVc+xcnPfM4+S9VheX9LL9r0aUu3Y5+ntaCDUdzaWj0vC/qZaOK+grQlwUBtk9vJA14gezwVGaCOGiMe1cOA7zX43sMOnpcZp9Z47ZEH4+FMkhIdZcSWyAsw1kp1KicerhdNYvsysn1N93eR0BvYkhWsBDQMQaOcy0x7ynrvnuvpuezAxyJYOiXMnil4+rmTpjNUNZ/Ynrm5M5YMSnw+twKJR7/ocNavP0P0xnS8sV1sw4xpLub1ezM/w/4mXI2pCHM/AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Cwmr+Ecm; dkim-atps=neutral; spf=pass (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Cwmr+Ecm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Fv2325Qz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 10:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733874827; x=1734479627; i=deller@gmx.de;
	bh=0EtnPcDYFUhiPkZvmv6OGFJVn7a1rYxmS/x9tbTqyK0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Cwmr+Ecm0gzinBy+Hr4+jNBoXfuGF++Fe/lHCUCoshC5R2Ok5mNcfLVOKfZUT+1g
	 lzjsAm3tPSzzLSEghJu6ceRy+X9jd1wDlbQdPSYUHEqB3I9W77ZzNFOXcCNfLHAuM
	 J2X7RpY27FmE7TT/nmlDgrnxIqYSfSBr29u212XDEZKZ2SXSlojtCStNv/uR0XMOe
	 P7hmeCdSYozgzDXg66ogpUWXKuBs/CzSRlcB0N74I/eO1Ol49t9MLl7qqegXc+RoC
	 U8AA27SXBnhP4H520NcwRsD6yU9qixaWFaofvnY5q4DPOyTvelGUk1zZEcc4Kayiy
	 Dy4eUy2r329xqHqNMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1tMoCz0oTu-00ERF1; Wed, 11
 Dec 2024 00:53:47 +0100
Message-ID: <b06308ee-93bf-40e8-bc58-a49ecdfbdeeb@gmx.de>
Date: Wed, 11 Dec 2024 00:53:46 +0100
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
From: Helge Deller <deller@gmx.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 arnd@arndb.de, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
References: <20241210142329.660801-1-tzimmermann@suse.de>
 <20241210142329.660801-2-tzimmermann@suse.de>
 <b5136312-e18c-46cb-9a01-3efc61d6fd9a@gmx.de>
 <de810def-84ac-4d55-b625-536b5781a20f@gmx.de>
 <e7d5fba5-7ecd-4ed3-be7a-56bf82030e67@suse.de>
 <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
Content-Language: en-US
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <6b543ccd-23dd-474d-9828-1eb0ecec9c5d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YLPx9oTICaMtiTUEkyQ12CqomCHjPoRN585IruFAIxFmttsc7vU
 QfnaTmbSnhRZJ061TDLWOfkF/pMTGyk0tctidxiDn35bDqBOJcmqPjHrtfS251+xVeofnee
 pQio7jBY2pMp4gUTZx/5zZBN/RCGOo4iUuEG86WUVPQbIgPBbSzw2VdmWHg3P2CIzthYMFw
 Ctzg0rh/AxajBPH2EhTAg==
UI-OutboundReport: notjunk:1;M01:P0:SMBVFmaoxfU=;1KBk0evqzy0ps5rxcP/6MpAZFKP
 ivqvTXdbpNmRpkP9Kc/biJrhHLfBsSHaF7Hde8qywKf/Dbjbj7XSSjtxGceDWvF+6HeTTGX2w
 +8GTxHlCrduE4vXfBDAV6xVu7uExpoT7tGncAaxTocv8BEnp8FvucIGSJqYhEG/Hejo7ewqFy
 agosMpor2rMzb2Fvkm1cLNXAFXbLDk4genDvO7QfZPp4FjnR4eaMS0uY+mMPE4iFYYHVmfMaM
 qY/ysb2toPSZmnh95fZAmX03S8bJWCbX7GmatdH4Of89hXgs0LUz5nxLV3Z0+0m6AiEDJD62B
 MPBMw8Fu5JvjN/56GYXo7lf8WxRZ1Uu+NOC3gQdHYTfoAX3DLkGt3KI/87Ptk4FVL2fYO5hq2
 7QJ8lhQmY338z1OHYlfmRwWsQk0hm/y5gwzYehCmN9y0K/8sax5/ctW+4W7z/bJpwGhiDjxjk
 jpoZVvfHVOYu2EEBmPNh7AUpodyzfbXW2rgDOnL0YYuF9rh5TNZvHJD6XTaFOTI45qfXvY8r7
 fesRJAz6ZV5dZ4ZC6qi7uV5AK5OL0eQ5o1oJmkeOjkABCARIiAraqOCrd8Ld+OymtJUWCheyP
 sQtDTWjvK7Xv7K+7ommIiUNIZrpgfiGdmoIIgq8gUt2VtuPrnDXJ/fPT6mzfOflAug471q7GM
 Je7P0wdcbYKaCjIo3Ci4sd5hDTKkTfGTn+vuYCROphIqNjDvW90otdtXNiSZ4Nm0e3OGt60+z
 hAEA/h5StTCuNC3RTBRf9FMl+R+AqEJlGwmDt+Qfa5mZ1jdDt1mYOnx1yyH7dVEPCFZCstfvq
 TlKBFz6/Lay5NwV0PdF5oFmU0RysNwh+VOJHTrSKRgOKpt6R76r4OrrdxMZJSHoyxp/UqB//5
 kaBXgkxZdmmBQTtP4jEEHG/xJkkU168nTabuTDA3MW5GvloqqGy/6FzIusIGEkXpRYWVVQCx1
 YbA1e5gV2lleCXwmUK1pnKpR3EnTqCAzWxLdnxOQyMBIsv7OGYZny+6seO51wO3SVVSr3FnCm
 B271tgjQBCFulZ6gLF0Ud3qscnE2btz88UfqXQzxyAyzb69MRqwNRz8HfpxRmt/bBDhznHV3v
 U2/Z+lNViH0+H+n3Z5tRlWi+X3tVQu
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/11/24 00:37, Helge Deller wrote:
> On 12/10/24 16:41, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 10.12.24 um 15:34 schrieb Helge Deller:
>>> On 12/10/24 15:29, Helge Deller wrote:
>>>> On 12/10/24 15:09, Thomas Zimmermann wrote:
>>>>> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/K=
config
>>>>> index 77ab44362f16..577e91ff7bf6 100644
>>>>> --- a/drivers/staging/fbtft/Kconfig
>>>>> +++ b/drivers/staging/fbtft/Kconfig
>>>>> @@ -3,6 +3,7 @@ menuconfig FB_TFT
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Support for small TFT LCD d=
isplay modules"
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB && SPI
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on FB_DEVICE
>>>>> +=C2=A0=C2=A0=C2=A0 depends on BACKLIGHT_DEVICE_CLASS
>>>>
>>>> Typo. Should be BACKLIGHT_CLASS_DEVICE...
>>
>> Ah, thanks. I'll better check the rest of the series for similar mistak=
es.
>>
>>>
>>> Beside the typo:
>>> In this case, doesn't it make sense to "select BACKLIGHT_DEVICE_CLASS"=
 instead?
>>
>> That causes the dependency error mentioned in the commit message. This =
time it's just for fbtft instead of shmobilefb.
>>
>>> If people want the fbtft, backlight support should be enabled too.
>>
>> As a user-visible option, it should not be auto-selected
>> unnecessarily.
>
> Right, it should not be auto-selected.
> Unless if fbtft really needs it enabled to function.
> IMHO all fb/drm drivers have higher priority than some low-level
> background backlight controller code.
>
>> The DRM panel drivers already depend on the backlight
>> instead of selecting it. It's the correct approach.
>
> Sounds wrong IMHO.
>
>> As I mentioned
>> in the cover letter, the few remaining driver that select it should
>> probably be updated.
>
> That dependency sounds weird, but maybe I simply misunderstand your logi=
c...?
>
> As a Linux end user I usually know which graphic cards are in my machine
> and which ones I want to enable.
> But as a normal user I think I shouldn't be expected to know
> that I first need to enable the "backlight class device"
> so that I'm then able to afterwards enable the fbtft (or any other drm/f=
b driver).
>
> Am I wrong?

Looking closer on this...
You propose:

=2D-- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -3,6 +3,7 @@ menuconfig FB_TFT
  	tristate "Support for small TFT LCD display modules"
  	depends on FB && SPI
  	depends on FB_DEVICE
+	depends on BACKLIGHT_DEVICE_CLASS
  	depends on GPIOLIB || COMPILE_TEST
  	select FB_BACKLIGHT

So, it will depend on BACKLIGHT_DEVICE_CLASS.
But there is "select FB_BACKLIGHT" as well, which is:
config FB_BACKLIGHT
         tristate
         depends on FB
         select BACKLIGHT_CLASS_DEVICE

So, you end up with selecting and depending on BACKLIGHT_CLASS_DEVICE ?

Helge

