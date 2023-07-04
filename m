Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0F74752F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:21:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUl0I4Ev;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwRMM1rkyz3bxS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 01:21:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUl0I4Ev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwRLQ2Gsjz30K6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 01:20:14 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 364FG5Pp026390;
	Tue, 4 Jul 2023 15:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=a65J3x09fXINXsjUSHihgHK5Fq0S5RGhLGiqcixCRSI=;
 b=SUl0I4Ev+1LC2J21S6mar/3eM2EexwwyVF6GcbiII9n/6coQMBcvAbA7djH7dPpIIpFb
 WVhQEV6j6B2nG0I+waKaO+HugYidBXAbZHrhJJksiKkN/AW1uJDeggzVvWM0lsdSIgRl
 P056U4+OVm+eKhc0UkKznjwn6I7CiM4TqFPaRjdkCwUXN7zUU7XsY2/Qq+6vqFN7aiS+
 qML75VjBCM8pRv6G9sW16d2rk1+47loaMwOCr4yl2vfJHxeZc1Hp2xeVF3a4NhKjU043
 PpvgPH+zB2OyGXorPH9wyKnuRRx4RCYgL0icoIZ65jvb2JAaIIBzZfZ+GXDqpT9+SYUQ yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmnwkr2s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 15:19:17 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 364FG8D4026561;
	Tue, 4 Jul 2023 15:19:16 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmnwkr2r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 15:19:16 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3646w9Gd001291;
	Tue, 4 Jul 2023 15:19:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rjbs51h5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 15:19:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 364FJAhJ21758598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jul 2023 15:19:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA2B020043;
	Tue,  4 Jul 2023 15:19:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCFD320040;
	Tue,  4 Jul 2023 15:19:07 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.171.51.132])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  4 Jul 2023 15:19:07 +0000 (GMT)
Date: Tue, 4 Jul 2023 17:19:05 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230704171905.1263478f@thinkpad-T15>
In-Reply-To: <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
	<20230628211624.531cdc58@thinkpad-T15>
	<cd7c2851-1440-7220-6c53-16b343b1474@google.com>
	<ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
	<20230629175645.7654d0a8@thinkpad-T15>
	<edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
	<7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gTdwrXVJ4yS3dpRA-l0lf-66zYWDMtIT
X-Proofpoint-ORIG-GUID: Bx-GTWE0dM7bMTYGsfQqutWb79cC4MAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_09,2023-07-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040130
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar
 K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill
 A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 1 Jul 2023 21:32:38 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Thu, 29 Jun 2023, Hugh Dickins wrote:
> > 
> > I've grown to dislike the (ab)use of pt_frag_refcount even more, to the
> > extent that I've not even tried to verify it; but I think I do get the
> > point now, that we need further info than just PPHHAA to know whether
> > the page is on the list or not.  But I think that if we move where the
> > call_rcu() is done, then the page can stay on or off the list by same
> > rules as before (but need to check HH bits along with PP when deciding
> > whether to allocate, and whether to list_add_tail() when freeing).  
> 
> No, not quite the same rules as before: I came to realize that using
> list_add_tail() for the HH pages would be liable to put a page on the
> list which forever blocked reuse of PP list_add_tail() pages after it
> (could be solved by a list_move() somewhere, but we have agreed to
> prefer simplicity).
> 
> I've dropped the HH bits, I'm using PageActive like we did on powerpc,
> I've dropped most of the pte_free_*() helpers, and list_del_init() is
> an easier way of dealing with those "is it on the list" questions.
> I expect that we shall be close to reaching agreement on...

This looks really nice, almost too good and easy to be true. I did not
find any obvious flaw, just some comments below. It also survived LTP
without any visible havoc, so I guess this approach is the best so far.

> 
> [PATCH v? 07/12] s390: add pte_free_defer() for pgtables sharing page
> 
> Add s390-specific pte_free_defer(), to free table page via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This precedes
> the generic version to avoid build breakage from incompatible pgtable_t.
> 
> This version is more complicated than others: because s390 fits two 2K
> page tables into one 4K page (so page->rcu_head must be shared between
> both halves), and already uses page->lru (which page->rcu_head overlays)
> to list any free halves; with clever management by page->_refcount bits.
> 
> Build upon the existing management, adjusted to follow a new rule: that
> a page is never on the free list if pte_free_defer() was used on either
> half (marked by PageActive).  And for simplicity, delay calling RCU until
> both halves are freed.
> 
> Not adding back unallocated fragments to the list in pte_free_defer()
> can result in wasting some amount of memory for pagetables, depending
> on how long the allocated fragment will stay in use. In practice, this
> effect is expected to be insignificant, and not justify a far more
> complex approach, which might allow to add the fragments back later
> in __tlb_remove_table(), where we might not have a stable mm any more.
> 
> Signed-off-by: Hugh Dickins <hughd@google.com>
> ---
>  arch/s390/include/asm/pgalloc.h |  4 ++
>  arch/s390/mm/pgalloc.c          | 75 +++++++++++++++++++++++++++------
>  2 files changed, 67 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
> index 17eb618f1348..89a9d5ef94f8 100644
> --- a/arch/s390/include/asm/pgalloc.h
> +++ b/arch/s390/include/asm/pgalloc.h
> @@ -143,6 +143,10 @@ static inline void pmd_populate(struct mm_struct *mm,
>  #define pte_free_kernel(mm, pte) page_table_free(mm, (unsigned long *) pte)
>  #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
>  
> +/* arch use pte_free_defer() implementation in arch/s390/mm/pgalloc.c */
> +#define pte_free_defer pte_free_defer
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
> +
>  void vmem_map_init(void);
>  void *vmem_crst_alloc(unsigned long val);
>  pte_t *vmem_pte_alloc(void);
> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> index 66ab68db9842..fd0c4312da16 100644
> --- a/arch/s390/mm/pgalloc.c
> +++ b/arch/s390/mm/pgalloc.c
> @@ -229,6 +229,15 @@ void page_table_free_pgste(struct page *page)
>   * logic described above. Both AA bits are set to 1 to denote a 4KB-pgtable
>   * while the PP bits are never used, nor such a page is added to or removed
>   * from mm_context_t::pgtable_list.
> + *
> + * pte_free_defer() overrides those rules: it takes the page off pgtable_list,
> + * and prevents both 2K fragments from being reused. pte_free_defer() has to
> + * guarantee that its pgtable cannot be reused before the RCU grace period
> + * has elapsed (which page_table_free_rcu() does not actually guarantee).

Hmm, I think page_table_free_rcu() has to guarantee the same, i.e. not
allow reuse before grace period elapsed. And I hope that it does so, by
setting the PP bits, which would be noticed in page_table_alloc(), in
case the page would be seen there.

Unlike pte_free_defer(), page_table_free_rcu() would add pages back to the
end of the list, and so they could be seen in page_table_alloc(), but they
should not be reused before grace period elapsed and __tlb_remove_table()
cleared the PP bits, as far as I understand.

So what exactly do you mean with "which page_table_free_rcu() does not actually
guarantee"?

> + * But for simplicity, because page->rcu_head overlays page->lru, and because
> + * the RCU callback might not be called before the mm_context_t has been freed,
> + * pte_free_defer() in this implementation prevents both fragments from being
> + * reused, and delays making the call to RCU until both fragments are freed.
>   */
>  unsigned long *page_table_alloc(struct mm_struct *mm)
>  {
> @@ -261,7 +270,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  					table += PTRS_PER_PTE;
>  				atomic_xor_bits(&page->_refcount,
>  							0x01U << (bit + 24));
> -				list_del(&page->lru);
> +				list_del_init(&page->lru);
>  			}
>  		}
>  		spin_unlock_bh(&mm->context.lock);
> @@ -281,6 +290,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  	table = (unsigned long *) page_to_virt(page);
>  	if (mm_alloc_pgste(mm)) {
>  		/* Return 4K page table with PGSTEs */
> +		INIT_LIST_HEAD(&page->lru);
>  		atomic_xor_bits(&page->_refcount, 0x03U << 24);
>  		memset64((u64 *)table, _PAGE_INVALID, PTRS_PER_PTE);
>  		memset64((u64 *)table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
> @@ -300,7 +310,9 @@ static void page_table_release_check(struct page *page, void *table,
>  {
>  	char msg[128];
>  
> -	if (!IS_ENABLED(CONFIG_DEBUG_VM) || !mask)
> +	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> +		return;
> +	if (!mask && list_empty(&page->lru))
>  		return;
>  	snprintf(msg, sizeof(msg),
>  		 "Invalid pgtable %p release half 0x%02x mask 0x%02x",
> @@ -308,6 +320,15 @@ static void page_table_release_check(struct page *page, void *table,
>  	dump_page(page, msg);
>  }
>  
> +static void pte_free_now(struct rcu_head *head)
> +{
> +	struct page *page;
> +
> +	page = container_of(head, struct page, rcu_head);
> +	pgtable_pte_page_dtor(page);
> +	__free_page(page);
> +}
> +
>  void page_table_free(struct mm_struct *mm, unsigned long *table)
>  {
>  	unsigned int mask, bit, half;
> @@ -325,10 +346,17 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>  		 */
>  		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
>  		mask >>= 24;
> -		if (mask & 0x03U)
> +		if ((mask & 0x03U) && !PageActive(page)) {
> +			/*
> +			 * Other half is allocated, and neither half has had
> +			 * its free deferred: add page to head of list, to make
> +			 * this freed half available for immediate reuse.
> +			 */
>  			list_add(&page->lru, &mm->context.pgtable_list);
> -		else
> -			list_del(&page->lru);
> +		} else {
> +			/* If page is on list, now remove it. */
> +			list_del_init(&page->lru);
> +		}

Ok, we might end up with some unnecessary list_del_init() here, e.g. if
other half is still allocated, when called from pte_free_defer() on a
fully allocated page, which was not on the list (and with PageActive, and
(mask & 0x03U) true).
Not sure if adding an additional mask check to the else path would be
needed, but it seems that list_del_init() should also be able to handle
this.

Same thought applies to the similar logic in page_table_free_rcu()
below.

>  		spin_unlock_bh(&mm->context.lock);
>  		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
>  		mask >>= 24;
> @@ -342,8 +370,10 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>  	}
>  
>  	page_table_release_check(page, table, half, mask);
> -	pgtable_pte_page_dtor(page);
> -	__free_page(page);
> +	if (TestClearPageActive(page))
> +		call_rcu(&page->rcu_head, pte_free_now);
> +	else
> +		pte_free_now(&page->rcu_head);

This ClearPageActive, and the similar thing in __tlb_remove_table() below,
worries me a bit, because it is done outside the spin_lock. It "feels" like
there could be some race with the PageActive checks inside the spin_lock,
but when drawing some pictures, I could not find any such scenario yet.
Also, our existing spin_lock is probably not supposed to protect against
PageActive changes anyway, right?

>  }
>  
>  void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
> @@ -370,10 +400,18 @@ void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
>  	 */
>  	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
>  	mask >>= 24;
> -	if (mask & 0x03U)
> +	if ((mask & 0x03U) && !PageActive(page)) {
> +		/*
> +		 * Other half is allocated, and neither half has had
> +		 * its free deferred: add page to end of list, to make
> +		 * this freed half available for reuse once its pending
> +		 * bit has been cleared by __tlb_remove_table().
> +		 */
>  		list_add_tail(&page->lru, &mm->context.pgtable_list);
> -	else
> -		list_del(&page->lru);
> +	} else {
> +		/* If page is on list, now remove it. */
> +		list_del_init(&page->lru);
> +	}
>  	spin_unlock_bh(&mm->context.lock);
>  	table = (unsigned long *) ((unsigned long) table | (0x01U << bit));
>  	tlb_remove_table(tlb, table);
> @@ -403,10 +441,23 @@ void __tlb_remove_table(void *_table)
>  	}
>  
>  	page_table_release_check(page, table, half, mask);
> -	pgtable_pte_page_dtor(page);
> -	__free_page(page);
> +	if (TestClearPageActive(page))
> +		call_rcu(&page->rcu_head, pte_free_now);
> +	else
> +		pte_free_now(&page->rcu_head);
>  }
>  
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> +{
> +	struct page *page;
> +
> +	page = virt_to_page(pgtable);
> +	SetPageActive(page);
> +	page_table_free(mm, (unsigned long *)pgtable);
> +}
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> +
>  /*
>   * Base infrastructure required to generate basic asces, region, segment,
>   * and page tables that do not make use of enhanced features like EDAT1.

