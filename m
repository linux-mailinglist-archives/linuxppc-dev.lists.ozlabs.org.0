Return-Path: <linuxppc-dev+bounces-1865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7625B995E40
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 05:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNf0v1QcGz2yGC;
	Wed,  9 Oct 2024 14:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728445519;
	cv=none; b=iq4BSdT3SWbSRuDreSMg0EjbDIwQyqtGvBmw3mEIkcX4e6JRpRGi3GfqVZTf47G7gfvyqAIHh61ftC1jClPB/xERuV4K4GwQhwOpmj6AJkfFS1SE3tjAiOuiN9H3EXfdlx9xhVg+jhy1VDPRjv7qY1rYDj/2ZqiEpx9ejLlBto8+cTpH0AQmokdt7cJlHU79NLbPNb0zs1lIt6qN8R3iWfi1LmHacn3gibsG8RdddXU2Jxzen21wS1y6Vb5rLCL1wjuWxov+XvJ7n7f8b5s6ob5JkNQ44Iq1iltU/++tFZcdtfYfgN/+lG79MyPZjJ1+5tupfTpS1cPLuKzJVgN6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728445519; c=relaxed/relaxed;
	bh=pZuu3o1/QXy3Kpc4hDvCdZCAIADV5doFTEXg/x1Cdbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQpzhgYYVBf8jNcUISqLrOjlRmd0Kh7lXOfR7J41wJwj7ZA7AXyvb8Xbn1WzUZ2MCCM9irA0JExr1Iq0N+3ScAHrNnGyBuWk2Io4Z1R+dvlT/iTOIax9FJdtBNOeAfD+q+EjgqqAJm9qS5YIofBGJ0cg7L16/wbSsPIbSbtTQhzA8kl+LVtXZ8xU9kiD6O4Pxd+2Ruf2uNz1FwayKdLs6s0l6ubr67SKADU465EzTLrZA7YNp4V/9xJ9vt45qRIfyqqNKwFyXSneTEKeMx6/LSfZ+1dSOvt5HvR7xSvZ34QRorJxHTQSvDB/6VCFXpX54ud+qr3bMsi2gH5dXTbrJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cRkNNU4A; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cRkNNU4A;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNf0s100Xz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 14:45:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728445516;
	bh=pZuu3o1/QXy3Kpc4hDvCdZCAIADV5doFTEXg/x1Cdbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cRkNNU4AAaf7i2pxNnIvQgJWOUqs5VTwvNgWJ3ecwGcdUc6A1+B8U8K6tE8sP67/x
	 tDg1X3o7yk2YK6779HDVAJK6mDWgf000Q8Sy2zW5Zn+ftAfkmk/In5s6WiGZu/mVaw
	 Ou5fU5tnqcrc3W6eu1zJOlg26kxhIzliWWAFzrsw54GFrBembr7Ets2MLDr3RISkpl
	 OfmiKoBpXk6M3AycrIVZKcrTQh9V47HwMx7P8KjLTBZrAv1tfCsZhUOYL0gJSG4CxQ
	 dlobwTaYZWmguYIfqBr/NdOQEbLE1NYv7fXPwi030OYYgeUHfAX3QQwNx4DbP16HYq
	 BXH34Z3xxc6rQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNf0q6plnz4wnr;
	Wed,  9 Oct 2024 14:45:15 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Peter Bergner
 <bergner@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/vdso: Should VDSO64 functions be flagged as
 functions like VDSO32 ?
In-Reply-To: <6abb373f-10fc-470e-b52a-05e990ee2961@csgroup.eu>
References: <6fa86f3de610ffc180ae0f5dbd511453e7473b36.1726208058.git.christophe.leroy@csgroup.eu>
 <875xqtr8qw.fsf@mail.lhotse>
 <6abb373f-10fc-470e-b52a-05e990ee2961@csgroup.eu>
Date: Wed, 09 Oct 2024 14:45:15 +1100
Message-ID: <87frp66it0.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Michael,
>
> Le 18/09/2024 =C3=A0 04:33, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> On powerpc64 as shown below by readelf, vDSO functions symbols have
>>> type NOTYPE.
>>>
>>> $ powerpc64-linux-gnu-readelf -a arch/powerpc/kernel/vdso/vdso64.so.dbg
>>> ELF Header:
>>>    Magic:   7f 45 4c 46 02 02 01 00 00 00 00 00 00 00 00 00
>>>    Class:                             ELF64
>>>    Data:                              2's complement, big endian
>>>    Version:                           1 (current)
>>>    OS/ABI:                            UNIX - System V
>>>    ABI Version:                       0
>>>    Type:                              DYN (Shared object file)
>>>    Machine:                           PowerPC64
>>>    Version:                           0x1
>>> ...
>>>
>>> Symbol table '.dynsym' contains 12 entries:
>>>     Num:    Value          Size Type    Bind   Vis      Ndx Name
>>> ...
>>>       1: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LI=
NUX_2.6.15
>>> ...
>>>       4: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>>>       5: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __[...]@@LI=
NUX_2.6.15
>>>
>>> Symbol table '.symtab' contains 56 entries:
>>>     Num:    Value          Size Type    Bind   Vis      Ndx Name
>>> ...
>>>      45: 0000000000000000     0 OBJECT  GLOBAL DEFAULT  ABS LINUX_2.6.15
>>>      46: 00000000000006c0    48 NOTYPE  GLOBAL DEFAULT    8 __kernel_ge=
tcpu
>>>      47: 0000000000000524    84 NOTYPE  GLOBAL DEFAULT    8 __kernel_cl=
ock_getres
>>>
>>> To overcome that, commit ba83b3239e65 ("selftests: vDSO: fix vDSO
>>> symbols lookup for powerpc64") was proposed to make selftests also
>>> look for NOTYPE symbols, but is it the correct fix ?
>>>
>>> VDSO32 functions are flagged as functions, why not VDSO64 functions ?
>>> Is it because VDSO functions are not traditional C functions using
>>> the standard API ?
>>=20
>> Yes. There's some explanation in the original commit:
>>=20
>>      Note that the symbols exposed by the vDSO aren't "normal" function =
symbols, apps
>>      can't be expected to link against them directly, the vDSO's are bot=
h seen
>>      as if they were linked at 0 and the symbols just contain offsets to=
 the
>>      various functions.  This is done on purpose to avoid a relocation s=
tep
>>      (ppc64 functions normally have descriptors with abs addresses in th=
em).
>>      When glibc uses those functions, it's expected to use it's own tram=
polines
>>      that know how to reach them.
>>=20
>>  From https://github.com/mpe/linux-fullhistory/commit/5f2dd691b62da9d9cc=
54b938f8b29c22c93cb805
>>=20
>> The descriptors it's talking about are the OPD function descriptors used
>> on ABI v1 (big endian).
>>=20
>>> But it is exactly the same for VDSO32 functions, allthough they are
>>> flagged as functions.
>>=20=20=20
>> It's not quite the same because of the function descriptors.
>>=20
>> On ppc64/ABIv1 a function pointer for "F" points to an opd, which then
>> points to ".F" which has the actual text. It's the ".F" symbol that has
>> type "function".
>>=20
>>> So lets flag them as functions and revert the selftest change.
>>>
>>> What's your opinion on that ?
>>=20
>> I think it's fine on ppc64le, I worry slightly that it risks breaking
>> glibc or something else on big endian.
>>=20
>> It is more correct for the text symbol to have type function, even if
>> there's no function descriptor for it.
>>=20
>> glibc has a special case already for handling the VDSO symbols which
>> creates a fake opd pointing at the kernel symbol. So changing the VDSO
>> symbol type to function shouldn't affect that AFAICS.
>>=20
>> I think the only cause of breakage would be if something is explicitly
>> looking for NOTYPE symbols, which seems unlikely, but you never know.
>>=20
>> So I think we could attempt to take this change for v6.13, giving it
>> lots of time to get some test coverage in next before going to mainline.
>
> Will you take the RFC as is for 6.13 or would you like me to include the=
=20
> above explainations and repost as non-RFC ?

If you can come up with a consolidated changelog and post a non-RFC
version that would help, thanks.

cheers

