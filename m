Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41834DD902
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 12:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKhjM4RGBz3bdl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 22:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKhhs2bNbz3069
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 22:33:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6049EB8219E;
 Fri, 18 Mar 2022 11:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81840C340E8;
 Fri, 18 Mar 2022 11:33:04 +0000 (UTC)
Date: Fri, 18 Mar 2022 11:33:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/7] arm64/pgtable: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Message-ID: <YjRt7DqDFJRZA7Gt@arm.com>
References: <20220315141837.137118-1-david@redhat.com>
 <20220315141837.137118-5-david@redhat.com>
 <YjIr9f9qaz4xITVd@arm.com>
 <c3d39666-52ae-42ba-eaa2-7a0ca489f766@redhat.com>
 <YjN2qsXkmlEUTg4u@arm.com>
 <8989a07b-3a5b-0c81-983f-b35403d19579@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8989a07b-3a5b-0c81-983f-b35403d19579@redhat.com>
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Oded Gabbay <oded.gabbay@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 10:59:10AM +0100, David Hildenbrand wrote:
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index b1e1b74d993c..fd6ddf14c190 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -14,6 +14,7 @@
>   * Software defined PTE bits definition.
>   */
>  #define PTE_WRITE		(PTE_DBM)		 /* same as DBM (51) */
> +#define PTE_SWP_EXCLUSIVE	(PTE_TABLE_BIT)		 /* only for swp ptes */
>  #define PTE_DIRTY		(_AT(pteval_t, 1) << 55)
>  #define PTE_SPECIAL		(_AT(pteval_t, 1) << 56)
>  #define PTE_DEVMAP		(_AT(pteval_t, 1) << 57)
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 94e147e5456c..c78994073cd0 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -402,6 +402,22 @@ static inline pgprot_t mk_pmd_sect_prot(pgprot_t prot)
>  	return __pgprot((pgprot_val(prot) & ~PMD_TABLE_BIT) | PMD_TYPE_SECT);
>  }
>  
> +#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
> +static inline pte_t pte_swp_mkexclusive(pte_t pte)
> +{
> +	return set_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
> +}
> +
> +static inline int pte_swp_exclusive(pte_t pte)
> +{
> +	return pte_val(pte) & PTE_SWP_EXCLUSIVE;
> +}
> +
> +static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> +{
> +	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
> +}
> +
>  #ifdef CONFIG_NUMA_BALANCING
>  /*
>   * See the comment in include/linux/pgtable.h
> @@ -908,7 +924,8 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  
>  /*
>   * Encode and decode a swap entry:
> - *	bits 0-1:	present (must be zero)
> + *	bits 0:		present (must be zero)
> + *	bits 1:		remember PG_anon_exclusive

It looks fine to me.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
