Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C11786B4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:52:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XDMv5zMQzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 10:52:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XDKf1d2nzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 10:50:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=N4g1wE7K; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48XDKf08Vxz9sR4; Wed,  4 Mar 2020 10:50:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48XDKd5mK1z9sQt;
 Wed,  4 Mar 2020 10:50:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583279445;
 bh=jIAOPQKCO+U1i5EZjrRUtjdww0KdhVgFTKvIXCCmMg4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=N4g1wE7K6hIjna45B7a/5iWJ36pWQ0rt0IbMYed73fWKpJQYBZ1bD6NpN6pGa3IbB
 GQx4xgbCcJZS6PkGzJ+eYPRJJ39r5AIKdenpClSHSkt1oKQI4joP4rTDlHlKrcw82d
 9T3cXoSwybhPZNEvy3CF4eCWbePe0oUpXZKOrHGX6O2sACINOT1iPG76Ojde+CETCo
 vuD5aeprguCAcsUmWGumH0nhz6R5opGLinAIhveus7DctgItZJ504n6aCdKWt5Fotv
 YUN2/YincBrQ4o/+5npr1byvJfS6EA4maiShnlHfWeAk7vsPZg3+knbbg9VBzNeNXR
 F4G9zQ5kbZ2BA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Fix missing KUAP disable in
 flush_coherent_icache()
In-Reply-To: <2ad423ee-590b-9198-7fc3-ea6f8900ad23@c-s.fr>
References: <20200303125949.27172-1-mpe@ellerman.id.au>
 <2ad423ee-590b-9198-7fc3-ea6f8900ad23@c-s.fr>
Date: Wed, 04 Mar 2020 10:50:45 +1100
Message-ID: <87sgipq9pm.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 03/03/2020 =C3=A0 13:59, Michael Ellerman a =C3=A9crit=C2=A0:
>> We received a report of strange kernel faults which turned out to be
>> due to a missing KUAP disable in flush_coherent_icache() called
>> from flush_icache_range().
>>=20
>> The fault looks like:
>>=20
>>    Kernel attempted to access user page (7fffc30d9c00) - exploit attempt=
? (uid: 1009)
>>    BUG: Unable to handle kernel data access on read at 0x7fffc30d9c00
>>    Faulting instruction address: 0xc00000000007232c
>>    Oops: Kernel access of bad area, sig: 11 [#1]
>>    LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA PowerNV
>>    CPU: 35 PID: 5886 Comm: sigtramp Not tainted 5.6.0-rc2-gcc-8.2.0-0000=
3-gfc37a1632d40 #79
>>    NIP:  c00000000007232c LR: c00000000003b7fc CTR: 0000000000000000
>>    REGS: c000001e11093940 TRAP: 0300   Not tainted  (5.6.0-rc2-gcc-8.2.0=
-00003-gfc37a1632d40)
>>    MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800=
0884  XER: 00000000
>>    CFAR: c0000000000722fc DAR: 00007fffc30d9c00 DSISR: 08000000 IRQMASK:=
 0
>>    GPR00: c00000000003b7fc c000001e11093bd0 c0000000023ac200 00007fffc30=
d9c00
>>    GPR04: 00007fffc30d9c18 0000000000000000 c000001e11093bd4 00000000000=
00000
>>    GPR08: 0000000000000000 0000000000000001 0000000000000000 c000001e110=
4ed80
>>    GPR12: 0000000000000000 c000001fff6ab380 c0000000016be2d0 40000000000=
00000
>>    GPR16: c000000000000000 bfffffffffffffff 0000000000000000 00000000000=
00000
>>    GPR20: 00007fffc30d9c00 00007fffc30d8f58 00007fffc30d9c18 00007fffc30=
d9c20
>>    GPR24: 00007fffc30d9c18 0000000000000000 c000001e11093d90 c000001e110=
4ed80
>>    GPR28: c000001e11093e90 0000000000000000 c0000000023d9d18 00007fffc30=
d9c00
>>    NIP flush_icache_range+0x5c/0x80
>>    LR  handle_rt_signal64+0x95c/0xc2c
>>    Call Trace:
>>      0xc000001e11093d90 (unreliable)
>>      handle_rt_signal64+0x93c/0xc2c
>>      do_notify_resume+0x310/0x430
>>      ret_from_except_lite+0x70/0x74
>>    Instruction dump:
>>    409e002c 7c0802a6 3c62ff31 3863f6a0 f8010080 48195fed 60000000 48fe4c=
8d
>>    60000000 e8010080 7c0803a6 7c0004ac <7c00ffac> 7c0004ac 4c00012c 3821=
0070
>>=20
>> This path through handle_rt_signal64() to setup_trampoline() and
>> flush_icache_range() is only triggered by 64-bit processes that have
>> unmapped their VDSO, which is rare.
>>=20
>> flush_icache_range() takes a range of addresses to flush. In
>> flush_coherent_icache() we implement an optimisation for CPUs where we
>> know we don't actually have to flush the whole range, we just need to
>> do a single icbi.
>>=20
>> However we still execute the icbi on the user address of the start of
>> the range we're flushing. On CPUs that also implement KUAP (Power9)
>> that leads to the spurious fault above.
>>=20
>> We should be able to pass any address, including a kernel address, to
>> the icbi on these CPUs, which would avoid any interaction with KUAP.
>> But I don't want to make that change in a bug fix, just in case it
>> surfaces some strange behaviour on some CPU.
>>=20
>> So for now just disable KUAP around the icbi. Note the icbi is treated
>> as a load, so we allow read access, not write as you'd expect.
>>=20
>> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
>> Cc: stable@vger.kernel.org # v5.2+
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/mm/mem.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index ef7b1119b2e2..184850d9d000 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -373,7 +373,9 @@ static inline bool flush_coherent_icache(unsigned lo=
ng addr)
>>   	 */
>>   	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
>>   		mb(); /* sync */
>> +		allow_read_from_user((void *)addr, 4);
>
> I know that's ignored on Radix, but shouldn't we use L1_CACHE_BYTES as a=
=20
> length ?

Yes you're right, I actually meant to do that but forgot.

Will send a v2.

cheers
