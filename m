Return-Path: <linuxppc-dev+bounces-7245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB8A6B361
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 04:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJp7G49t3z2yrp;
	Fri, 21 Mar 2025 14:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742528282;
	cv=none; b=CBPOdFMPrb9gdW8uavSP0Os4Pgyskh+IHXcR4M2SsySJw+QzxeeyFDwclf7r6JnkN2lZJ1PiBob8vX4IvpYTnhCe9y0fHewPkuwQh3bRPUO7TEpAoYNRgWkvQ7mdE55EbnTnPTSFRv3RBYh1n85bJIakH/XihH3RJorLCJlYWn5RIBvoAXk/+xizBq3PfybLVyImdpJrNC70GoJtPwx9ZFlO3XvmyuPIISPupDBTVbAhSl8NdLcPok2TycxuJO/d2GVpdLaqfvr72GVaYjQqZzwMWfWPk5c9dDBOYbi1PJU3AsQUd3zmq5TlbCDB3gwAj5p4sWQmR5cpb0RDW0IoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742528282; c=relaxed/relaxed;
	bh=9qL1C/CVkfJFKOzMETjek18c+JYVuoJQcPAzDidFBsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4SplJ4QLWYgj/Fp+QAPyh7BZrX5YXqQ/HcTjiy95Y91CxHJgaLL5rZM07VnOl0hWqzTdh3Yq+frhX4eWAQxebQZsxiJIA4FXubPX7X/vlSCc07402ZZuHdDhTfkh/TiiUKR+XFok5MaWy10SlCPVeMej9cHiIEI/1Qucy29lvFGNlj2VKcXyN2WxUbg+l0qlIolcAFvu4T/pRMorMTLbauhqXdPztjhSVX4vI3aLJsN3L++1xlvaQJtfYtyXHwfesgaZ5+XgU8n8gXRlpzR98f9OcsT821cvgm0LYIN0Ps3lEbUh6+jxSUFhL6/j3fNO+TkNwW2zYrtb9Xt6sFcbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJp7D73DDz2yrS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 14:37:59 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C2D5106F;
	Thu, 20 Mar 2025 20:37:35 -0700 (PDT)
Received: from [10.162.16.153] (a077893.blr.arm.com [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E3873F673;
	Thu, 20 Mar 2025 20:37:21 -0700 (PDT)
Message-ID: <6f88d4a7-4b22-4601-a651-029cb343d93b@arm.com>
Date: Fri, 21 Mar 2025 09:07:18 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/ptdump: Split note_page() into level specific
 callbacks
To: linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-2-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250317061818.16244-2-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/17/25 11:48, Anshuman Khandual wrote:
> Last argument passed down in note_page() is u64 assuming pxd_val() returned
> value (all page table levels) is 64 bit - which might not be the case going
> ahead when D128 page tables is enabled on arm64 platform. Besides pxd_val()
> is very platform specific and its type should not be assumed in generic MM.
> 
> Split note_page() into individual page table level specific callbacks which
> accepts corresponding pxd_t argument instead and then subscribing platforms
> just derive pxd_val() from the entries as required and proceed as earlier.
> 
> Also add a note_page_flush() callback for flushing the last page table page
> that was being handled earlier via level = -1.

Does this look good OR is there any concern OR an alternate approach ?

> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-mm@kvack.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/ptdump.h | 16 +++++++++--
>  arch/arm64/mm/ptdump.c          | 48 ++++++++++++++++++++++++++++++---
>  arch/powerpc/mm/ptdump/ptdump.c | 46 +++++++++++++++++++++++++++++--
>  arch/riscv/mm/ptdump.c          | 46 +++++++++++++++++++++++++++++--
>  arch/s390/mm/dump_pagetables.c  | 46 +++++++++++++++++++++++++++++--
>  arch/x86/mm/dump_pagetables.c   | 39 ++++++++++++++++++++++++++-
>  include/linux/ptdump.h          |  9 ++++---
>  mm/ptdump.c                     | 42 ++++++++++++++++++++++-------
>  8 files changed, 267 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
> index 6cf4aae05219..e5da9ce8a515 100644
> --- a/arch/arm64/include/asm/ptdump.h
> +++ b/arch/arm64/include/asm/ptdump.h
> @@ -59,7 +59,13 @@ struct ptdump_pg_state {
>  
>  void ptdump_walk(struct seq_file *s, struct ptdump_info *info);
>  void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
> -	       u64 val);
> +	       pteval_t val);
> +void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte);
> +void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
> +void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud);
> +void note_page_p4d(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
> +void note_page_pgd(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
> +void note_page_flush(struct ptdump_state *st);
>  #ifdef CONFIG_PTDUMP_DEBUGFS
>  #define EFI_RUNTIME_MAP_END	DEFAULT_MAP_WINDOW_64
>  void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
> @@ -69,7 +75,13 @@ static inline void ptdump_debugfs_register(struct ptdump_info *info,
>  #endif /* CONFIG_PTDUMP_DEBUGFS */
>  #else
>  static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
> -			     int level, u64 val) { }
> +			     int level, pteval_t val) { }
> +static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
> +static inline void note_page_pmd(struct ptdump_state *st, unsigned long addr, pmd_t pmd) { }
> +static inline void note_page_pud(struct ptdump_state *st, unsigned long addr, pud_t pud) { }
> +static inline void note_page_p4d(struct ptdump_state *st, unsigned long addr, p4d_t p4d) { }
> +static inline void note_page_pgd(struct ptdump_state *st, unsigned long addr, pgd_t pgd) { }
> +static inline void note_page_flush(struct ptdump_state *st) { }
>  #endif /* CONFIG_PTDUMP_CORE */
>  
>  #endif /* __ASM_PTDUMP_H */
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index 688fbe0271ca..fd1610b4fd15 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -189,7 +189,7 @@ static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
>  }
>  
>  void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
> -	       u64 val)
> +	       pteval_t val)
>  {
>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>  	struct ptdump_pg_level *pg_level = st->pg_level;
> @@ -251,6 +251,38 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  
>  }
>  
> +void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
> +{
> +	note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
> +{
> +	note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
> +{
> +	note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
> +{
> +	note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> +{
> +	note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +void note_page_flush(struct ptdump_state *pt_st)
> +{
> +	pte_t pte_zero = {0};
> +
> +	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
>  void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  {
>  	unsigned long end = ~0UL;
> @@ -266,7 +298,12 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>  		.pg_level = &kernel_pg_levels[0],
>  		.level = -1,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]){
>  				{info->base_addr, end},
>  				{0, 0}
> @@ -303,7 +340,12 @@ bool ptdump_check_wx(void)
>  		.level = -1,
>  		.check_wx = true,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]) {
>  				{_PAGE_OFFSET(vabits_actual), ~0UL},
>  				{0, 0}
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 9dc239967b77..b2358d794855 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -298,6 +298,38 @@ static void populate_markers(void)
>  #endif
>  }
>  
> +static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
> +{
> +	note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
> +{
> +	note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
> +{
> +	note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
> +{
> +	note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> +{
> +	note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +static void note_page_flush(struct ptdump_state *pt_st)
> +{
> +	pte_t pte_zero = {0};
> +
> +	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
>  static int ptdump_show(struct seq_file *m, void *v)
>  {
>  	struct pg_state st = {
> @@ -305,7 +337,12 @@ static int ptdump_show(struct seq_file *m, void *v)
>  		.marker = address_markers,
>  		.level = -1,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = ptdump_range,
>  		}
>  	};
> @@ -338,7 +375,12 @@ bool ptdump_check_wx(void)
>  		.level = -1,
>  		.check_wx = true,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = ptdump_range,
>  		}
>  	};
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 9d5f657a251b..32922550a50a 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -318,6 +318,38 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
>  	}
>  }
>  
> +static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
> +{
> +	note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
> +{
> +	note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
> +{
> +	note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
> +{
> +	note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> +{
> +	note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +static void note_page_flush(struct ptdump_state *pt_st)
> +{
> +	pte_t pte_zero = {0};
> +
> +	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
>  static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
>  {
>  	struct pg_state st = {
> @@ -325,7 +357,12 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
>  		.marker = pinfo->markers,
>  		.level = -1,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]) {
>  				{pinfo->base_addr, pinfo->end},
>  				{0, 0}
> @@ -347,7 +384,12 @@ bool ptdump_check_wx(void)
>  		.level = -1,
>  		.check_wx = true,
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]) {
>  				{KERN_VIRT_START, ULONG_MAX},
>  				{0, 0}
> diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
> index fa54f3bc0c8d..e7cc52542f71 100644
> --- a/arch/s390/mm/dump_pagetables.c
> +++ b/arch/s390/mm/dump_pagetables.c
> @@ -145,11 +145,48 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	}
>  }
>  
> +static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
> +{
> +	note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
> +{
> +	note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
> +{
> +	note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
> +{
> +	note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> +{
> +	note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +static void note_page_flush(struct ptdump_state *pt_st)
> +{
> +	pte_t pte_zero = {0};
> +
> +	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
>  bool ptdump_check_wx(void)
>  {
>  	struct pg_state st = {
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]) {
>  				{.start = 0, .end = max_addr},
>  				{.start = 0, .end = 0},
> @@ -188,7 +225,12 @@ static int ptdump_show(struct seq_file *m, void *v)
>  {
>  	struct pg_state st = {
>  		.ptdump = {
> -			.note_page = note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.range = (struct ptdump_range[]) {
>  				{.start = 0, .end = max_addr},
>  				{.start = 0, .end = 0},
> diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
> index 89079ea73e65..2e1c2d006ace 100644
> --- a/arch/x86/mm/dump_pagetables.c
> +++ b/arch/x86/mm/dump_pagetables.c
> @@ -362,6 +362,38 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>  	}
>  }
>  
> +static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
> +{
> +	note_page(pt_st, addr, 4, pte_val(pte));
> +}
> +
> +static void note_page_pmd(struct ptdump_state *pt_st, unsigned long addr, pmd_t pmd)
> +{
> +	note_page(pt_st, addr, 3, pmd_val(pmd));
> +}
> +
> +static void note_page_pud(struct ptdump_state *pt_st, unsigned long addr, pud_t pud)
> +{
> +	note_page(pt_st, addr, 2, pud_val(pud));
> +}
> +
> +static void note_page_p4d(struct ptdump_state *pt_st, unsigned long addr, p4d_t p4d)
> +{
> +	note_page(pt_st, addr, 1, p4d_val(p4d));
> +}
> +
> +static void note_page_pgd(struct ptdump_state *pt_st, unsigned long addr, pgd_t pgd)
> +{
> +	note_page(pt_st, addr, 0, pgd_val(pgd));
> +}
> +
> +static void note_page_flush(struct ptdump_state *pt_st)
> +{
> +	pte_t pte_zero = {0};
> +
> +	note_page(pt_st, 0, -1, pte_val(pte_zero));
> +}
> +
>  bool ptdump_walk_pgd_level_core(struct seq_file *m,
>  				struct mm_struct *mm, pgd_t *pgd,
>  				bool checkwx, bool dmesg)
> @@ -378,7 +410,12 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
>  
>  	struct pg_state st = {
>  		.ptdump = {
> -			.note_page	= note_page,
> +			.note_page_pte = note_page_pte,
> +			.note_page_pmd = note_page_pmd,
> +			.note_page_pud = note_page_pud,
> +			.note_page_p4d = note_page_p4d,
> +			.note_page_pgd = note_page_pgd,
> +			.note_page_flush = note_page_flush,
>  			.effective_prot = effective_prot,
>  			.range		= ptdump_ranges
>  		},
> diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
> index 8dbd51ea8626..1c1eb1fae199 100644
> --- a/include/linux/ptdump.h
> +++ b/include/linux/ptdump.h
> @@ -11,9 +11,12 @@ struct ptdump_range {
>  };
>  
>  struct ptdump_state {
> -	/* level is 0:PGD to 4:PTE, or -1 if unknown */
> -	void (*note_page)(struct ptdump_state *st, unsigned long addr,
> -			  int level, u64 val);
> +	void (*note_page_pte)(struct ptdump_state *st, unsigned long addr, pte_t pte);
> +	void (*note_page_pmd)(struct ptdump_state *st, unsigned long addr, pmd_t pmd);
> +	void (*note_page_pud)(struct ptdump_state *st, unsigned long addr, pud_t pud);
> +	void (*note_page_p4d)(struct ptdump_state *st, unsigned long addr, p4d_t p4d);
> +	void (*note_page_pgd)(struct ptdump_state *st, unsigned long addr, pgd_t pgd);
> +	void (*note_page_flush)(struct ptdump_state *st);
>  	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
>  	const struct ptdump_range *range;
>  };
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 106e1d66e9f9..706cfc19439b 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -18,7 +18,7 @@ static inline int note_kasan_page_table(struct mm_walk *walk,
>  {
>  	struct ptdump_state *st = walk->private;
>  
> -	st->note_page(st, addr, 4, pte_val(kasan_early_shadow_pte[0]));
> +	st->note_page_pte(st, addr, kasan_early_shadow_pte[0]);
>  
>  	walk->action = ACTION_CONTINUE;
>  
> @@ -42,7 +42,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>  		st->effective_prot(st, 0, pgd_val(val));
>  
>  	if (pgd_leaf(val)) {
> -		st->note_page(st, addr, 0, pgd_val(val));
> +		st->note_page_pgd(st, addr, val);
>  		walk->action = ACTION_CONTINUE;
>  	}
>  
> @@ -65,7 +65,7 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
>  		st->effective_prot(st, 1, p4d_val(val));
>  
>  	if (p4d_leaf(val)) {
> -		st->note_page(st, addr, 1, p4d_val(val));
> +		st->note_page_p4d(st, addr, val);
>  		walk->action = ACTION_CONTINUE;
>  	}
>  
> @@ -88,7 +88,7 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
>  		st->effective_prot(st, 2, pud_val(val));
>  
>  	if (pud_leaf(val)) {
> -		st->note_page(st, addr, 2, pud_val(val));
> +		st->note_page_pud(st, addr, val);
>  		walk->action = ACTION_CONTINUE;
>  	}
>  
> @@ -109,7 +109,7 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
>  	if (st->effective_prot)
>  		st->effective_prot(st, 3, pmd_val(val));
>  	if (pmd_leaf(val)) {
> -		st->note_page(st, addr, 3, pmd_val(val));
> +		st->note_page_pmd(st, addr, val);
>  		walk->action = ACTION_CONTINUE;
>  	}
>  
> @@ -125,7 +125,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
>  	if (st->effective_prot)
>  		st->effective_prot(st, 4, pte_val(val));
>  
> -	st->note_page(st, addr, 4, pte_val(val));
> +	st->note_page_pte(st, addr, val);
>  
>  	return 0;
>  }
> @@ -134,9 +134,31 @@ static int ptdump_hole(unsigned long addr, unsigned long next,
>  		       int depth, struct mm_walk *walk)
>  {
>  	struct ptdump_state *st = walk->private;
> -
> -	st->note_page(st, addr, depth, 0);
> -
> +	pte_t pte_zero = {0};
> +	pmd_t pmd_zero = {0};
> +	pud_t pud_zero = {0};
> +	p4d_t p4d_zero = {0};
> +	pgd_t pgd_zero = {0};
> +
> +	switch (depth) {
> +	case 4:
> +		st->note_page_pte(st, addr, pte_zero);
> +		break;
> +	case 3:
> +		st->note_page_pmd(st, addr, pmd_zero);
> +		break;
> +	case 2:
> +		st->note_page_pud(st, addr, pud_zero);
> +		break;
> +	case 1:
> +		st->note_page_p4d(st, addr, p4d_zero);
> +		break;
> +	case 0:
> +		st->note_page_pgd(st, addr, pgd_zero);
> +		break;
> +	default:
> +		break;
> +	}
>  	return 0;
>  }
>  
> @@ -162,7 +184,7 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>  	mmap_write_unlock(mm);
>  
>  	/* Flush out the last page */
> -	st->note_page(st, 0, -1, 0);
> +	st->note_page_flush(st);
>  }
>  
>  static int check_wx_show(struct seq_file *m, void *v)

