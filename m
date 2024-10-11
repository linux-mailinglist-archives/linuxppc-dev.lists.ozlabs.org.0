Return-Path: <linuxppc-dev+bounces-2114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87599A2F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 13:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ4bm2FKdz3byZ;
	Fri, 11 Oct 2024 22:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728647220;
	cv=none; b=OKyfTAbFqXzJl60snyQ6rSMRfL+aNK6rlwpZyLg0FkUPoaSI4OIG0tnilR/TNmror+iSXTMnMf9+PsTAmqGkab081r6H4KnY5CsI3+3cY2GeHSdtOxx98diZ7oDhTbhUZwvqp/fry+XVgQKJZEDCuVimMVtaljFZnqNKsXsbJEQGirpLvwCblxdp2lttd5ZjCQbo60CtXIgoT/G6bXpb/FDF/kHwHpjystMa1e9mddenBV2UWbFyGa23hEmapEK/l8CjQnu232LLDYPNOdcOlHpQAtHc6lZDkKIzWMhY4U5oXod0TPent2fCBtIBWY3zXB8RBdDk9akJB55J/oTnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728647220; c=relaxed/relaxed;
	bh=+aymiEDsUlrj4Hj/jd45PcWeDycg9xK7aT88j0B35JQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GLTzDOip776UWZb4h6M4mnUCi2AIgYTIDpy048u9RhVoDcsgi0fJ04tW4gUnkMQ9lilvrz2RJ0wahjI6W1ZZL8PXwnprqDRbyMFYZPWS1TsbXqzB8k6AtSW3EKhriP5YC85nUHyeIK6GKDKy11NvsoUrWNyukbgzGhbOxbXgSbBKSpOjfb+tugt4J7HCGVCh7w31uWIp9qvhxsXVah8FvxyFCRJiUMhYKQ563Gv7I4B9SKCqAfognXNYzQmZR3uob4smcXMbln1m36L7YWNSB6TtEElhs22EN8E2KgYNeKlurjUx8lpYZTi8ofoi9HgmG5yg/KynDynMaJb8c+I46g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=evYR4MD8; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=evYR4MD8;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ4bj40xHz3byF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 22:46:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728647210;
	bh=+aymiEDsUlrj4Hj/jd45PcWeDycg9xK7aT88j0B35JQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=evYR4MD8c7DVLP3cu1vcoLNB+l4FifihAXP9bkKJfWzzBqADJmR/ciZ/c5M37IIcU
	 bJud3Gi5Yr+hfqqf8Q4JOubVufrAFJKbI4irDqPLkn1TDGBfXlOeaT/7d85dEdfkob
	 RRlNuILyY3TrLOvkCLatUQJo9l/fk7aGlOOV1E0Rn15mxW64oEdAcQKuW7wHl7dLYx
	 8lJjJByLPEooWV99nnNffBG5qjh9I3OwSB90EMDjjOIu/+PH4nDKTxFsQsTKZGoWYE
	 PmIhUjLododqZncY7hnmKg9hHUnOZPgmsh8bmulGtzi1gNJkGYjZXWwDIiUX+L+dQs
	 wVwxxcEyQ1wbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQ4bY3H9Vz4xQ2;
	Fri, 11 Oct 2024 22:46:48 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas =?utf-8?Q?Wei?=
 =?utf-8?Q?=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jason@zx2c4.com
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
In-Reply-To: <7c8231ad-683e-4df6-a63f-26985d46316f@csgroup.eu>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
 <0a3d0813-e44f-45be-8b9a-957c75aa26cb@csgroup.eu>
 <20241010110927-9688b27e-6048-48ac-a908-5b80ba8da63e@linutronix.de>
 <7c8231ad-683e-4df6-a63f-26985d46316f@csgroup.eu>
Date: Fri, 11 Oct 2024 22:46:48 +1100
Message-ID: <87r08m6evr.fsf@mail.lhotse>
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
> Le 10/10/2024 =C3=A0 11:12, Thomas Wei=C3=9Fschuh a =C3=A9crit=C2=A0:
>> On Thu, Oct 10, 2024 at 11:00:15AM +0200, Christophe Leroy wrote:
>>> Hi Thomas,
>>>
>>> Le 10/10/2024 =C3=A0 10:20, Thomas Wei=C3=9Fschuh a =C3=A9crit=C2=A0:
>>>> On Wed, Oct 02, 2024 at 10:39:29AM +0200, Christophe Leroy wrote:
>>>>> VDSO time functions do not call any other function, so they don't
>>>>> need to save/restore LR. However, retrieving the address of VDSO data
>>>>> page requires using LR hence saving then restoring it, which can be
>>>>> heavy on some CPUs. On the other hand, VDSO functions on powerpc are
>>>>> not standard functions and require a wrapper function to call C VDSO
>>>>> functions. And that wrapper has to save and restore LR in order to
>>>>> call the C VDSO function, so retrieving VDSO data page address in that
>>>>> wrapper doesn't require additional save/restore of LR.
>>>>>
>>>>> For random VDSO functions it is a bit different. Because the function
>>>>> calls __arch_chacha20_blocks_nostack(), it saves and restores LR.
>>>>> Retrieving VDSO data page address can then be done there without
>>>>> additional save/restore of LR.
>>>>>
>>>>> So lets implement __arch_get_vdso_rng_data() and simplify the wrapper.
>>>>>
>>>>> It starts paving the way for the day powerpc will implement a more
>>>>> standard ABI for VDSO functions.
>>>>>
>>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>>> ---
>>>>>    arch/powerpc/include/asm/vdso/getrandom.h | 15 +++++++++++++--
>>>>>    arch/powerpc/kernel/asm-offsets.c         |  1 -
>>>>>    arch/powerpc/kernel/vdso/getrandom.S      |  1 -
>>>>>    arch/powerpc/kernel/vdso/vgetrandom.c     |  4 ++--
>>>>>    4 files changed, 15 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc=
/include/asm/vdso/getrandom.h
>>>>> index 501d6bb14e8a..4302e7c67aa5 100644
>>>>> --- a/arch/powerpc/include/asm/vdso/getrandom.h
>>>>> +++ b/arch/powerpc/include/asm/vdso/getrandom.h
>>>>> @@ -7,6 +7,8 @@
>>>>>    #ifndef __ASSEMBLY__
>>>>> +#include <asm/vdso_datapage.h>
>>>>> +
>>>>>    static __always_inline int do_syscall_3(const unsigned long _r0, c=
onst unsigned long _r3,
>>>>>    					const unsigned long _r4, const unsigned long _r5)
>>>>>    {
>>>>> @@ -43,11 +45,20 @@ static __always_inline ssize_t getrandom_syscall(=
void *buffer, size_t len, unsig
>>>>>    static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_d=
ata(void)
>>>>>    {
>>>>> -	return NULL;
>>>>> +	struct vdso_arch_data *data;
>>>>> +
>>>>> +	asm(
>>>>> +		"	bcl	20, 31, .+4\n"
>>>>> +		"0:	mflr	%0\n"
>>>>> +		"	addis	%0, %0, (_vdso_datapage - 0b)@ha\n"
>>>>> +		"	addi	%0, %0, (_vdso_datapage - 0b)@l\n"
>>>>> +	: "=3Dr" (data) :: "lr");
>>>>> +
>>>>> +	return &data->rng_data;
>>>>>    }
>>>>
>>>> Did you also try something like this:
>>>>
>>>> extern struct vdso_arch_data _vdso_datapage __attribute__((visibility(=
"hidden")));
>>>>
>>>> static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(=
void)
>>>> {
>>>>          return &_vdso_datapage.rng_data;
>>>> }
>>>>
>>>> Not knowing much about ppc asm the resulting assembly looks simpler.
>>>> And it would be more in line with what other archs are doing.
>>>
>>> Did you build it ?
>>=20
>> Yes, I couldn't have looked at the asm otherwise.
>>=20
>>> I get :
>>>
>>>    VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>>>    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>>> supported
>>> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75:
>>> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
>>=20
>> I forgot to enable CONFIG_COMPAT.
>> It's only broken for the 32 bit case.
>>=20
>>> Current solution gives:
>>>
>>>    24:	42 9f 00 05 	bcl     20,4*cr7+so,28 <__c_kernel_getrandom+0x28>
>>>    28:	7e a8 02 a6 	mflr    r21
>>>    2c:	3e b5 00 00 	addis   r21,r21,0
>>> 			2e: R_PPC_REL16_HA	_vdso_datapage+0x6
>>>    30:	3a b5 00 00 	addi    r21,r21,0
>>> 			32: R_PPC_REL16_LO	_vdso_datapage+0xa
>>>
>>>
>>> Your solution gives:
>>>
>>>    60:	3e e0 00 00 	lis     r23,0
>>> 			62: R_PPC_ADDR16_HA	_vdso_datapage
>>>    64:	3a f7 00 00 	addi    r23,r23,0
>>> 			66: R_PPC_ADDR16_LO	_vdso_datapage
>>>
>>>
>>> So yes your solution looks simpler, but relies on absolute addresses se=
t up
>>> through dynamic relocation which is not possible because different proc=
esses
>>> map the same VDSO datapage at different addresses.
>>=20
>> Due to visibility("hidden"), the compiler should not emit absolute
>> references but PC-relative ones.
>> This is how it works for most other architectures, see
>> include/vdso/datapage.h.
>>=20
>> I'll try to see why this doesn't work for ppc32.
>
> PC-rel instructions only exist on very very recent powerpc CPUs (power10 =
?)
=20
Yeah power10 or later.

> On PPC64, ELF ABI v2 requires caller to put called function address in=20
> r12 and it looks like GCC uses that:
>
> 0000000000000000 <__c_kernel_getrandom>:
>     0:	3c 4c 00 00 	addis   r2,r12,0
> 			2: R_PPC64_REL16_HA	.TOC.+0x2
>     4:	38 42 00 00 	addi    r2,r2,0
> 			6: R_PPC64_REL16_LO	.TOC.+0x6
> ...
>    64:	3d 22 00 00 	addis   r9,r2,0
> 			66: R_PPC64_TOC16_HA	_vdso_datapage+0x100
>    68:	89 29 00 00 	lbz     r9,0(r9)
> 			6a: R_PPC64_TOC16_LO	_vdso_datapage+0x100

Setting up r12 is only required for calls to the global entry point
(offset 0), local calls can be made to offset 8 and use/don't require
r12 to be set. That's because local calls should already have the
correct toc pointer in r2.

But that's not true in VDSO code.

> Which after final link results in:
>
> 0000000000001060 <__c_kernel_getrandom>:
>      1060:	3c 4c 00 01 	addis   r2,r12,1
>      1064:	38 42 8e a0 	addi    r2,r2,-29024
> ...
>      10c4:	3d 22 ff fc 	addis   r9,r2,-4
>      10c8:	89 29 62 00 	lbz     r9,25088(r9)

The call to __c_kernel_getrandom skips over the r2 setup because it's a
local call, even though we haven't setup r2 correctly:

0000000000000758 <__kernel_getrandom>:
     758:       91 ff 21 f8     stdu    r1,-112(r1)
     75c:       a6 02 08 7c     mflr    r0
     760:       91 ff 21 f8     stdu    r1,-112(r1)
     764:       80 00 01 f8     std     r0,128(r1)
     768:       88 00 41 f8     std     r2,136(r1)
     76c:       05 00 9f 42     bcl     20,4*cr7+so,770 <__kernel_getrandom=
+0x18>
     770:       a6 02 08 7d     mflr    r8
     774:       fe ff 08 3d     addis   r8,r8,-2
     778:       90 f8 08 39     addi    r8,r8,-1904
     77c:       fc 00 68 81     lwz     r11,252(r8)
     780:       ff 7f 6b 6d     xoris   r11,r11,32767
     784:       ff ff 6b 69     xori    r11,r11,65535
     788:       34 00 6b 7d     cntlzw  r11,r11
     78c:       de 5b 6b 55     rlwinm  r11,r11,11,15,15
     790:       14 5a 08 7d     add     r8,r8,r11
     794:       d8 02 08 39     addi    r8,r8,728
     798:       41 09 00 48     bl      10d8 <__c_kernel_getrandom+0x8>

We could setup r2, but that would only help 64-bit.

This also makes me notice that we have a mixture of ELF ABI v1 and v2
code in the VDSO, depending on whether the kernel is building itself ABI
v1 or v2:

  arch/powerpc/kernel/vdso/cacheflush-64.o:        ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/datapage-64.o:          ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/getcpu-64.o:            ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/getrandom-64.o:         ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/gettimeofday-64.o:      ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/note-64.o:              ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/sigtramp64-64.o:        ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/vgetrandom-64.o:        ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), n=
ot stripped
  arch/powerpc/kernel/vdso/vgetrandom-chacha-64.o: ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version =
1 (SYSV), not stripped
  arch/powerpc/kernel/vdso/vgettimeofday-64.o:     ELF 64-bit LSB relocatab=
le, 64-bit PowerPC or cisco 7500, OpenPOWER ELF V2 ABI, version 1 (SYSV), n=
ot stripped

All the asm files are ABI v1 because they historically were, and don't
say otherwise. The C code comes out as ABI v1 or v2 depending on what
we're building the kernel as. Which is a bit fishy.

cheers

