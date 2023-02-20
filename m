Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46169C522
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 07:11:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKsW221vLz3c9x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 17:11:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fUif1Qrx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKsV43rSQz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 17:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fUif1Qrx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKsTz2rJ5z4x7y;
	Mon, 20 Feb 2023 17:10:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676873431;
	bh=xWuZzIeJyguF5sAUFZLUh7zZT50AAbSN88z0OFx2Rz8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fUif1QrxaZPklVV4/eND4zOAYUjGnPGb6iKSslqzPSrr3ozP8BfIwkkfkgw+kYQDd
	 P52ELcdhB8T/YK+DJKDwJH+9L9E0XLpiJy+x9H+ymnETsnI5b2XWJKTz+xyv9X+siU
	 3Yqm5JwfEtCqrri72Z4gNkg+Q3GX39HjKmVWdzIV0fDUmDmCPsIV33/kKfKFBEuhzC
	 gXtajkYq9FYOe5UbPT5erqUmLLCB45EIIkXwJsh4S/ZCiH/miD79SJmNp9KvOGlIMs
	 OxcPuutHebqOmWCYp7SN+pDm0rhnV6aH3k14EtK0weCoPOyHjVmErUA+4JUvAXUaGm
	 4j6jtG66VoDfg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Rohan McLure
 <rmclure@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/{32,book3e}: kcsan: Extend KCSAN Support
In-Reply-To: <ec61d8c8-b7e5-9a76-4400-47c513f92943@csgroup.eu>
References: <20230216050938.2188488-1-rmclure@linux.ibm.com>
 <20230216050938.2188488-2-rmclure@linux.ibm.com>
 <319e4663-2732-4974-5642-f0c1ef98d08a@csgroup.eu>
 <9B8ABAF9-22DE-43A6-AADE-9B3165FD3522@linux.ibm.com>
 <ec61d8c8-b7e5-9a76-4400-47c513f92943@csgroup.eu>
Date: Mon, 20 Feb 2023 17:10:30 +1100
Message-ID: <87zg98yii1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 17/02/2023 =C3=A0 00:23, Rohan McLure a =C3=A9crit=C2=A0:
>>> On 16 Feb 2023, at 6:14 pm, Christophe Leroy <christophe.leroy@csgroup.=
eu> wrote:
>>> Le 16/02/2023 =C3=A0 06:09, Rohan McLure a =C3=A9crit :
>>>> Enable HAVE_ARCH_KCSAN on all powerpc platforms, permitting use of the
>>>> kernel concurrency sanitiser through the CONFIG_KCSAN_* kconfig option=
s.
>>>>
>>>> Boots and passes selftests on 32-bit and 64-bit platforms. See
>>>> documentation in Documentation/dev-tools/kcsan.rst for more informatio=
n.
>>>>
>>>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>>>> ---
>>>> New patch
>>>> ---
>>>>   arch/powerpc/Kconfig | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 2c9cdf1d8761..45771448d47a 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -197,7 +197,7 @@ config PPC
>>>>    select HAVE_ARCH_KASAN if PPC_RADIX_MMU
>>>>    select HAVE_ARCH_KASAN if PPC_BOOK3E_64
>>>>    select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
>>>> - select HAVE_ARCH_KCSAN             if PPC_BOOK3S_64
>>>> + select HAVE_ARCH_KCSAN
>>>
>>> So that's a followup of a not yet posted version v5 of the other series=
 ?
>>> Why not just add patch 1 in that series and have KCSAN for all powerpc
>>> at once ?
>>=20
>> So the v3 was accepted upstream, likely to appear in 6.3. This patch ser=
ies is
>> just to extend support to other platforms, once kcsan supports us.
>
> Hum ... Ok.
>
> I checked in checkpatch before writting that mail and saw that v4 was=20
> flagged "changes requested", so I didn't notice v3 was accepted.

Sorry that's my fault. I talked to Rohan on chat and decided that taking
v3 was the best way to get something in before the merge window closed.

cheers
