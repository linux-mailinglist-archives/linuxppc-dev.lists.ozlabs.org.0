Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE017C962
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 01:05:00 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z4VW3c7RzDrFC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:04:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48Z4T159JqzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 11:03:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3A530E;
 Fri,  6 Mar 2020 16:03:26 -0800 (PST)
Received: from [10.163.1.59] (unknown [10.163.1.59])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689F93F237;
 Fri,  6 Mar 2020 16:03:17 -0800 (PST)
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, linux-mm@kvack.org
References: <1583452659-11801-1-git-send-email-anshuman.khandual@arm.com>
 <1583527481.7365.165.camel@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
Date: Sat, 7 Mar 2020 05:33:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583527481.7365.165.camel@lca.pw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/07/2020 02:14 AM, Qian Cai wrote:
> On Fri, 2020-03-06 at 05:27 +0530, Anshuman Khandual wrote:
>> This adds tests which will validate architecture page table helpers and
>> other accessors in their compliance with expected generic MM semantics.
>> This will help various architectures in validating changes to existing
>> page table helpers or addition of new ones.
>>
>> This test covers basic page table entry transformations including but not
>> limited to old, young, dirty, clean, write, write protect etc at various
>> level along with populating intermediate entries with next page table page
>> and validating them.
>>
>> Test page table pages are allocated from system memory with required size
>> and alignments. The mapped pfns at page table levels are derived from a
>> real pfn representing a valid kernel text symbol. This test gets called
>> inside kernel_init() right after async_synchronize_full().
>>
>> This test gets built and run when CONFIG_DEBUG_VM_PGTABLE is selected. Any
>> architecture, which is willing to subscribe this test will need to select
>> ARCH_HAS_DEBUG_VM_PGTABLE. For now this is limited to arc, arm64, x86, s390
>> and ppc32 platforms where the test is known to build and run successfully.
>> Going forward, other architectures too can subscribe the test after fixing
>> any build or runtime problems with their page table helpers. Meanwhile for
>> better platform coverage, the test can also be enabled with CONFIG_EXPERT
>> even without ARCH_HAS_DEBUG_VM_PGTABLE.
>>
>> Folks interested in making sure that a given platform's page table helpers
>> conform to expected generic MM semantics should enable the above config
>> which will just trigger this test during boot. Any non conformity here will
>> be reported as an warning which would need to be fixed. This test will help
>> catch any changes to the agreed upon semantics expected from generic MM and
>> enable platforms to accommodate it thereafter.
> 
> OK, I get this working on powerpc hash MMU as well, so this?
> 
> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> index 64d0f9b15c49..c527d05c0459 100644
> --- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -22,8 +22,7 @@
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
> -    |  powerpc/32: |  ok  |
> -    |  powerpc/64: | TODO |
> +    |     powerpc: |  ok  |
>      |       riscv: | TODO |
>      |        s390: |  ok  |
>      |          sh: | TODO |
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2e7eee523ba1..176930f40e07 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -116,7 +116,7 @@ config PPC
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
>  	select ARCH_HAS_DEBUG_VIRTUAL
> -	select ARCH_HAS_DEBUG_VM_PGTABLE if PPC32
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FORTIFY_SOURCE
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 96a91bda3a85..98990a515268 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
> @@ -256,7 +256,8 @@ static void __init pte_clear_tests(struct mm_struct *mm,
> pte_t *ptep,
>  	pte_t pte = READ_ONCE(*ptep);
>  
>  	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
> -	WRITE_ONCE(*ptep, pte);
> +	set_pte_at(mm, vaddr, ptep, pte);

Hmm, set_pte_at() function is not preferred here for these tests. The idea
is to avoid or atleast minimize TLB/cache flushes triggered from these sort
of 'static' tests. set_pte_at() is platform provided and could/might trigger
these flushes or some other platform specific synchronization stuff. Just
wondering is there specific reason with respect to the soft lock up problem
making it necessary to use set_pte_at() rather than a simple WRITE_ONCE() ?

> +	barrier();
>  	pte_clear(mm, vaddr, ptep);
>  	pte = READ_ONCE(*ptep);
>  	WARN_ON(!pte_none(pte));
> 
