Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD22724D44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 21:42:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbLV42cxKz3f10
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 05:42:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GeMbTsIq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GeMbTsIq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbLT93pdCz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 05:41:49 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356JaOmN024752;
	Tue, 6 Jun 2023 19:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=keFCyDsNdacTA2OQj9oiReKVufM6GGO2OhVxCJqDtS0=;
 b=GeMbTsIqCghaUH7JSGyANkCZrkXtnSNvwh5DPVN4bqKuAUA+W99c61loIc8tIxfSA30j
 pPxnrHLTfobxozWPhxtI46gXUrydatm2GuIlNBJT0OtiOIxTj+s/q9brEJ3rHQ46x8IB
 Y0hlwvfOu42ysvXI+3HiPhM51Ut4FuIbzWMYwKWH3HtihKNDDKZTRLtRGPZOc/rPQmo2
 tXWVNsVcP1fzrif+0t8TvN4yAZGQs0314MMKgfRXWJX3nGLo61tpjwlv9TtVMqSQ52bm
 ZR+4LZ3EqgQLmJV+hBrEteI65dpYU8+ZPtUdHuAwT8PuosMXMI11QbB2ZzsVt5DWQsaf QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2aku113e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:40:50 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 356JaIeo024108;
	Tue, 6 Jun 2023 19:40:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2aku111h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:40:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 356IZbJu013718;
	Tue, 6 Jun 2023 19:40:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r2a7a0186-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 19:40:46 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 356JeggF20972220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 19:40:43 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA2B120043;
	Tue,  6 Jun 2023 19:40:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F018720040;
	Tue,  6 Jun 2023 19:40:39 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.179.8.65])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue,  6 Jun 2023 19:40:39 +0000 (GMT)
Date: Tue, 6 Jun 2023 21:40:37 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
Message-ID: <20230606214037.09c6b280@thinkpad-T15>
In-Reply-To: <175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
	<6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com>
	<175ebec8-761-c3f-2d98-6c3bd87161c8@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IBzt0HR068keJSuKL98a8MYgtpNVJKOC
X-Proofpoint-GUID: _Gg1ZL486poj2Zp-jL0cqzcguQIoxv08
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_14,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306060166
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
 K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 5 Jun 2023 22:11:52 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Sun, 28 May 2023, Hugh Dickins wrote:
> 
> > Add s390-specific pte_free_defer(), to call pte_free() via call_rcu().
> > pte_free_defer() will be called inside khugepaged's retract_page_tables()
> > loop, where allocating extra memory cannot be relied upon.  This precedes
> > the generic version to avoid build breakage from incompatible pgtable_t.
> > 
> > This version is more complicated than others: because page_table_free()
> > needs to know which fragment is being freed, and which mm to link it to.
> > 
> > page_table_free()'s fragment handling is clever, but I could too easily
> > break it: what's done here in pte_free_defer() and pte_free_now() might
> > be better integrated with page_table_free()'s cleverness, but not by me!
> > 
> > By the time that page_table_free() gets called via RCU, it's conceivable
> > that mm would already have been freed: so mmgrab() in pte_free_defer()
> > and mmdrop() in pte_free_now().  No, that is not a good context to call
> > mmdrop() from, so make mmdrop_async() public and use that.  
> 
> But Matthew Wilcox quickly pointed out that sharing one page->rcu_head
> between multiple page tables is tricky: something I knew but had lost
> sight of.  So the powerpc and s390 patches were broken: powerpc fairly
> easily fixed, but s390 more painful.
> 
> In https://lore.kernel.org/linux-s390/20230601155751.7c949ca4@thinkpad-T15/
> On Thu, 1 Jun 2023 15:57:51 +0200
> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
> > 
> > Yes, we have 2 pagetables in one 4K page, which could result in same
> > rcu_head reuse. It might be possible to use the cleverness from our
> > page_table_free() function, e.g. to only do the call_rcu() once, for
> > the case where both 2K pagetable fragments become unused, similar to
> > how we decide when to actually call __free_page().
> > 
> > However, it might be much worse, and page->rcu_head from a pagetable
> > page cannot be used at all for s390, because we also use page->lru
> > to keep our list of free 2K pagetable fragments. I always get confused
> > by struct page unions, so not completely sure, but it seems to me that
> > page->rcu_head would overlay with page->lru, right?  
> 
> Sigh, yes, page->rcu_head overlays page->lru.  But (please correct me if
> I'm wrong) I think that s390 could use exactly the same technique for
> its list of free 2K pagetable fragments as it uses for its list of THP
> "deposited" pagetable fragments, over in arch/s390/mm/pgtable.c: use
> the first two longs of the page table itself for threading the list.

Nice idea, I think that could actually work, since we only need the empty
2K halves on the list. So it should be possible to store the list_head
inside those.

> 
> And while it could use third and fourth longs instead, I don't see any
> need for that: a deposited pagetable has been allocated, so would not
> be on the list of free fragments.

Correct, that should not interfere.

> 
> Below is one of the grossest patches I've ever posted: gross because
> it's a rushed attempt to see whether that is viable, while it would take
> me longer to understand all the s390 cleverness there (even though the
> PP AA commentary above page_table_alloc() is excellent).

Sounds fair, this is also one of the grossest code we have, which is also
why Alexander added the comment. I guess we could need even more comments
inside the code, as it still confuses me more than it should.

Considering that, you did remarkably well. Your patch seems to work fine,
at least it survived some LTP mm tests. I will also add it to our CI runs,
to give it some more testing. Will report tomorrow when it broke something.
See also below for some patch comments.

> 
> I'm hoping the use of page->lru in arch/s390/mm/gmap.c is disjoint.
> And cmma_init_nodat()? Ah, that's __init so I guess disjoint.

cmma_init_nodat() should be disjoint, not only because it is __init,
but also because it explicitly skips pagetable pages, so it should
never touch page->lru of those.

Not very familiar with the gmap code, it does look disjoint, and we should
also use complete 4K pages for pagetables instead of 2K fragments there,
but Christian or Claudio should also have a look.

> 
> Gerald, s390 folk: would it be possible for you to give this
> a try, suggest corrections and improvements, and then I can make it
> a separate patch of the series; and work on avoiding concurrent use
> of the rcu_head by pagetable fragment buddies (ideally fit in with
> the scheme already there, maybe DD bits to go along with the PP AA).

It feels like it could be possible to not only avoid the double
rcu_head, but also avoid passing over the mm via page->pt_mm.
I.e. have pte_free_defer(), which has the mm, do all the checks and
list updates that page_table_free() does, for which we need the mm.
Then just skip the pgtable_pte_page_dtor() + __free_page() at the end,
and do call_rcu(pte_free_now) instead. The pte_free_now() could then
just do _dtor/__free_page similar to the generic version.

I must admit that I still have no good overview of the "big picture"
here, and especially if this approach would still fit in. Probably not,
as the to-be-freed pagetables would still be accessible, but not really
valid, if we added them back to the list, with list_heads inside them.
So maybe call_rcu() has to be done always, and not only for the case
where the whole 4K page becomes free, then we probably cannot do w/o
passing over the mm for proper list handling.

Ah, and they could also be re-used, once they are back on the list,
which will probably not go well. Is that what you meant with DD bits,
i.e. mark such fragments to prevent re-use? Smells a bit like the
"pending purge"

> 
> Why am I even asking you to move away from page->lru: why don't I
> thread s390's pte_free_defer() pagetables like THP's deposit does?
> I cannot, because the deferred pagetables have to remain accessible
> as valid pagetables, until the RCU grace period has elapsed - unless
> all the list pointers would appear as pte_none(), which I doubt.

Yes, only empty and invalid PTEs will appear as pte_none(), i.e. entries
that contain only 0x400.

Ok, I guess that also explains why the approach mentioned above,
to avoid passing over the mm and do the list handling already in
pte_free_defer(), will not be so easy or possible at all.

> 
> (That may limit our possibilities with the deposited pagetables in
> future: I can imagine them too wanting to remain accessible as valid
> pagetables.  But that's not needed by this series, and s390 only uses
> deposit/withdraw for anon THP; and some are hoping that we might be
> able to move away from deposit/withdraw altogther - though powerpc's
> special use will make that more difficult.)
> 
> Thanks!
> Hugh
> 
> --- 6.4-rc5/arch/s390/mm/pgalloc.c
> +++ linux/arch/s390/mm/pgalloc.c
> @@ -232,6 +232,7 @@ void page_table_free_pgste(struct page *
>   */
>  unsigned long *page_table_alloc(struct mm_struct *mm)
>  {
> +	struct list_head *listed;
>  	unsigned long *table;
>  	struct page *page;
>  	unsigned int mask, bit;
> @@ -241,8 +242,8 @@ unsigned long *page_table_alloc(struct m
>  		table = NULL;
>  		spin_lock_bh(&mm->context.lock);
>  		if (!list_empty(&mm->context.pgtable_list)) {
> -			page = list_first_entry(&mm->context.pgtable_list,
> -						struct page, lru);
> +			listed = mm->context.pgtable_list.next;
> +			page = virt_to_page(listed);
>  			mask = atomic_read(&page->_refcount) >> 24;
>  			/*
>  			 * The pending removal bits must also be checked.
> @@ -259,9 +260,12 @@ unsigned long *page_table_alloc(struct m
>  				bit = mask & 1;		/* =1 -> second 2K */
>  				if (bit)
>  					table += PTRS_PER_PTE;
> +				BUG_ON(table != (unsigned long *)listed);
>  				atomic_xor_bits(&page->_refcount,
>  							0x01U << (bit + 24));
> -				list_del(&page->lru);
> +				list_del(listed);
> +				set_pte((pte_t *)&table[0], __pte(_PAGE_INVALID));
> +				set_pte((pte_t *)&table[1], __pte(_PAGE_INVALID));
>  			}
>  		}
>  		spin_unlock_bh(&mm->context.lock);
> @@ -288,8 +292,9 @@ unsigned long *page_table_alloc(struct m
>  		/* Return the first 2K fragment of the page */
>  		atomic_xor_bits(&page->_refcount, 0x01U << 24);
>  		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
> +		listed = (struct list head *)(table + PTRS_PER_PTE);

Missing "_" in "struct list head"

>  		spin_lock_bh(&mm->context.lock);
> -		list_add(&page->lru, &mm->context.pgtable_list);
> +		list_add(listed, &mm->context.pgtable_list);
>  		spin_unlock_bh(&mm->context.lock);
>  	}
>  	return table;
> @@ -310,6 +315,7 @@ static void page_table_release_check(str
>  
>  void page_table_free(struct mm_struct *mm, unsigned long *table)
>  {
> +	struct list_head *listed;
>  	unsigned int mask, bit, half;
>  	struct page *page;

Not sure if "reverse X-mas" is still part of any style guidelines,
but I still am a big fan of that :-). Although the other code in that
file is also not consistently using it ...

>  
> @@ -325,10 +331,24 @@ void page_table_free(struct mm_struct *m
>  		 */
>  		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
>  		mask >>= 24;
> -		if (mask & 0x03U)
> -			list_add(&page->lru, &mm->context.pgtable_list);
> -		else
> -			list_del(&page->lru);
> +		if (mask & 0x03U) {
> +			listed = (struct list_head *)table;
> +			list_add(listed, &mm->context.pgtable_list);
> +		} else {
> +			/*
> +			 * Get address of the other page table sharing the page.
> +			 * There are sure to be MUCH better ways to do all this!
> +			 * But I'm rushing, while trying to keep to the obvious.
> +			 */
> +			listed = (struct list_head *)(table + PTRS_PER_PTE);
> +			if (virt_to_page(listed) != page) {
> +				/* sizeof(*listed) is twice sizeof(*table) */
> +				listed -= PTRS_PER_PTE;
> +			}

Bitwise XOR with 0x800 should do the trick here, i.e. give you the address
of the other 2K half, like this:

			listed = (struct list_head *)((unsigned long) table ^ 0x800UL);

> +			list_del(listed);
> +			set_pte((pte_t *)&listed->next, __pte(_PAGE_INVALID));
> +			set_pte((pte_t *)&listed->prev, __pte(_PAGE_INVALID));
> +		}
>  		spin_unlock_bh(&mm->context.lock);
>  		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
>  		mask >>= 24;
> @@ -349,6 +369,7 @@ void page_table_free(struct mm_struct *m
>  void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
>  			 unsigned long vmaddr)
>  {
> +	struct list_head *listed;
>  	struct mm_struct *mm;
>  	struct page *page;
>  	unsigned int bit, mask;
> @@ -370,10 +391,24 @@ void page_table_free_rcu(struct mmu_gath
>  	 */
>  	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
>  	mask >>= 24;
> -	if (mask & 0x03U)
> -		list_add_tail(&page->lru, &mm->context.pgtable_list);
> -	else
> -		list_del(&page->lru);
> +	if (mask & 0x03U) {
> +		listed = (struct list_head *)table;
> +		list_add_tail(listed, &mm->context.pgtable_list);
> +	} else {
> +		/*
> +		 * Get address of the other page table sharing the page.
> +		 * There are sure to be MUCH better ways to do all this!
> +		 * But I'm rushing, and trying to keep to the obvious.
> +		 */
> +		listed = (struct list_head *)(table + PTRS_PER_PTE);
> +		if (virt_to_page(listed) != page) {
> +			/* sizeof(*listed) is twice sizeof(*table) */
> +			listed -= PTRS_PER_PTE;
> +		}

Same as above.

> +		list_del(listed);
> +		set_pte((pte_t *)&listed->next, __pte(_PAGE_INVALID));
> +		set_pte((pte_t *)&listed->prev, __pte(_PAGE_INVALID));
> +	}
>  	spin_unlock_bh(&mm->context.lock);
>  	table = (unsigned long *) ((unsigned long) table | (0x01U << bit));
>  	tlb_remove_table(tlb, table);

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
