Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7267AB2D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 15:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsYCc3N2Dz3dGm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 23:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ghiti.fr (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=alex@ghiti.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 20366 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 23:34:06 AEST
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsYC26c4Zz3ccD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 23:34:04 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55DF62000D;
	Fri, 22 Sep 2023 13:33:46 +0000 (UTC)
Message-ID: <e098a287-36dc-3e66-6be7-f908729e91d4@ghiti.fr>
Date: Fri, 22 Sep 2023 15:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] mm: hugetlb: Add huge page size param to
 set_huge_pte_at()
Content-Language: en-US
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230922115804.2043771-1-ryan.roberts@arm.com>
 <20230922115804.2043771-2-ryan.roberts@arm.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230922115804.2043771-2-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
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
Cc: linux-s390@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2023 13:58, Ryan Roberts wrote:
> In order to fix a bug, arm64 needs to be told the size of the huge page
> for which the pte is being set in set_huge_pte_at(). Provide for this by
> adding an `unsigned long sz` parameter to the function. This follows the
> same pattern as huge_pte_clear().
>
> This commit makes the required interface modifications to the core mm as
> well as all arches that implement this function (arm64, parisc, powerpc,
> riscv, s390, sparc). The actual arm64 bug will be fixed in a separate
> commit.
>
> No behavioral changes intended.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Cc: <stable@vger.kernel.org> # 6.5+
> ---
>   arch/arm64/include/asm/hugetlb.h              |  2 +-
>   arch/arm64/mm/hugetlbpage.c                   |  6 ++-
>   arch/parisc/include/asm/hugetlb.h             |  2 +-
>   arch/parisc/mm/hugetlbpage.c                  |  2 +-
>   .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
>   arch/powerpc/mm/book3s64/hugetlbpage.c        |  5 ++-
>   arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  3 +-
>   arch/powerpc/mm/nohash/8xx.c                  |  3 +-
>   arch/powerpc/mm/pgtable.c                     |  3 +-
>   arch/riscv/include/asm/hugetlb.h              |  3 +-
>   arch/riscv/mm/hugetlbpage.c                   |  3 +-
>   arch/s390/include/asm/hugetlb.h               |  6 ++-
>   arch/s390/mm/hugetlbpage.c                    |  8 +++-
>   arch/sparc/include/asm/hugetlb.h              |  6 ++-
>   arch/sparc/mm/hugetlbpage.c                   |  8 +++-
>   include/asm-generic/hugetlb.h                 |  2 +-
>   include/linux/hugetlb.h                       |  6 ++-
>   mm/damon/vaddr.c                              |  3 +-
>   mm/hugetlb.c                                  | 43 +++++++++++--------
>   mm/migrate.c                                  |  7 ++-
>   mm/rmap.c                                     | 23 +++++++---
>   mm/vmalloc.c                                  |  2 +-
>   22 files changed, 100 insertions(+), 49 deletions(-)
>
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index f43a38ac1779..2ddc33d93b13 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -28,7 +28,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
>   #define arch_make_huge_pte arch_make_huge_pte
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>   extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -			    pte_t *ptep, pte_t pte);
> +			    pte_t *ptep, pte_t pte, unsigned long sz);
>   #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
>   extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>   				      unsigned long addr, pte_t *ptep,
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 9c52718ea750..a7f8c8db3425 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -249,7 +249,7 @@ static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
>   }
>   
>   void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -			    pte_t *ptep, pte_t pte)
> +			    pte_t *ptep, pte_t pte, unsigned long sz)
>   {
>   	size_t pgsize;
>   	int i;
> @@ -571,5 +571,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>   void huge_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>   				  pte_t old_pte, pte_t pte)
>   {
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +	unsigned long psize = huge_page_size(hstate_vma(vma));


Does this sequence "huge_page_size(hstate_vma(vma))" work for a THP 
backed vma? Or are we sure that THP paths won't call set_huge_pte_at()?

Thanks,

Alex


> +
> +	set_huge_pte_at(vma->vm_mm, addr, ptep, pte, psize);
>   }
> diff --git a/arch/parisc/include/asm/hugetlb.h b/arch/parisc/include/asm/hugetlb.h
> index f7f078c2872c..72daacc472a0 100644
> --- a/arch/parisc/include/asm/hugetlb.h
> +++ b/arch/parisc/include/asm/hugetlb.h
> @@ -6,7 +6,7 @@
>   
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>   void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -		     pte_t *ptep, pte_t pte);
> +		     pte_t *ptep, pte_t pte, unsigned long sz);
>   
>   #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>   pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
> index a8a1a7c1e16e..a9f7e21f6656 100644
> --- a/arch/parisc/mm/hugetlbpage.c
> +++ b/arch/parisc/mm/hugetlbpage.c
> @@ -140,7 +140,7 @@ static void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   }
>   
>   void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -		     pte_t *ptep, pte_t entry)
> +		     pte_t *ptep, pte_t entry, unsigned long sz)
>   {
>   	__set_huge_pte_at(mm, addr, ptep, entry);
>   }
> diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> index de092b04ee1a..92df40c6cc6b 100644
> --- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> +++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
> @@ -46,7 +46,8 @@ static inline int check_and_get_huge_psize(int shift)
>   }
>   
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> -void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		     pte_t pte, unsigned long sz);
>   
>   #define __HAVE_ARCH_HUGE_PTE_CLEAR
>   static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
> index 3bc0eb21b2a0..5a2e512e96db 100644
> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> @@ -143,11 +143,14 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
>   void huge_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
>   				  pte_t *ptep, pte_t old_pte, pte_t pte)
>   {
> +	unsigned long psize;
>   
>   	if (radix_enabled())
>   		return radix__huge_ptep_modify_prot_commit(vma, addr, ptep,
>   							   old_pte, pte);
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +
> +	psize = huge_page_size(hstate_vma(vma));
> +	set_huge_pte_at(vma->vm_mm, addr, ptep, pte, psize);
>   }
>   
>   void __init hugetlbpage_init_defaultsize(void)
> diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> index 17075c78d4bc..35fd2a95be24 100644
> --- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> +++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> @@ -47,6 +47,7 @@ void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>   					 pte_t old_pte, pte_t pte)
>   {
>   	struct mm_struct *mm = vma->vm_mm;
> +	unsigned long psize = huge_page_size(hstate_vma(vma));
>   
>   	/*
>   	 * POWER9 NMMU must flush the TLB after clearing the PTE before
> @@ -58,5 +59,5 @@ void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>   	    atomic_read(&mm->context.copros) > 0)
>   		radix__flush_hugetlb_page(vma, addr);
>   
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +	set_huge_pte_at(vma->vm_mm, addr, ptep, pte, psize);
>   }
> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index dbbfe897455d..a642a7929892 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -91,7 +91,8 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
>   	if (new && WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
>   		return -EINVAL;
>   
> -	set_huge_pte_at(&init_mm, va, ptep, pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)));
> +	set_huge_pte_at(&init_mm, va, ptep,
> +			pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)), psize);
>   
>   	return 0;
>   }
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index 3f86fd217690..3ba9fe411604 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -288,7 +288,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>   }
>   
>   #if defined(CONFIG_PPC_8xx)
> -void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
> +		     pte_t pte, unsigned long sz)
>   {
>   	pmd_t *pmd = pmd_off(mm, addr);
>   	pte_basic_t val;
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
> index 34e24f078cc1..4c5b0e929890 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -18,7 +18,8 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>   
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>   void set_huge_pte_at(struct mm_struct *mm,
> -		     unsigned long addr, pte_t *ptep, pte_t pte);
> +		     unsigned long addr, pte_t *ptep, pte_t pte,
> +		     unsigned long sz);
>   
>   #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
>   pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 96225a8533ad..e4a2ace92dbe 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -180,7 +180,8 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>   void set_huge_pte_at(struct mm_struct *mm,
>   		     unsigned long addr,
>   		     pte_t *ptep,
> -		     pte_t pte)
> +		     pte_t pte,
> +		     unsigned long sz)
>   {
>   	int i, pte_num;
>   
> diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
> index f07267875a19..deb198a61039 100644
> --- a/arch/s390/include/asm/hugetlb.h
> +++ b/arch/s390/include/asm/hugetlb.h
> @@ -16,6 +16,8 @@
>   #define hugepages_supported()			(MACHINE_HAS_EDAT1)
>   
>   void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +		     pte_t *ptep, pte_t pte, unsigned long sz);
> +void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   		     pte_t *ptep, pte_t pte);
>   pte_t huge_ptep_get(pte_t *ptep);
>   pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> @@ -65,7 +67,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>   	int changed = !pte_same(huge_ptep_get(ptep), pte);
>   	if (changed) {
>   		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
> -		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
>   	}
>   	return changed;
>   }
> @@ -74,7 +76,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>   					   unsigned long addr, pte_t *ptep)
>   {
>   	pte_t pte = huge_ptep_get_and_clear(mm, addr, ptep);
> -	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
> +	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(pte));
>   }
>   
>   static inline pte_t mk_huge_pte(struct page *page, pgprot_t pgprot)
> diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
> index c718f2a0de94..297a6d897d5a 100644
> --- a/arch/s390/mm/hugetlbpage.c
> +++ b/arch/s390/mm/hugetlbpage.c
> @@ -142,7 +142,7 @@ static void clear_huge_pte_skeys(struct mm_struct *mm, unsigned long rste)
>   		__storage_key_init_range(paddr, paddr + size - 1);
>   }
>   
> -void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   		     pte_t *ptep, pte_t pte)
>   {
>   	unsigned long rste;
> @@ -163,6 +163,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   	set_pte(ptep, __pte(rste));
>   }
>   
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +		     pte_t *ptep, pte_t pte, unsigned long sz)
> +{
> +	__set_huge_pte_at(mm, addr, ptep, pte);
> +}
> +
>   pte_t huge_ptep_get(pte_t *ptep)
>   {
>   	return __rste_to_pte(pte_val(*ptep));
> diff --git a/arch/sparc/include/asm/hugetlb.h b/arch/sparc/include/asm/hugetlb.h
> index 0a26cca24232..c714ca6a05aa 100644
> --- a/arch/sparc/include/asm/hugetlb.h
> +++ b/arch/sparc/include/asm/hugetlb.h
> @@ -14,6 +14,8 @@ extern struct pud_huge_patch_entry __pud_huge_patch, __pud_huge_patch_end;
>   
>   #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>   void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +		     pte_t *ptep, pte_t pte, unsigned long sz);
> +void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   		     pte_t *ptep, pte_t pte);
>   
>   #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> @@ -32,7 +34,7 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
>   					   unsigned long addr, pte_t *ptep)
>   {
>   	pte_t old_pte = *ptep;
> -	set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
> +	__set_huge_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
>   }
>   
>   #define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> @@ -42,7 +44,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>   {
>   	int changed = !pte_same(*ptep, pte);
>   	if (changed) {
> -		set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
>   		flush_tlb_page(vma, addr);
>   	}
>   	return changed;
> diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
> index d7018823206c..b432500c13a5 100644
> --- a/arch/sparc/mm/hugetlbpage.c
> +++ b/arch/sparc/mm/hugetlbpage.c
> @@ -328,7 +328,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>   	return pte_offset_huge(pmd, addr);
>   }
>   
> -void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   		     pte_t *ptep, pte_t entry)
>   {
>   	unsigned int nptes, orig_shift, shift;
> @@ -364,6 +364,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>   				    orig_shift);
>   }
>   
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +		     pte_t *ptep, pte_t entry, unsigned long sz)
> +{
> +	__set_huge_pte_at(mm, addr, ptep, entry);
> +}
> +
>   pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>   			      pte_t *ptep)
>   {
> diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
> index 4da02798a00b..6dcf4d576970 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -76,7 +76,7 @@ static inline void hugetlb_free_pgd_range(struct mmu_gather *tlb,
>   
>   #ifndef __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
>   static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -		pte_t *ptep, pte_t pte)
> +		pte_t *ptep, pte_t pte, unsigned long sz)
>   {
>   	set_pte_at(mm, addr, ptep, pte);
>   }
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 5b2626063f4f..a30686e649f7 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -984,7 +984,9 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>   						unsigned long addr, pte_t *ptep,
>   						pte_t old_pte, pte_t pte)
>   {
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +	unsigned long psize = huge_page_size(hstate_vma(vma));
> +
> +	set_huge_pte_at(vma->vm_mm, addr, ptep, pte, psize);
>   }
>   #endif
>   
> @@ -1173,7 +1175,7 @@ static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>   }
>   
>   static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -				   pte_t *ptep, pte_t pte)
> +				   pte_t *ptep, pte_t pte, unsigned long sz)
>   {
>   }
>   
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index 4c81a9dbd044..cf8a9fc5c9d1 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -341,13 +341,14 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
>   	bool referenced = false;
>   	pte_t entry = huge_ptep_get(pte);
>   	struct folio *folio = pfn_folio(pte_pfn(entry));
> +	unsigned long psize = huge_page_size(hstate_vma(vma));
>   
>   	folio_get(folio);
>   
>   	if (pte_young(entry)) {
>   		referenced = true;
>   		entry = pte_mkold(entry);
> -		set_huge_pte_at(mm, addr, pte, entry);
> +		set_huge_pte_at(mm, addr, pte, entry, psize);
>   	}
>   
>   #ifdef CONFIG_MMU_NOTIFIER
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ba6d39b71cb1..52d26072dfda 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4980,7 +4980,7 @@ static bool is_hugetlb_entry_hwpoisoned(pte_t pte)
>   
>   static void
>   hugetlb_install_folio(struct vm_area_struct *vma, pte_t *ptep, unsigned long addr,
> -		      struct folio *new_folio, pte_t old)
> +		      struct folio *new_folio, pte_t old, unsigned long sz)
>   {
>   	pte_t newpte = make_huge_pte(vma, &new_folio->page, 1);
>   
> @@ -4988,7 +4988,7 @@ hugetlb_install_folio(struct vm_area_struct *vma, pte_t *ptep, unsigned long add
>   	hugepage_add_new_anon_rmap(new_folio, vma, addr);
>   	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(old))
>   		newpte = huge_pte_mkuffd_wp(newpte);
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, newpte);
> +	set_huge_pte_at(vma->vm_mm, addr, ptep, newpte, sz);
>   	hugetlb_count_add(pages_per_huge_page(hstate_vma(vma)), vma->vm_mm);
>   	folio_set_hugetlb_migratable(new_folio);
>   }
> @@ -5065,7 +5065,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
>   		} else if (unlikely(is_hugetlb_entry_hwpoisoned(entry))) {
>   			if (!userfaultfd_wp(dst_vma))
>   				entry = huge_pte_clear_uffd_wp(entry);
> -			set_huge_pte_at(dst, addr, dst_pte, entry);
> +			set_huge_pte_at(dst, addr, dst_pte, entry, sz);
>   		} else if (unlikely(is_hugetlb_entry_migration(entry))) {
>   			swp_entry_t swp_entry = pte_to_swp_entry(entry);
>   			bool uffd_wp = pte_swp_uffd_wp(entry);
> @@ -5080,18 +5080,18 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
>   				entry = swp_entry_to_pte(swp_entry);
>   				if (userfaultfd_wp(src_vma) && uffd_wp)
>   					entry = pte_swp_mkuffd_wp(entry);
> -				set_huge_pte_at(src, addr, src_pte, entry);
> +				set_huge_pte_at(src, addr, src_pte, entry, sz);
>   			}
>   			if (!userfaultfd_wp(dst_vma))
>   				entry = huge_pte_clear_uffd_wp(entry);
> -			set_huge_pte_at(dst, addr, dst_pte, entry);
> +			set_huge_pte_at(dst, addr, dst_pte, entry, sz);
>   		} else if (unlikely(is_pte_marker(entry))) {
>   			pte_marker marker = copy_pte_marker(
>   				pte_to_swp_entry(entry), dst_vma);
>   
>   			if (marker)
>   				set_huge_pte_at(dst, addr, dst_pte,
> -						make_pte_marker(marker));
> +						make_pte_marker(marker), sz);
>   		} else {
>   			entry = huge_ptep_get(src_pte);
>   			pte_folio = page_folio(pte_page(entry));
> @@ -5145,7 +5145,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
>   					goto again;
>   				}
>   				hugetlb_install_folio(dst_vma, dst_pte, addr,
> -						      new_folio, src_pte_old);
> +						      new_folio, src_pte_old, sz);
>   				spin_unlock(src_ptl);
>   				spin_unlock(dst_ptl);
>   				continue;
> @@ -5166,7 +5166,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
>   			if (!userfaultfd_wp(dst_vma))
>   				entry = huge_pte_clear_uffd_wp(entry);
>   
> -			set_huge_pte_at(dst, addr, dst_pte, entry);
> +			set_huge_pte_at(dst, addr, dst_pte, entry, sz);
>   			hugetlb_count_add(npages, dst);
>   		}
>   		spin_unlock(src_ptl);
> @@ -5184,7 +5184,8 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
>   }
>   
>   static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
> -			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte)
> +			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte,
> +			  unsigned long sz)
>   {
>   	struct hstate *h = hstate_vma(vma);
>   	struct mm_struct *mm = vma->vm_mm;
> @@ -5202,7 +5203,7 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
>   		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>   
>   	pte = huge_ptep_get_and_clear(mm, old_addr, src_pte);
> -	set_huge_pte_at(mm, new_addr, dst_pte, pte);
> +	set_huge_pte_at(mm, new_addr, dst_pte, pte, sz);
>   
>   	if (src_ptl != dst_ptl)
>   		spin_unlock(src_ptl);
> @@ -5259,7 +5260,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   		if (!dst_pte)
>   			break;
>   
> -		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte);
> +		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte, sz);
>   	}
>   
>   	if (shared_pmd)
> @@ -5337,7 +5338,8 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
>   			if (pte_swp_uffd_wp_any(pte) &&
>   			    !(zap_flags & ZAP_FLAG_DROP_MARKER))
>   				set_huge_pte_at(mm, address, ptep,
> -						make_pte_marker(PTE_MARKER_UFFD_WP));
> +						make_pte_marker(PTE_MARKER_UFFD_WP),
> +						sz);
>   			else
>   				huge_pte_clear(mm, address, ptep, sz);
>   			spin_unlock(ptl);
> @@ -5371,7 +5373,8 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
>   		if (huge_pte_uffd_wp(pte) &&
>   		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
>   			set_huge_pte_at(mm, address, ptep,
> -					make_pte_marker(PTE_MARKER_UFFD_WP));
> +					make_pte_marker(PTE_MARKER_UFFD_WP),
> +					sz);
>   		hugetlb_count_sub(pages_per_huge_page(h), mm);
>   		page_remove_rmap(page, vma, true);
>   
> @@ -5676,7 +5679,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
>   		hugepage_add_new_anon_rmap(new_folio, vma, haddr);
>   		if (huge_pte_uffd_wp(pte))
>   			newpte = huge_pte_mkuffd_wp(newpte);
> -		set_huge_pte_at(mm, haddr, ptep, newpte);
> +		set_huge_pte_at(mm, haddr, ptep, newpte, huge_page_size(h));
>   		folio_set_hugetlb_migratable(new_folio);
>   		/* Make the old page be freed below */
>   		new_folio = old_folio;
> @@ -5972,7 +5975,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
>   	 */
>   	if (unlikely(pte_marker_uffd_wp(old_pte)))
>   		new_pte = huge_pte_mkuffd_wp(new_pte);
> -	set_huge_pte_at(mm, haddr, ptep, new_pte);
> +	set_huge_pte_at(mm, haddr, ptep, new_pte, huge_page_size(h));
>   
>   	hugetlb_count_add(pages_per_huge_page(h), mm);
>   	if ((flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
> @@ -6261,7 +6264,8 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>   		}
>   
>   		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
> -		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
> +		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte,
> +				huge_page_size(h));
>   
>   		/* No need to invalidate - it was non-present before */
>   		update_mmu_cache(dst_vma, dst_addr, dst_pte);
> @@ -6412,7 +6416,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>   	if (wp_enabled)
>   		_dst_pte = huge_pte_mkuffd_wp(_dst_pte);
>   
> -	set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
> +	set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, huge_page_size(h));
>   
>   	hugetlb_count_add(pages_per_huge_page(h), dst_mm);
>   
> @@ -6598,7 +6602,7 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
>   			else if (uffd_wp_resolve)
>   				newpte = pte_swp_clear_uffd_wp(newpte);
>   			if (!pte_same(pte, newpte))
> -				set_huge_pte_at(mm, address, ptep, newpte);
> +				set_huge_pte_at(mm, address, ptep, newpte, psize);
>   		} else if (unlikely(is_pte_marker(pte))) {
>   			/* No other markers apply for now. */
>   			WARN_ON_ONCE(!pte_marker_uffd_wp(pte));
> @@ -6623,7 +6627,8 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
>   			if (unlikely(uffd_wp))
>   				/* Safe to modify directly (none->non-present). */
>   				set_huge_pte_at(mm, address, ptep,
> -						make_pte_marker(PTE_MARKER_UFFD_WP));
> +						make_pte_marker(PTE_MARKER_UFFD_WP),
> +						psize);
>   		}
>   		spin_unlock(ptl);
>   	}
> diff --git a/mm/migrate.c b/mm/migrate.c
> index b7fa020003f3..2053b54556ca 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -243,7 +243,9 @@ static bool remove_migration_pte(struct folio *folio,
>   
>   #ifdef CONFIG_HUGETLB_PAGE
>   		if (folio_test_hugetlb(folio)) {
> -			unsigned int shift = huge_page_shift(hstate_vma(vma));
> +			struct hstate *h = hstate_vma(vma);
> +			unsigned int shift = huge_page_shift(h);
> +			unsigned long psize = huge_page_size(h);
>   
>   			pte = arch_make_huge_pte(pte, shift, vma->vm_flags);
>   			if (folio_test_anon(folio))
> @@ -251,7 +253,8 @@ static bool remove_migration_pte(struct folio *folio,
>   						       rmap_flags);
>   			else
>   				page_dup_file_rmap(new, true);
> -			set_huge_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> +			set_huge_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte,
> +					psize);
>   		} else
>   #endif
>   		{
> diff --git a/mm/rmap.c b/mm/rmap.c
> index ec7f8e6c9e48..9f795b93cf40 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1480,6 +1480,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   	struct mmu_notifier_range range;
>   	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>   	unsigned long pfn;
> +	unsigned long hsz = 0;
>   
>   	/*
>   	 * When racing against e.g. zap_pte_range() on another cpu,
> @@ -1511,6 +1512,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   		 */
>   		adjust_range_if_pmd_sharing_possible(vma, &range.start,
>   						     &range.end);
> +
> +		/* We need the huge page size for set_huge_pte_at() */
> +		hsz = huge_page_size(hstate_vma(vma));
>   	}
>   	mmu_notifier_invalidate_range_start(&range);
>   
> @@ -1628,7 +1632,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
>   			if (folio_test_hugetlb(folio)) {
>   				hugetlb_count_sub(folio_nr_pages(folio), mm);
> -				set_huge_pte_at(mm, address, pvmw.pte, pteval);
> +				set_huge_pte_at(mm, address, pvmw.pte, pteval,
> +						hsz);
>   			} else {
>   				dec_mm_counter(mm, mm_counter(&folio->page));
>   				set_pte_at(mm, address, pvmw.pte, pteval);
> @@ -1820,6 +1825,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   	struct mmu_notifier_range range;
>   	enum ttu_flags flags = (enum ttu_flags)(long)arg;
>   	unsigned long pfn;
> +	unsigned long hsz = 0;
>   
>   	/*
>   	 * When racing against e.g. zap_pte_range() on another cpu,
> @@ -1855,6 +1861,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   		 */
>   		adjust_range_if_pmd_sharing_possible(vma, &range.start,
>   						     &range.end);
> +
> +		/* We need the huge page size for set_huge_pte_at() */
> +		hsz = huge_page_size(hstate_vma(vma));
>   	}
>   	mmu_notifier_invalidate_range_start(&range);
>   
> @@ -2020,7 +2029,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
>   			if (folio_test_hugetlb(folio)) {
>   				hugetlb_count_sub(folio_nr_pages(folio), mm);
> -				set_huge_pte_at(mm, address, pvmw.pte, pteval);
> +				set_huge_pte_at(mm, address, pvmw.pte, pteval,
> +						hsz);
>   			} else {
>   				dec_mm_counter(mm, mm_counter(&folio->page));
>   				set_pte_at(mm, address, pvmw.pte, pteval);
> @@ -2044,7 +2054,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   
>   			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>   				if (folio_test_hugetlb(folio))
> -					set_huge_pte_at(mm, address, pvmw.pte, pteval);
> +					set_huge_pte_at(mm, address, pvmw.pte,
> +							pteval, hsz);
>   				else
>   					set_pte_at(mm, address, pvmw.pte, pteval);
>   				ret = false;
> @@ -2058,7 +2069,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   			if (anon_exclusive &&
>   			    page_try_share_anon_rmap(subpage)) {
>   				if (folio_test_hugetlb(folio))
> -					set_huge_pte_at(mm, address, pvmw.pte, pteval);
> +					set_huge_pte_at(mm, address, pvmw.pte,
> +							pteval, hsz);
>   				else
>   					set_pte_at(mm, address, pvmw.pte, pteval);
>   				ret = false;
> @@ -2090,7 +2102,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>   			if (pte_uffd_wp(pteval))
>   				swp_pte = pte_swp_mkuffd_wp(swp_pte);
>   			if (folio_test_hugetlb(folio))
> -				set_huge_pte_at(mm, address, pvmw.pte, swp_pte);
> +				set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
> +						hsz);
>   			else
>   				set_pte_at(mm, address, pvmw.pte, swp_pte);
>   			trace_set_migration_pte(address, pte_val(swp_pte),
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ef8599d394fd..a3fedb3ee0db 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -111,7 +111,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>   			pte_t entry = pfn_pte(pfn, prot);
>   
>   			entry = arch_make_huge_pte(entry, ilog2(size), 0);
> -			set_huge_pte_at(&init_mm, addr, pte, entry);
> +			set_huge_pte_at(&init_mm, addr, pte, entry, size);
>   			pfn += PFN_DOWN(size);
>   			continue;
>   		}
