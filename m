Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8BF860ACF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 07:29:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EMbblfw+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th0Tf1ywzz3ddR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 17:29:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EMbblfw+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th0Sw5qPfz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 17:28:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708669712;
	bh=duK8hnXiT5n5Kg9Jl3mlaRvQlpDsnm/hT89SUHL4XQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EMbblfw+npK1Q3Mn/yKbvDYOKz990gt2mxRe/pKDzfUO5MmSCSWwf+6OrA7Dudq6c
	 +5KG1qM1lP9Y2K9FTYFTsoJPYDqkpzjB49nwIUw98JTaTjWGRwddM1n099OFADuczR
	 oKYCjD7if+X8fxRGWGSh4wercnbVsRf0mlkvVKvVioJ23X0fhwnlxJgiNby5tww+A9
	 LigYj1NZrc6DUVo+kxwrlqv7xHBMF1WLsifJHiPm8dofCZ7trlDFA51Y0b/Pvy61tT
	 +lU3z1+4NU2ymLY5PAiT01/57BgaB8n715lj5Vj/qw7wkg/SJ2vBR+kUOgG269xPba
	 RX6HRmwsPby9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Th0Sw3sFRz4wbh;
	Fri, 23 Feb 2024 17:28:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Refactor __kernel_map_pages()
In-Reply-To: <4e610204-492d-4e3f-9ae6-7b8084b523f9@csgroup.eu>
References: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
 <8734tlawsw.fsf@mail.lhotse>
 <4e610204-492d-4e3f-9ae6-7b8084b523f9@csgroup.eu>
Date: Fri, 23 Feb 2024 17:28:32 +1100
Message-ID: <87ttlzae3z.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 22/02/2024 =C3=A0 06:32, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> __kernel_map_pages() is almost identical for PPC32 and RADIX.
>>>
>>> Refactor it.
>>>
>>> On PPC32 it is not needed for KFENCE, but to keep it simple
>>> just make it similar to PPC64.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
>>>   arch/powerpc/include/asm/book3s/64/radix.h   |  2 --
>>>   arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 --------------
>>>   arch/powerpc/mm/pageattr.c                   | 19 +++++++++++++++++++
>>>   arch/powerpc/mm/pgtable_32.c                 | 15 ---------------
>>>   5 files changed, 19 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
>>> index 421db7c4f2a4..16b8d20d6ca8 100644
>>> --- a/arch/powerpc/mm/pageattr.c
>>> +++ b/arch/powerpc/mm/pageattr.c
>>> @@ -101,3 +101,22 @@ int change_memory_attr(unsigned long addr, int num=
pages, long action)
>>>   	return apply_to_existing_page_range(&init_mm, start, size,
>>>   					    change_page_attr, (void *)action);
>>>   }
>>> +
>>> +#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>>> +#ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
>>> +void __kernel_map_pages(struct page *page, int numpages, int enable)
>>> +{
>>> +	unsigned long addr =3D (unsigned long)page_address(page);
>>> +
>>> +	if (PageHighMem(page))
>>> +		return;
>>> +
>>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
>>> +		hash__kernel_map_pages(page, numpages, enable);
>>> +	else if (enable)
>>> +		set_memory_p(addr, numpages);
>>> +	else
>>> +		set_memory_np(addr, numpages);
>>> +}
>>=20
>> This doesn't build on 32-bit, eg. ppc32_allmodconfig:
>>=20
>> ../arch/powerpc/mm/pageattr.c: In function '__kernel_map_pages':
>> ../arch/powerpc/mm/pageattr.c:116:23: error: implicit declaration of fun=
ction 'hash__kernel_map_pages' [-Werror=3Dimplicit-function-declaration]
>>    116 |                 err =3D hash__kernel_map_pages(page, numpages, =
enable);
>>        |                       ^~~~~~~~~~~~~~~~~~~~~~
>>=20
>> I couldn't see a nice way to get around it, so ended up with:
>>=20
>> void __kernel_map_pages(struct page *page, int numpages, int enable)
>> {
>> 	int err;
>> 	unsigned long addr =3D (unsigned long)page_address(page);
>>=20
>> 	if (PageHighMem(page))
>> 		return;
>>=20
>> #ifdef CONFIG_PPC_BOOK3S_64
>> 	if (!radix_enabled())
>> 		err =3D hash__kernel_map_pages(page, numpages, enable);
>> 	else
>> #endif
>> 	if (enable)
>> 		err =3D set_memory_p(addr, numpages);
>> 	else
>> 		err =3D set_memory_np(addr, numpages);
>>=20
>
>
> I missed something it seems. Not good to leave something unterminated=20
> when you leave for vacation and think it was finished when you come back.
>
> The best solution I see is to move hash__kernel_map_pages() prototype=20
> somewhere else.

> $ git grep -e hash__ -e radix__ -- arch/powerpc/include/asm/*.h
> arch/powerpc/include/asm/bug.h:void hash__do_page_fault(struct pt_regs *);
> arch/powerpc/include/asm/mmu.h:extern void radix__mmu_cleanup_all(void);
> arch/powerpc/include/asm/mmu_context.h:extern void radix__switch_mmu_cont=
ext(struct mm_struct *prev,
> arch/powerpc/include/asm/mmu_context.h:         return radix__switch_mmu_=
context(prev, next);
> arch/powerpc/include/asm/mmu_context.h:extern int hash__alloc_context_id(=
void);
> arch/powerpc/include/asm/mmu_context.h:void __init hash__reserve_context_=
id(int id);
> arch/powerpc/include/asm/mmu_context.h: context_id =3D hash__alloc_contex=
t_id();
> arch/powerpc/include/asm/mmu_context.h:  * radix__flush_all_mm() to deter=
mine the scope (local/global)
> arch/powerpc/include/asm/mmu_context.h:         radix__flush_all_mm(mm);

If anything I'd prefer to move those out of there into the book3s/64/
headers :)

> Maybe asm/mmu.h ?
>
> Or mm/mmu_decl.h ?

Yeah I'll do that. It's a bit of a dumping ground, but at least it's
internal to arch code, not exported to the rest of the kernel.

cheers
