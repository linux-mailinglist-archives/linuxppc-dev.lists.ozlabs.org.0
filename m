Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C857AA699
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 03:38:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PNAAsjxZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsFJx1tncz3cjv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 11:38:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PNAAsjxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsFJ20jqQz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 11:37:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0642EB820DA;
	Fri, 22 Sep 2023 01:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2723CC433C8;
	Fri, 22 Sep 2023 01:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695346635;
	bh=zRyL223DT0AFJx1gaOEUn6WcLlX2Kysk+6Fs0mtLrOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PNAAsjxZ/e5mSgGg/LPftlkbNKpcN/rnJGyJdb//w0VkNEAdvtPkglz83EUpi+iRP
	 CUifgPcEfIXikkO8FSBVWAewa4zbTOyW/Yl5flrqUDllqJAE3SzG2kmjrjAZrmJDHo
	 crbAM8SWYY+JnkBboXDn+/Qz7CHhlgXE7xG/2qP2x0dmB0tprvlPXeP9NzkYvk+r3s
	 0uxngMBI0XN0BvxVhCId+ACbyTDCZOXDjS5wdL3TxpEGcwtg23dBoXZkT0xPOs4c86
	 SSz1LUNN37N0YRjVtKgcGjRfXwPjXi9P2JOPVjrrrvT7bUtXub+Siisb+MvwlrdxSE
	 a+KWdAyrmeGOA==
From: SeongJae Park <sj@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v1 6/8] mm: hugetlb: Convert set_huge_pte_at() to take vma
Date: Fri, 22 Sep 2023 01:37:11 +0000
Message-Id: <20230922013711.100278-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-7-ryan.roberts@arm.com>
References: 
MIME-Version: 1.0
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
Cc: Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org
 , stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ryan,

On Thu, 21 Sep 2023 17:20:05 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:

> In order to fix a bug, arm64 needs access to the vma inside it's
> implementation of set_huge_pte_at(). Provide for this by converting the
> mm parameter to be a vma. Any implementations that require the mm can
> access it via vma->vm_mm.
> 
> This commit makes the required modifications to the core mm. Separate
> commits update the arches, before the actual bug is fixed in arm64.
> 
> No behavioral changes intended.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

For mm/damon/ part change,

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ


> ---
>  include/asm-generic/hugetlb.h |  6 +++---
>  include/linux/hugetlb.h       |  6 +++---
>  mm/damon/vaddr.c              |  2 +-
>  mm/hugetlb.c                  | 30 +++++++++++++++---------------
>  mm/migrate.c                  |  2 +-
>  mm/rmap.c                     | 10 +++++-----
>  mm/vmalloc.c                  |  5 ++++-
>  7 files changed, 32 insertions(+), 29 deletions(-)
> 
> diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
> index 4da02798a00b..515e4777fb65 100644
> --- a/include/asm-generic/hugetlb.h
> +++ b/include/asm-generic/hugetlb.h
> @@ -75,10 +75,10 @@ static inline void hugetlb_free_pgd_range(struct mmu_gather *tlb,
>  #endif
>  
>  #ifndef __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> -static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -		pte_t *ptep, pte_t pte)
> +static inline void set_huge_pte_at(struct vm_area_struct *vma,
> +		unsigned long addr, pte_t *ptep, pte_t pte)
>  {
> -	set_pte_at(mm, addr, ptep, pte);
> +	set_pte_at(vma->vm_mm, addr, ptep, pte);
>  }
>  #endif
>  
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 5b2626063f4f..08184f32430c 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -984,7 +984,7 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
>  						unsigned long addr, pte_t *ptep,
>  						pte_t old_pte, pte_t pte)
>  {
> -	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
> +	set_huge_pte_at(vma, addr, ptep, pte);
>  }
>  #endif
>  
> @@ -1172,8 +1172,8 @@ static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  #endif
>  }
>  
> -static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> -				   pte_t *ptep, pte_t pte)
> +static inline void set_huge_pte_at(struct vm_area_struct *vma,
> +				   unsigned long addr, pte_t *ptep, pte_t pte)
>  {
>  }
>  
> diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
> index 4c81a9dbd044..55da8cee8fbc 100644
> --- a/mm/damon/vaddr.c
> +++ b/mm/damon/vaddr.c
> @@ -347,7 +347,7 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
>  	if (pte_young(entry)) {
>  		referenced = true;
>  		entry = pte_mkold(entry);
> -		set_huge_pte_at(mm, addr, pte, entry);
> +		set_huge_pte_at(vma, addr, pte, entry);
>  	}
>  
>  #ifdef CONFIG_MMU_NOTIFIER
[...]


Thanks,
SJ
