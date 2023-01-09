Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E45BA66319E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 21:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrQhT5nVKz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 07:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=gxMrS/Tw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=gxMrS/Tw;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrQgT2TrJz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:35:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1673296481; bh=tDDMxQUH9PrDLgE/dT+MuHlPyJiO7mFGW8/sbQmK4fA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gxMrS/Twsss7fCu2lS0Wb7K3e/li2f3rr8EK0drV5Gymn8ukNv3Bwd3LMbH/SmLJz
	 o2pWkySPI2F6couqVMUSRCavEGZqW+jT+LxjfSX8MZJes+uauHTLdbV5/NxJk291CX
	 ttUvgacY+St5fs4ANcNfRSuJ0LQubjNe4T7ejyE7EPNyMI/EAgYH8sAY0VeTaiwytz
	 8FAsrR1AbNmEEbpSuFs3/+7VsGugLmhoT+YZmgEAg8A5M+IslycNul2RkgORKhtpdV
	 /weQ+nsr0P6qYV6MOEXto40tT5he1eKLUNC73UieAtSZYLBAigqW9XXZ9z4aW1VLn9
	 II8e94VHAgC2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.168.5]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWAOW-1pHbCN0Lk2-00XalY; Mon, 09
 Jan 2023 21:34:41 +0100
Message-ID: <f5b87764-57b8-8d13-79bd-592363ca7c32@gmx.de>
Date: Mon, 9 Jan 2023 21:34:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight
 handling
Content-Language: en-US
To: Stephen Kitt <steve@sk2.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
 <Y7nb2q6SDota/rTU@ravnborg.org> <811a392a-d634-5557-dd58-57f1580e28f2@gmx.de>
 <20230109211857.79856bcf@heffalump.sk2.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230109211857.79856bcf@heffalump.sk2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sxat2VV9tsmpDqx48BXRIJsjtp4Uk+LtMp6TeothrAxEKeOVUMN
 Dm0J5cCxulRKy7oAmoyPnyYtBINa8biDQuhLNx3id5aME9DtEU5Bjf/sV3mvs40zfguZnbh
 KtsbJUiQXuF3dSrIqUeLm0CfC2SEBu2glCy9/ejtL6222AIa6jJQxToCY/b0mN6irXRDkxr
 YErYktx+mjchd/jxSTLBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ru6D61qjM+I=;/Tif9Q07xNGL/8IpH47T4Zb2J/p
 87op62XiN1+XP1UVPc++jmLZc3PbX8X9DyVhRrkA+1F+2SvKWtOdBxx0+7KIDfVWx9w0/9mym
 cGrz4Hz99ahqT75tlCPuD9C340MVcJwPEkubfK4IAoZn5iz7mvijEeHZl0HE3t4OI5BJ6Yyyg
 e+muYXDfYFB4b2wOzOyP5lmp8SIkqdnUQiNK6B7QgUJAgubpgxBe62neT1cxRXfo5kPDiTg97
 iUMWRThu99tk9hZ/rOPyyRVGNp46tU5eW0uFDJSXSN1KDo00pyAJHeToaAc424ld8T+Gh6+JM
 7Alx9KJZs1jVQveQrERjLkcczY3TGv4ktXLXIXIdZ3Mvgee2ed71+lUUBpN5S3cBAaMLXawPx
 HCGmxyBNZ2DOaW2tf08AfG/zAleN9QNs7nEHhy1ETyTdwgjW8qT9fd4hyTf73icRT0MQt7amF
 2nzXeM/b6tH3qHifK1iaxWAlFLlj38yKg/rUv31pYRG0V0m1PG5vdDFs1fBtFNGIhMhzw6ezi
 zfi3h0KmiGw5NQUkUkvIkCaHSKsrD2zXEkh0qAtXf299o/ZweoN6YFZnc9NPNl3Ge/RzVazUJ
 qB6UWJ790F+sf2/MqvlneZqxmgceqEEsHOtqsOdAHPb7viXlebkLnhq5Hqnrfv8ESCO5mwTcQ
 5D9swqk/sxRHfuDLKXDf5I+KZWSxtoboJH4V+TuOPIoPg1G3Bdhl2FJEDqi4a2rLaYttNv60f
 T6OfkZJ12Bxtc4tmYiZRJgGbiGgwdfp5b1AFR9JnK2zGr4qX8xa/5oC7e7rQMdXU50SU9ZBkk
 mNCd+bQk1QovwKxnpregRNLjnVjbhpsEIcY4FznWPiFR0/n1YiVEK+4wpjUsxMT8+lORVepC0
 tTn339nCiIBz0Lfmm4vvvFKeTbUg6LD/gOmkmJFJq2UWfWinI8CNbixz6uQqNIxbEOqAF+xmz
 aRkqQA==
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/9/23 21:18, Stephen Kitt wrote:
> On Sun, 8 Jan 2023 18:26:12 +0100, Helge Deller <deller@gmx.de> wrote:
>
>> On 1/7/23 21:53, Sam Ravnborg wrote:
>>> Hi Stephen.
>>>
>>> On Sat, Jan 07, 2023 at 09:36:47PM +0100, Stephen Kitt wrote:
>>>> On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoi=
nt
>>>> <devnull+sam.ravnborg.org@kernel.org> wrote:
>>>>> From: Sam Ravnborg <sam@ravnborg.org>
>>>>>
>>>>> The atmel_lcdfb had code to save/restore power state.
>>>>> This is not needed so drop it.
>>>>>
>>>>> Introduce backlight_is_brightness() to make logic simpler.
>>>>>
>>>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>>>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>>> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
>>>>> Cc: linux-fbdev@vger.kernel.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> ---
>>>>> drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
>>>>> 1 file changed, 3 insertions(+), 21 deletions(-)
>>> ...
>>>>
>>>> Hi Sam,
>>>>
>>>> I=E2=80=99d submitted quite a few more of these previously (and you=
=E2=80=99d reviewed
>>>> them), see e.g. the thread starting at
>>>> https://lkml.org/lkml/2022/6/7/4365, and yesterday,
>>>> https://lkml.org/lkml/2023/1/6/520, https://lkml.org/lkml/2023/1/6/65=
6,
>>>> https://lkml.org/lkml/2023/1/6/970, https://lkml.org/lkml/2023/1/6/64=
3,
>>>> and https://lkml.org/lkml/2023/1/6/680. There are a few more, I can f=
ind
>>>> them if it=E2=80=99s any use.
>>>
>>> The patches from yesterday was what triggered me to resurrect an old
>>> branch of mine where I had done something similar. I had lost all
>>> memory of reviewing similar patches from you.
>>>
>>>
>>> Helge - could you pick the reviewed patches from:
>>> https://lore.kernel.org/all/20220607192335.1137249-1-steve@sk2.org/
>>> [This is the same mail as Stephen refer to above - looked up via lore]=
.
>>
>> I just pulled those 7 patches into fbdev/for-next.
>> If you need more, please let me know,
>
> Please pull
> https://lore.kernel.org/lkml/20230109200239.1850611-1-steve@sk2.org/ too=
, it
> completes the fbdev set. (It=E2=80=99s a re-send of
> https://lore.kernel.org/lkml/20220609180440.3138625-1-steve@sk2.org/).

Done.

Thanks!
Helge

