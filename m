Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204696E8060
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 19:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1nq209lQz3fR7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 03:29:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ZmsCl4VX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ZmsCl4VX;
	dkim-atps=neutral
X-Greylist: delayed 327 seconds by postgrey-1.36 at boromir; Thu, 20 Apr 2023 03:29:00 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1np41LtXz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 03:28:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1681925334; i=deller@gmx.de;
	bh=C5yrQi1O5H/ZJ6i2wZhc9S+TYhhPSe8koYmOSkrsxpg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZmsCl4VXvitbCRVdUkBdlfI2alparlkCERuNbgnY7uFetwUgClkeBi4gOjmBAqd8K
	 rxkZFLoL7KBGe43vgpDjJhI9Tk+3toIQtbOPE0A5czZXGzMHog6tWDlNydgRDVeQxI
	 18gI+1YqhcLDEMfNUMmqT273oEXsIpfSy4N+QeUQcrJBNlZ7DsCkzGpHT4p7Nkf0KQ
	 vniRppU4X1gtB6DtcBD0fr1qcYEOp2Lht8plYj1fD8q3Oc6iaUvKUUDcu/gK4JEzO5
	 9evkgKh2Nk7bDEHYASQWUUZ9+P3pZ7S4rgxMSnALNFLfWEg4xT6ndfwpUZ8Cr+CwD7
	 wBa1i16YR47Qg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.144.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatVb-1qRYCj0P8t-00cRzi; Wed, 19
 Apr 2023 19:22:54 +0200
Message-ID: <b1f90fa4-85c7-e785-ba14-f32962f87d5e@gmx.de>
Date: Wed, 19 Apr 2023 19:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/19] arch: Consolidate <asm/fb.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230417125651.25126-1-tzimmermann@suse.de>
 <1641007d-7953-426a-a3de-ca9c90f6c5a9@app.fastmail.com>
 <5fa98536-a4b0-7b71-7342-9ba05158062f@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <5fa98536-a4b0-7b71-7342-9ba05158062f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H9qZXkCOPDN+3vsO7z+9ttDKPCRSFaiF/4cDmiO5ovofGlBxTzT
 kMlRPG3r4Q6KYGeHBb//fU40kwtmWj1gVkdx7p7FELLCFOD5Nql8qYPGjnWefhzsS88zNIK
 xaqD2s84khdceDbFsitlOpU2HidQYYXlykQQ9SD+p1IgyfdLRLZnqUmFoBDr2Oq3uB/Hpmu
 vy6bniwylk05WNGd4sCJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JkuuhQTF31w=;L+yIwDUJ+AXwy27/xZlNldQZIxM
 ZndB806O4sJYo7gNJlDnQvJOJ3qya+xdPNud87tENN/4Wtbco1yfPL/qNys1opwGEGvkEeq8F
 nCiQYohKL5+TvZLCZQ5qjIPml/dGguzb5CIZmkr6fzC/X0jrXlMm8pmzmz7SqA1JTsTyI92zA
 rbXUd38iqhnoIrCKtupAcPi+nrmdP/dAkRtta6PfNzgAK35JT/3QlwC7Fw6FVx4Tv3hBCP0Ab
 KmvHEAzslBFQ+wM4h8sM0PF6OyDCoCKU4vaRcmbZ4s7eJRS85nImghPCaY+CtG2yQ+W+ldTvC
 M7+uODp8Jz6Zbf/GVuqDcwc3FCx2mPYZGdCD5MXlIv16W1ozCpaI11s0GhKbbhcKcMRWTT9J/
 Vy+6Eqf5QOF3rNPy0pdw5SwERbIcSyG6rnGDIB4r6H/x1Fg7lpI9WkmGs3NMXdDzr53//56MO
 NYBE3NMvNMjQlpw8D4cpOrkWNb3BEXdCj00Bdy/uZjoVnGyX649xC586ABXlMzYRJEb/ubSum
 SHUD6SCHykIGSurFcOUQw75QsrwBzULu28EgOXg54OyO58RtajmZMqPwNzcTxBJ9Za8oaGWmw
 5jDRcxg9X+kyt1IPIsthIycfCg3lhSIZUA24lF3sFWUijWtyzbDOygnDweU05unOizKPuV7a4
 k3npJ6ZxkiX1KrLjOUIYlW8yobiXQ1c9YIEKGkDvJiPBNS0GAQhIEYTx2XbHs1TtdqRnDpXng
 eK6ViZlYIlX8PfwqN0liN4mjYEVcTPb+CHTKCIQDCZAuIHgU3n5MdzsKScm47eUCtttEyG5jo
 9Hih5943EzjVlq/m4Hmbxpyzr54KHjNOIf02GnLFzxU/RHG223/15lVZB64R/5eMlAFwOc2F8
 VQz2VKfk1RpNaUFdCkt+i28hqSxoHKc2XhxcD409x6EubflhzhyrDFbWHdrvUbipNZIfj3JbG
 pemUaXlsB5VMSk2TadDPs1wT6r0=
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

> Am 17.04.23 um 16:12 schrieb Arnd Bergmann:>> On Mon, Apr 17, 2023, at 1=
4:56, Thomas Zimmermann wrote:
>>> Various architectures provide <asm/fb.h> with helpers for fbdev
>>> framebuffer devices. Share the contained code where possible. There
>>> is already <asm-generic/fb.h>, which implements generic (as in
>>> 'empty') functions of the fbdev helpers. The header was added in
>>> commit aafe4dbed0bf ("asm-generic: add generic versions of common
>>> headers"), but never used.
>>>
>>> Each per-architecture header file declares and/or implements fbdev
>>> helpers and defines a preprocessor token for each. The generic
>>> header then provides the remaining helpers. It works like the I/O
>>> helpers in <asm/io.h>.
>>
>> Looks all good to me,
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks a lot. I know that Helge wants to test the PARISC changes, so
> I'll keep this series pending for a bit longer. I'd like to merge the
> patches through the DRM tree, if no one objects.

Yes, patch is good and I've tested it on parisc. Thanks!

You may add:
Acked-by: Helge Deller <deller@gmx.de>
to the series and take it through the drm tree.

Helge
