Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0174A057
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:04:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hotimYj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxfvK01mhz3c3x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hotimYj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxftQ11qmz3brb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 01:03:41 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366F1NL4002682;
	Thu, 6 Jul 2023 15:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=qSwFzruPcaNdP45SxVUbDhB22B0cgY81dMFR8R2Q4e4=;
 b=hotimYj8WUqulE0HBmKXfLbgKYf2Lr78pmtKqqFoRsMj+u7koEPz4PW/MJQavdO7FXY4
 4deakJj22T41XELxCotJ/nsKRaEybKwwFHpa/WuYovYUX3Vxzk+h9VYh39HagbwiLdaz
 wvHA7EuH/UHAfSZMLrdaU3p1mf5IX9MEh1SHRNua1zhTEuBwxJP1Q/2NSejDsFLYcw0/
 qEecqFTSnPgtCPmp5yfhYC7FM09aD6hGzYQvQVOCiUeKeceXt83sl78liBwNo9TpIAOe
 9ADgn9vhlWzjRPiOt40+CwluQTKf5JV4SC00qSKRzyy1qBkZXnhe8W44fnStQo9Y1hMm nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnyvs81m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 15:02:27 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 366F1SXO003194;
	Thu, 6 Jul 2023 15:02:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnyvs81gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 15:02:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 365Ni7ZQ002690;
	Thu, 6 Jul 2023 15:02:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rjbde3cmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 15:02:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 366F2IIN12911276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 15:02:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42AF920040;
	Thu,  6 Jul 2023 15:02:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 565902004B;
	Thu,  6 Jul 2023 15:02:15 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.179.10.27])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu,  6 Jul 2023 15:02:15 +0000 (GMT)
Date: Thu, 6 Jul 2023 17:02:13 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230706170213.2ea63606@thinkpad-T15>
In-Reply-To: <1014735-ecc4-b4bc-3ae7-48a4328ed149@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
	<20230628211624.531cdc58@thinkpad-T15>
	<cd7c2851-1440-7220-6c53-16b343b1474@google.com>
	<ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
	<20230629175645.7654d0a8@thinkpad-T15>
	<edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
	<7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com>
	<20230704171905.1263478f@thinkpad-T15>
	<e678affb-5eee-a055-7af1-1d29a965663b@google.com>
	<20230705145516.7d9d554d@thinkpad-T15>
	<1014735-ecc4-b4bc-3ae7-48a4328ed149@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QGkni06Tvema7LXh8NlVshLGX4mkBNVW
X-Proofpoint-GUID: 5jal2qspqbLQazmPwsOCxzoLdtbfP85A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_11,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060130
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

On Wed, 5 Jul 2023 18:20:21 -0700 (PDT)
Hugh Dickins <hughd@google.com> wrote:

> On Wed, 5 Jul 2023, Gerald Schaefer wrote:
> > On Tue, 4 Jul 2023 10:03:57 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote:  
> > > On Tue, 4 Jul 2023, Gerald Schaefer wrote:  
> > > > On Sat, 1 Jul 2023 21:32:38 -0700 (PDT)
> > > > Hugh Dickins <hughd@google.com> wrote:    
> > > > > On Thu, 29 Jun 2023, Hugh Dickins wrote:    
> > > ...  
> > > > > --- a/arch/s390/mm/pgalloc.c
> > > > > +++ b/arch/s390/mm/pgalloc.c
> > > > > @@ -229,6 +229,15 @@ void page_table_free_pgste(struct page *page)
> > > > >   * logic described above. Both AA bits are set to 1 to denote a 4KB-pgtable
> > > > >   * while the PP bits are never used, nor such a page is added to or removed
> > > > >   * from mm_context_t::pgtable_list.
> > > > > + *
> > > > > + * pte_free_defer() overrides those rules: it takes the page off pgtable_list,
> > > > > + * and prevents both 2K fragments from being reused. pte_free_defer() has to
> > > > > + * guarantee that its pgtable cannot be reused before the RCU grace period
> > > > > + * has elapsed (which page_table_free_rcu() does not actually guarantee).    
> > > > 
> > > > Hmm, I think page_table_free_rcu() has to guarantee the same, i.e. not
> > > > allow reuse before grace period elapsed. And I hope that it does so, by
> > > > setting the PP bits, which would be noticed in page_table_alloc(), in
> > > > case the page would be seen there.
> > > > 
> > > > Unlike pte_free_defer(), page_table_free_rcu() would add pages back to the
> > > > end of the list, and so they could be seen in page_table_alloc(), but they
> > > > should not be reused before grace period elapsed and __tlb_remove_table()
> > > > cleared the PP bits, as far as I understand.
> > > > 
> > > > So what exactly do you mean with "which page_table_free_rcu() does not actually
> > > > guarantee"?    
> > > 
> > > I'll answer without locating and re-reading what Jason explained earlier,
> > > perhaps in a separate thread, about pseudo-RCU-ness in tlb_remove_table():
> > > he may have explained it better.  And without working out again all the
> > > MMU_GATHER #defines, and which of them do and do not apply to s390 here.
> > > 
> > > The detail that sticks in my mind is the fallback in tlb_remove_table()  
> > 
> > Ah ok, I was aware of that "semi-RCU" fallback logic in tlb_remove_table(),
> > but that is rather a generic issue, and not s390-specific.  
> 
> Yes.
> 
> > I thought you
> > meant some s390-oddity here, of which we have a lot, unfortunately...
> > Of course, we call tlb_remove_table() from our page_table_free_rcu(), so
> > I guess you could say that page_table_free_rcu() cannot guarantee what
> > tlb_remove_table() cannot guarantee.
> > 
> > Maybe change to "which page_table_free_rcu() does not actually guarantee,
> > by calling tlb_remove_table()", to make it clear that this is not a problem
> > of page_table_free_rcu() itself.  
> 
> Okay - I'll rephrase slightly to avoid being sued by s390's lawyers :-)
> 
> >   
> > > in mm/mmu_gather.c: if its __get_free_page(GFP_NOWAIT) fails, it cannot
> > > batch the tables for freeing by RCU, and resorts instead to an immediate 
> > > TLB flush (I think: that again involves chasing definitions) followed by
> > > tlb_remove_table_sync_one() - which just delivers an interrupt to each CPU,
> > > and is commented: 
> > > /*
> > >  * This isn't an RCU grace period and hence the page-tables cannot be
> > >  * assumed to be actually RCU-freed.
> > >  *
> > >  * It is however sufficient for software page-table walkers that rely on
> > >  * IRQ disabling.
> > >  */
> > > 
> > > Whether that's good for your PP pages or not, I've given no thought:
> > > I've just taken it on trust that what s390 has working today is good.  
> > 
> > Yes, we should be fine with that, current code can be trusted :-)  
> 
> Glad to hear it :-)  Yes, I think it's not actually relying on the "rcu"
> implied by the function name.

Ah ok, now I get it. Never noticed that naming it "free_rcu" could be
misleading. It is only ever called from pte_free_tlb(), so always in that
"semi-RCU" context. If you just look at the name, you could expect this
to always free pagetables by RCU, which would be exactly what you need
for pte_free_defer(), and which of course cannot be guaranteed by our
page_table_free_rcu().

IOW, exactly what your comment says, and now I think it is actually fine
as it is :-)

I guess I am a bit lamebrained this week, due to early shift and not
enough sleep...

> 
> >   
> > > 
> > > If that __get_free_page(GFP_NOWAIT) fallback instead used call_rcu(),
> > > then I would not have written "(which page_table_free_rcu() does not
> > > actually guarantee)".  But it cannot use call_rcu() because it does
> > > not have an rcu_head to work with - it's in some generic code, and
> > > there is no MMU_GATHER_CAN_USE_PAGE_RCU_HEAD for architectures to set.
> > > 
> > > And Jason would have much preferred us to address the issue from that
> > > angle; but not only would doing so destroy my sanity, I'd also destroy
> > > 20 architectures TLB-flushing, unbuilt and untested, in the attempt.  
> > 
> > Oh yes, if your changes would have allowed to get rid of that "semi RCU"
> > logic, that would really be a major boost in popularity, I guess. But
> > it probably is as it is, because it is not so easily fixed...  
> 
> I'm hoping that this series might help stir someone else to get into that.
> 
> >   
> > > 
> > > ...  
> > > > > @@ -325,10 +346,17 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
> > > > >  		 */
> > > > >  		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
> > > > >  		mask >>= 24;
> > > > > -		if (mask & 0x03U)
> > > > > +		if ((mask & 0x03U) && !PageActive(page)) {
> > > > > +			/*
> > > > > +			 * Other half is allocated, and neither half has had
> > > > > +			 * its free deferred: add page to head of list, to make
> > > > > +			 * this freed half available for immediate reuse.
> > > > > +			 */
> > > > >  			list_add(&page->lru, &mm->context.pgtable_list);
> > > > > -		else
> > > > > -			list_del(&page->lru);
> > > > > +		} else {
> > > > > +			/* If page is on list, now remove it. */
> > > > > +			list_del_init(&page->lru);
> > > > > +		}    
> > > > 
> > > > Ok, we might end up with some unnecessary list_del_init() here, e.g. if
> > > > other half is still allocated, when called from pte_free_defer() on a
> > > > fully allocated page, which was not on the list (and with PageActive, and
> > > > (mask & 0x03U) true).
> > > > Not sure if adding an additional mask check to the else path would be
> > > > needed, but it seems that list_del_init() should also be able to handle
> > > > this.    
> > > 
> > > list_del_init() is very cheap in the unnecessary case: the cachelines
> > > required are already there.  You don't want a flag to say whether to
> > > call it or not, it is already the efficient approach.  
> > 
> > Yes, I also see no functional issue here. Just thought that the extra
> > write could be avoided, e.g. by checking for list_empty() or mask first.
> > But I guess that is simply the benefit of list_del_init(), that you
> > don't have to check, at least if it is guaranteed that rcu_head is
> > never in use here.
> > 
> > Then maybe adjust the comment, because now it makes you wonder, when
> > you read (and understand) the code, you see that this list_del_init()
> > might also be called for pages not on the list.  
> 
> Sorry, I don't understand what clarification you're asking for there.
> I thought
> 			/* If page is on list, now remove it. */
> 			list_del_init(&page->lru);
> was good enough comment.
> 
> (I certainly don't want to enumerate the cases when it is or is not
> already on the list there, that would be misery; but I don't think
> that's the adjustment you were asking for either.)

I was mislead by the comment saying "If page is on the list", in an
else path where we also end up for pages not on the list any more.
I guess I would have added something like "it is also ok to do
list_del_init() here for pages not on the list". But thinking again,
that would probably just be a reminder of how list_del_init() works, 
which should be obvious anyway, at least for people with enough sleep.

> 
> >   
> > > 
> > > (But you were right not to use it in your pt_frag_refcount version,
> > > because there we were still trying to do the call_rcu() per fragment
> > > rather than per page, so page->lru could have been on the RCU queue.)  
> > 
> > That is actually the one thing I still try to figure out, by drawing
> > pictures, i.e. if we really really never end up here on list_del_init(),
> > while using rcu_head, e.g. by racing PageActive.  
> 
> There is no race with PageActive being seen when the table page is
> finally to be freed (by RCU or not).  But there is definitely a harmless
> race with pte_free_defer()er of other half setting PageActive an instant
> after page_table_free() checked PageActive here.  So maybe this
> page_table_free() does a list_add(), which the racer then list_del_init()s
> when it gets the mm->context.lock; or maybe they both list_del_init().

Agree.

Since none of my remarks on the comments seem valid or strictly necessary
any more, and I also could not find functional issues, I think you can add
this patch as new version for 07/12. And I can now give you this:

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
