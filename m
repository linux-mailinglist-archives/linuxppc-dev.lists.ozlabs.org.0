Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B38E1EE4B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 14:45:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d58d1FbPzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 22:45:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d56M5sMwzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 22:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Yl67+OzG; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49d56M3DNLz9sSc;
 Thu,  4 Jun 2020 22:43:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591274587;
 bh=c+fR+Wk8wg6/dMhQWZlcmNgpSzbn+tow0KvBgGVU/eM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Yl67+OzGPoDggkr27FQmgShUI/8MC2dI5y1gc6QuUE7I8uAOK4NEt4t6AfAgZysm5
 Zj1wFT8ovE72SqiB2umXioszuoBZEy0KjB5hrqmiPGu0w4+M4OZXc5s7sjIIAyg/Nr
 GclqZAStzoJcUkNjpBqxjSbGn+xzY8awJKZQQEALjnc1NNrSkruvMZJBB9VHYneyEk
 ao1eGQTKm5kzGMokyaLbwUZlAuBj60l/2beuRrqqKrP/z8gkWuFRuxZJfCktvcbtLw
 A2T4jP/0u9xnwH8sNSHhvHw84RWnoN8qNuFzq6LVwUs5nyrfCoHqyn0h9sAbucnyc9
 L1KxZPTfQ/keA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: fix ups for clashes between akpm and powerpc trees
In-Reply-To: <20200604184501.1ea5ba36@canb.auug.org.au>
References: <20200603202655.0ad0eacc@canb.auug.org.au>
 <20200604165246.436f02ba@canb.auug.org.au>
 <20200604184501.1ea5ba36@canb.auug.org.au>
Date: Thu, 04 Jun 2020 22:43:31 +1000
Message-ID: <87o8pzgfws.fsf@mpe.ellerman.id.au>
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
>> diff --git a/arch/powerpc/mm/kasan/8xx.c b/arch/powerpc/mm/kasan/8xx.c
>> index db4ef44af22f..569d98a41881 100644
>> --- a/arch/powerpc/mm/kasan/8xx.c
>> +++ b/arch/powerpc/mm/kasan/8xx.c
>> @@ -10,7 +10,7 @@
>>  static int __init
>>  kasan_init_shadow_8M(unsigned long k_start, unsigned long k_end, void *block)
>>  {
>> -	pmd_t *pmd = pmd_ptr_k(k_start);
>> +	pmd_t *pmd = pmd_off_k(k_start);
>>  	unsigned long k_cur, k_next;
>>  
>>  	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd += 2, block += SZ_8M) {
>> @@ -59,7 +59,7 @@ int __init kasan_init_region(void *start, size_t size)
>>  		return ret;
>>  
>>  	for (; k_cur < k_end; k_cur += PAGE_SIZE) {
>> -		pmd_t *pmd = pmd_ptr_k(k_cur);
>> +		pmd_t *pmd = pmd_off_k(k_cur);
>>  		void *va = block + k_cur - k_start;
>>  		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
>>  
>> diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book3s_32.c
>> index 4bc491a4a1fd..a32b4640b9de 100644
>> --- a/arch/powerpc/mm/kasan/book3s_32.c
>> +++ b/arch/powerpc/mm/kasan/book3s_32.c
>> @@ -46,7 +46,7 @@ int __init kasan_init_region(void *start, size_t size)
>>  	kasan_update_early_region(k_start, k_cur, __pte(0));
>>  
>>  	for (; k_cur < k_end; k_cur += PAGE_SIZE) {
>> -		pmd_t *pmd = pmd_ptr_k(k_cur);
>> +		pmd_t *pmd = pmd_off_k(k_cur);
>>  		void *va = block + k_cur - k_start;
>>  		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
>>  
>> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
>> index 286441bbbe49..92e8929cbe3e 100644
>> --- a/arch/powerpc/mm/nohash/8xx.c
>> +++ b/arch/powerpc/mm/nohash/8xx.c
>> @@ -74,7 +74,7 @@ static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *pmdp, unsigned long va)
>>  static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
>>  					     pgprot_t prot, int psize, bool new)
>>  {
>> -	pmd_t *pmdp = pmd_ptr_k(va);
>> +	pmd_t *pmdp = pmd_off_k(va);
>>  	pte_t *ptep;
>>  
>>  	if (WARN_ON(psize != MMU_PAGE_512K && psize != MMU_PAGE_8M))
>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>> index 45a0556089e8..1136257c3a99 100644
>> --- a/arch/powerpc/mm/pgtable.c
>> +++ b/arch/powerpc/mm/pgtable.c
>> @@ -264,7 +264,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>>  #if defined(CONFIG_PPC_8xx)
>>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
>>  {
>> -	pmd_t *pmd = pmd_ptr(mm, addr);
>> +	pmd_t *pmd = pmd_off(mm, addr);
>>  	pte_basic_t val;
>>  	pte_basic_t *entry = &ptep->pte;
>>  	int num = is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
>> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
>> index e2d054c9575e..6eb4eab79385 100644
>> --- a/arch/powerpc/mm/pgtable_32.c
>> +++ b/arch/powerpc/mm/pgtable_32.c
>> @@ -40,7 +40,7 @@ notrace void __init early_ioremap_init(void)
>>  {
>>  	unsigned long addr = ALIGN_DOWN(FIXADDR_START, PGDIR_SIZE);
>>  	pte_t *ptep = (pte_t *)early_fixmap_pagetable;
>> -	pmd_t *pmdp = pmd_ptr_k(addr);
>> +	pmd_t *pmdp = pmd_off_k(addr);
>>  
>>  	for (; (s32)(FIXADDR_TOP - addr) > 0;
>>  	     addr += PGDIR_SIZE, ptep += PTRS_PER_PTE, pmdp++)
>
> I have added the above hunks as to linux-next for tomorrow as a fix for
> mm-pgtable-add-shortcuts-for-accessing-kernel-pmd-and-pte.

Looks good. Thanks.

cheers
