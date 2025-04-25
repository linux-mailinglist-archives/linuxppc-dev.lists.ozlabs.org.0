Return-Path: <linuxppc-dev+bounces-7992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36494A9CE43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 18:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkdlV4fTdz30Jc;
	Sat, 26 Apr 2025 02:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745598998;
	cv=none; b=ChWWaUcf4/pIZ2B0x/PTgvdpLJxnse/7Sh310FQM+VRk5vSYEKrvbtUiQ95jIg3QTQRnpm7JP4phNyQCxXLRc2PLZUfgvesJY4KB4XKITUX+02z92HedfHkGI/qJ8mDanY24DHPgRzROhg+Dvw9dS7m/zSY9qmHm+LYdb/6FU4PkLjX/HNmt0kXmdXBeyMG/TX9Q1mXWQy5fs61/4XbVISk7ofzK3yg/hlKdoqV5qT0cBc8svb6/ltzJYJ7sBzm1tFS+td5+QPxa8Tut1QyQuzf9EamuNkO0OL3D8UnZ790DR71TuNBsvGSTsXW+jnuzytRTGrB7ywleuWW76QuWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745598998; c=relaxed/relaxed;
	bh=UoSIWEZjnJvFHHJcidBd9gWqF1dgFiYXT2UqixJzyRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7wQ1C1s0PrM5ID8vJiljVnxgLTiXSC2ZRkjKTVSkVFB5Lg0z7KHJf49QcMBnl1393cUDphmL8Y09GHU3vShD1zZpI8zCSg/UFDEnuBhqnlz3MprmP1OXNYU3rZLdHNyzH5Cnzjg2UL+h5e5iOXrtgskAfcNgJR6tMi4bNljayADsYar8/9lr7J3hF4gYMnGXS1k3sBCTVwmZyeu8WxGJ4uaBOK9uIVitJBzQ6XKjvI5UvfAgeY8Sl4iUonKM9lcMJHl81IHNXQSFSNIRfcI1emgMpJStS4WLb0C+xDeLuBja4OMELMHOaGRLCuKx+uHQnT0KkXApfvPHslyhaB64w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6iMPIIM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I6iMPIIM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkdlT46wLz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:36:37 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PAftkV024809;
	Fri, 25 Apr 2025 16:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UoSIWEZjnJvFHHJcidBd9gWqF1dgFi
	YXT2UqixJzyRw=; b=I6iMPIIMKAA98kW3WEbpflVNtKf9Vf/3RXc49Xlyb+oaEO
	DkFcwBa5NOK/Ijyze6TsMdgIA0BN/40a01sWV1hsCHNsSDOa2h5dvitFEfqfUy+6
	xnSPfd68+Yf4rEik84JilejXUuMTVBn27suA16fX+VK3Qvb7ZxVo9PrcJiFCcATe
	3j0R3EI/NZmCPfZbtJ+hdnnBSKxFw9cBbHuloJ8GR+C/wlKAFKUmgNarRhmrk/aJ
	b4DdMyARsXJ8YAojaXQutX0wjRRap+GcrAu8FQt9LLj9NxNWLYifHEJbT3VHgAWR
	BuiJxB4OSQ9f8fl8twYhwpLsrXMUxnr7vU4Akqiw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4688ushnap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:34:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PG9Iq6005861;
	Fri, 25 Apr 2025 16:34:58 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfxp49b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:34:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PGYunP34144900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:34:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 117B320043;
	Fri, 25 Apr 2025 16:34:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327C120040;
	Fri, 25 Apr 2025 16:34:54 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.73.111])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 16:34:54 +0000 (GMT)
Date: Fri, 25 Apr 2025 18:34:52 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
        Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 01/12] mm: Pass mm down to pagetable_{pte,pmd}_ctor
Message-ID: <aAu5rHSX7w9xjqg9@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-2-kevin.brodsky@arm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408095222.860601-2-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=680bb9b3 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=7XQ_oYAFJgMplnqaJ0EA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNCBTYWx0ZWRfX9h3njuqExHoJ HJja56Lsy6oDF9Y2PLpbY+BFxd+fFSA9eBOYUkRmoMsfaaEczHXT0eDuxVxlAIJlJaXl7Xv4svl xoD9EVVTCUr7G+SiAowO7thlblslz0QJVG0YZJ4LLob9P5jRE+9+FXgAlOa2WKV0mUz/rHhvjYU
 ZaYlhcCij+yfiw3l3u7HqsXe947Sd+mv7GgDjQ/XOdobx+p/ADROGya1SGkL7CQwpRfGrIsJeNQ SsjPFxupcxH7HW2700dNMXsuJM80DaxyYPS558iwl5L2yjVjkxzKDcnXaPT36gp6VICnX1ilHLD 17wtWOO+Bsz/H9E6NGBT7N7S3f5yQk0YK8qoc+FuXC5RN62KwcdDcYpG2DlQuYQ0y/a7g+0+cTX
 hkJE/E/TkWW9RaWs6WdeNkTOse1BsrO1K9sG/M2tJB/eJ4fHemqsaYVdBoroeLJ8IffsQG2U
X-Proofpoint-ORIG-GUID: ySTbmFj0-W242HV95924LVB8DHS4YoGV
X-Proofpoint-GUID: ySTbmFj0-W242HV95924LVB8DHS4YoGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250114
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 10:52:11AM +0100, Kevin Brodsky wrote:
> In preparation for calling constructors for all kernel page tables
> while eliding unnecessary ptlock initialisation, let's pass down the
> associated mm to the PTE/PMD level ctors. (These are the two levels
> where ptlocks are used.)
> 
> In most cases the mm is already around at the point of calling the
> ctor so we simply pass it down. This is however not the case for
> special page table allocators:
> 
> * arch/arm/mm/mmu.c
> * arch/arm64/mm/mmu.c
> * arch/riscv/mm/init.c
> 
> In those cases, the page tables being allocated are either for
> standard kernel memory (init_mm) or special page directories, which
> may not be associated to any mm. For now let's pass NULL as mm; this
> will be refined where possible in future patches.
> 
> No functional change in this patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm/mm/mmu.c                        |  2 +-
>  arch/arm64/mm/mmu.c                      |  4 ++--
>  arch/loongarch/include/asm/pgalloc.h     |  2 +-
>  arch/m68k/include/asm/mcf_pgalloc.h      |  2 +-
>  arch/m68k/include/asm/motorola_pgalloc.h | 10 +++++-----
>  arch/m68k/mm/motorola.c                  |  6 +++---
>  arch/mips/include/asm/pgalloc.h          |  2 +-
>  arch/parisc/include/asm/pgalloc.h        |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       |  2 +-
>  arch/powerpc/mm/pgtable-frag.c           |  2 +-
>  arch/riscv/mm/init.c                     |  4 ++--
>  arch/s390/include/asm/pgalloc.h          |  2 +-
>  arch/s390/mm/pgalloc.c                   |  2 +-
>  arch/sparc/mm/init_64.c                  |  2 +-
>  arch/sparc/mm/srmmu.c                    |  2 +-
>  arch/x86/mm/pgtable.c                    |  2 +-
>  include/asm-generic/pgalloc.h            |  4 ++--
>  include/linux/mm.h                       |  6 ++++--
>  18 files changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index f02f872ea8a9..edb7f56b7c91 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -735,7 +735,7 @@ static void *__init late_alloc(unsigned long sz)
>  	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM,
>  			get_order(sz));
>  
> -	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
> +	if (!ptdesc || !pagetable_pte_ctor(NULL, ptdesc))
>  		BUG();
>  	return ptdesc_to_virt(ptdesc);
>  }
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..8c5c471cfb06 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -494,9 +494,9 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>  	 * folded, and if so pagetable_pte_ctor() becomes nop.
>  	 */
>  	if (shift == PAGE_SHIFT)
> -		BUG_ON(!pagetable_pte_ctor(ptdesc));
> +		BUG_ON(!pagetable_pte_ctor(NULL, ptdesc));
>  	else if (shift == PMD_SHIFT)
> -		BUG_ON(!pagetable_pmd_ctor(ptdesc));
> +		BUG_ON(!pagetable_pmd_ctor(NULL, ptdesc));
>  
>  	return pa;
>  }
> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
> index b58f587f0f0a..1c63a9d9a6d3 100644
> --- a/arch/loongarch/include/asm/pgalloc.h
> +++ b/arch/loongarch/include/asm/pgalloc.h
> @@ -69,7 +69,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pagetable_pmd_ctor(ptdesc)) {
> +	if (!pagetable_pmd_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
> index 4c648b51e7fd..465a71101b7d 100644
> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -48,7 +48,7 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pte_ctor(ptdesc)) {
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/m68k/include/asm/motorola_pgalloc.h b/arch/m68k/include/asm/motorola_pgalloc.h
> index 5abe7da8ac5a..1091fb0affbe 100644
> --- a/arch/m68k/include/asm/motorola_pgalloc.h
> +++ b/arch/m68k/include/asm/motorola_pgalloc.h
> @@ -15,7 +15,7 @@ enum m68k_table_types {
>  };
>  
>  extern void init_pointer_table(void *table, int type);
> -extern void *get_pointer_table(int type);
> +extern void *get_pointer_table(struct mm_struct *mm, int type);
>  extern int free_pointer_table(void *table, int type);
>  
>  /*
> @@ -26,7 +26,7 @@ extern int free_pointer_table(void *table, int type);
>  
>  static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -	return get_pointer_table(TABLE_PTE);
> +	return get_pointer_table(mm, TABLE_PTE);
>  }
>  
>  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> @@ -36,7 +36,7 @@ static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -	return get_pointer_table(TABLE_PTE);
> +	return get_pointer_table(mm, TABLE_PTE);
>  }
>  
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
> @@ -53,7 +53,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
>  
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
> -	return get_pointer_table(TABLE_PMD);
> +	return get_pointer_table(mm, TABLE_PMD);
>  }
>  
>  static inline int pmd_free(struct mm_struct *mm, pmd_t *pmd)
> @@ -75,7 +75,7 @@ static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	return get_pointer_table(TABLE_PGD);
> +	return get_pointer_table(mm, TABLE_PGD);
>  }
>  
>  
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 73651e093c4d..6ab3ef39ba7a 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -139,7 +139,7 @@ void __init init_pointer_table(void *table, int type)
>  	return;
>  }
>  
> -void *get_pointer_table(int type)
> +void *get_pointer_table(struct mm_struct *mm, int type)
>  {
>  	ptable_desc *dp = ptable_list[type].next;
>  	unsigned int mask = list_empty(&ptable_list[type]) ? 0 : PD_MARKBITS(dp);
> @@ -164,10 +164,10 @@ void *get_pointer_table(int type)
>  			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
>  			 * SMP.
>  			 */
> -			pagetable_pte_ctor(virt_to_ptdesc(page));
> +			pagetable_pte_ctor(mm, virt_to_ptdesc(page));
>  			break;
>  		case TABLE_PMD:
> -			pagetable_pmd_ctor(virt_to_ptdesc(page));
> +			pagetable_pmd_ctor(mm, virt_to_ptdesc(page));
>  			break;
>  		case TABLE_PGD:
>  			pagetable_pgd_ctor(virt_to_ptdesc(page));
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index bbca420c96d3..942af87f1cdd 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -62,7 +62,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pagetable_pmd_ctor(ptdesc)) {
> +	if (!pagetable_pmd_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
> index 2ca74a56415c..3b84ee93edaa 100644
> --- a/arch/parisc/include/asm/pgalloc.h
> +++ b/arch/parisc/include/asm/pgalloc.h
> @@ -39,7 +39,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  	ptdesc = pagetable_alloc(gfp, PMD_TABLE_ORDER);
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pmd_ctor(ptdesc)) {
> +	if (!pagetable_pmd_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 8f7d41ce2ca1..a282233c8785 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -422,7 +422,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>  	ptdesc = pagetable_alloc(gfp, 0);
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pmd_ctor(ptdesc)) {
> +	if (!pagetable_pmd_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> index 713268ccb1a0..387e9b1fe12c 100644
> --- a/arch/powerpc/mm/pgtable-frag.c
> +++ b/arch/powerpc/mm/pgtable-frag.c
> @@ -61,7 +61,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>  		ptdesc = pagetable_alloc(PGALLOC_GFP | __GFP_ACCOUNT, 0);
>  		if (!ptdesc)
>  			return NULL;
> -		if (!pagetable_pte_ctor(ptdesc)) {
> +		if (!pagetable_pte_ctor(mm, ptdesc)) {
>  			pagetable_free(ptdesc);
>  			return NULL;
>  		}
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ab475ec6ca42..e5ef693fc778 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -442,7 +442,7 @@ static phys_addr_t __meminit alloc_pte_late(uintptr_t va)
>  {
>  	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
>  
> -	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
> +	BUG_ON(!ptdesc || !pagetable_pte_ctor(NULL, ptdesc));
>  	return __pa((pte_t *)ptdesc_address(ptdesc));
>  }
>  
> @@ -522,7 +522,7 @@ static phys_addr_t __meminit alloc_pmd_late(uintptr_t va)
>  {
>  	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
>  
> -	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
> +	BUG_ON(!ptdesc || !pagetable_pmd_ctor(NULL, ptdesc));
>  	return __pa((pmd_t *)ptdesc_address(ptdesc));
>  }
>  
> diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
> index 005497ffebda..5345398df653 100644
> --- a/arch/s390/include/asm/pgalloc.h
> +++ b/arch/s390/include/asm/pgalloc.h
> @@ -97,7 +97,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long vmaddr)
>  	if (!table)
>  		return NULL;
>  	crst_table_init(table, _SEGMENT_ENTRY_EMPTY);
> -	if (!pagetable_pmd_ctor(virt_to_ptdesc(table))) {
> +	if (!pagetable_pmd_ctor(mm, virt_to_ptdesc(table))) {
>  		crst_table_free(mm, table);
>  		return NULL;
>  	}
> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> index e3a6f8ae156c..619d6917e3b7 100644
> --- a/arch/s390/mm/pgalloc.c
> +++ b/arch/s390/mm/pgalloc.c
> @@ -145,7 +145,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  	ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pte_ctor(ptdesc)) {
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 760818950464..5c8eabda1d17 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2895,7 +2895,7 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pte_ctor(ptdesc)) {
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index dd32711022f5..f8fb4911d360 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -350,7 +350,7 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
>  	if (page_ref_inc_return(page) == 2 &&
> -			!pagetable_pte_ctor(page_ptdesc(page))) {
> +			!pagetable_pte_ctor(mm, page_ptdesc(page))) {
>  		page_ref_dec(page);
>  		ptep = NULL;
>  	}
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index a05fcddfc811..7930f234c5f6 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -205,7 +205,7 @@ static int preallocate_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
>  
>  		if (!ptdesc)
>  			failed = true;
> -		if (ptdesc && !pagetable_pmd_ctor(ptdesc)) {
> +		if (ptdesc && !pagetable_pmd_ctor(mm, ptdesc)) {
>  			pagetable_free(ptdesc);
>  			ptdesc = NULL;
>  			failed = true;
> diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
> index 892ece4558a2..e164ca66f0f6 100644
> --- a/include/asm-generic/pgalloc.h
> +++ b/include/asm-generic/pgalloc.h
> @@ -70,7 +70,7 @@ static inline pgtable_t __pte_alloc_one_noprof(struct mm_struct *mm, gfp_t gfp)
>  	ptdesc = pagetable_alloc_noprof(gfp, 0);
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pte_ctor(ptdesc)) {
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> @@ -137,7 +137,7 @@ static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
>  	ptdesc = pagetable_alloc_noprof(gfp, 0);
>  	if (!ptdesc)
>  		return NULL;
> -	if (!pagetable_pmd_ctor(ptdesc)) {
> +	if (!pagetable_pmd_ctor(mm, ptdesc)) {
>  		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b7f13f087954..f9b793cce2c1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3100,7 +3100,8 @@ static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>  	pagetable_free(ptdesc);
>  }
>  
> -static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
> +static inline bool pagetable_pte_ctor(struct mm_struct *mm,
> +				      struct ptdesc *ptdesc)
>  {
>  	if (!ptlock_init(ptdesc))
>  		return false;
> @@ -3206,7 +3207,8 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  	return ptl;
>  }
>  
> -static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
> +static inline bool pagetable_pmd_ctor(struct mm_struct *mm,
> +				      struct ptdesc *ptdesc)
>  {
>  	if (!pmd_ptlock_init(ptdesc))
>  		return false;

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>	# s390

