Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30424661780
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 18:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nqkh00BsMz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 04:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q7LW3p/v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q7LW3p/v;
	dkim-atps=neutral
X-Greylist: delayed 342 seconds by postgrey-1.36 at boromir; Mon, 09 Jan 2023 04:32:45 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nqkg11pD2z304m
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 04:32:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1673199162; bh=7v/7zj2Ysz+/w95b1kVq+oD2bzqjczc2L3mL7k87WRA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=q7LW3p/v8znTK9z1tdrZP7pXZoNrJr8TL3fpF7Z8LjuQyw1UMAHCJUbe4iUPQn+oS
	 /B3OZKRyMC+yh2P7Ht+w3sNOtTEERxFdWnbp/OELO7akWNSKOGT9H5Z7P3IhPvM9IN
	 JqFcejmEPcWXDWxfYt+9J5xFnVSZ975plWU4ODt9qRkfDYLwzDcKGADfal/QWn2Z7o
	 u9NcXm4zqvRODA+tlWLHrJtQeZg9rZpBtRkDDMGfxs2Ml9hFHQt00z4F6SGj9+evwM
	 IxDqIRBnzZXI+SO+OLNnLUT/3jdiUxKEhyomqSXxut4je/cb2BvA1iixK/hv5ObZCM
	 EwZYPeyG6ITKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.135.194]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1ogbfA2j3d-00amNL; Sun, 08
 Jan 2023 18:26:17 +0100
Message-ID: <811a392a-d634-5557-dd58-57f1580e28f2@gmx.de>
Date: Sun, 8 Jan 2023 18:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight
 handling
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Stephen Kitt <steve@sk2.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
 <Y7nb2q6SDota/rTU@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Y7nb2q6SDota/rTU@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T9uileinKOrfmfXULyUKIEJ7Q5sw2pWalYogfbz1gtzJSOq1Nnk
 V1Zd+9ekAM/oEwNZj1ns1vPVvUAvy44ZTl/BH109UTdaVmWLFROcAvtyBj2aiXsnhpoNIYK
 f6LsM16mV7xk2n5D7VSkS/fvq9QrFB+Qsr4JdY1dEhwACqZ+EY+1G3NYsfmX6ypM+wH5gFE
 /7WyOoTkU98Aw7Eoh7DaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EYIG5Yvp3Ag=;s/h+gAEeY4YiRb5DX/izZPnDOSP
 I6I0tSyxyATE1TV3txwARA1kCH8Ufst9fXZfp8hSl1x8oUA5gOaMEvUW3Z3D4KlXzpPuHjcU3
 wggWDoheUFAZa9YTSPcL2K4Rf04HEAJLdl8tuBnxHg7coiCIYOiHKadDFNV9iKgIqJ7J6wQKV
 9UcxZ4+dXpxE2Ba406UvLN9oN2VXnqwoDDHBgazUcli26bJSp4dJFAJ4UJ9YUr7OGe/xlD8bZ
 ddPXQsGtQOhZFP8/ytLNPS91wEGXqvA31AwdfEclzfJ8bSE1b0lHZHf/GlAvFBa9lGISKNQLu
 oWXLB204EALROYpMIKE37jh5YU4EgZrFDRyHpsxzw9LoHmxBTATsMP2zPmDJbMClWcBQB+AX9
 k0ZPhhucNMEsa+94xdkqC1HqBqbqN/ms2+GXjRgz0rf0ACc2mJnsDs09sST2ieAWl/lkd4DeZ
 qOoAS5q1g8feBQUCzZeOs1gb47uX96vjfTkRdBcpONti40GAaphHsEQ2pP/26V5/45cdNUVSf
 4hr61i/u+9AEFNJg4vpcg2jdOHSBdmfVUyrPr1xGDxj5JOq0Xm31IyDPSIFiJM+jyM+T8XjXV
 Xm359wWgkNd8R4tKArTmBZ+H+H1wwAsAgZuS78xzicT6yVLyjCW3t/AmsnTjz+DmizeanDuLK
 ybwO5mzJUPNzvlFlQzQX+OZHsPrkLM7aj7zsFSsdVP3FRpkLCcomNcBdsE+2ZZhECS6Ifiv30
 yRumUcBgfV+MQPYx7N4FaYCDrKqIK5vaO1quMwibSrnKpM2fpsWw8gMgy53GMcD8O0gKc0xBw
 2RmFlrngLsqUUX0y6rFXWaP7/I2kayYuKcl/pT5tJiTjQz/O5ERg2lumarqIBeux57f2TSJB0
 3kU/ZWdXBl5kQQVnm45gn9wayQTNQ8E62ya8FQUyItKxHcUhGm3IYdC60OeZPQPygBwick0cw
 BFWjpw==
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-omap@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Lee Jones <lee@kernel.org>, linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/7/23 21:53, Sam Ravnborg wrote:
> Hi Stephen.
>
> On Sat, Jan 07, 2023 at 09:36:47PM +0100, Stephen Kitt wrote:
>> On 7 January 2023 19:26:15 CET, Sam Ravnborg via B4 Submission Endpoint=
 <devnull+sam.ravnborg.org@kernel.org> wrote:
>>> From: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> The atmel_lcdfb had code to save/restore power state.
>>> This is not needed so drop it.
>>>
>>> Introduce backlight_is_brightness() to make logic simpler.
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
>>> Cc: linux-fbdev@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> ---
>>> drivers/video/fbdev/atmel_lcdfb.c | 24 +++---------------------
>>> 1 file changed, 3 insertions(+), 21 deletions(-)
> ...
>>
>> Hi Sam,
>>
>> I=E2=80=99d submitted quite a few more of these previously (and you=E2=
=80=99d reviewed them), see e.g. the thread starting at https://lkml.org/l=
kml/2022/6/7/4365, and yesterday, https://lkml.org/lkml/2023/1/6/520, http=
s://lkml.org/lkml/2023/1/6/656, https://lkml.org/lkml/2023/1/6/970, https:=
//lkml.org/lkml/2023/1/6/643, and https://lkml.org/lkml/2023/1/6/680. Ther=
e are a few more, I can find them if it=E2=80=99s any use.
>
> The patches from yesterday was what triggered me to resurrect an old
> branch of mine where I had done something similar. I had lost all
> memory of reviewing similar patches from you.
>
>
> Helge - could you pick the reviewed patches from:
> https://lore.kernel.org/all/20220607192335.1137249-1-steve@sk2.org/
> [This is the same mail as Stephen refer to above - looked up via lore].

I just pulled those 7 patches into fbdev/for-next.
If you need more, please let me know,

Thanks!
Helge


>
> Stephen - I expect Daniel/Lee to take care of the patches from yesterday=
.
> If you can look up other pending patches from you please do so, so we
> can have them applied.
> Preferably with links to lore - as this makes it easier to apply them.
>
> Review of what is unique in this set would be appreciated.
>
> 	Sam

