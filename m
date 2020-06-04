Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1A1EE36B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 13:29:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d3TX4NpkzDqrF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 21:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d3Rk3mMXzDqgk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 21:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=omPVORFa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49d3Rj27Rhz9sSc;
 Thu,  4 Jun 2020 21:28:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591270081;
 bh=RxX+tPyrCW35oHj1PQviARj5kQb6NCOIuDZHvW2/7JA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=omPVORFa7AnLlaWXLnzXanEDFAvuqwukoHBDpCA2Ecqm48DD5gUnX4EigsY3Q1XjR
 P6GMTMLLIvn7vj4/gls+S79Utetp2eP6CgLLOjSYg7d0GNLnZm76T5IjpQXTvQNVmZ
 9Jh6TzRcAJW4Bt3bS9JgZPXu+b6z2AlyciO/CVoIyqxp+KAU7Sug1edGeV3i8OoGFS
 FB17sJKvyMCGF7v5gmsLEafqVj2LMS1uSzhEyQb7V9czGQoVMr6VIFc9A0JSLVdvwH
 KStv/HUsFz6LipSZZzsNf6crrprieJs86cClYnZCizDONw4KCyjW9x/lDj2ATysf3z
 oVhSYpiMr32fw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
In-Reply-To: <20200604183805.6f384b23@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
 <20200604165246.436f02ba@canb.auug.org.au>
 <20200604183805.6f384b23@canb.auug.org.au>
Date: Thu, 04 Jun 2020 21:28:23 +1000
Message-ID: <87r1uvgje0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> On Thu, 4 Jun 2020 16:52:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 25c3cb8272c0..a6799723cd98 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1008,6 +1008,12 @@ extern struct page *p4d_page(p4d_t p4d);
>>  #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
>>  #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
>>  
>> +static inline unsigned long pgd_index(unsigned long address)
>> +{
>> +	return (address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1);
>> +}
>> +#define pgd_index pgd_index
>> +
>>  #define pte_ERROR(e) \
>>  	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
>>  #define pmd_ERROR(e) \
>
> I have added that hunk to linux-next for tomorrow as a fix for
> mm-consolidate-pgd_index-and-pgd_offset_k-definitions.
>
> Its not strickly necessary, but Michael expressed a preference for the
> inline function.

That was because we just recently converted it into a static inline to
avoid UBSAN warnings:

commit c2e929b18cea6cbf71364f22d742d9aad7f4677a
Author:     Qian Cai <cai@lca.pw>
AuthorDate: Thu Mar 5 23:48:52 2020 -0500

    powerpc/64s/pgtable: fix an undefined behaviour

    Booting a power9 server with hash MMU could trigger an undefined
    behaviour because pud_offset(p4d, 0) will do,

    0 >> (PAGE_SHIFT:16 + PTE_INDEX_SIZE:8 + H_PMD_INDEX_SIZE:10)

    Fix it by converting pud_index() and friends to static inline
    functions.

    UBSAN: shift-out-of-bounds in arch/powerpc/mm/ptdump/ptdump.c:282:15
    shift exponent 34 is too large for 32-bit type 'int'
    CPU: 6 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc4-next-20200303+ #13
    Call Trace:
    dump_stack+0xf4/0x164 (unreliable)
    ubsan_epilogue+0x18/0x78
    __ubsan_handle_shift_out_of_bounds+0x160/0x21c
    walk_pagetables+0x2cc/0x700
    walk_pud at arch/powerpc/mm/ptdump/ptdump.c:282
    (inlined by) walk_pagetables at arch/powerpc/mm/ptdump/ptdump.c:311
    ptdump_check_wx+0x8c/0xf0
    mark_rodata_ro+0x48/0x80
    kernel_init+0x74/0x194
    ret_from_kernel_thread+0x5c/0x74


> I was wondering if pgd_index "Must be a compile-time
> constant" on one (or a few) architectures, then why not leave the
> default as an inline function and special case it as a macro where
> needed ...

AIUI that requirement comes from x86 which has:

#define KERNEL_PGD_BOUNDARY	pgd_index(PAGE_OFFSET)
#define KERNEL_PGD_PTRS		(PTRS_PER_PGD - KERNEL_PGD_BOUNDARY)
...
#define MAX_PREALLOCATED_USER_PMDS KERNEL_PGD_PTRS
...
pgd_t *pgd_alloc(struct mm_struct *mm)
{
	pgd_t *pgd;
	pmd_t *u_pmds[MAX_PREALLOCATED_USER_PMDS];


Which will produce a variable length array if pgd_index() isn't a
compile-time constant.

cheers
