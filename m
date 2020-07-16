Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7022261D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:46:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6xsk10kmzDqYk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B6x8t3Xg5zDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 00:14:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA8F331B;
 Thu, 16 Jul 2020 07:14:43 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00B4B3F66E;
 Thu, 16 Jul 2020 07:14:38 -0700 (PDT)
Subject: Re: [PATCH V5 1/4] mm/debug_vm_pgtable: Add tests validating arch
 helpers for core MM features
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
 <1594610587-4172-2-git-send-email-anshuman.khandual@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <2ff756c5-28e2-b64a-3788-260ba30c6409@arm.com>
Date: Thu, 16 Jul 2020 15:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594610587-4172-2-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 agordeev@linux.ibm.com, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 gerald.schaefer@de.ibm.com, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, cai@lca.pw,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 aneesh.kumar@linux.ibm.com, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/07/2020 04:23, Anshuman Khandual wrote:
> This adds new tests validating arch page table helpers for these following
> core memory features. These tests create and test specific mapping types at
> various page table levels.
> 
> 1. SPECIAL mapping
> 2. PROTNONE mapping
> 3. DEVMAP mapping
> 4. SOFTDIRTY mapping
> 5. SWAP mapping
> 6. MIGRATION mapping
> 7. HUGETLB mapping
> 8. THP mapping
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: x86@kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Tested-by: Vineet Gupta <vgupta@synopsys.com>	#arc
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>   mm/debug_vm_pgtable.c | 302 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 301 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
> index 61ab16fb2e36..2fac47db3eb7 100644
> --- a/mm/debug_vm_pgtable.c
> +++ b/mm/debug_vm_pgtable.c
[...]
> +
> +static void __init pte_swap_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	swp_entry_t swp;
> +	pte_t pte;
> +
> +	pte = pfn_pte(pfn, prot);
> +	swp = __pte_to_swp_entry(pte);

Minor issue: this doesn't look necessarily valid - there's no reason a 
normal PTE can be turned into a swp_entry. In practise this is likely to 
work on all architectures because there's no reason not to use (at 
least) all the PFN bits for the swap entry, but it doesn't exactly seem 
correct.

Can we start with a swp_entry_t (from __swp_entry()) and check the round 
trip of that?

It would also seem sensible to have a check that 
is_swap_pte(__swp_entry_to_pte(__swp_entry(x,y))) is true.

> +	pte = __swp_entry_to_pte(swp);
> +	WARN_ON(pfn != pte_pfn(pte));
> +}
> +
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot)
> +{
> +	swp_entry_t swp;
> +	pmd_t pmd;
> +
> +	pmd = pfn_pmd(pfn, prot);
> +	swp = __pmd_to_swp_entry(pmd);
> +	pmd = __swp_entry_to_pmd(swp);
> +	WARN_ON(pfn != pmd_pfn(pmd));
> +}
> +#else  /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +static void __init pmd_swap_tests(unsigned long pfn, pgprot_t prot) { }
> +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static void __init swap_migration_tests(void)
> +{
> +	struct page *page;
> +	swp_entry_t swp;
> +
> +	if (!IS_ENABLED(CONFIG_MIGRATION))
> +		return;
> +	/*
> +	 * swap_migration_tests() requires a dedicated page as it needs to
> +	 * be locked before creating a migration entry from it. Locking the
> +	 * page that actually maps kernel text ('start_kernel') can be real
> +	 * problematic. Lets allocate a dedicated page explicitly for this

NIT: s/Lets/Let's

Otherwise looks good to me.

Steve
