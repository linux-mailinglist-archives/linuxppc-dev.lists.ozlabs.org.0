Return-Path: <linuxppc-dev+bounces-7161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914AA66871
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 05:38:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGzcg4p8lz2yfv;
	Tue, 18 Mar 2025 15:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742272723;
	cv=none; b=CBlVd6/3QcD83/u5DFUCTZMU1vWN8c5sERXxzlG9SdCfCdWhLKTgl47YAuJRW0Y0KavwxU7oJ05SLclrRRDzJxjWM7xk+6IHxWwc3742sGL8eImgVUbDgvVCn3nZMGV7j1FyyJH+hZKrYyxITBJkpxXaLj86v5ZLEKWUQyMtHCdaHMofandaqxk/UZlSm0sqaJd8lTQLVeVETA8XEQ8qUmtUhrMkpQWJf4pvW+XYLI6ZgfCee1eREYoFtrq9k/qWDYxPcTcFk3s5Y70nVXR7bWsDFQD58ItEKHhHDiOr945hQQ3m4MrqnFawvoS3qANYXMz61eThxct0v5A7pcsVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742272723; c=relaxed/relaxed;
	bh=rwck3yq1zfX0/VzN1MDQ+NCBErVzByOdr+S/IgfqxhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2iuWnXUyKxZQ540euWr/gX/N1RXrCrCRxvAEd249rxRH+fXweo4VimdJCVSRFLZC4DcAPyh9Pq55Qjku5+Kd1y/Il7dYGetDLlgazg/j/uPMEcPpD9fo0aI9HrC4qRyhqk1JEFJHE/+YHlu00e784DsLej3abb2uQRN7ATITuWr5991ijGpFWhYXTgbmmo87BqnnWMpX4UnXB0YEWyLa9USwOSMapmrS/2rZDkVjhmSvfSbFfGdt9Zk6zWcHLgfvOJs+WP76AUm6wCwPd/NJ16rjTSaauMnbzVq8vEY7XU8LJQGm1ZVB4JkPLx1y5vl8Oqvm2wG+a3WYj3Yr9aJnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGzcd5YFfz2yfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 15:38:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300C2152B;
	Mon, 17 Mar 2025 21:38:16 -0700 (PDT)
Received: from [10.163.44.33] (unknown [10.163.44.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B992E3F63F;
	Mon, 17 Mar 2025 21:38:00 -0700 (PDT)
Message-ID: <392723e2-da82-4bdb-bebe-ed1c982d0d5f@arm.com>
Date: Tue, 18 Mar 2025 10:07:56 +0530
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
Subject: Re: [PATCH 2/2] arm64/ptdump: Replace u64 with pteval_t
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Marc Zyngier <maz@kernel.org>
References: <20250317061818.16244-1-anshuman.khandual@arm.com>
 <20250317061818.16244-3-anshuman.khandual@arm.com>
 <16c12c3f-f2c2-45fa-9db6-4dfaeb002059@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <16c12c3f-f2c2-45fa-9db6-4dfaeb002059@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 3/17/25 14:58, Ryan Roberts wrote:
> On 17/03/2025 06:18, Anshuman Khandual wrote:
>> Page table entry's value, mask and protection are represented with pteval_t
>> data type format not u64 that has been assumed while dumping the page table
>> entries. Replace all such u64 instances with pteval_t instead as required.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/ptdump.h | 8 ++++----
>>  arch/arm64/mm/ptdump.c          | 2 +-
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>> index e5da9ce8a515..476a870489b9 100644
>> --- a/arch/arm64/include/asm/ptdump.h
>> +++ b/arch/arm64/include/asm/ptdump.h
>> @@ -24,8 +24,8 @@ struct ptdump_info {
>>  };
>>  
>>  struct ptdump_prot_bits {
>> -	u64		mask;
>> -	u64		val;
>> +	pteval_t	mask;
>> +	pteval_t	val;
> 
> Given Ard's suggestion of using "ptdesc" as a generic term for PTDESC_SHIFT (or
> PTDESC_ORDER, or whatever we ended up calling it), I wonder if it would be
> cleaner to do the same with the types? We could have a ptdesc_t, which is
> typedef'ed as u64 (or u128), then pteval_t, pmdval_t, ..., could all be
> typedef'ed as ptdesc_t. Then for code that just wants a generic pgtable
> descriptor value, we can use that type to indicate that it can be at any level.

Something like the following ? Will cross check again if this might have
missed something which could be converted as ptdesc_t as well.

diff --git a/arch/arm64/include/asm/pgtable-types.h b/arch/arm64/include/asm/pgtable-types.h
index 6d6d4065b0cb..686541e986e3 100644
--- a/arch/arm64/include/asm/pgtable-types.h
+++ b/arch/arm64/include/asm/pgtable-types.h
@@ -11,11 +11,13 @@
 
 #include <asm/types.h>
 
-typedef u64 pteval_t;
-typedef u64 pmdval_t;
-typedef u64 pudval_t;
-typedef u64 p4dval_t;
-typedef u64 pgdval_t;
+typedef u64 ptdesc_t;
+
+typedef ptdesc_t pteval_t;
+typedef ptdesc_t pmdval_t;
+typedef ptdesc_t pudval_t;
+typedef ptdesc_t p4dval_t;
+typedef ptdesc_t pgdval_t;
 
 /*
  * These are used to make use of C type-checking..
@@ -46,7 +48,7 @@ typedef struct { pgdval_t pgd; } pgd_t;
 #define pgd_val(x)	((x).pgd)
 #define __pgd(x)	((pgd_t) { (x) } )
 
-typedef struct { pteval_t pgprot; } pgprot_t;
+typedef struct { ptdesc_t pgprot; } pgprot_t;
 #define pgprot_val(x)	((x).pgprot)
 #define __pgprot(x)	((pgprot_t) { (x) } )
 
diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
index e5da9ce8a515..9548813bc877 100644
--- a/arch/arm64/include/asm/ptdump.h
+++ b/arch/arm64/include/asm/ptdump.h
@@ -24,8 +24,8 @@ struct ptdump_info {
 };
 
 struct ptdump_prot_bits {
-	u64		mask;
-	u64		val;
+	ptdesc_t	mask;
+	ptdesc_t	val;
 	const char	*set;
 	const char	*clear;
 };
@@ -34,7 +34,7 @@ struct ptdump_pg_level {
 	const struct ptdump_prot_bits *bits;
 	char name[4];
 	int num;
-	u64 mask;
+	ptdesc_t mask;
 };
 
 /*
@@ -51,7 +51,7 @@ struct ptdump_pg_state {
 	const struct mm_struct *mm;
 	unsigned long start_address;
 	int level;
-	u64 current_prot;
+	ptdesc_t current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
 	unsigned long uxn_pages;
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 1d25d8899dbf..42e281c07c2f 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -29,7 +29,7 @@ static bool region_is_misaligned(const efi_memory_desc_t *md)
  * executable, everything else can be mapped with the XN bits
  * set. Also take the new (optional) RO/XP bits into account.
  */
-static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
+static __init ptdesc_t create_mapping_protection(efi_memory_desc_t *md)
 {
 	u64 attr = md->attribute;
 	u32 type = md->type;
@@ -83,7 +83,7 @@ static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
 
 int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 {
-	pteval_t prot_val = create_mapping_protection(md);
+	ptdesc_t prot_val = create_mapping_protection(md);
 	bool page_mappings_only = (md->type == EFI_RUNTIME_SERVICES_CODE ||
 				   md->type == EFI_RUNTIME_SERVICES_DATA);
 
diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index e57b043f324b..a00f57c73d81 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -159,7 +159,7 @@ static void noinline __section(".idmap.text") set_ttbr0_for_lpa2(u64 ttbr)
 static void __init remap_idmap_for_lpa2(void)
 {
 	/* clear the bits that change meaning once LPA2 is turned on */
-	pteval_t mask = PTE_SHARED;
+	ptdesc_t mask = PTE_SHARED;
 
 	/*
 	 * We have to clear bits [9:8] in all block or page descriptors in the
diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
index 2b69e3beeef8..30c6bc50844f 100644
--- a/arch/arm64/kernel/pi/map_range.c
+++ b/arch/arm64/kernel/pi/map_range.c
@@ -30,7 +30,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 		      int level, pte_t *tbl, bool may_use_cont, u64 va_offset)
 {
 	u64 cmask = (level == 3) ? CONT_PTE_SIZE - 1 : U64_MAX;
-	pteval_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
+	ptdesc_t protval = pgprot_val(prot) & ~PTE_TYPE_MASK;
 	int lshift = (3 - level) * (PAGE_SHIFT - 3);
 	u64 lmask = (PAGE_SIZE << lshift) - 1;
 
@@ -87,7 +87,7 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
 	}
 }
 
-asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, pteval_t clrmask)
+asmlinkage u64 __init create_init_idmap(pgd_t *pg_dir, ptdesc_t clrmask)
 {
 	u64 ptep = (u64)pg_dir + PAGE_SIZE;
 	pgprot_t text_prot = PAGE_KERNEL_ROX;
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..91dcb5b6bbd1 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -33,4 +33,4 @@ void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 
 asmlinkage void early_map_kernel(u64 boot_status, void *fdt);
 
-asmlinkage u64 create_init_idmap(pgd_t *pgd, pteval_t clrmask);
+asmlinkage u64 create_init_idmap(pgd_t *pgd, ptdesc_t clrmask);
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 07aeab8a7606..c86c348857c4 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -83,7 +83,7 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot;
+	ptdesc_t prot;
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index fd1610b4fd15..280e850f1688 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	struct ptdump_pg_level *pg_level = st->pg_level;
 	static const char units[] = "KMGTPE";
-	u64 prot = 0;
+	ptdesc_t prot = 0;
 
 	/* check if the current level has been folded dynamically */
 	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
-- 
2.25.1

> 
> Thanks,
> Ryan
> 
>>  	const char	*set;
>>  	const char	*clear;
>>  };
>> @@ -34,7 +34,7 @@ struct ptdump_pg_level {
>>  	const struct ptdump_prot_bits *bits;
>>  	char name[4];
>>  	int num;
>> -	u64 mask;
>> +	pteval_t mask;
>>  };
>>  
>>  /*
>> @@ -51,7 +51,7 @@ struct ptdump_pg_state {
>>  	const struct mm_struct *mm;
>>  	unsigned long start_address;
>>  	int level;
>> -	u64 current_prot;
>> +	pteval_t current_prot;
>>  	bool check_wx;
>>  	unsigned long wx_pages;
>>  	unsigned long uxn_pages;
>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>> index fd1610b4fd15..a5651be95868 100644
>> --- a/arch/arm64/mm/ptdump.c
>> +++ b/arch/arm64/mm/ptdump.c
>> @@ -194,7 +194,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
>>  	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
>>  	struct ptdump_pg_level *pg_level = st->pg_level;
>>  	static const char units[] = "KMGTPE";
>> -	u64 prot = 0;
>> +	pteval_t prot = 0;
>>  
>>  	/* check if the current level has been folded dynamically */
>>  	if (st->mm && ((level == 1 && mm_p4d_folded(st->mm)) ||
> 

