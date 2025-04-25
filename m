Return-Path: <linuxppc-dev+bounces-7991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2AA9CE41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 18:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkdlR1Vw4z304f;
	Sat, 26 Apr 2025 02:36:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745598995;
	cv=none; b=oJuZSdlyuDWuuTY1Z1khYkkCBlNOGtbqfx+/KdnMCcNuO71Xgx/u55iORm5dN9RdFQ9rSh6IefUndeprZ2zcKnXg5R6nScSh26ckbDQPHgn9sNvD27/y1yifmQh4nrp4EE0v8EK8atm72e8w4RT9ZHuWbVhkTsg398Q4xxmyj0U2ik+uz5ozBy+elDiWdjMV3Bf2KbfuA1fERXgBqQyWrZTdlvSNBy1NDw11rHDZ39qxTkWkuwgII7jxfbhihzmekZTM+nSVdkkvz/rQIfGFZvi8ykfLGGtyUJf+VFFOj7soV9QTAS4MJrLmwq5iocdvACG8YS+AAfxnhzhX1gibEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745598995; c=relaxed/relaxed;
	bh=ejJgdqEPZKllX4jx/pva9umANCVtEBT18p/3RAmx1Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUi7A7vw/dYtpVLylzw2vwleiu89r/HSeDJwudvcPtnSgLoCMx5Gj8vb4z00gadTTM3HNyIJDWTLn7qKFd7BMGaadsP+roHypn1CjxaaR1HjAjO3pP2s5HbLJWbrjSVz2n7q8DdIyNPzwCjqnCNWgYBNa8x8/EKFZKsnBTJTLhU7dpR7Msm8Md/ZK2SfdK50gnmaZVJP/IERVDQfzCrYddEJRcCbl3ugNY6gQXbsBQB6J5VC2PbXRvkDbItCGiDHW84Gnqb5pp8AXJqIg7qq92UmBxG2CYvs2SBuaD2tXw3ksloYJRTGJeBKmdol7aoC1qd5XGg6PFgKN09Csq4u1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqpOZv1g; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqpOZv1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkdlQ0Kz3z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:36:32 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PAfbvU023963;
	Fri, 25 Apr 2025 16:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ejJgdqEPZKllX4jx/pva9umANCVtEB
	T18p/3RAmx1Es=; b=EqpOZv1gbGFg4t85FrLlOnzYnqCpeD+gFp/4utrY95VCIZ
	h75Yza2MfYXQuYTjxvakxgUr08T+r3Mnj+hSHfUHEI/TJH3S6SnAHpVSsBLQaa7h
	JG0KhJpULlDgMiyQa50wwMo8ILPeXLFm4r9+r14ubKLH8tp+Olnoy4Y6olLQampi
	bKI2mW6zxE3Zp4T3ddLMXjQEVPJPpJUVXKRXqHsN/ACkP1gFKFnVXc9RUmaBnLmt
	9V0KJGIT6dCYsYT11ODN9q+MH3F7P9nNOSGqwRSGOpiw3BvM9GoSszha/eq3ZnWj
	BZdXBLYvjmEVLPiofDOoumk+2leUg7DxcnneeHug==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4688ushned-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:35:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PG93Q2000973;
	Fri, 25 Apr 2025 16:35:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 466jfy650a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 16:35:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PGZQqW21430558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 16:35:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB01720040;
	Fri, 25 Apr 2025 16:35:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDF662004B;
	Fri, 25 Apr 2025 16:35:23 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.73.111])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 25 Apr 2025 16:35:23 +0000 (GMT)
Date: Fri, 25 Apr 2025 18:35:22 +0200
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
Subject: Re: [PATCH v2 03/12] mm: Call ctor/dtor for kernel PTEs
Message-ID: <aAu5ylJPs+Oa9iQ3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-4-kevin.brodsky@arm.com>
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
In-Reply-To: <20250408095222.860601-4-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=680bb9d1 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=o1rnUynpLg_ZTY15UzkA:9
 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNCBTYWx0ZWRfXxfQmH6A1i1kR F0Qrpt5yak4qbEYdxPP6AWpDu4jDULgX7mdTdovae8J2DMeHPJ2D4u8gmGvG8XhP8zbhnJDUi7+ oK3yajHXRE48UbY0683PBqDQHITbNZwqnJVe1YdfWQGR3ID2SwUhxCrN+9vFaZQScLGRA9ZWojV
 RSarM6Bq4x1756TbKQ7JAqAplyDxMSMxtJfJY+CwQCIcyeMNJ2FfwH1U67EFPMKvl1DQURmevds Pee9V6Nxdjtm224E6UAw6q6vWv3bAGwXIbvyodOLAwWqUT1Dyb1+HxugPtHlhMT5cZoObV010KU 7+GC4doRznHR8qOWZytOu/IeBX++vqFmWURUnIQCQ3D26e15+uLRNAAoyxIDX5DeSwFGcgLYsiH
 z/1Pnm5AjA0kyrP1dqxLeXwdbYN0HQt8yyFmLroqBHwiHMLU8gJ5MxgaxSjoCKoy5BK9psby
X-Proofpoint-ORIG-GUID: MwNYdyucMFQMOg7jYooYi3IwxTZPVWry
X-Proofpoint-GUID: MwNYdyucMFQMOg7jYooYi3IwxTZPVWry
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

On Tue, Apr 08, 2025 at 10:52:13AM +0100, Kevin Brodsky wrote:
> Since [1], constructors/destructors are expected to be called for
> all page table pages, at all levels and for both user and kernel
> pgtables. There is however one glaring exception: kernel PTEs are
> managed via separate helpers (pte_alloc_kernel/pte_free_kernel),
> which do not call the [cd]tor, at least not in the generic
> implementation.
> 
> The most obvious reason for this anomaly is that init_mm is
> special-cased not to use split page table locks. As a result calling
> ptlock_init() for PTEs associated with init_mm would be wasteful,
> potentially resulting in dynamic memory allocation. However, pgtable
> [cd]tors perform other actions - currently related to
> accounting/statistics, and potentially more functionally significant
> in the future.
> 
> Now that pagetable_pte_ctor() is passed the associated mm, we can
> make it skip the call to ptlock_init() for init_mm; this allows us
> to call the ctor from pte_alloc_one_kernel() too. This is matched by
> a call to the pgtable destructor in pte_free_kernel(); no
> special-casing is needed on that path, as ptlock_free() is already
> called unconditionally. (ptlock_free() is a no-op unless a ptlock
> was allocated for the given PTP.)
> 
> This patch ensures that all architectures that rely on
> <asm-generic/pgalloc.h> call the [cd]tor for kernel PTEs.
> pte_free_kernel() cannot be overridden so changing the generic
> implementation is sufficient. pte_alloc_one_kernel() can be
> overridden using __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL, and a few
> architectures implement it by calling the page allocator directly.
> We amend those so that they call the generic
> __pte_alloc_one_kernel() instead, if possible, ensuring that the
> ctor is called.
> 
> A few architectures do not use <asm-generic/pgalloc.h>; those will
> be taken care of separately.
> 
> [1] https://lore.kernel.org/linux-mm/20250103184415.2744423-1-kevin.brodsky@arm.com/
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/csky/include/asm/pgalloc.h | 2 +-
>  arch/microblaze/mm/pgtable.c    | 2 +-
>  arch/openrisc/mm/ioremap.c      | 2 +-
>  include/asm-generic/pgalloc.h   | 7 ++++++-
>  include/linux/mm.h              | 2 +-
>  5 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
> index 11055c574968..9ed2b15ffd94 100644
> --- a/arch/csky/include/asm/pgalloc.h
> +++ b/arch/csky/include/asm/pgalloc.h
> @@ -29,7 +29,7 @@ static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  	pte_t *pte;
>  	unsigned long i;
>  
> -	pte = (pte_t *) __get_free_page(GFP_KERNEL);
> +	pte = __pte_alloc_one_kernel(mm);
>  	if (!pte)
>  		return NULL;
>  
> diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
> index 9f73265aad4e..e96dd1b7aba4 100644
> --- a/arch/microblaze/mm/pgtable.c
> +++ b/arch/microblaze/mm/pgtable.c
> @@ -245,7 +245,7 @@ unsigned long iopa(unsigned long addr)
>  __ref pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
>  	if (mem_init_done)
> -		return (pte_t *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
> +		return __pte_alloc_one_kernel(mm);
>  	else
>  		return memblock_alloc_try_nid(PAGE_SIZE, PAGE_SIZE,
>  					      MEMBLOCK_LOW_LIMIT,
> diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
> index 8e63e86251ca..3b352f97fecb 100644
> --- a/arch/openrisc/mm/ioremap.c
> +++ b/arch/openrisc/mm/ioremap.c
> @@ -36,7 +36,7 @@ pte_t __ref *pte_alloc_one_kernel(struct mm_struct *mm)
>  	pte_t *pte;
>  
>  	if (likely(mem_init_done)) {
> -		pte = (pte_t *)get_zeroed_page(GFP_KERNEL);
> +		pte = __pte_alloc_one_kernel(mm);
>  	} else {
>  		pte = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
>  	}
> diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
> index e164ca66f0f6..3c8ec3bfea44 100644
> --- a/include/asm-generic/pgalloc.h
> +++ b/include/asm-generic/pgalloc.h
> @@ -23,6 +23,11 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
>  
>  	if (!ptdesc)
>  		return NULL;
> +	if (!pagetable_pte_ctor(mm, ptdesc)) {
> +		pagetable_free(ptdesc);
> +		return NULL;
> +	}
> +
>  	return ptdesc_address(ptdesc);
>  }
>  #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
> @@ -48,7 +53,7 @@ static inline pte_t *pte_alloc_one_kernel_noprof(struct mm_struct *mm)
>   */
>  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -	pagetable_free(virt_to_ptdesc(pte));
> +	pagetable_dtor_free(virt_to_ptdesc(pte));
>  }
>  
>  /**
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f9b793cce2c1..3f48e449574a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3103,7 +3103,7 @@ static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>  static inline bool pagetable_pte_ctor(struct mm_struct *mm,
>  				      struct ptdesc *ptdesc)
>  {
> -	if (!ptlock_init(ptdesc))
> +	if (mm != &init_mm && !ptlock_init(ptdesc))
>  		return false;
>  	__pagetable_ctor(ptdesc);
>  	return true;

Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390

