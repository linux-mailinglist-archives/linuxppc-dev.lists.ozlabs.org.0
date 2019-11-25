Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04B108820
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 06:15:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LwFv3FC9zDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 16:14:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lvy42JLmzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 16:01:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Lvy31TZzz9sP3;
 Mon, 25 Nov 2019 16:01:15 +1100 (AEDT)
Date: Mon, 25 Nov 2019 16:01:13 +1100
User-Agent: K-9 Mail for Android
In-Reply-To: <87v9r8g3oe.fsf@dja-thinkpad.axtens.net>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
 <87ef0vpfbc.fsf@mpe.ellerman.id.au> <87v9r8g3oe.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: lockdep warning while booting POWER9 PowerNV
To: Daniel Axtens <dja@axtens.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Bart Van Assche <bvanassche@acm.org>, Qian Cai <cai@lca.pw>
From: Michael Ellerman <michael@ellerman.id.au>
Message-ID: <EA225D34-2394-4C77-B989-38C275818590@ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25 November 2019 12:12:01 pm AEDT, Daniel Axtens <dja@axtens=2Enet> wro=
te:
>Hi Michael,
>
>>>> Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH)
>would generate
>>>> a warning in lockdep_register_key() at,
>>>>=20
>>>> if (WARN_ON_ONCE(static_obj(key)))
>>>>=20
>>>> because
>>>>=20
>>>> key =3D 0xc0000000019ad118
>>>> &_stext =3D 0xc000000000000000
>>>> &_end =3D 0xc0000000049d0000
>>>>=20
>>>> i=2Ee=2E, it will cause static_obj() returns 1=2E
>>>
>>> (back from a trip)
>>>
>>> Hi Qian,
>>>
>>> Does this mean that on POWER9 it can happen that a dynamically
>allocated=20
>>> object has an address that falls between &_stext and &_end?
>>
>> I thought that was true on all arches due to initmem, but seems not=2E
>>
>> I guess we have the same problem as s390 and we need to define
>> arch_is_kernel_initmem_freed()=2E
>>
>> Qian, can you try this:
>>
>> diff --git a/arch/powerpc/include/asm/sections=2Eh
>b/arch/powerpc/include/asm/sections=2Eh
>> index 4a1664a8658d=2E=2E616b1b7b7e52 100644
>> --- a/arch/powerpc/include/asm/sections=2Eh
>> +++ b/arch/powerpc/include/asm/sections=2Eh
>> @@ -5,8 +5,22 @@
>> =20
>>  #include <linux/elf=2Eh>
>>  #include <linux/uaccess=2Eh>
>> +
>> +#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
>> +
>>  #include <asm-generic/sections=2Eh>
>> =20
>> +extern bool init_mem_is_free;
>> +
>> +static inline int arch_is_kernel_initmem_freed(unsigned long addr)
>> +{
>> +	if (!init_mem_is_free)
>> +		return 0;
>> +
>> +	return addr >=3D (unsigned long)__init_begin &&
>> +		addr < (unsigned long)__init_end;
>> +}
>> +
>>  extern char __head_end[];
>> =20
>>  #ifdef __powerpc64__
>>
>
>This also fixes the following syzkaller bug:
>https://syzkaller-ppc64=2Eappspot=2Ecom/bug?id=3Dcfdf75cd985012d0124cd41e=
6fa095d33e7d0f6b
>https://github=2Ecom/linuxppc/issues/issues/284
>
>Would you like me to do up a nice commit message for it?

That'd be great, thanks=2E

cheers
