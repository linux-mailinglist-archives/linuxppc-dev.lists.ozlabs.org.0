Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DE648FD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 17:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTtvk0XbHz3c71
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Dec 2022 03:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=hAwEbCco;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=hAwEbCco;
	dkim-atps=neutral
X-Greylist: delayed 321 seconds by postgrey-1.36 at boromir; Sun, 11 Dec 2022 03:41:01 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NTttj47mQz3bNx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 03:41:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1670690457; bh=hULunELhZdtE1GkCID2SUUW9EZF1DKJ0BvrmvOkyd/U=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hAwEbCcoWJ/q0lH9bINboeiPxKxMCqPiGpc+WSHiJZjmwSitA2ueLTenJoW+rPeMs
	 J8wNn1BwPjJT6sxJhBYavYBVbVZsbk5E1QoC1+IZ9lXRfb6mMl2wFNSyGvCzpZCkPx
	 U8zkwD4E2u6fFyvnUp/qp6bU2rWqK88v03Dx7xhrbubhOhsjNo/4IGaqDvzrAo7hVe
	 CRlT3O403uFg4l3RdSyh+bnAhqXYoYcLDujJaeSdDSQfvEVO2m/rDevQKsHWv/FtAM
	 iYHvzchwenu4VBiC83heJC8TCDWdGY7VrEKLOZbsps4EIRLvpLMDcH+Hj3L+5mDtu1
	 Gp0PTGll8EPaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.157.120]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBDj4-1pESvq0s9e-00CjAD; Sat, 10
 Dec 2022 17:35:08 +0100
Message-ID: <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>
Date: Sat, 10 Dec 2022 17:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] fbdev: make offb driver tristate
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221126000401.25302-1-rdunlap@infradead.org>
 <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3Q0WJF64Q10zFZW6VO/GCqoYxns0l0hOMM9nr71J/mwrFHaUIW0
 hHaa21eYA8KaBbR8FgN6lOCWFk6XJsBMqiz2o0hSJFz8baJzpzOmfJhel4aAbnw3E07zDZ4
 g/3b042iW+L+MvTBCSUknRi3WUJRyWFHZzydh/p3Wg/R/adLxtJIIcWYI1tvdQinLd8MtjU
 H+4y4GF/teZ1STuzK0M7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:liZ5UrO/QYg=;l2PnyWectd3j8pkgT5cBE6bb/C3
 /jtPg5GsYUd6lZUOrs86xNQl29CnIMAyzYdqCUzbl2zcn2Fh9b8Vq/khwMyPDqj8VaZHaUrSg
 F7i/dACeFahyqq557Qo9PScrnkORc5wNQm5kq0Tjz40C7zp6K/MPQ9rdBBsd6fDJ+sZ95JjdW
 TEpODUgneTg2c2ck0AmP4jp4lLdCHowjCGMAHJM0lVWJaKYGiSSGtR4QKevdJDbYKobemGu/4
 LSJffiGQP3lloEk1OEIjcKMkQR7oSvfbCRCJXYDVzod6KVhra6XlX3LHDqjt5cNA/9Tn4dEMQ
 QFev19QJJ6ZDI4u2ei3p/Pv/B6Vl7U8ItoXoLQzbfm4Z1NYuP3AZo4cm+wIivMh/Vd7P8v/Z3
 jMha3ikpEwi/YOlwrprEVSegI6jR81b/bwQGmGSFfFem7Tx8u3LUCLdRTpTkoH6/eDa6O2YGc
 OVjHHNjQhvWa4/XxMqOssulJTzLMrNdfJjt6tMb+FgH0H5UnevMOy3fYPTvd9EQRvWidTvLEx
 bU1PeILUtlma336mXB1ymRG4U9fgL4cQpiurrg5UaC/S2XhlOJSrPLg7FZb+cuNAdUUMdjAYv
 RwPJRC3jFNP17k9GIhMoJIiDORlOyTe33B/3XKg5jfa6gFJvD+9Fh/2SDAu8Jo0ZOdONalUUE
 lYKMfzHx7BwlumMfGfQtw4wHoC51GwgXOn7BTwoTCNm3yaegL72qimgdX+Q24YUjKA0tEd+g6
 Xf6duosBfl7tnYGOjWFX4JdwwEEVV37g4rR/D69NJ+wiGgToFek9reAaz9iZ0yBFPIxDY2mt+
 GMJ6lquXreCEXxOTeRUA9gshCFm2IxyMdnBIHpIIYvvHc0Rvllut0NqIkqlEBTqKHJ3XHpGQq
 GMk9nwt5zCoSFSa3257rSr9GREgq2qPcrtNmuEKhEwswYPjw5TDf76xIlMYWh4Sq0HA0Ya69J
 JqS10Q==
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/26/22 14:40, Thomas Zimmermann wrote:
> Am 26.11.22 um 01:04 schrieb Randy Dunlap:
>> Make the offb (Open Firmware frame buffer) driver tristate,
>> i.e., so that it can be built as a loadable module.
>>
>> However, it still depends on the setting of DRM_OFDRM
>> so that both of these drivers cannot be builtin at the same time
>> nor can one be builtin and the other one a loadable module.
>>
>> Build-tested successfully with all combination of DRM_OFDRM and FB_OF.
>>
>> This fixes a build issue that Michal reported when FB_OF=3Dy and
>> DRM_OFDRM=3Dm:
>>
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): und=
efined reference to `cfb_fillrect'
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): und=
efined reference to `cfb_copyarea'
>> powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): und=
efined reference to `cfb_imageblit'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Michal Such=C3=A1nek <msuchanek@suse.de>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Helge Deller <deller@gmx.de>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

applied.

Thanks!
Helge



>>
>> ---
>> =C2=A0 drivers/video/fbdev/Kconfig |=C2=A0=C2=A0=C2=A0 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -456,8 +456,8 @@ config FB_ATARI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chipset found in Ataris.
>> =C2=A0 config FB_OF
>> -=C2=A0=C2=A0=C2=A0 bool "Open Firmware frame buffer device support"
>> -=C2=A0=C2=A0=C2=A0 depends on (FB =3D y) && PPC && (!PPC_PSERIES || PC=
I)
>> +=C2=A0=C2=A0=C2=A0 tristate "Open Firmware frame buffer device support=
"
>> +=C2=A0=C2=A0=C2=A0 depends on FB && PPC && (!PPC_PSERIES || PCI)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on !DRM_OFDRM
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select APERTURE_HELPERS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select FB_CFB_FILLRECT
>

