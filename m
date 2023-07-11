Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEED74F377
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 17:31:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dt0t1XV1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0lG65s6cz3c3v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 01:31:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=dt0t1XV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 344 seconds by postgrey-1.37 at boromir; Wed, 12 Jul 2023 01:30:37 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0lF91v2Vz2xW7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 01:30:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689089420; x=1689694220; i=deller@gmx.de;
 bh=X5J8IwR1yeKrwbjkpPsX7TYJjlXNjW6vNyFiaXSONCI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=dt0t1XV1ayiz/SJL3s2x1nKbHArNjmcF3GE6w9P/u/ZWPuz1bV8wR7nA4XpmNXspFjc9+JY
 1B5fc8AF1xSoDqggXQO11QwB3WpDU2cJfxsxIsrXubkO5G8Ot6wu19JBtuBD85NmxwHFANdtD
 EH5a91o5CcM14prLpWojqewu34zz6hsjvoXq35UDvrlduK09+PxnxnTw+rNRDH5RayGa5ZtSl
 WgMx6hD2Vit0867ifGOoh2W1MftI1aoTMrRSgSmXkudKeJBiNV9zFuIW0s2+TxMuarKoihPZ1
 03EhTwRvmtXa5u3ZRqblFFkysEPWzFwk+ZGgONfli3Vm4U0TwKZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.149.147]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1ps3V72pTb-011i72; Tue, 11
 Jul 2023 17:24:02 +0200
Message-ID: <bf439387-6b13-0fd9-f61b-1a5cbf731187@gmx.de>
Date: Tue, 11 Jul 2023 17:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/17] fbdev: Remove FBINFO_DEFAULT and
 FBINFO_FLAG_DEFAULT flags
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
 <20230710171903.GA14712@ravnborg.org>
 <ab92f8d9-36ab-06bc-b85b-d52b7a1bfe9a@suse.de>
 <20230711144744.GA117276@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230711144744.GA117276@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6I/u9K9DZKAMaYzMuqb+xXVwXoFF+h72slV7307qnBcsm0Dzs1x
 nG8x0xILsiEhhUVyajytT1uvIrwO9pRmYfPk78Yjls8o/KkVUspWf98tkujsctomDLRF6u0
 UdBWhjkxLyl8NlhxrYI/AySAPNbWQr6NnCxEKWsR0EsTYbybHP0PZ/RgD80PFRH8fmhW/rk
 TAn21cXKojNy9UOEmBO4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lW4p1ZJ05Fw=;GxyVIzLC98Kse0BkV0VKZSOEV78
 XeMp7kqQBHVDcHkoFVS4DPGJe2FDd7daPCdRo0CdxTxrUrBuD91qPcVlzb5LGezLQglrLaAv6
 W86fopwiEz7BpxYOwQWOQgmtquiiUa51Lh8oSfY2NlQeMD8nKaviPKKiFCvozYXYvthf64ujQ
 EKyj+yZW/3TsFwy+PsfplTAHchWGUdlYdAEjHww8dR0vUtCi0GVM7BitR/mTA75Q9Rd1+COED
 9/L0hrISYXCvVFCRQPhYDRC57NFUaDcpnj3e1AvvRhb5srZOko0myPl3O6dMZyAPwY7YELlFF
 QhKRCIBKMDtEGg+/vRniKsfuAJup3pzEr2qibwWXh/XLMYiZI2+TE+1DPUWtxa7iM7JumDN/i
 QinKWUGG2cF5dWpQIpWMpZAH7NnWAO85p9qhzjVSyeZtW6PbOqag4ulMGoRVZTA5978rMMEk4
 QXuefBnCDK3d8gXU7t4RTNPhUJ+W+x7WboPSqfcRVu+CClmXOs+DLEt4uvKDZs2ZZDkN+hMs4
 J4Txco/JAKnFjMT9PNjCdp9CUaYxq63USwMNRAgtHpi82uOfg54IJRUy9TCygPDVzTpVL1NJd
 dZ4vq0eiXgK8Y2efSKhSJThvXMBtF6a0mWCTJEZbCp9fiMQMLvK10gHLy1VJQAV5WeuJiLNIj
 SSmB8VwQHEJ7qkj6v9cCdfn3o5ULoc67f5X8dYJ7lxu797Vnz3LSDv6T0CcgAVUTjHyvT9Opn
 taog0/LWl1oCDUhcMn60srOqciY/OR1PjcXuNPUboMjPJSYTM1X9RUhVfIIXshgtBYRBEatc2
 bcNOqjxMw9QAyo3RJt1ZEnz10J2qXmbx74JReuMZ1cYvwHBh/b+izCQbraHM9IZynoLhL/ax3
 03k/atFQiAXoEoXaN2WbCMT6RmU2GDNKLUqIklwOijYC8RIu43ivmwZtsrD09DNYUHNY1Wrx6
 sbwroaHH9gOuoGxUy2cns2gUXkE=
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-geode@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 16:47, Sam Ravnborg wrote:
> Hi Thomas,
>
> On Tue, Jul 11, 2023 at 08:24:40AM +0200, Thomas Zimmermann wrote:
>> Hi Sam
>>
>> Am 10.07.23 um 19:19 schrieb Sam Ravnborg:
>>> Hi Thomas,
>>>
>>> On Mon, Jul 10, 2023 at 02:50:04PM +0200, Thomas Zimmermann wrote:
>>>> Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT from
>>>> fbdev and drivers, as briefly discussed at [1]. Both flags were maybe
>>>> useful when fbdev had special handling for driver modules. With
>>>> commit 376b3ff54c9a ("fbdev: Nuke FBINFO_MODULE"), they are both 0
>>>> and have no further effect.
>>>>
>>>> Patches 1 to 7 remove FBINFO_DEFAULT from drivers. Patches 2 to 5
>>>> split this by the way the fb_info struct is being allocated. All flag=
s
>>>> are cleared to zero during the allocation.
>>>>
>>>> Patches 8 to 16 do the same for FBINFO_FLAG_DEFAULT. Patch 8 fixes
>>>> an actual bug in how arch/sh uses the tokne for struct fb_videomode,
>>>> which is unrelated.
>>>>
>>>> Patch 17 removes both flag constants from <linux/fb.h>
>>>
>>> We have a few more flags that are unused - should they be nuked too?
>>> FBINFO_HWACCEL_FILLRECT
>>> FBINFO_HWACCEL_ROTATE
>>> FBINFO_HWACCEL_XPAN
>>
>> It seems those are there for completeness. Nothing sets _ROTATE,

I think some fbdev drivers had hardware acceleration for ROTATE in the
past. HWACCEL_XPAN is still in some drivers.

>> the others are simply never checked. According to the comments,
>> some are required, some are optional. I don't know what that
>> means.

I think it's OK if you remove those flags which aren't used anywhere,
e.g. FBINFO_HWACCEL_ROTATE.

>> IIRC there were complains about performance when Daniel tried to remove
>> fbcon acceleration, so not all _HWACCEL_ flags are unneeded.

Correct. I think COPYAREA and FILLRECT are the bare minimum to accelerate
fbcon, IMAGEBLIT is for showing the tux penguin (?),
XPAN/YPAN and YWRAP for some hardware screen panning needed by some driver=
s
(not sure if this is still used as I don't have such hardware, Geert?).

>> Leaving them in for reference/completeness might be an option; or not. =
I
>> have no strong feelings about those flags.

I'd say drop FBINFO_HWACCEL_ROTATE at least ?

>>> Unused as in no references from fbdev/core/*
>>>
>>> I would rather see one series nuke all unused FBINFO flags in one go.
>>> Assuming my quick grep are right and the above can be dropped.
>>
>> I would not want to extend this series. I'm removing _DEFAULT as it's
>> absolutely pointless and confusing.

Yes, Ok.

Helge
