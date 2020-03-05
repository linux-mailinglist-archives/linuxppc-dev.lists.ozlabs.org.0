Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E632117A055
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 07:59:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y1p13nGyzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 17:59:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y1fx4GMzzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 17:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Up6N9Oca; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y1fw1CmHz9sPK;
 Thu,  5 Mar 2020 17:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583391209;
 bh=8jCSNDpZcyYP36tXG3jftwqgQjsPgFR5ySfAmBMic1Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Up6N9Oca0A4fJyoJhjHtJSUPcNOPC4eIpQwOenrqS63oJsSK3004yhhhAfuSxL4nL
 ean+CPl9S73o3P3+fxKXFTRSnQWGu42/CyrnRbede8bi0cxeeouIpZNZwL70MOhlpd
 T4gSkHKxH1pL6jxp+kZ3B70VepZniCXmZVHZjMO5aE17rtuDs2+pgKaSEwNqy7r3Tp
 v6amiaYPXkYIQmtDgD62LWUyx1B0GgHdp2hY8Ie+Cb5l1xDeoB41fn34uHlHY+AXgl
 RT35zKEsk8wGZguUmriTYLVARwyEw+4sGJII7TCKQ/3YUXj7Ev4gBm3EYTvsKX58yX
 CgjygTBuJ+2Uw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>,
 akpm@linux-foundation.org
Subject: Re: [PATCH -next] powerpc/mm/ptdump: fix an undefined behaviour
In-Reply-To: <3b724167-6bd2-f281-c6ee-fcb39cb9e24b@c-s.fr>
References: <20200305044759.1279-1-cai@lca.pw>
 <3b724167-6bd2-f281-c6ee-fcb39cb9e24b@c-s.fr>
Date: Thu, 05 Mar 2020 17:53:25 +1100
Message-ID: <8736anqom2.fsf@mpe.ellerman.id.au>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, rashmicy@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 05/03/2020 =C3=A0 05:47, Qian Cai a =C3=A9crit=C2=A0:
>> Booting a power9 server with hash MMU could trigger an undefined
>> behaviour because pud_offset(p4d, 0) will do,
>>=20
>> 0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)
>>=20
>>   UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
>>   shift exponent 34 is too large for 32-bit type 'int'
>>   CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
>>   Call Trace:
>>   dump_stack+0xf4/0x164 (unreliable)
>>   ubsan_epilogue+0x18/0x78
>>   __ubsan_handle_shift_out_of_bounds+0x160/0x21c
>>   walk_pagetables+0x2cc/0x700
>>   walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
>>   (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
>>   ptdump_check_wx+0x8c/0xf0
>>   mark_rodata_ro+0x48/0x80
>>   kernel_init+0x74/0x194
>>   ret_from_kernel_thread+0x5c/0x74
>>=20
>> Fixes: 8eb07b187000 ("powerpc/mm: Dump linux pagetables")
>> Signed-off-by: Qian Cai <cai@lca.pw>
>> ---
>>=20
>> Notes for maintainers:
>>=20
>> This is on the top of the linux-next commit "powerpc: add support for
>> folded p4d page tables" which is in the Andrew's tree.
>>=20
>>   arch/powerpc/mm/ptdump/ptdump.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/pt=
dump.c
>> index 9d6256b61df3..b530f81398a7 100644
>> --- a/arch/powerpc/mm/ptdump/ptdump.c
>> +++ b/arch/powerpc/mm/ptdump/ptdump.c
>> @@ -279,7 +279,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud=
, unsigned long start)
>>=20=20=20
>>   static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long st=
art)
>>   {
>> -	pud_t *pud =3D pud_offset(p4d, 0);
>> +	pud_t *pud =3D pud_offset(p4d, 0UL);
>
> Is that the only place we have to do this ?
>
> (In 5.6-rc) I see the same in:
> /arch/powerpc/mm/ptdump/hashpagetable.c
> /arch/powerpc/kvm/book3s_64_mmu_radix.c
>
> Wouldn't it be better to:
> - Either cast addr to unsigned long in pud_index() macro
> - Or change pud_index() macro to a static inline function as x86 ?

Yes, either would be better, but preferably the latter.

It's hostile to require the caller to pass an unsigned long when there's
no way they can know that's required.

cheers
