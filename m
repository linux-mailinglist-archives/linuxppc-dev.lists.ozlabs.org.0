Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0D7429E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 17:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBsonv92;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsN9F1RFCz3c56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 01:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bBsonv92;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsN8L24VTz300t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 01:45:54 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TFgVbP002416;
	Thu, 29 Jun 2023 15:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=REuMPbpiXxOOqmGePcLnL26GHPmbfQCfjSdqDhRBqJY=;
 b=bBsonv926PlkwA6TzSXylOVMuJXDwWfuyrEkJE0fL24hbL9rxscF1torf4uob6L380nl
 EN/LXEt4fNbjl2yidJVXJTvhQidne2ZnzGeMHDOAgLWmtb2rlL7qKDoE4y7btLoqIQHj
 smS6gwrB9gLr3wn+NAKmsGLc6E17BCS2CQIZZN63znuo1iFnfqbFbVh699uy2gTC7u3D
 2GhuajLs4GF0c4NHnhJD7djNyCWqBzLx/Lq+nAxgfwg+sADTmQGSyvwxQIQC27A/4WD+
 hNG9LlOmVVSkSylZySjLEToKd686gqogibwmB+n+4Ht392oQ+RognSPVb93J74qqtsJO 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhcu5070r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:44:53 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TFgaDS002862;
	Thu, 29 Jun 2023 15:44:33 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhcu505gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:44:32 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35TDgsNe000301;
	Thu, 29 Jun 2023 15:44:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rdr452jy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 15:44:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TFi1CT20382400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 15:44:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DE522004F;
	Thu, 29 Jun 2023 15:44:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 087EF20040;
	Thu, 29 Jun 2023 15:43:58 +0000 (GMT)
Received: from thinkpad-T15 (unknown [9.171.52.248])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 29 Jun 2023 15:43:57 +0000 (GMT)
Date: Thu, 29 Jun 2023 17:43:55 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables
 sharing page
Message-ID: <20230629174355.222ebed0@thinkpad-T15>
In-Reply-To: <ZJ2OK29zPB76i0Ga@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
	<a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com>
	<20230628211624.531cdc58@thinkpad-T15>
	<ZJ2OK29zPB76i0Ga@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OW0O7AqzJVgwJLiz07Yw91wbyFNWLd8a
X-Proofpoint-GUID: rDaQf77dkZisi0rgCzgj53DrRyw-QNEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290140
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, V
 asily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill
 A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jun 2023 15:59:07 +0200
Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> On Wed, Jun 28, 2023 at 09:16:24PM +0200, Gerald Schaefer wrote:
> > On Tue, 20 Jun 2023 00:51:19 -0700 (PDT)
> > Hugh Dickins <hughd@google.com> wrote:  
> 
> Hi Gerald, Hugh!
> 
> ...
> > @@ -407,6 +445,88 @@ void __tlb_remove_table(void *_table)
> >  	__free_page(page);
> >  }
> >  
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +static void pte_free_now0(struct rcu_head *head);
> > +static void pte_free_now1(struct rcu_head *head);  
> 
> What about pte_free_lower() / pte_free_upper()?

I actually like the 0/1 better, I always get confused what exactly we
mean with "lower / upper" in our code and comments. Is it the first
or second half? With 0/1 it is immediately clear to me.

> 
> ...
> > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > +{
> > +	unsigned int bit, mask;
> > +	struct page *page;
> > +
> > +	page = virt_to_page(pgtable);
> > +	if (mm_alloc_pgste(mm)) {
> > +		/*
> > +		 * TODO: Do we need gmap_unlink(mm, pgtable, addr), like in
> > +		 * page_table_free_rcu()?
> > +		 * If yes -> need addr parameter here, like in pte_free_tlb().
> > +		 */
> > +		call_rcu(&page->rcu_head, pte_free_pgste);
> > +		return;
> > +}
> > +	bit = ((unsigned long)pgtable & ~PAGE_MASK) / (PTRS_PER_PTE * sizeof(pte_t));
> > +
> > +	spin_lock_bh(&mm->context.lock);
> > +	mask = atomic_xor_bits(&page->_refcount, 0x15U << (bit + 24));  
> 
> This  makes the bit logic increasingly complicated to me.

I think it is well in line with existing code in page_table_free[_rcu].
Only instead of doing xor with 0x11U, it does xor with 0x15U to also
switch on the H bit while at it.

> 
> What if instead we set the rule "one bit at a time only"?
> That means an atomic group bit flip is only allowed between
> pairs of bits, namely:
> 
> bit flip	initiated from
> -----------	----------------------------------------
> P      <- A	page_table_free(), page_table_free_rcu()
>      H <- A	pte_free_defer()
> P <- H		pte_free_half()
> 
> In the current model P bit could be on together with H
> bit simultaneously. That actually brings in equation
> nothing.

P bit has to be set at the latest when __tlb_remove_table() gets
called, because there it is checked / cleared. It might be possible
to not set it in pte_free_defer() already, but only later in
pte_free_half() RCU callback, before calling __tlb_remove_table().
But that would not be in line any more with existing code, where it
is already set before scheduling the RCU callback.

Therefore, I would rather stick to the current approach, unless
you see some bug in it.

> 
> Besides, this check in page_table_alloc() (while still
> correct) makes one (well, me) wonder "what about HH bits?":
> 
> 	mask = (mask | (mask >> 4)) & 0x03U;
> 	if (mask != 0x03U) {
> 		...
> 	}

Without adding fragments back to the list, it is not necessary
to check any H bits page_table_alloc(), or so I hope. Actually,
I like that aspect most, i.e. we have as little impact on current
code as possible.

And H bits are only relevant for preventing double use of rcu_head,
which is what they were designed for, and only the new code has
to care about them.
