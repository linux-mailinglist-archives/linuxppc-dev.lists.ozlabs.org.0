Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865176966E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 14:35:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=FXGk9moC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDyPP3H82z3c3h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 22:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=FXGk9moC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDyNV59FSz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 22:34:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690806806; x=1691411606; i=deller@gmx.de;
 bh=0RFDEXXQMPxJBQdMJHQn7D5WifSZ6l/L2WktkbceJyc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FXGk9moCw8qFnPcjSFfxssf06xB2w7SYR8UPNCKWRnYLOjxtepPLWJ1onxRzFeHeQOp+ApT
 ZdloVKFW6BctrAcKl3boCKaltVrEg05FJAMEGZ9JTRoL0XmvakhrDTGWCRLZ9VgU6WFYNq58p
 XD9GBC+8XPT8TYdHxvt7RwLju0T5qsERFCshKCzQRM6LlWTpxxc7mTOTNBDYrfNMIEJ5K3E0Z
 ik9Ny4gE5yarWwE6H8XWYfTgNnmSL9Mrx2s/jbx18XXJVsoQwvRFnELhp1kcBZmU9r1UbB6tH
 mOmKsf0fgrLd5uQX4G3HwID0IGuDIBuCM9bj4YfLNihfjlHTEz7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.238]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1qAYrk2CD4-00KTWj; Mon, 31
 Jul 2023 14:33:26 +0200
Message-ID: <6bd9ed23-5a79-879a-c9c1-0b3952fea0ad@gmx.de>
Date: Mon, 31 Jul 2023 14:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me> <874jm1jv9m.fsf@mail.lhotse>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <874jm1jv9m.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8JThjdBtX8FirEM7utDHiybc3BR1zxxlm3GKmGCUcmNv/w83edb
 otg9E/DNNBHl1ybbl0Dnt+KCqms2wgX2uWiHMlT0XaX/WaGBw57s9qbkwU/xJo/Gyaoilt9
 gfufL2w5I0drReRuUihbe4SuRPqukFP3MBOROScj4gMd13Q82B0WnIwBLjSOo4oRLNxgELH
 JvwRQszd9U8IqhRCFWcIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:17kHrss4C9E=;k7E/NjF47QPlMvlKSJpOftE6ES3
 eRQdZ5sMAmvlfdbcYe0RUVBfrF0dShKRZCnn9H325/YHm74NPQuf17UrPeY7bd0yrllcgkrwA
 W8Fu5/qiLBPE7P/fqNXtQNBtJZfU5K9Eo3ruUmxYHFlPx4IhSqmta6zUKWDdsVXqIhQSBYj7L
 QoQiOQdeyq7ABC0dfN7w8IIzRIMENta3BEMvBhjeicsAB9vdx8TbKEMvNi3EcEzSE/C1dTpC7
 Eyn8AisbqGP5x8PXb5AVNVkrrt6RBvbm3tmlBxeBT1o6vGJWFYavZGlPpu7oMmDzCqqgIHnM/
 Q1QdDEIXOalxLp13B6FYQ6dELenoh2DXSczYRV6evYF3sjSgCNRiRRcyaGWAkSZ9eYqw/mm2V
 faG+rsElF3AdGmX9vieh74jpKAzPcuRBSijhFLckSxCRm/SnV7JB1a3IcY3b/QklKV+oWorBC
 43MRn3g7Gzkk0NtHPy9xf0iC+Ew/Ruyv/7aqJO0KsThjaEWoDt1zCsLr4IffMKFmI+AoysWpp
 uVAiQ832jrE4OgQS/wGWUvVCa3CgfY57XPXtvTPW7xUk0mvC/DYBoCfOYmOT7+SpKRIFah+N4
 rTgnIEBFuUXRrWgzS+31fxKaOVYRzKbXPOl3eXuVJecTSqYpGa9jv4lx37drxct3TKnkIQglU
 vYUjs9KwjoRfHXJwSgwKQPIntjdX9vBfRjpN4Qg3rk12K3dAbsOhBZNa0f4Wp60Fo4Qc7XOgD
 XKvQHZ2ldvjTXpTSbtwuqnjVCZsKVXxJmuh3x+i6XX4Skiw0Sp49xXhSDp0HchERv8Ftz5UwC
 u3yEtA0CmMr/VZd+6tfVMn6GoI8ddFaVNmSt698nqcQsSamUb8d9Y4r09HJywn9gAQmTnQjzn
 T1E2abpkKs/FAGBH1dYSC+7PmmHxNjgHDF08P/xKNEoMPn+MsLkLLUODHvYs0pCwQPgE4nKRz
 8hULd2moGa4LLOVU4AhIfK4Nugg=
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
Cc: linux-fbdev@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>, Geoff Levand <geoff@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/18/23 13:48, Michael Ellerman wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>> On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
>>> on ppc64:
>>>
>>> In file included from ../include/linux/device.h:15,
>>>                   from ../arch/powerpc/include/asm/io.h:22,
>>>                   from ../include/linux/io.h:13,
>>>                   from ../include/linux/irq.h:20,
>>>                   from ../arch/powerpc/include/asm/hardirq.h:6,
>>>                   from ../include/linux/hardirq.h:11,
>>>                   from ../include/linux/interrupt.h:11,
>>>                   from ../drivers/video/fbdev/ps3fb.c:25:
>>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no=
 member named 'dev'
>>>   1172 |                  dev_driver_string(info->dev), dev_name(info-=
>dev),
>>>        |                                        ^~
>>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'de=
v_printk_index_wrap'
>>>    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);            =
           \
>>>        |                                     ^~~~~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'de=
v_info'
>>>   1171 |         dev_info(info->device, "%s %s, using %u KiB of video =
memory\n",
>>>        |         ^~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no=
 member named 'dev'
>>>   1172 |                  dev_driver_string(info->dev), dev_name(info-=
>dev),
>>>        |                                                             ^=
~
>>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'de=
v_printk_index_wrap'
>>>    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);            =
           \
>>>        |                                     ^~~~~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'de=
v_info'
>>>   1171 |         dev_info(info->device, "%s %s, using %u KiB of video =
memory\n",
>>>        |         ^~~~~~~~
>>>
>>>
>>
>> Hmm, there is no response from Thomas yet. I guess we should go with
>> reverting bdb616479eff419, right? Regardless, I'm adding this build reg=
ression
>> to regzbot so that parties involved are aware of it:
>>
>> #regzbot ^introduced: bdb616479eff419
>> #regzbot title: build regression in PS3 framebuffer
>
> Does regzbot track issues in linux-next?
>
> They're not really regressions because they're not in a release yet.
>
> Anyway I don't see where bdb616479eff419 comes from.
>
> The issue was introduced by:
>
>    701d2054fa31 fbdev: Make support for userspace interfaces configurabl=
e
>
> The driver seems to only use info->dev in that one dev_info() line,
> which seems purely cosmetic, so I think it could just be removed, eg:
>
> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
> index d4abcf8aff75..a304a39d712b 100644
> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -1168,8 +1168,7 @@ static int ps3fb_probe(struct ps3_system_bus_devic=
e *dev)
>
>   	ps3_system_bus_set_drvdata(dev, info);
>
> -	dev_info(info->device, "%s %s, using %u KiB of video memory\n",
> -		 dev_driver_string(info->dev), dev_name(info->dev),
> +	dev_info(info->device, "using %u KiB of video memory\n",
>   		 info->fix.smem_len >> 10);
>
>   	task =3D kthread_run(ps3fbd, info, DEVICE_NAME);
>

Can you please resend this as proper patch to fbdev and/or drm-misc mailin=
g lists?
As it is, it never showed up for me in patchwork...

Helge
